import { Router } from 'express';
import { getSupabaseClient } from '../storage/database/supabase-client.js';

const router = Router();

// 获取所有题目（支持按类型筛选）
router.get('/', async (req, res) => {
  try {
    const client = getSupabaseClient();
    const { type, limit, offset } = req.query;
    
    let query = client.from('questions').select('*');
    
    if (type && type !== 'all') {
      query = query.eq('type', type);
    }
    
    if (limit) {
      query = query.limit(parseInt(limit as string));
    }
    if (offset) {
      query = query.range(parseInt(offset as string), parseInt(offset as string) + (parseInt(limit as string) || 10) - 1);
    }
    
    const { data, error } = await query;
    
    if (error) throw new Error(`查询失败: ${error.message}`);
    
    // 解析 options 和 answer JSON 字段
    const formattedResult = (data || []).map((q: any) => ({
      ...q,
      options: q.options ? JSON.parse(q.options) : null,
      answer: q.answer ? JSON.parse(q.answer) : q.answer,
    }));
    
    res.json({ success: true, data: formattedResult });
  } catch (error) {
    console.error('Error fetching questions:', error);
    res.status(500).json({ success: false, error: '获取题目失败' });
  }
});

// 获取单道题目
router.get('/:id', async (req, res) => {
  try {
    const client = getSupabaseClient();
    const { id } = req.params;
    const { data, error } = await client
      .from('questions')
      .select('*')
      .eq('id', parseInt(id))
      .maybeSingle();
    
    if (error) throw new Error(`查询失败: ${error.message}`);
    if (!data) {
      return res.status(404).json({ success: false, error: '题目不存在' });
    }
    
    res.json({
      success: true,
      data: {
        ...data,
        options: data.options ? JSON.parse(data.options) : null,
        answer: data.answer ? JSON.parse(data.answer) : data.answer,
      }
    });
  } catch (error) {
    console.error('Error fetching question:', error);
    res.status(500).json({ success: false, error: '获取题目失败' });
  }
});

// 获取题目统计
router.get('/stats/overview', async (req, res) => {
  try {
    const client = getSupabaseClient();
    
    const { count: total, error: totalError } = await client
      .from('questions')
      .select('*', { count: 'exact', head: true });
    if (totalError) throw new Error(`统计失败: ${totalError.message}`);
    
    const { count: judgment, error: judgmentError } = await client
      .from('questions')
      .select('*', { count: 'exact', head: true })
      .eq('type', 'judgment');
    if (judgmentError) throw new Error(`统计失败: ${judgmentError.message}`);
    
    const { count: choice, error: choiceError } = await client
      .from('questions')
      .select('*', { count: 'exact', head: true })
      .eq('type', 'choice');
    if (choiceError) throw new Error(`统计失败: ${choiceError.message}`);
    
    const { count: shortAnswer, error: shortAnswerError } = await client
      .from('questions')
      .select('*', { count: 'exact', head: true })
      .eq('type', 'short_answer');
    if (shortAnswerError) throw new Error(`统计失败: ${shortAnswerError.message}`);
    
    const { count: wrongCount, error: wrongError } = await client
      .from('wrong_questions')
      .select('question_id', { count: 'exact', head: true })
      .eq('is_wrong', true);
    if (wrongError) throw new Error(`统计失败: ${wrongError.message}`);
    
    res.json({
      success: true,
      data: {
        total: total || 0,
        judgment: judgment || 0,
        choice: choice || 0,
        shortAnswer: shortAnswer || 0,
        wrongCount: wrongCount || 0,
      }
    });
  } catch (error) {
    console.error('Error fetching stats:', error);
    res.status(500).json({ success: false, error: '获取统计失败' });
  }
});

// 提交答案并记录错题
router.post('/submit', async (req, res) => {
  try {
    const client = getSupabaseClient();
    const { questionId, userAnswer } = req.body;
    
    // 获取题目
    const { data: questionData, error: questionError } = await client
      .from('questions')
      .select('*')
      .eq('id', questionId)
      .maybeSingle();
    
    if (questionError) throw new Error(`查询失败: ${questionError.message}`);
    if (!questionData) {
      return res.status(404).json({ success: false, error: '题目不存在' });
    }
    
    const question = questionData;
    const correctAnswer = question.answer ? JSON.parse(question.answer) : question.answer;
    
    // 判断答案是否正确
    let isCorrect = false;
    if (question.type === 'short_answer') {
      // 简答题：用户答案与标准答案进行模糊匹配
      const userAnswerLower = String(userAnswer || '').toLowerCase().trim();
      const correctAnswerLower = String(correctAnswer || '').toLowerCase().trim();
      isCorrect = correctAnswerLower.includes(userAnswerLower) || userAnswerLower.includes(correctAnswerLower);
    } else if (question.type === 'choice' && Array.isArray(correctAnswer)) {
      // 多选题
      const userAnswerArray = Array.isArray(userAnswer) ? userAnswer.sort() : [userAnswer];
      const correctAnswerArray = [...correctAnswer].sort();
      isCorrect = JSON.stringify(userAnswerArray) === JSON.stringify(correctAnswerArray);
    } else {
      // 判断题和单选题
      isCorrect = userAnswer === correctAnswer || String(userAnswer) === String(correctAnswer);
    }
    
    // 记录错题
    if (!isCorrect) {
      const { error: insertError } = await client.from('wrong_questions').insert({
        question_id: questionId,
        user_answer: typeof userAnswer === 'object' ? JSON.stringify(userAnswer) : String(userAnswer),
        is_wrong: true,
      });
      if (insertError) throw new Error(`插入失败: ${insertError.message}`);
    }
    
    res.json({
      success: true,
      data: {
        isCorrect,
        correctAnswer,
        explanation: question.explanation,
        question: {
          ...question,
          options: question.options ? JSON.parse(question.options) : null,
        }
      }
    });
  } catch (error) {
    console.error('Error submitting answer:', error);
    res.status(500).json({ success: false, error: '提交答案失败' });
  }
});

// 获取错题列表
router.get('/wrong/list', async (req, res) => {
  try {
    const client = getSupabaseClient();
    const { data: wrongList, error } = await client
      .from('wrong_questions')
      .select(`
        id,
        question_id,
        user_answer,
        answered_at,
        questions (
          id,
          type,
          question,
          options,
          answer,
          explanation
        )
      `)
      .eq('is_wrong', true)
      .order('answered_at', { ascending: false });
    
    if (error) throw new Error(`查询失败: ${error.message}`);
    
    const formattedList = (wrongList || []).map((item: any) => ({
      id: item.id,
      questionId: item.question_id,
      userAnswer: item.user_answer ? (item.user_answer.startsWith('[') ? JSON.parse(item.user_answer) : item.user_answer) : null,
      answeredAt: item.answered_at,
      question: item.questions ? {
        ...item.questions,
        options: item.questions.options ? JSON.parse(item.questions.options) : null,
        answer: item.questions.answer ? JSON.parse(item.questions.answer) : item.questions.answer,
      } : null,
    }));
    
    res.json({ success: true, data: formattedList });
  } catch (error) {
    console.error('Error fetching wrong questions:', error);
    res.status(500).json({ success: false, error: '获取错题列表失败' });
  }
});

// 清空错题记录
router.delete('/wrong/clear', async (req, res) => {
  try {
    const client = getSupabaseClient();
    const { error } = await client
      .from('wrong_questions')
      .delete()
      .eq('is_wrong', true);
    
    if (error) throw new Error(`删除失败: ${error.message}`);
    res.json({ success: true, message: '错题已清空' });
  } catch (error) {
    console.error('Error clearing wrong questions:', error);
    res.status(500).json({ success: false, error: '清空错题失败' });
  }
});

// 删除单条错题
router.delete('/wrong/:id', async (req, res) => {
  try {
    const client = getSupabaseClient();
    const { id } = req.params;
    const { error } = await client
      .from('wrong_questions')
      .delete()
      .eq('id', parseInt(id));
    
    if (error) throw new Error(`删除失败: ${error.message}`);
    res.json({ success: true, message: '错题已删除' });
  } catch (error) {
    console.error('Error deleting wrong question:', error);
    res.status(500).json({ success: false, error: '删除错题失败' });
  }
});

export default router;
