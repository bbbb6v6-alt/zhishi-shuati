import { Screen } from '@/components/Screen';
import { Stack } from 'expo-router';
import { useSafeRouter, useSafeSearchParams } from '@/hooks/useSafeRouter';
import { View, Text, TouchableOpacity, ScrollView, StyleSheet } from 'react-native';

interface QuestionResult {
  id: number;
  type: string;
  question: string;
  userAnswer: string;
  correctAnswer: string;
  isCorrect: boolean;
  explanation: string;
  options?: { key: string; text: string }[];
}

export default function ResultScreen() {
  const params = useSafeSearchParams<{ results?: string }>();
  const router = useSafeRouter();
  
  const results: QuestionResult[] = params.results 
    ? JSON.parse(params.results) 
    : [];
  
  const correctCount = results.filter(r => r.isCorrect).length;
  const totalCount = results.length;
  const accuracy = totalCount > 0 ? Math.round((correctCount / totalCount) * 100) : 0;

  const handleBackHome = () => {
    router.replace('/');
  };

  const handleRetry = () => {
    router.back();
  };

  const getTypeLabel = (type: string) => {
    switch (type) {
      case 'judgment': return '判断题';
      case 'choice': return '单选题';
      case 'multiple_choice': return '多选题';
      case 'fill_blank': return '填空题';
      case 'short_answer': return '简答题';
      default: return type;
    }
  };

  const getAnswerDisplay = (result: QuestionResult) => {
    if (result.type === 'fill_blank') {
      return `你的答案: ${result.userAnswer || '未作答'}`;
    }
    if (result.options) {
      return `你的答案: ${result.userAnswer}`;
    }
    return `你的答案: ${result.userAnswer === 'true' ? '正确' : '错误'}`;
  };

  return (
    <Screen>
      <Stack.Screen options={{ title: '答题结果', headerShown: true }} />
      <ScrollView style={styles.container}>
        {/* 统计卡片 */}
        <View style={styles.statsCard}>
          <Text style={styles.statsTitle}>练习完成</Text>
          <View style={styles.statsRow}>
            <View style={styles.statItem}>
              <Text style={styles.statNumber}>{correctCount}</Text>
              <Text style={styles.statLabel}>答对</Text>
            </View>
            <View style={styles.statDivider} />
            <View style={styles.statItem}>
              <Text style={styles.statNumber}>{totalCount - correctCount}</Text>
              <Text style={styles.statLabel}>答错</Text>
            </View>
            <View style={styles.statDivider} />
            <View style={styles.statItem}>
              <Text style={styles.statNumber}>{accuracy}%</Text>
              <Text style={styles.statLabel}>正确率</Text>
            </View>
          </View>
        </View>

        {/* 结果列表 */}
        <View style={styles.resultList}>
          <Text style={styles.sectionTitle}>答题详情</Text>
          {results.map((result, index) => (
            <View key={result.id} style={styles.resultCard}>
              <View style={styles.resultHeader}>
                <Text style={styles.resultNumber}>第{index + 1}题</Text>
                <View style={[
                  styles.typeTag,
                  result.type === 'multiple_choice' && styles.multiTag,
                  result.type === 'fill_blank' && styles.fillTag
                ]}>
                  <Text style={styles.typeTagText}>{getTypeLabel(result.type)}</Text>
                </View>
              </View>
              
              <Text style={styles.questionText}>{result.question}</Text>
              
              <View style={styles.answerSection}>
                <Text style={[
                  styles.answerText,
                  result.isCorrect ? styles.correctText : styles.wrongText
                ]}>
                  {getAnswerDisplay(result)}
                </Text>
                {!result.isCorrect && (
                  <Text style={styles.correctAnswerText}>
                    正确答案: {result.correctAnswer}
                  </Text>
                )}
              </View>

              <View style={styles.explanationSection}>
                <Text style={styles.explanationTitle}>解析</Text>
                <Text style={styles.explanationText}>{result.explanation}</Text>
              </View>
            </View>
          ))}
        </View>

        {/* 操作按钮 */}
        <View style={styles.buttonContainer}>
          <TouchableOpacity style={styles.retryButton} onPress={handleRetry}>
            <Text style={styles.retryButtonText}>再做一遍</Text>
          </TouchableOpacity>
          <TouchableOpacity style={styles.homeButton} onPress={handleBackHome}>
            <Text style={styles.homeButtonText}>返回首页</Text>
          </TouchableOpacity>
        </View>
      </ScrollView>
    </Screen>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#F5F5F5',
  },
  statsCard: {
    backgroundColor: '#FFFFFF',
    marginHorizontal: 16,
    marginTop: 16,
    borderRadius: 16,
    padding: 20,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.1,
    shadowRadius: 8,
    elevation: 4,
  },
  statsTitle: {
    fontSize: 16,
    color: '#666',
    textAlign: 'center',
    marginBottom: 16,
  },
  statsRow: {
    flexDirection: 'row',
    justifyContent: 'space-around',
    alignItems: 'center',
  },
  statItem: {
    alignItems: 'center',
    flex: 1,
  },
  statNumber: {
    fontSize: 32,
    fontWeight: 'bold',
    color: '#C41E3A',
  },
  statLabel: {
    fontSize: 14,
    color: '#999',
    marginTop: 4,
  },
  statDivider: {
    width: 1,
    height: 40,
    backgroundColor: '#E5E5E5',
  },
  resultList: {
    paddingHorizontal: 16,
    paddingTop: 16,
  },
  sectionTitle: {
    fontSize: 18,
    fontWeight: '600',
    color: '#333',
    marginBottom: 12,
  },
  resultCard: {
    backgroundColor: '#FFFFFF',
    borderRadius: 12,
    padding: 16,
    marginBottom: 12,
  },
  resultHeader: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    marginBottom: 8,
  },
  resultNumber: {
    fontSize: 14,
    color: '#999',
  },
  typeTag: {
    backgroundColor: '#E8F5E9',
    paddingHorizontal: 8,
    paddingVertical: 2,
    borderRadius: 4,
  },
  multiTag: {
    backgroundColor: '#FFF3E0',
  },
  fillTag: {
    backgroundColor: '#E3F2FD',
  },
  typeTagText: {
    fontSize: 12,
    color: '#333',
  },
  questionText: {
    fontSize: 15,
    color: '#333',
    lineHeight: 22,
  },
  answerSection: {
    marginTop: 12,
    paddingTop: 12,
    borderTopWidth: 1,
    borderTopColor: '#F0F0F0',
  },
  answerText: {
    fontSize: 14,
    fontWeight: '500',
  },
  correctText: {
    color: '#4CAF50',
  },
  wrongText: {
    color: '#F44336',
  },
  correctAnswerText: {
    fontSize: 14,
    color: '#4CAF50',
    marginTop: 4,
  },
  explanationSection: {
    marginTop: 12,
    paddingTop: 12,
    borderTopWidth: 1,
    borderTopColor: '#F0F0F0',
  },
  explanationTitle: {
    fontSize: 14,
    fontWeight: '600',
    color: '#333',
    marginBottom: 4,
  },
  explanationText: {
    fontSize: 14,
    color: '#666',
    lineHeight: 20,
  },
  buttonContainer: {
    flexDirection: 'row',
    paddingHorizontal: 16,
    paddingVertical: 24,
    gap: 12,
  },
  retryButton: {
    flex: 1,
    backgroundColor: '#FFF',
    borderWidth: 2,
    borderColor: '#C41E3A',
    borderRadius: 12,
    paddingVertical: 14,
    alignItems: 'center',
  },
  retryButtonText: {
    fontSize: 16,
    fontWeight: '600',
    color: '#C41E3A',
  },
  homeButton: {
    flex: 1,
    backgroundColor: '#C41E3A',
    borderRadius: 12,
    paddingVertical: 14,
    alignItems: 'center',
  },
  homeButtonText: {
    fontSize: 16,
    fontWeight: '600',
    color: '#FFF',
  },
});
