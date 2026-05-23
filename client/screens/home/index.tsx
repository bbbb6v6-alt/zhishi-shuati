import React, { useState, useEffect, useCallback } from 'react';
import { View, Text, TouchableOpacity, StyleSheet, ScrollView, ActivityIndicator } from 'react-native';
import { Screen } from '@/components/Screen';
import { useSafeRouter } from '@/hooks/useSafeRouter';
import { useFocusEffect } from 'expo-router';
import { FontAwesome6 } from '@expo/vector-icons';

const EXPO_PUBLIC_BACKEND_BASE_URL = process.env.EXPO_PUBLIC_BACKEND_BASE_URL || 'http://localhost:9091';

interface Stats {
  total: number;
  judgment: number;
  choice: number;
  multipleChoice: number;
  fillBlank: number;
  shortAnswer: number;
  wrongCount: number;
}

export default function HomeScreen() {
  const router = useSafeRouter();
  const [stats, setStats] = useState<Stats | null>(null);
  const [loading, setLoading] = useState(true);

  const fetchStats = async () => {
    try {
      const response = await fetch(`${EXPO_PUBLIC_BACKEND_BASE_URL}/api/v1/questions/stats/overview`);
      const data = await response.json();
      if (data.success) {
        setStats(data.data);
      }
    } catch (error) {
      console.error('Failed to fetch stats:', error);
    } finally {
      setLoading(false);
    }
  };

  useFocusEffect(
    useCallback(() => {
      fetchStats();
    }, [])
  );

  const handlePractice = (type: string) => {
    router.push('/practice', { type });
  };

  const handleWrong = () => {
    router.push('/wrong');
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
      <View className="bg-[#C41E3A] px-5 pb-8 pt-4">
        <Text className="text-3xl font-bold text-white mt-2">党史刷题</Text>
        <Text className="text-white/80 mt-1 text-base">不忘初心 · 牢记使命</Text>
      </View>

      <ScrollView className="flex-1 -mt-4" showsVerticalScrollIndicator={false}>
        {/* Stats Card */}
        <View className="bg-white rounded-2xl mx-4 p-5 shadow-lg">
          <Text className="text-lg font-bold text-gray-800 mb-4">学习统计</Text>
          <View className="flex-row justify-between">
            <View className="items-center flex-1">
              <Text className="text-3xl font-bold text-[#C41E3A]">{stats?.total || 0}</Text>
              <Text className="text-sm text-gray-500 mt-1">总题数</Text>
            </View>
            <View className="items-center flex-1">
              <Text className="text-3xl font-bold text-[#059669]">{stats?.wrongCount || 0}</Text>
              <Text className="text-sm text-gray-500 mt-1">错题数</Text>
            </View>
            <View className="items-center flex-1">
              <Text className="text-3xl font-bold text-[#0EA5E9]">
                {stats && stats.total > 0 ? Math.round(((stats.total - stats.wrongCount) / stats.total) * 100) : 100}%
              </Text>
              <Text className="text-sm text-gray-500 mt-1">正确率</Text>
            </View>
          </View>
        </View>

        {/* Practice Modes */}
        <View className="px-4 mt-6">
          <Text className="text-lg font-bold text-gray-800 mb-4">练习模式</Text>
          
          {/* Mode Cards */}
          <TouchableOpacity 
            className="bg-white rounded-2xl p-4 mb-3 shadow-sm border-l-4 border-[#C41E3A]"
            onPress={() => handlePractice('all')}
            activeOpacity={0.8}
          >
            <View className="flex-row items-center">
              <View className="w-12 h-12 rounded-full bg-[#FEE2E2] items-center justify-center mr-4">
                <FontAwesome6 name="book" size={22} color="#C41E3A" />
              </View>
              <View className="flex-1">
                <Text className="text-base font-bold text-gray-800">顺序练习</Text>
                <Text className="text-sm text-gray-500 mt-1">按题库顺序逐一练习</Text>
              </View>
              <Text className="text-gray-400 text-xl">›</Text>
            </View>
          </TouchableOpacity>

          <TouchableOpacity 
            className="bg-white rounded-2xl p-4 mb-3 shadow-sm border-l-4 border-[#0EA5E9]"
            onPress={() => handlePractice('random')}
            activeOpacity={0.8}
          >
            <View className="flex-row items-center">
              <View className="w-12 h-12 rounded-full bg-[#E0F2FE] items-center justify-center mr-4">
                <FontAwesome6 name="shuffle" size={20} color="#0EA5E9" />
              </View>
              <View className="flex-1">
                <Text className="text-base font-bold text-gray-800">随机练习</Text>
                <Text className="text-sm text-gray-500 mt-1">打乱顺序随机抽取题目</Text>
              </View>
              <Text className="text-gray-400 text-xl">›</Text>
            </View>
          </TouchableOpacity>

          <TouchableOpacity 
            className="bg-white rounded-2xl p-4 mb-3 shadow-sm border-l-4 border-[#DC2626]"
            onPress={handleWrong}
            activeOpacity={0.8}
          >
            <View className="flex-row items-center">
              <View className="w-12 h-12 rounded-full bg-[#FEE2E2] items-center justify-center mr-4">
                <FontAwesome6 name="pencil" size={20} color="#DC2626" />
              </View>
              <View className="flex-1">
                <Text className="text-base font-bold text-gray-800">错题复习</Text>
                <Text className="text-sm text-gray-500 mt-1">专项训练已收藏的错题</Text>
              </View>
              {stats && stats.wrongCount > 0 && (
                <View className="bg-[#DC2626] rounded-full px-2 py-1">
                  <Text className="text-white text-xs font-bold">{stats.wrongCount}</Text>
                </View>
              )}
              <Text className="text-gray-400 text-xl ml-2">›</Text>
            </View>
          </TouchableOpacity>

          <Text className="text-lg font-bold text-gray-800 mt-6 mb-4">题型专练</Text>

          <TouchableOpacity 
            className="bg-white rounded-2xl p-4 mb-3 shadow-sm"
            onPress={() => handlePractice('judgment')}
            activeOpacity={0.8}
          >
            <View className="flex-row items-center justify-between">
              <View className="flex-row items-center">
                <View className="w-10 h-10 rounded-full bg-[#FEE2E2] items-center justify-center mr-3">
                  <Text className="text-xl">✓</Text>
                </View>
                <Text className="text-base font-bold text-gray-800">判断题</Text>
              </View>
              <View className="flex-row items-center">
                <Text className="text-sm text-gray-500 mr-2">{stats?.judgment || 0} 题</Text>
                <Text className="text-gray-400 text-xl">›</Text>
              </View>
            </View>
          </TouchableOpacity>

          <TouchableOpacity 
            className="bg-white rounded-2xl p-4 mb-3 shadow-sm"
            onPress={() => handlePractice('choice')}
            activeOpacity={0.8}
          >
            <View className="flex-row items-center justify-between">
              <View className="flex-row items-center">
                <View className="w-10 h-10 rounded-full bg-[#DBEAFE] items-center justify-center mr-3">
                  <Text className="text-xl">③</Text>
                </View>
                <Text className="text-base font-bold text-gray-800">选择题</Text>
              </View>
              <View className="flex-row items-center">
                <Text className="text-sm text-gray-500 mr-2">{stats?.choice || 0} 题</Text>
                <Text className="text-gray-400 text-xl">›</Text>
              </View>
            </View>
          </TouchableOpacity>

          <TouchableOpacity 
            className="bg-white rounded-2xl p-4 mb-3 shadow-sm"
            onPress={() => handlePractice('short_answer')}
            activeOpacity={0.8}
          >
            <View className="flex-row items-center justify-between">
              <View className="flex-row items-center">
                <View className="w-10 h-10 rounded-full bg-[#FEF3C7] items-center justify-center mr-3">
                  <Text className="text-xl">✎</Text>
                </View>
                <Text className="text-base font-bold text-gray-800">简答题</Text>
              </View>
              <View className="flex-row items-center">
                <Text className="text-sm text-gray-500 mr-2">{stats?.shortAnswer || 0} 题</Text>
                <Text className="text-gray-400 text-xl">›</Text>
              </View>
            </View>
          </TouchableOpacity>

          <TouchableOpacity 
            className="bg-white rounded-2xl p-4 mb-3 shadow-sm"
            onPress={() => handlePractice('multiple_choice')}
            activeOpacity={0.8}
          >
            <View className="flex-row items-center justify-between">
              <View className="flex-row items-center">
                <View className="w-10 h-10 rounded-full bg-[#D1FAE5] items-center justify-center mr-3">
                  <FontAwesome6 name="check" size={20} color="#059669" />
                </View>
                <Text className="text-base font-bold text-gray-800">多选题</Text>
              </View>
              <View className="flex-row items-center">
                <Text className="text-sm text-gray-500 mr-2">{stats?.multipleChoice || 0} 题</Text>
                <Text className="text-gray-400 text-xl">›</Text>
              </View>
            </View>
          </TouchableOpacity>

          <TouchableOpacity 
            className="bg-white rounded-2xl p-4 mb-3 shadow-sm"
            onPress={() => handlePractice('fill_blank')}
            activeOpacity={0.8}
          >
            <View className="flex-row items-center justify-between">
              <View className="flex-row items-center">
                <View className="w-10 h-10 rounded-full bg-[#E9D5FF] items-center justify-center mr-3">
                  <Text className="text-xl">▢</Text>
                </View>
                <Text className="text-base font-bold text-gray-800">填空题</Text>
              </View>
              <View className="flex-row items-center">
                <Text className="text-sm text-gray-500 mr-2">{stats?.fillBlank || 0} 题</Text>
                <Text className="text-gray-400 text-xl">›</Text>
              </View>
            </View>
          </TouchableOpacity>
        </View>

        <View className="h-8" />
      </ScrollView>
    </Screen>
  );
}

const styles = {
  container: 'flex-1 bg-[#FEF2F2]',
};
