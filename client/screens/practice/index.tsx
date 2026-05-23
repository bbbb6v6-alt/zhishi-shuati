import { useState, useCallback } from 'react';
import {
  View,
  Text,
  ScrollView,
  TouchableOpacity,
  TextInput,
  ActivityIndicator,
  Alert,
} from 'react-native';
import { useFocusEffect } from 'expo-router';
import { SafeAreaView } from 'react-native-safe-area-context';
import { Screen } from '@/components/Screen';
import { useSafeRouter, useSafeSearchParams } from '@/hooks/useSafeRouter';
import { Ionicons } from '@expo/vector-icons';

const EXPO_PUBLIC_BACKEND_BASE_URL = process.env.EXPO_PUBLIC_BACKEND_BASE_URL;

interface Question {
  id: number;
  type: string;
  question: string;
  options: string[] | null;
  answer: string;
  explanation?: string;
}

export default function PracticeScreen() {
  const safeRouter = useSafeRouter();
  const params = useSafeSearchParams<{ type?: string; questionIds?: string }>();
  const questionType = params.type || 'judgment';
  const initialQuestionIds = params.questionIds ? JSON.parse(params.questionIds) : null;

  const [questions, setQuestions] = useState<Question[]>([]);
  const [currentIndex, setCurrentIndex] = useState(0);
  const [selectedAnswer, setSelectedAnswer] = useState<string | string[] | null>(null);
  const [fillBlankAnswer, setFillBlankAnswer] = useState('');
  const [isSubmitted, setIsSubmitted] = useState(false);
  const [isCorrect, setIsCorrect] = useState(false);
  const [isLoading, setIsLoading] = useState(true);
  const [submitting, setSubmitting] = useState(false);
  const [doneQuestionIds, setDoneQuestionIds] = useState<Set<number>>(new Set());

  // 智能解析相关
  const [aiExplanation, setAiExplanation] = useState<string | null>(null);
  const [loadingExplanation, setLoadingExplanation] = useState(false);
  const [showExplanation, setShowExplanation] = useState(false);

  const currentQuestion = questions[currentIndex];

  // 获取题目列表
  const fetchQuestions = useCallback(async (questionIds?: (number | string)[]) => {
    try {
      setIsLoading(true);
      let url = `${EXPO_PUBLIC_BACKEND_BASE_URL}/api/v1/questions?type=${questionType}&limit=1000`;
      
      if (questionIds && questionIds.length > 0) {
        // 如果有指定的题目ID，按ID获取
        url = `${EXPO_PUBLIC_BACKEND_BASE_URL}/api/v1/questions?type=${questionType}&ids=${questionIds.join(',')}`;
      }
      
      const response = await fetch(url);
      const data = await response.json();
      if (data.success && data.data.length > 0) {
        setQuestions(data.data);
        setCurrentIndex(0);
        setSelectedAnswer(null);
        setFillBlankAnswer('');
        setIsSubmitted(false);
        setIsCorrect(false);
        setAiExplanation(null);
        setShowExplanation(false);
      }
    } catch (error) {
      console.error('获取题目失败:', error);
    } finally {
      setIsLoading(false);
    }
  }, [questionType]);

  useFocusEffect(
    useCallback(() => {
      if (initialQuestionIds && initialQuestionIds.length > 0) {
        // 从首页传来的已做过的题目，重新做这些题
        fetchQuestions(initialQuestionIds);
      } else {
        fetchQuestions();
      }
    }, [fetchQuestions, initialQuestionIds])
  );

  // 提交答案
  const handleSubmit = async () => {
    if (!currentQuestion) return;

    let answerToSubmit = '';

    if (currentQuestion.type === 'fill_blank') {
      answerToSubmit = fillBlankAnswer.trim();
    } else if (currentQuestion.type === 'multiple_choice') {
      if (Array.isArray(selectedAnswer) && selectedAnswer.length > 0) {
        answerToSubmit = [...selectedAnswer].sort().join('');
      }
    } else {
      // 判断题和单选题
      if (selectedAnswer !== null && selectedAnswer !== undefined) {
        if (typeof selectedAnswer === 'string') {
          answerToSubmit = selectedAnswer;
        } else if (typeof selectedAnswer === 'number') {
          answerToSubmit = String.fromCharCode(65 + selectedAnswer);
        }
      }
    }

    if (!answerToSubmit) {
      Alert.alert('提示', '请选择或输入答案');
      return;
    }

    setSubmitting(true);
    try {
      const response = await fetch(
        `${EXPO_PUBLIC_BACKEND_BASE_URL}/api/v1/questions/submit`,
        {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify({
            questionId: currentQuestion.id,
            userAnswer: answerToSubmit,
          }),
        }
      );
      const data = await response.json();
      setIsSubmitted(true);
      setIsCorrect(data.data?.isCorrect || false);
      
      // 记录做过的题目ID
      setDoneQuestionIds(prev => new Set([...prev, currentQuestion.id]));
      
      // 提交后自动获取AI智能解析
      fetchAiExplanation();
    } catch (error) {
      console.error('提交失败:', error);
      Alert.alert('错误', '提交失败，请重试');
    } finally {
      setSubmitting(false);
    }
  };

  // 获取AI智能解析
  const fetchAiExplanation = async () => {
    if (!currentQuestion) return;

    setLoadingExplanation(true);
    try {
      const response = await fetch(
        `${EXPO_PUBLIC_BACKEND_BASE_URL}/api/v1/explain/explain`,
        {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify({ questionId: currentQuestion.id }),
        }
      );
      const data = await response.json();
      if (data.success) {
        setAiExplanation(data.data.explanation);
        setShowExplanation(true);
      } else {
        Alert.alert('提示', data.error || '获取解析失败');
      }
    } catch (error) {
      console.error('获取解析失败:', error);
      Alert.alert('错误', '获取解析失败，请重试');
    } finally {
      setLoadingExplanation(false);
    }
  };

  // 上一题
  const handlePrev = () => {
    if (currentIndex > 0) {
      setCurrentIndex(currentIndex - 1);
      resetState();
    }
  };

  // 下一题
  const handleNext = () => {
    if (currentIndex < questions.length - 1) {
      setCurrentIndex(currentIndex + 1);
      resetState();
    }
  };

  // 刷新重做
  const handleRefresh = () => {
    Alert.alert(
      '刷新重做',
      '确定要重新开始吗？所有进度将清除。',
      [
        { text: '取消', style: 'cancel' },
        { text: '确定', onPress: () => {
          setCurrentIndex(0);
          fetchQuestions();
        }},
      ]
    );
  };

  // 重置状态
  const resetState = () => {
    setSelectedAnswer(null);
    setFillBlankAnswer('');
    setIsSubmitted(false);
    setIsCorrect(false);
    setAiExplanation(null);
    setShowExplanation(false);
  };

  // 选择题选项点击
  // 获取单选题的选项键（如 'A'）根据索引
  const getOptionKeyByIndex = (index: number): string => {
    return String.fromCharCode(65 + index); // 0 -> 'A', 1 -> 'B', etc.
  };

  // 单选题选项点击
  const handleOptionSelect = (optionKey: string) => {
    if (isSubmitted) return;
    setSelectedAnswer(optionKey);
  };

  // 多选题选项点击
  const handleMultiSelect = (key: string) => {
    if (isSubmitted) return;
    const current = Array.isArray(selectedAnswer) ? selectedAnswer : [];
    if (current.includes(key)) {
      setSelectedAnswer(current.filter((k) => k !== key));
    } else {
      setSelectedAnswer([...current, key]);
    }
  };

  // 获取题型名称
  const getTypeName = () => {
    const names: Record<string, string> = {
      judgment: '判断题',
      choice: '单选题',
      multiple_choice: '多选题',
      fill_blank: '填空题',
    };
    return names[questionType] || '练习';
  };

  // 获取选项标签
  const getOptionLabel = (index: number) => {
    return String.fromCharCode(65 + index);
  };

  // 渲染单选题选项
  const renderChoiceOptions = () => {
    if (!currentQuestion?.options) return null;
    return (
      <View className="mt-4 space-y-3">
        {currentQuestion.options.map((option, index) => {
          const isMulti = currentQuestion.type === 'multiple';
          const selectedIndexes = isMulti && Array.isArray(selectedAnswer) 
            ? selectedAnswer.map(a => a.charCodeAt(0) - 65)
            : [];
          const isSelected = isMulti 
            ? selectedIndexes.includes(index)
            : (selectedAnswer !== null && !Array.isArray(selectedAnswer) && selectedAnswer !== '' && index === Number(selectedAnswer));
          const isCorrectAnswer = currentQuestion.answer === getOptionLabel(index);
          let bgClass = 'bg-white dark:bg-gray-800';
          let borderClass = 'border-gray-200 dark:border-gray-700';

          if (isSubmitted) {
            if (isCorrectAnswer) {
              bgClass = 'bg-green-50 dark:bg-green-900/30';
              borderClass = 'border-green-500';
            } else if (isSelected && !isCorrect) {
              bgClass = 'bg-red-50 dark:bg-red-900/30';
              borderClass = 'border-red-500';
            }
          } else if (isSelected) {
            bgClass = 'bg-blue-50 dark:bg-blue-900/30';
            borderClass = 'border-blue-500';
          }

          return (
            <TouchableOpacity
              key={index}
              onPress={() => handleOptionSelect(getOptionLabel(index))}
              disabled={isSubmitted}
              className={`p-4 rounded-xl border-2 ${borderClass} ${bgClass} ${isSubmitted ? 'opacity-80' : ''}`}
            >
              <View className="flex-row items-center">
                <View
                  className={`w-8 h-8 rounded-full items-center justify-center mr-3 ${
                    isSelected ? 'bg-blue-500' : 'bg-gray-100 dark:bg-gray-700'
                  }`}
                >
                  <Text
                    className={`font-semibold ${
                      isSelected ? 'text-white' : 'text-gray-600 dark:text-gray-300'
                    }`}
                  >
                    {getOptionLabel(index)}
                  </Text>
                </View>
                <Text className="flex-1 text-gray-800 dark:text-gray-200 text-base">
                  {option}
                </Text>
                {isSubmitted && isCorrectAnswer && (
                  <Ionicons name="checkmark-circle" size={24} color="#22c55e" />
                )}
                {isSubmitted && isSelected && !isCorrect && (
                  <Ionicons name="close-circle" size={24} color="#ef4444" />
                )}
              </View>
            </TouchableOpacity>
          );
        })}
      </View>
    );
  };

  // 渲染多选题选项
  const renderMultiOptions = () => {
    if (!currentQuestion?.options) return null;
    const correctAnswers = currentQuestion.answer.split('');

    return (
      <View className="mt-4 space-y-3">
        {currentQuestion.options.map((option, index) => {
          const key = getOptionLabel(index);
          const isSelected = Array.isArray(selectedAnswer) && selectedAnswer.includes(key);
          const isCorrectAnswer = correctAnswers.includes(key);
          let bgClass = 'bg-white dark:bg-gray-800';
          let borderClass = 'border-gray-200 dark:border-gray-700';

          if (isSubmitted) {
            if (isCorrectAnswer) {
              bgClass = 'bg-green-50 dark:bg-green-900/30';
              borderClass = 'border-green-500';
            } else if (isSelected) {
              bgClass = 'bg-red-50 dark:bg-red-900/30';
              borderClass = 'border-red-500';
            }
          } else if (isSelected) {
            bgClass = 'bg-blue-50 dark:bg-blue-900/30';
            borderClass = 'border-blue-500';
          }

          return (
            <TouchableOpacity
              key={index}
              onPress={() => handleMultiSelect(key)}
              disabled={isSubmitted}
              className={`p-4 rounded-xl border-2 ${borderClass} ${bgClass} ${isSubmitted ? 'opacity-80' : ''}`}
            >
              <View className="flex-row items-center">
                <View
                  className={`w-8 h-8 rounded-lg items-center justify-center mr-3 ${
                    isSelected ? 'bg-blue-500' : 'bg-gray-100 dark:bg-gray-700'
                  }`}
                >
                  <Text
                    className={`font-semibold ${
                      isSelected ? 'text-white' : 'text-gray-600 dark:text-gray-300'
                    }`}
                  >
                    {key}
                  </Text>
                </View>
                <Text className="flex-1 text-gray-800 dark:text-gray-200 text-base">
                  {option}
                </Text>
                {isSubmitted && isCorrectAnswer && (
                  <Ionicons name="checkmark-circle" size={24} color="#22c55e" />
                )}
                {isSubmitted && isSelected && !isCorrect && (
                  <Ionicons name="close-circle" size={24} color="#ef4444" />
                )}
              </View>
            </TouchableOpacity>
          );
        })}
      </View>
    );
  };

  // 渲染判断题选项
  const renderJudgmentOptions = () => {
    const options = [
      { label: '正确', value: 'true' },
      { label: '错误', value: 'false' },
    ];

    return (
      <View className="mt-6 flex-row justify-center space-x-6">
        {options.map((option) => {
          const isSelected = selectedAnswer === option.value;
          const isCorrectAnswer = currentQuestion?.answer === option.value;
          let bgClass = 'bg-white dark:bg-gray-800';
          let borderClass = 'border-gray-200 dark:border-gray-700';

          if (isSubmitted) {
            if (isCorrectAnswer) {
              bgClass = 'bg-green-50 dark:bg-green-900/30';
              borderClass = 'border-green-500';
            } else if (isSelected) {
              bgClass = 'bg-red-50 dark:bg-red-900/30';
              borderClass = 'border-red-500';
            }
          } else if (isSelected) {
            bgClass = 'bg-blue-50 dark:bg-blue-900/30';
            borderClass = 'border-blue-500';
          }

          return (
            <TouchableOpacity
              key={option.value}
              onPress={() => handleOptionSelect(option.value)}
              disabled={isSubmitted}
              className={`w-32 h-16 rounded-2xl border-2 items-center justify-center ${borderClass} ${bgClass} ${isSubmitted ? 'opacity-80' : ''}`}
            >
              <Text
                className={`text-xl font-bold ${
                  isSelected ? 'text-blue-600' : 'text-gray-700 dark:text-gray-300'
                }`}
              >
                {option.label}
              </Text>
            </TouchableOpacity>
          );
        })}
      </View>
    );
  };

  // 渲染填空题输入
  const renderFillBlank = () => {
    return (
      <View className="mt-6">
        <TextInput
          className="bg-white dark:bg-gray-800 border-2 border-gray-200 dark:border-gray-700 rounded-xl p-4 text-gray-800 dark:text-gray-200 text-lg"
          placeholder="请输入答案"
          placeholderTextColor="#9ca3af"
          value={fillBlankAnswer}
          onChangeText={setFillBlankAnswer}
          editable={!isSubmitted}
          multiline
        />
        {isSubmitted && (
          <View className="mt-4 p-4 bg-green-50 dark:bg-green-900/30 rounded-xl">
            <Text className="text-green-700 dark:text-green-400 font-medium">
              正确答案：{currentQuestion?.answer}
            </Text>
          </View>
        )}
      </View>
    );
  };

  // 渲染智能解析区域
  const renderExplanation = () => {
    return (
      <View className="mt-4">
        {/* AI解析按钮 */}
        {!showExplanation && (
          <TouchableOpacity
            onPress={fetchAiExplanation}
            disabled={loadingExplanation}
            className="bg-purple-50 dark:bg-purple-900/30 p-4 rounded-xl border border-purple-200 dark:border-purple-800"
          >
            <View className="flex-row items-center justify-center">
              {loadingExplanation ? (
                <ActivityIndicator color="#8b5cf6" className="mr-2" />
              ) : (
                <Ionicons name="bulb-outline" size={20} color="#8b5cf6" className="mr-2" />
              )}
              <Text className="text-purple-600 dark:text-purple-400 font-medium">
                {loadingExplanation ? '正在生成解析...' : '点击获取智能解析'}
              </Text>
            </View>
          </TouchableOpacity>
        )}

        {/* AI解析内容 */}
        {showExplanation && aiExplanation && (
          <View className="bg-purple-50 dark:bg-purple-900/30 p-4 rounded-xl border border-purple-200 dark:border-purple-800">
            <View className="flex-row items-center mb-2">
              <Ionicons name="sparkles" size={18} color="#8b5cf6" className="mr-2" />
              <Text className="text-purple-600 dark:text-purple-400 font-semibold">
                AI智能解析
              </Text>
            </View>
            <Text className="text-gray-700 dark:text-gray-300 leading-relaxed">
              {aiExplanation}
            </Text>
          </View>
        )}

        {/* 原有解析 */}
        {isSubmitted && currentQuestion?.explanation && !showExplanation && (
          <View className="bg-yellow-50 dark:bg-yellow-900/30 p-4 rounded-xl border border-yellow-200 dark:border-yellow-800">
            <Text className="text-yellow-700 dark:text-yellow-400 font-semibold mb-1">
              题目解析
            </Text>
            <Text className="text-gray-700 dark:text-gray-300">
              {currentQuestion.explanation}
            </Text>
          </View>
        )}
      </View>
    );
  };

  if (isLoading) {
    return (
      <Screen>
        <SafeAreaView className="flex-1 items-center justify-center">
          <ActivityIndicator size="large" color="#3b82f6" />
          <Text className="mt-4 text-gray-500">加载中...</Text>
        </SafeAreaView>
      </Screen>
    );
  }

  if (!currentQuestion) {
    return (
      <Screen>
        <SafeAreaView className="flex-1 items-center justify-center">
          <Ionicons name="alert-circle-outline" size={64} color="#9ca3af" />
          <Text className="mt-4 text-gray-500 text-lg">暂无题目</Text>
          <TouchableOpacity
            onPress={() => safeRouter.replace('/')}
            className="mt-4 px-6 py-2 bg-blue-500 rounded-lg"
          >
            <Text className="text-white font-medium">返回首页</Text>
          </TouchableOpacity>
        </SafeAreaView>
      </Screen>
    );
  }

  return (
    <Screen>
      <SafeAreaView className="flex-1 bg-gray-50 dark:bg-gray-900">
        {/* 顶部导航栏 */}
        <View className="bg-white dark:bg-gray-800 px-4 py-3 border-b border-gray-200 dark:border-gray-700">
          <View className="flex-row items-center justify-between">
            <View className="flex-row items-center">
              <TouchableOpacity
                onPress={() => safeRouter.back()}
                className="p-2 -ml-2"
              >
                <Ionicons name="arrow-back" size={24} color="#374151" />
              </TouchableOpacity>
              <Text className="ml-2 text-lg font-semibold text-gray-800 dark:text-white">
                {getTypeName()}
              </Text>
            </View>
            <View className="flex-row items-center space-x-2">
              <Text className="text-sm text-gray-500">
                {currentIndex + 1}/{questions.length}
              </Text>
              <TouchableOpacity
                onPress={handleRefresh}
                className="p-2"
              >
                <Ionicons name="refresh" size={22} color="#6b7280" />
              </TouchableOpacity>
            </View>
          </View>
        </View>

        <ScrollView className="flex-1 p-4" contentContainerStyle={{ paddingBottom: 100 }}>
          {/* 题目类型标签 */}
          <View className="mb-4">
            <View className="bg-blue-100 dark:bg-blue-900/30 px-3 py-1 rounded-full self-start">
              <Text className="text-blue-600 dark:text-blue-400 text-sm font-medium">
                {getTypeName()}
              </Text>
            </View>
          </View>

          {/* 题目内容 */}
          <Text className="text-xl font-semibold text-gray-800 dark:text-white leading-relaxed">
            {currentQuestion.question}
          </Text>

          {/* 题目选项或输入框 */}
          {currentQuestion.type === 'choice' && renderChoiceOptions()}
          {currentQuestion.type === 'multiple_choice' && renderMultiOptions()}
          {currentQuestion.type === 'judgment' && renderJudgmentOptions()}
          {currentQuestion.type === 'fill_blank' && renderFillBlank()}

          {/* 智能解析 */}
          {isSubmitted && (
            <>
              {renderExplanation()}
              {!showExplanation && aiExplanation && (
                <TouchableOpacity
                  onPress={() => setShowExplanation(true)}
                  className="mt-3 bg-purple-50 dark:bg-purple-900/30 p-3 rounded-xl border border-purple-200 dark:border-purple-800"
                >
                  <Text className="text-purple-600 dark:text-purple-400 text-center font-medium">
                    点击查看AI智能解析
                  </Text>
                </TouchableOpacity>
              )}
            </>
          )}

          {/* 提交按钮 */}
          {!isSubmitted && (
            <TouchableOpacity
              onPress={handleSubmit}
              disabled={submitting}
              className={`mt-6 py-4 rounded-xl items-center ${
                submitting ? 'bg-gray-400' : 'bg-blue-500 active:bg-blue-600'
              }`}
            >
              {submitting ? (
                <ActivityIndicator color="#fff" />
              ) : (
                <Text className="text-white font-bold text-lg">提交答案</Text>
              )}
            </TouchableOpacity>
          )}

          {/* 答题结果反馈 */}
          {isSubmitted && (
            <View className="mt-6 p-4 rounded-xl bg-white dark:bg-gray-800">
              <View className="flex-row items-center mb-2">
                <Ionicons
                  name={isCorrect ? 'checkmark-circle' : 'close-circle'}
                  size={28}
                  color={isCorrect ? '#22c55e' : '#ef4444'}
                  className="mr-2"
                />
                <Text
                  className={`text-xl font-bold ${
                    isCorrect ? 'text-green-600' : 'text-red-600'
                  }`}
                >
                  {isCorrect ? '回答正确！' : '回答错误'}
                </Text>
              </View>
              {!isCorrect && currentQuestion.type !== 'fill_blank' && (
                <Text className="text-gray-600 dark:text-gray-400">
                  正确答案：{currentQuestion.answer}
                </Text>
              )}
            </View>
          )}
        </ScrollView>

        {/* 底部导航栏 */}
        <View className="absolute bottom-0 left-0 right-0 bg-white dark:bg-gray-800 border-t border-gray-200 dark:border-gray-700 px-4 py-3">
          <View className="flex-row items-center justify-between">
            <TouchableOpacity
              onPress={handlePrev}
              disabled={currentIndex === 0}
              className={`flex-row items-center px-4 py-2 rounded-lg ${
                currentIndex === 0
                  ? 'bg-gray-100 dark:bg-gray-700 opacity-50'
                  : 'bg-gray-100 dark:bg-gray-700'
              }`}
            >
              <Ionicons
                name="chevron-back"
                size={20}
                color={currentIndex === 0 ? '#9ca3af' : '#374151'}
              />
              <Text
                className={`ml-1 font-medium ${
                  currentIndex === 0 ? 'text-gray-400' : 'text-gray-700 dark:text-gray-300'
                }`}
              >
                上一题
              </Text>
            </TouchableOpacity>

            <TouchableOpacity
              onPress={handleRefresh}
              className="px-4 py-2 bg-orange-100 dark:bg-orange-900/30 rounded-lg"
            >
              <Text className="text-orange-600 dark:text-orange-400 font-medium">
                刷新重做
              </Text>
            </TouchableOpacity>

            <TouchableOpacity
              onPress={handleNext}
              disabled={currentIndex === questions.length - 1}
              className={`flex-row items-center px-4 py-2 rounded-lg ${
                currentIndex === questions.length - 1
                  ? 'bg-gray-100 dark:bg-gray-700 opacity-50'
                  : 'bg-gray-100 dark:bg-gray-700'
              }`}
            >
              <Text
                className={`mr-1 font-medium ${
                  currentIndex === questions.length - 1
                    ? 'text-gray-400'
                    : 'text-gray-700 dark:text-gray-300'
                }`}
              >
                下一题
              </Text>
              <Ionicons
                name="chevron-forward"
                size={20}
                color={currentIndex === questions.length - 1 ? '#9ca3af' : '#374151'}
              />
            </TouchableOpacity>
          </View>
        </View>
      </SafeAreaView>
    </Screen>
  );
}
