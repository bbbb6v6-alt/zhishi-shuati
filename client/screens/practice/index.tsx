import React, { useState, useEffect, useCallback } from 'react';
import { View, Text, TouchableOpacity, StyleSheet, ScrollView, TextInput, ActivityIndicator, KeyboardAvoidingView, Platform } from 'react-native';
import { Screen } from '@/components/Screen';
import { useSafeRouter, useSafeSearchParams } from '@/hooks/useSafeRouter';
import { useFocusEffect } from 'expo-router';

const EXPO_PUBLIC_BACKEND_BASE_URL = process.env.EXPO_PUBLIC_BACKEND_BASE_URL || 'http://localhost:9091';

interface Question {
  id: number;
  type: string;
  question: string;
  options: string[] | null;
  answer: any;
  explanation: string;
}

export default function PracticeScreen() {
  const router = useSafeRouter();
  const params = useSafeSearchParams<{ type: string }>();
  const [questions, setQuestions] = useState<Question[]>([]);
  const [currentIndex, setCurrentIndex] = useState(0);
  const [selectedAnswer, setSelectedAnswer] = useState<any>(null);
  const [multiSelect, setMultiSelect] = useState<number[]>([]);
  const [shortAnswer, setShortAnswer] = useState('');
  const [loading, setLoading] = useState(true);
  const [submitted, setSubmitted] = useState(false);
  const [result, setResult] = useState<any>(null);

  const currentQuestion = questions[currentIndex];

  const fetchQuestions = async () => {
    try {
      setLoading(true);
      let url = `${EXPO_PUBLIC_BACKEND_BASE_URL}/api/v1/questions`;
      
      if (params.type && params.type !== 'all' && params.type !== 'random') {
        url += `?type=${params.type}`;
      }
      
      const response = await fetch(url);
      const data = await response.json();
      
      if (data.success) {
        let questionList = data.data;
        
        // 如果是随机练习，打乱顺序
        if (params.type === 'random') {
          questionList = [...questionList].sort(() => Math.random() - 0.5);
        }
        
        setQuestions(questionList);
      }
    } catch (error) {
      console.error('Failed to fetch questions:', error);
    } finally {
      setLoading(false);
    }
  };

  useFocusEffect(
    useCallback(() => {
      fetchQuestions();
    }, [params.type])
  );

  const handleSubmit = async () => {
    if (!currentQuestion || submitted) return;

    try {
      let answerToSubmit = selectedAnswer;
      if (currentQuestion.type === 'short_answer') {
        answerToSubmit = shortAnswer;
      } else if (currentQuestion.type === 'choice' && Array.isArray(currentQuestion.answer)) {
        // 多选题
        answerToSubmit = multiSelect;
      }

      const response = await fetch(`${EXPO_PUBLIC_BACKEND_BASE_URL}/api/v1/questions/submit`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          questionId: currentQuestion.id,
          userAnswer: answerToSubmit,
        }),
      });

      const data = await response.json();
      if (data.success) {
        setResult(data.data);
        setSubmitted(true);
      }
    } catch (error) {
      console.error('Failed to submit answer:', error);
    }
  };

  const handleNext = () => {
    if (currentIndex < questions.length - 1) {
      setCurrentIndex(currentIndex + 1);
      resetState();
    } else {
      router.replace('/');
    }
  };

  const resetState = () => {
    setSelectedAnswer(null);
    setMultiSelect([]);
    setShortAnswer('');
    setSubmitted(false);
    setResult(null);
  };

  const handleMultiSelect = (index: number) => {
    if (multiSelect.includes(index)) {
      setMultiSelect(multiSelect.filter(i => i !== index));
    } else {
      setMultiSelect([...multiSelect, index]);
    }
  };

  const getTypeLabel = (type: string) => {
    switch (type) {
      case 'judgment': return '判断题';
      case 'choice': return '选择题';
      case 'short_answer': return '简答题';
      default: return type;
    }
  };

  const getTypeColor = (type: string) => {
    switch (type) {
      case 'judgment': return '#059669';
      case 'choice': return '#0EA5E9';
      case 'short_answer': return '#D97706';
      default: return '#6B7280';
    }
  };

  const renderOptions = () => {
    if (!currentQuestion) return null;

    if (currentQuestion.type === 'judgment') {
      return (
        <View className="mt-4">
          <TouchableOpacity
            className={`p-4 rounded-xl mb-3 border-2 ${selectedAnswer === true ? 'border-[#C41E3A] bg-[#FEE2E2]' : 'border-gray-200 bg-white'}`}
            onPress={() => setSelectedAnswer(true)}
            disabled={submitted}
          >
            <Text className={`text-base ${selectedAnswer === true ? 'text-[#C41E3A] font-bold' : 'text-gray-700'}`}>
              ✓ 正确
            </Text>
          </TouchableOpacity>
          <TouchableOpacity
            className={`p-4 rounded-xl border-2 ${selectedAnswer === false ? 'border-[#C41E3A] bg-[#FEE2E2]' : 'border-gray-200 bg-white'}`}
            onPress={() => setSelectedAnswer(false)}
            disabled={submitted}
          >
            <Text className={`text-base ${selectedAnswer === false ? 'text-[#C41E3A] font-bold' : 'text-gray-700'}`}>
              ✗ 错误
            </Text>
          </TouchableOpacity>
        </View>
      );
    }

    if (currentQuestion.type === 'choice' && currentQuestion.options) {
      const isMulti = Array.isArray(currentQuestion.answer);
      return (
        <View className="mt-4">
          {currentQuestion.options.map((option, index) => {
            const isSelected = isMulti 
              ? multiSelect.includes(index) 
              : selectedAnswer === index;
            
            return (
              <TouchableOpacity
                key={index}
                className={`p-4 rounded-xl mb-3 border-2 ${isSelected ? 'border-[#C41E3A] bg-[#FEE2E2]' : 'border-gray-200 bg-white'}`}
                onPress={() => isMulti ? handleMultiSelect(index) : setSelectedAnswer(index)}
                disabled={submitted}
              >
                <View className="flex-row items-center">
                  <View className={`w-6 h-6 rounded-full border-2 mr-3 items-center justify-center ${isSelected ? 'border-[#C41E3A] bg-[#C41E3A]' : 'border-gray-300'}`}>
                    {isSelected && <Text className="text-white text-xs">✓</Text>}
                  </View>
                  <Text className={`text-base flex-1 ${isSelected ? 'text-[#C41E3A] font-bold' : 'text-gray-700'}`}>
                    {String.fromCharCode(65 + index)}. {option}
                  </Text>
                </View>
              </TouchableOpacity>
            );
          })}
          {Array.isArray(currentQuestion.answer) && (
            <Text className="text-sm text-[#6B7280] mt-2">* 此题为多选题</Text>
          )}
        </View>
      );
    }

    if (currentQuestion.type === 'short_answer') {
      return (
        <View className="mt-4">
          <TextInput
            className="bg-white border-2 border-gray-200 rounded-xl p-4 min-h-[120px] text-base"
            placeholder="请输入你的答案..."
            multiline
            value={shortAnswer}
            onChangeText={setShortAnswer}
            editable={!submitted}
            textAlignVertical="top"
          />
        </View>
      );
    }

    return null;
  };

  const renderResult = () => {
    if (!result || !submitted) return null;

    const isCorrect = result.isCorrect;
    const correctAnswer = result.correctAnswer;
    
    let correctAnswerText = '';
    if (currentQuestion.type === 'judgment') {
      correctAnswerText = correctAnswer ? '正确' : '错误';
    } else if (currentQuestion.type === 'choice' && currentQuestion.options) {
      if (Array.isArray(correctAnswer)) {
        correctAnswerText = correctAnswer.map((i: number) => String.fromCharCode(65 + i)).join('、');
      } else {
        correctAnswerText = String.fromCharCode(65 + correctAnswer);
      }
    } else {
      correctAnswerText = String(correctAnswer);
    }

    return (
      <View className={`mt-4 p-4 rounded-xl ${isCorrect ? 'bg-[#D1FAE5]' : 'bg-[#FEE2E2]'}`}>
        <View className="flex-row items-center mb-3">
          <View className={`w-8 h-8 rounded-full items-center justify-center mr-3 ${isCorrect ? 'bg-[#059669]' : 'bg-[#DC2626]'}`}>
            <Text className="text-white font-bold">{isCorrect ? '✓' : '✗'}</Text>
          </View>
          <Text className={`text-lg font-bold ${isCorrect ? 'text-[#059669]' : 'text-[#DC2626]'}`}>
            {isCorrect ? '回答正确！' : '回答错误'}
          </Text>
        </View>

        {!isCorrect && (
          <View className="mb-3">
            <Text className="text-sm text-gray-600">正确答案：</Text>
            <Text className="text-base font-bold text-[#059669] mt-1">{correctAnswerText}</Text>
          </View>
        )}

        <View className="border-t border-gray-200 pt-3">
          <Text className="text-sm text-gray-600 mb-1">答案解析：</Text>
          <Text className="text-base text-gray-800 leading-relaxed">{result.explanation}</Text>
        </View>
      </View>
    );
  };

  if (loading) {
    return (
      <Screen>
        <View className="flex-1 items-center justify-center">
          <ActivityIndicator size="large" color="#C41E3A" />
          <Text className="text-gray-500 mt-3">加载题目中...</Text>
        </View>
      </Screen>
    );
  }

  if (questions.length === 0) {
    return (
      <Screen>
        <View className="flex-1 items-center justify-center px-6">
          <Text className="text-xl text-gray-500 text-center">暂无题目</Text>
          <TouchableOpacity 
            className="mt-6 bg-[#C41E3A] px-6 py-3 rounded-xl"
            onPress={() => router.back()}
          >
            <Text className="text-white font-bold">返回首页</Text>
          </TouchableOpacity>
        </View>
      </Screen>
    );
  }

  return (
    <Screen>
      {/* Header */}
      <View className="bg-white px-4 py-3 border-b border-gray-100">
        <View className="flex-row items-center justify-between mb-2">
          <TouchableOpacity onPress={() => router.back()}>
            <Text className="text-[#C41E3A] text-base">← 返回</Text>
          </TouchableOpacity>
          <Text className="text-gray-500 text-sm">
            {currentIndex + 1} / {questions.length}
          </Text>
        </View>
        {/* Progress Bar */}
        <View className="h-2 bg-gray-200 rounded-full overflow-hidden">
          <View 
            className="h-full bg-[#C41E3A] rounded-full transition-all duration-300"
            style={{ width: `${((currentIndex + 1) / questions.length) * 100}%` }}
          />
        </View>
      </View>

      <KeyboardAvoidingView 
        className="flex-1"
        behavior={Platform.OS === 'ios' ? 'padding' : undefined}
      >
        <ScrollView className="flex-1 px-4 py-5" showsVerticalScrollIndicator={false}>
          {/* Question Card */}
          <View className="bg-white rounded-2xl p-5 shadow-sm">
            {/* Type Tag */}
            <View className="flex-row items-center mb-4">
              <View 
                className="px-3 py-1 rounded-full"
                style={{ backgroundColor: getTypeColor(currentQuestion.type) + '20' }}
              >
                <Text 
                  className="text-sm font-bold"
                  style={{ color: getTypeColor(currentQuestion.type) }}
                >
                  {getTypeLabel(currentQuestion.type)}
                </Text>
              </View>
            </View>

            {/* Question */}
            <Text className="text-lg text-gray-800 leading-relaxed font-medium">
              {currentQuestion.question}
            </Text>

            {/* Options */}
            {renderOptions()}

            {/* Result */}
            {renderResult()}
          </View>

          {/* Bottom Button */}
          <View className="mt-6 mb-8">
            {!submitted ? (
              <TouchableOpacity
                className={`py-4 rounded-xl items-center ${selectedAnswer || shortAnswer.trim() ? 'bg-[#C41E3A]' : 'bg-gray-300'}`}
                onPress={handleSubmit}
                disabled={!selectedAnswer && !shortAnswer.trim()}
              >
                <Text className="text-white text-lg font-bold">提交答案</Text>
              </TouchableOpacity>
            ) : (
              <TouchableOpacity
                className="py-4 rounded-xl items-center bg-[#C41E3A]"
                onPress={handleNext}
              >
                <Text className="text-white text-lg font-bold">
                  {currentIndex < questions.length - 1 ? '下一题 →' : '完成练习'}
                </Text>
              </TouchableOpacity>
            )}
          </View>
        </ScrollView>
      </KeyboardAvoidingView>
    </Screen>
  );
}

const styles = {
  container: 'flex-1 bg-[#F5F5F5]',
};
