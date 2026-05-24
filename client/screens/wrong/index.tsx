import React, { useState, useCallback, useEffect } from 'react';
import { View, Text, TouchableOpacity, ScrollView, ActivityIndicator, TextInput, Alert } from 'react-native';
import { Screen } from '@/components/Screen';
import { useSafeRouter } from '@/hooks/useSafeRouter';
import { useFocusEffect } from 'expo-router';
import { FontAwesome6 } from '@expo/vector-icons';
import { useSafeAreaInsets } from 'react-native-safe-area-context';

const EXPO_PUBLIC_BACKEND_BASE_URL = process.env.EXPO_PUBLIC_BACKEND_BASE_URL || 'http://localhost:9091';

interface WrongQuestion {
  id: number;
  questionId: number;
  userAnswer: any;
  answeredAt: string;
  question: {
    id: number;
    type: string;
    question: string;
    options: string[] | null;
    answer: any;
    explanation: string;
  } | null;
}

export default function WrongQuestionsScreen() {
  const router = useSafeRouter();
  const insets = useSafeAreaInsets();
  const [wrongQuestions, setWrongQuestions] = useState<WrongQuestion[]>([]);
  const [loading, setLoading] = useState(true);
  const [currentIndex, setCurrentIndex] = useState(0);
  const [selectedAnswer, setSelectedAnswer] = useState<any>(null);
  const [isSubmitted, setIsSubmitted] = useState(false);
  const [isCorrect, setIsCorrect] = useState(false);
  const [fillBlankInput, setFillBlankInput] = useState('');
  const [aiExplanation, setAiExplanation] = useState('');
  const [loadingExplanation, setLoadingExplanation] = useState(false);
  const [submittingAnswer, setSubmittingAnswer] = useState(false);
  const [showQuestionPicker, setShowQuestionPicker] = useState(false);

  const fetchWrongQuestions = async () => {
    try {
      setLoading(true);
      const response = await fetch(`${EXPO_PUBLIC_BACKEND_BASE_URL}/api/v1/questions/wrong/list`);
      const data = await response.json();
      if (data.success) {
        setWrongQuestions(data.data);
      }
    } catch (error) {
      console.error('Failed to fetch wrong questions:', error);
    } finally {
      setLoading(false);
    }
  };

  useFocusEffect(
    useCallback(() => {
      fetchWrongQuestions();
    }, [])
  );

  useEffect(() => {
    // 重置状态当题目改变时
    setSelectedAnswer(null);
    setIsSubmitted(false);
    setIsCorrect(false);
    setFillBlankInput('');
    setAiExplanation('');
  }, [currentIndex]);

  const currentQuestion = wrongQuestions[currentIndex];

  const handleOptionSelect = (optionKey: string) => {
    if (isSubmitted) return;
    setSelectedAnswer(optionKey);
  };

  const checkAnswer = (userAnswer: any, correctAnswer: any, type: string): boolean => {
    if (type === 'fill_blank') {
      // 填空题模糊匹配
      const normalize = (s: string) => s.trim().replace(/\s+/g, '');
      const userAns = normalize(userAnswer);
      const correctAns = normalize(correctAnswer);
      return userAns.includes(correctAns) || correctAns.includes(userAns);
    }
    if (type === 'judgment') {
      // 判断题：true/false 比较
      const userVal = userAnswer === 'true' || userAnswer === true;
      const correctVal = correctAnswer === 'true' || correctAnswer === true || correctAnswer === '对';
      return userVal === correctVal;
    }
    if (type === 'choice' || type === 'multi_choice') {
      // 选择题：直接比较字符串
      const normalizedUser = String(userAnswer).toUpperCase();
      const normalizedCorrect = String(correctAnswer).toUpperCase();
      return normalizedUser === normalizedCorrect;
    }
    return String(userAnswer) === String(correctAnswer);
  };

  const handleSubmit = async () => {
    if (!currentQuestion || !currentQuestion.question) return;

    let userAnswer = selectedAnswer;
    const type = currentQuestion.question.type;

    // 填空题处理
    if (type === 'fill_blank') {
      userAnswer = fillBlankInput.trim();
      if (!userAnswer) {
        Alert.alert('提示', '请输入答案');
        return;
      }
    }

    if (type !== 'judgment' && !userAnswer) {
      Alert.alert('提示', '请选择一个选项');
      return;
    }

    setSubmittingAnswer(true);
    setIsSubmitted(true);

    const correctAnswer = currentQuestion.question.answer;
    const correct = checkAnswer(userAnswer, correctAnswer, type);
    setIsCorrect(correct);

    // 如果答对了，从错题列表中移除
    if (correct) {
      try {
        await fetch(`${EXPO_PUBLIC_BACKEND_BASE_URL}/api/v1/questions/wrong/${currentQuestion.id}`, {
          method: 'DELETE',
        });
        // 从列表中移除
        const newList = wrongQuestions.filter((_, idx) => idx !== currentIndex);
        setWrongQuestions(newList);
        // 如果还有题，调整索引
        if (currentIndex >= newList.length && newList.length > 0) {
          setCurrentIndex(newList.length - 1);
        }
      } catch (error) {
        console.error('Failed to remove correct answer:', error);
      }
    }

    setSubmittingAnswer(false);
  };

  const handlePrev = () => {
    if (currentIndex > 0) {
      setCurrentIndex(currentIndex - 1);
    }
  };

  const handleNext = () => {
    if (currentIndex < wrongQuestions.length - 1) {
      setCurrentIndex(currentIndex + 1);
    }
  };

  const handleRePractice = () => {
    setCurrentIndex(0);
    setSelectedAnswer(null);
    setIsSubmitted(false);
    setIsCorrect(false);
    setFillBlankInput('');
  };

  const fetchAiExplanation = async () => {
    if (!currentQuestion?.question) return;
    setLoadingExplanation(true);
    setAiExplanation('');
    
    try {
      const response = await fetch(`${EXPO_PUBLIC_BACKEND_BASE_URL}/api/v1/explain`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          questionId: currentQuestion.question.id,
          question: currentQuestion.question.question,
          answer: currentQuestion.question.answer,
          type: currentQuestion.question.type,
        }),
      });
      
      const data = await response.json();
      if (data.success && data.explanation) {
        setAiExplanation(data.explanation);
      } else if (data.explanation) {
        setAiExplanation(data.explanation);
      } else {
        setAiExplanation('暂无解析');
      }
    } catch (error) {
      console.error('Failed to fetch explanation:', error);
      setAiExplanation('解析加载失败');
    } finally {
      setLoadingExplanation(false);
    }
  };

  const getTypeLabel = (type: string) => {
    switch (type) {
      case 'judgment': return '判断题';
      case 'choice': return '单选题';
      case 'multi_choice': return '多选题';
      case 'fill_blank': return '填空题';
      default: return '选择题';
    }
  };

  const getTypeColor = (type: string) => {
    switch (type) {
      case 'judgment': return '#059669';
      case 'choice': return '#0EA5E9';
      case 'multi_choice': return '#8B5CF6';
      case 'fill_blank': return '#F59E0B';
      default: return '#6B7280';
    }
  };

  const renderOptions = () => {
    if (!currentQuestion?.question) return null;
    const { type, options, answer } = currentQuestion.question;

    // 填空题
    if (type === 'fill_blank') {
      return (
        <View className="mt-4">
          <Text className="text-gray-300 mb-2 font-medium">请输入答案：</Text>
          <TextInput
            className="bg-gray-800 text-white rounded-xl px-4 py-3 text-base border border-gray-700"
            placeholder="输入你的答案"
            placeholderTextColor="#6B7280"
            value={fillBlankInput}
            onChangeText={setFillBlankInput}
            editable={!isSubmitted}
          />
        </View>
      );
    }

    // 判断题
    if (type === 'judgment') {
      return (
        <View className="mt-4 flex-row gap-3">
          {['true', 'false'].map((option) => {
            const isSelected = selectedAnswer === option;
            const isCorrectOption = answer === option || answer === (option === 'true');
            const isWrongSelection = isSelected && !isCorrectOption && isSubmitted;
            const showCorrect = isSubmitted && isCorrectOption;

            return (
              <TouchableOpacity
                key={option}
                className={`flex-1 py-4 rounded-xl border-2 ${
                  isSelected
                    ? isWrongSelection
                      ? 'border-red-500 bg-red-500/20'
                      : showCorrect
                      ? 'border-green-500 bg-green-500/20'
                      : 'border-[#C41E3A] bg-[#C41E3A]/20'
                    : 'border-gray-600 bg-gray-800/50'
                }`}
                onPress={() => handleOptionSelect(option)}
                disabled={isSubmitted}
              >
                <Text className={`text-center font-semibold text-base ${
                  isSelected ? 'text-white' : 'text-gray-300'
                }`}>
                  {option === 'true' ? '正确' : '错误'}
                </Text>
              </TouchableOpacity>
            );
          })}
        </View>
      );
    }

    // 选择题/多选题
    if (options) {
      return (
        <View className="mt-4 gap-2">
          {Object.entries(options).map(([key, value]) => {
            const isMulti = type === 'multi_choice';
            const selectedKeys = Array.isArray(selectedAnswer) ? selectedAnswer : selectedAnswer ? [selectedAnswer] : [];
            const isSelected = selectedKeys.includes(key);
            const isCorrectOption = Array.isArray(answer) ? answer.includes(key) : answer === key;
            const isWrongSelection = isSelected && !isCorrectOption && isSubmitted;
            const showCorrect = isSubmitted && isCorrectOption;

            return (
              <TouchableOpacity
                key={key}
                className={`flex-row items-center p-4 rounded-xl border-2 ${
                  isSelected
                    ? isWrongSelection
                      ? 'border-red-500 bg-red-500/20'
                      : showCorrect
                      ? 'border-green-500 bg-green-500/20'
                      : 'border-[#C41E3A] bg-[#C41E3A]/20'
                    : 'border-gray-600 bg-gray-800/50'
                }`}
                onPress={() => handleOptionSelect(key)}
                disabled={isSubmitted}
              >
                <View className={`w-8 h-8 rounded-full items-center justify-center mr-3 ${
                  isSelected ? 'bg-[#C41E3A]' : 'bg-gray-700'
                }`}>
                  <Text className="text-white font-bold">{key}</Text>
                </View>
                <Text className="flex-1 text-gray-100 font-medium">{value as string}</Text>
                {showCorrect && (
                  <FontAwesome6 name="check-circle" size={20} color="#22C55E" />
                )}
                {isWrongSelection && (
                  <FontAwesome6 name="times-circle" size={20} color="#EF4444" />
                )}
              </TouchableOpacity>
            );
          })}
        </View>
      );
    }

    return null;
  };

  if (loading) {
    return (
      <Screen safeAreaEdges={['top']}>
        <View className="flex-1 items-center justify-center">
          <ActivityIndicator size="large" color="#C41E3A" />
        </View>
      </Screen>
    );
  }

  // 错题做完了
  if (wrongQuestions.length === 0) {
    return (
      <Screen safeAreaEdges={['top', 'bottom']}>
        <View className="flex-1 items-center justify-center px-6">
          <View className="w-24 h-24 rounded-full bg-green-500/20 items-center justify-center mb-6">
            <FontAwesome6 name="check" size={48} color="#22C55E" />
          </View>
          <Text className="text-2xl font-bold text-white mb-2">太棒了！</Text>
          <Text className="text-gray-400 text-center mb-8">你已经把错题全部做对了</Text>
          <TouchableOpacity
            className="bg-[#C41E3A] px-8 py-3 rounded-full"
            onPress={() => router.back()}
          >
            <Text className="text-white font-semibold">返回</Text>
          </TouchableOpacity>
        </View>
      </Screen>
    );
  }

  return (
    <Screen safeAreaEdges={['top', 'bottom']}>
      <ScrollView 
        className="flex-1 px-4" 
        contentContainerStyle={{ paddingBottom: insets.bottom + 80 }}
        showsVerticalScrollIndicator={false}
      >
        {/* Header */}
        <View className="flex-row items-center justify-between mb-4 mt-2">
          <View className="flex-row items-center gap-2">
            <View className="bg-[#C41E3A] px-3 py-1 rounded-full">
              <Text className="text-white text-sm font-medium">
                {getTypeLabel(currentQuestion.question?.type || 'choice')}
              </Text>
            </View>
          </View>
          <Text className="text-gray-400">
            第 {currentIndex + 1} / {wrongQuestions.length} 题
          </Text>
        </View>

        {/* Progress Bar */}
        <View className="h-1 bg-gray-800 rounded-full mb-3">
          <View 
            className="h-full bg-[#C41E3A] rounded-full transition-all"
            style={{ width: `${((currentIndex + 1) / wrongQuestions.length) * 100}%` }}
          />
        </View>

        {/* Question Number Picker */}
        <TouchableOpacity 
          className="bg-gray-800/50 rounded-xl p-3 mb-4 flex-row items-center justify-between"
          onPress={() => setShowQuestionPicker(!showQuestionPicker)}
        >
          <Text className="text-gray-300 text-sm">选择题号</Text>
          <View className="flex-row items-center gap-2">
            <Text className="text-[#C41E3A] font-semibold">第 {currentIndex + 1} 题</Text>
            <FontAwesome6 
              name={showQuestionPicker ? "chevron-up" : "chevron-down"} 
              size={14} 
              color="#9CA3AF" 
            />
          </View>
        </TouchableOpacity>

        {/* Question Picker Grid */}
        {showQuestionPicker && (
          <View className="bg-gray-800/80 rounded-xl p-3 mb-4 max-h-60">
            <ScrollView showsVerticalScrollIndicator={false}>
              <View className="flex-row flex-wrap gap-2">
                {wrongQuestions.map((wq, idx) => (
                  <TouchableOpacity
                    key={wq.id}
                    className={`w-10 h-10 rounded-lg items-center justify-center ${
                      idx === currentIndex 
                        ? 'bg-[#C41E3A]' 
                        : 'bg-gray-700'
                    }`}
                    onPress={() => {
                      setCurrentIndex(idx);
                      setShowQuestionPicker(false);
                    }}
                  >
                    <Text className={`text-sm font-medium ${
                      idx === currentIndex ? 'text-white' : 'text-gray-300'
                    }`}>
                      {idx + 1}
                    </Text>
                  </TouchableOpacity>
                ))}
              </View>
            </ScrollView>
          </View>
        )}

        {/* Question */}
        <View className="bg-gray-800/50 rounded-2xl p-5 mb-4">
          <Text className="text-white text-lg leading-relaxed">
            {currentQuestion.question?.question}
          </Text>
        </View>

        {/* Options */}
        {renderOptions()}

        {/* Submit Button */}
        {!isSubmitted && (
          <TouchableOpacity
            className="bg-[#C41E3A] py-4 rounded-xl mt-6"
            onPress={handleSubmit}
            disabled={submittingAnswer}
          >
            <Text className="text-white text-center font-bold text-lg">
              {submittingAnswer ? '提交中...' : '提交答案'}
            </Text>
          </TouchableOpacity>
        )}

        {/* Result */}
        {isSubmitted && (
          <View className="mt-6">
            {/* Result Banner */}
            <View className={`p-4 rounded-xl mb-4 ${
              isCorrect ? 'bg-green-500/20' : 'bg-red-500/20'
            }`}>
              <View className="flex-row items-center gap-3">
                <FontAwesome6 
                  name={isCorrect ? 'check-circle' : 'times-circle'} 
                  size={24} 
                  color={isCorrect ? '#22C55E' : '#EF4444'} 
                />
                <Text className={`text-lg font-bold ${isCorrect ? 'text-green-400' : 'text-red-400'}`}>
                  {isCorrect ? '回答正确' : '回答错误'}
                </Text>
              </View>
              {!isCorrect && (
                <Text className="text-gray-300 mt-2">
                  正确答案: {currentQuestion.question?.answer}
                </Text>
              )}
            </View>

            {/* AI 解析按钮 */}
            {!aiExplanation && (
              <TouchableOpacity
                className="bg-purple-500/20 border border-purple-500 py-3 rounded-xl mb-4"
                onPress={fetchAiExplanation}
                disabled={loadingExplanation}
              >
                <View className="flex-row items-center justify-center gap-2">
                  <FontAwesome6 name="lightbulb" size={18} color="#A855F7" />
                  <Text className="text-purple-400 font-medium">
                    {loadingExplanation ? '正在生成智能解析...' : '点击获取智能解析'}
                  </Text>
                </View>
              </TouchableOpacity>
            )}

            {/* 解析内容 */}
            {aiExplanation && (
              <View className="bg-purple-500/10 border border-purple-500/30 rounded-xl p-4 mb-4">
                <View className="flex-row items-center gap-2 mb-2">
                  <FontAwesome6 name="brain" size={16} color="#A855F7" />
                  <Text className="text-purple-400 font-semibold">智能解析</Text>
                </View>
                <Text className="text-gray-300 leading-relaxed">{aiExplanation}</Text>
              </View>
            )}

            {/* 原有解析 */}
            {currentQuestion.question?.explanation && (
              <View className="bg-gray-800/50 rounded-xl p-4 mb-4">
                <Text className="text-gray-400 font-medium mb-1">题目解析</Text>
                <Text className="text-gray-300 leading-relaxed">
                  {currentQuestion.question.explanation}
                </Text>
              </View>
            )}
          </View>
        )}
      </ScrollView>

      {/* Bottom Navigation */}
      <View 
        className="absolute bottom-0 left-0 right-0 bg-gray-900/95 border-t border-gray-800 px-4 py-3"
        style={{ paddingBottom: insets.bottom + 12 }}
      >
        <View className="flex-row gap-3">
          <TouchableOpacity
            className={`flex-1 py-3 rounded-xl border border-gray-600 ${
              currentIndex === 0 ? 'opacity-40' : ''
            }`}
            onPress={handlePrev}
            disabled={currentIndex === 0}
          >
            <Text className="text-gray-300 text-center font-medium">上一题</Text>
          </TouchableOpacity>
          
          <TouchableOpacity
            className="flex-1 py-3 rounded-xl bg-[#C41E3A]"
            onPress={handleNext}
            disabled={currentIndex === wrongQuestions.length - 1}
          >
            <Text className="text-white text-center font-medium">下一题</Text>
          </TouchableOpacity>
        </View>
      </View>
    </Screen>
  );
}
