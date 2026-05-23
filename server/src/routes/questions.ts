import { Router } from 'express';
import { getSupabaseClient } from '../storage/database/supabase-client.js';

const router = Router();

// 批量导入题目
router.post('/batch', async (req, res) => {
  try {
    const client = getSupabaseClient();
    const questions = req.body;
    
    if (!Array.isArray(questions) || questions.length === 0) {
      return res.status(400).json({ success: false, error: '无效的题目数据' });
    }
    
    // 确保所有题目都有answer字段
    const cleanQuestions = questions.map((q: any) => ({
      ...q,
      answer: q.answer || '',
      explanation: q.explanation || '',
    }));
    
    // 批量插入
    const { data, error } = await client.from('questions').insert(cleanQuestions).select();
    
    if (error) {
      console.error('批量插入失败:', error);
      return res.status(500).json({ success: false, error: error.message });
    }
    
    res.json({ success: true, count: data?.length || 0 });
  } catch (error: any) {
    console.error('批量导入失败:', error);
    res.status(500).json({ success: false, error: error.message });
  }
});

// 获取所有题目（支持按类型筛选和按ID列表获取）
router.get('/', async (req, res) => {
  try {
    const client = getSupabaseClient();
    const { type, limit, offset, ids } = req.query;
    
    let query = client.from('questions').select('*');
    
    if (ids) {
      // 按ID列表获取，支持 ids=1,2,3 或 ids[0]=1&ids[1]=2 两种格式
      let idList: number[] = [];
      if (Array.isArray(ids)) {
        idList = ids.map(id => parseInt(String(id).trim())).filter(id => !isNaN(id));
      } else {
        idList = String(ids).split(',').map(id => parseInt(id.trim())).filter(id => !isNaN(id));
      }
      if (idList.length > 0) {
        query = query.in('id', idList);
      }
    } else if (type && type !== 'all') {
      query = query.eq('type', type);
    }
    
    if (limit) {
      query = query.limit(parseInt(limit as string));
    }
    if (offset && !ids) {
      query = query.range(parseInt(offset as string), parseInt(offset as string) + (parseInt(limit as string) || 10) - 1);
    }
    
    const { data, error } = await query;
    
    if (error) throw new Error(`查询失败: ${error.message}`);
    
    // 解析 options 和 answer JSON 字段
    const formattedResult = (data || []).map((q: any) => {
      let parsedOptions = null;
      let parsedAnswer = q.answer;
      
      // 解析 options 字段
      if (q.options) {
        try {
          parsedOptions = JSON.parse(q.options);
        } catch {
          // 如果解析失败，可能是简单选项字符串（如"A,B,C,D"），转换为数组
          if (typeof q.options === 'string' && /^[A-Z,]+$/.test(q.options)) {
            parsedOptions = q.options.split(',');
          }
        }
      }
      
      // 解析 answer 字段（多选题答案保持字符串格式如"AB"，前端会处理）
      if (q.answer && typeof q.answer === 'string') {
        // 如果是多选题且答案是简单字符串（如"AB"），保持字符串格式
        if (q.type === 'multiple_choice' && /^[A-Z]+$/.test(q.answer)) {
          parsedAnswer = q.answer; // 保持 "AB" 字符串格式
        }
      } else if (q.answer && Array.isArray(q.answer)) {
        // 如果 answer 已经是数组（可能是 Supabase JSON 类型自动解析），转为字符串
        if (q.type === 'multiple_choice') {
          parsedAnswer = q.answer.join(''); // ["A","B"] -> "AB"
        }
      }
      
      return {
        ...q,
        options: parsedOptions,
        answer: parsedAnswer,
      };
    });
    
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
    
    // 多选题答案是简单字符串如"AB"，转为数组
    let formattedAnswer = data.answer;
    if (data.type === 'multiple_choice' && data.answer && typeof data.answer === 'string' && /^[A-Z]+$/.test(data.answer)) {
      formattedAnswer = data.answer.split('');
    }
    
    res.json({
      success: true,
      data: {
        ...data,
        options: data.options ? (() => { try { return JSON.parse(data.options); } catch { return null; } })() : null,
        answer: formattedAnswer,
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
    
    const { count: multipleChoice, error: multipleChoiceError } = await client
      .from('questions')
      .select('*', { count: 'exact', head: true })
      .eq('type', 'multiple_choice');
    if (multipleChoiceError) throw new Error(`统计失败: ${multipleChoiceError.message}`);
    
    const { count: fillBlank, error: fillBlankError } = await client
      .from('questions')
      .select('*', { count: 'exact', head: true })
      .eq('type', 'fill_blank');
    if (fillBlankError) throw new Error(`统计失败: ${fillBlankError.message}`);
    
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
        multipleChoice: multipleChoice || 0,
        fillBlank: fillBlank || 0,
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
    // 多选题答案可能是字符串 "AB"，也可能是 JSON 数组格式
    let correctAnswer = question.answer;
    if (question.type === 'multiple_choice') {
      // 多选题答案：如果是字符串直接使用，如果是 JSON 字符串则解析
      if (typeof question.answer === 'string') {
        try {
          const parsed = JSON.parse(question.answer);
          correctAnswer = Array.isArray(parsed) ? parsed.join('') : parsed;
        } catch {
          correctAnswer = question.answer; // 已经是字符串 "AB"
        }
      } else if (Array.isArray(question.answer)) {
        correctAnswer = question.answer.join(''); // 数组转字符串
      }
    } else {
      // 非多选题：如果是 JSON 字符串则解析
      if (typeof question.answer === 'string' && question.answer.startsWith('[')) {
        try {
          correctAnswer = JSON.parse(question.answer);
        } catch {
          correctAnswer = question.answer;
        }
      }
    }
    
    // 判断答案是否正确
    let isCorrect = false;
    if (question.type === 'short_answer') {
      // 简答题：用户答案与标准答案进行模糊匹配
      const userAnswerLower = String(userAnswer || '').toLowerCase().trim();
      const correctAnswerLower = String(correctAnswer || '').toLowerCase().trim();
      isCorrect = correctAnswerLower.includes(userAnswerLower) || userAnswerLower.includes(correctAnswerLower);
    } else if (question.type === 'multiple_choice') {
      // 多选题：排序后比较字符串
      const userStr = String(userAnswer || '').split('').sort().join('');
      const correctStr = String(correctAnswer || '').split('').sort().join('');
      isCorrect = userStr === correctStr;
    } else if (question.type === 'choice' && Array.isArray(correctAnswer)) {
      // 可能是之前遗留的多选题格式（数组）
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
    
    // 解析 options
    let parsedOptions = null;
    if (question.options) {
      try {
        parsedOptions = JSON.parse(question.options);
      } catch {
        parsedOptions = ['A', 'B', 'C', 'D']; // 默认选项
      }
    }
    
    res.json({
      success: true,
      data: {
        isCorrect,
        correctAnswer,
        explanation: question.explanation,
        question: {
          ...question,
          options: parsedOptions,
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
