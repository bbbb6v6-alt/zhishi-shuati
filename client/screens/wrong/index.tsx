import React, { useState, useCallback } from 'react';
import { View, Text, TouchableOpacity, StyleSheet, ScrollView, ActivityIndicator, Alert } from 'react-native';
import { Screen } from '@/components/Screen';
import { useSafeRouter } from '@/hooks/useSafeRouter';
import { useFocusEffect } from 'expo-router';
import { FontAwesome6 } from '@expo/vector-icons';

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
  const [wrongQuestions, setWrongQuestions] = useState<WrongQuestion[]>([]);
  const [loading, setLoading] = useState(true);
  const [expandedId, setExpandedId] = useState<number | null>(null);

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

  const handleClearAll = () => {
    Alert.alert(
      '清空错题',
      '确定要清空所有错题记录吗？',
      [
        { text: '取消', style: 'cancel' },
        {
          text: '确定',
          style: 'destructive',
          onPress: async () => {
            try {
              const response = await fetch(`${EXPO_PUBLIC_BACKEND_BASE_URL}/api/v1/questions/wrong/clear`, {
                method: 'DELETE',
              });
              const data = await response.json();
              if (data.success) {
                setWrongQuestions([]);
              }
            } catch (error) {
              console.error('Failed to clear wrong questions:', error);
            }
          },
        },
      ]
    );
  };

  const handleDeleteOne = async (id: number) => {
    try {
      const response = await fetch(`${EXPO_PUBLIC_BACKEND_BASE_URL}/api/v1/questions/wrong/${id}`, {
        method: 'DELETE',
      });
      const data = await response.json();
      if (data.success) {
        setWrongQuestions(wrongQuestions.filter(q => q.id !== id));
      }
    } catch (error) {
      console.error('Failed to delete wrong question:', error);
    }
  };

  const handleRePractice = (questionId: number) => {
    router.push('/practice', { type: 'wrong', questionId: questionId.toString() });
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

  const formatAnswer = (answer: any, type: string, options: string[] | null) => {
    if (type === 'judgment') {
      return answer ? '正确' : '错误';
    }
    if (type === 'choice' && options) {
      if (Array.isArray(answer)) {
        return answer.map((i: number) => String.fromCharCode(65 + i)).join('、');
      }
      return String.fromCharCode(65 + answer);
    }
    return String(answer || '未作答');
  };

  const formatCorrectAnswer = (answer: any, type: string, options: string[] | null) => {
    if (type === 'judgment') {
      return answer ? '正确' : '错误';
    }
    if (type === 'choice' && options) {
      if (Array.isArray(answer)) {
        return answer.map((i: number) => `${String.fromCharCode(65 + i)}. ${options[i]}`).join('、');
      }
      return `${String.fromCharCode(65 + answer)}. ${options[answer]}`;
    }
    return String(answer);
  };

  if (loading) {
    return (
      <Screen>
        <View className="flex-1 items-center justify-center">
          <ActivityIndicator size="large" color="#C41E3A" />
        </View>
      </Screen>
    );
  }

  return (
    <Screen>
      {/* Header */}
      <View className="bg-white px-4 py-4 border-b border-gray-100">
        <View className="flex-row items-center justify-between">
          <TouchableOpacity onPress={() => router.back()}>
            <Text className="text-[#C41E3A] text-base">← 返回</Text>
          </TouchableOpacity>
          <Text className="text-lg font-bold text-gray-800">错题集</Text>
          {wrongQuestions.length > 0 && (
            <TouchableOpacity onPress={handleClearAll}>
              <Text className="text-[#DC2626] text-base">清空</Text>
            </TouchableOpacity>
          )}
        </View>
      </View>

      {wrongQuestions.length === 0 ? (
        <View className="flex-1 items-center justify-center px-6">
          <View className="w-20 h-20 rounded-full bg-[#D1FAE5] items-center justify-center mb-4">
            <FontAwesome6 name="circle-check" size={40} color="#059669" />
          </View>
          <Text className="text-xl text-gray-600 font-bold">太棒了！</Text>
          <Text className="text-gray-500 mt-2 text-center">
            暂无错题记录{'\n'}继续保持，再接再厉！
          </Text>
          <TouchableOpacity 
            className="mt-8 bg-[#C41E3A] px-8 py-3 rounded-xl"
            onPress={() => router.back()}
          >
            <Text className="text-white font-bold">返回首页</Text>
          </TouchableOpacity>
        </View>
      ) : (
        <ScrollView className="flex-1 px-4 py-4" showsVerticalScrollIndicator={false}>
          {/* Stats */}
          <View className="bg-white rounded-2xl p-4 mb-4 shadow-sm">
            <View className="flex-row items-center">
              <View className="w-12 h-12 rounded-full bg-[#FEE2E2] items-center justify-center mr-4">
                <View className="w-12 h-12 rounded-full bg-[#FEE2E2] items-center justify-center mr-4">
                <FontAwesome6 name="pencil" size={22} color="#DC2626" />
              </View>
              </View>
              <View>
                <Text className="text-lg font-bold text-gray-800">错题统计</Text>
                <Text className="text-gray-500 text-sm mt-1">
                  共 {wrongQuestions.length} 道错题待复习
                </Text>
              </View>
            </View>
          </View>

          {/* Wrong Questions List */}
          <Text className="text-base font-bold text-gray-800 mb-3">错题列表</Text>
          {wrongQuestions.map((item) => (
            <View 
              key={item.id} 
              className="bg-white rounded-2xl p-4 mb-3 shadow-sm overflow-hidden"
            >
              {/* Question Header */}
              <TouchableOpacity
                className="flex-row items-center justify-between"
                onPress={() => setExpandedId(expandedId === item.id ? null : item.id)}
                activeOpacity={0.8}
              >
                <View className="flex-1">
                  <View className="flex-row items-center mb-2">
                    <View 
                      className="px-2 py-0.5 rounded mr-2"
                      style={{ backgroundColor: getTypeColor(item.question?.type || '') + '20' }}
                    >
                      <Text 
                        className="text-xs font-bold"
                        style={{ color: getTypeColor(item.question?.type || '') }}
                      >
                        {getTypeLabel(item.question?.type || '')}
                      </Text>
                    </View>
                  </View>
                  <Text className="text-base text-gray-800 line-clamp-2" numberOfLines={2}>
                    {item.question?.question || '题目已删除'}
                  </Text>
                </View>
                <Text className="text-gray-400 text-xl ml-3">
                  {expandedId === item.id ? '↑' : '↓'}
                </Text>
              </TouchableOpacity>

              {/* Expanded Content */}
              {expandedId === item.id && item.question && (
                <View className="mt-4 pt-4 border-t border-gray-100">
                  {/* User's Wrong Answer */}
                  <View className="mb-3">
                    <Text className="text-sm text-gray-500 mb-1">你的答案：</Text>
                    <Text className="text-[#DC2626] font-medium">
                      {formatAnswer(item.userAnswer, item.question.type, item.question.options)}
                    </Text>
                  </View>

                  {/* Correct Answer */}
                  <View className="mb-4">
                    <Text className="text-sm text-gray-500 mb-1">正确答案：</Text>
                    <Text className="text-[#059669] font-bold">
                      {formatCorrectAnswer(item.question.answer, item.question.type, item.question.options)}
                    </Text>
                  </View>

                  {/* Explanation */}
                  <View className="mb-4 p-3 bg-[#FEF3C7] rounded-xl">
                    <Text className="text-sm text-gray-600 mb-1">解析：</Text>
                    <Text className="text-sm text-gray-700 leading-relaxed">
                      {item.question.explanation}
                    </Text>
                  </View>

                  {/* Actions */}
                  <View className="flex-row justify-between">
                    <TouchableOpacity
                      className="px-4 py-2 rounded-lg border border-gray-200"
                      onPress={() => handleDeleteOne(item.id)}
                    >
                      <Text className="text-gray-600 text-sm">移除</Text>
                    </TouchableOpacity>
                    <TouchableOpacity
                      className="px-4 py-2 rounded-lg bg-[#C41E3A]"
                      onPress={() => handleRePractice(item.questionId)}
                    >
                      <Text className="text-white text-sm font-bold">重新练习</Text>
                    </TouchableOpacity>
                  </View>
                </View>
              )}
            </View>
          ))}
          <View className="h-8" />
        </ScrollView>
      )}
    </Screen>
  );
}

const styles = {
  container: 'flex-1 bg-[#F5F5F5]',
};
