import { Router } from 'express';
import { FetchClient, Config, S3Storage } from 'coze-coding-dev-sdk';
import { getSupabaseClient } from '../storage/database/supabase-client.js';

const router = Router();

// 批量导入题目
router.post('/batch', async (req, res) => {
  try {
    const client = getSupabaseClient();
    const { questions } = req.body;
    
    if (!Array.isArray(questions) || questions.length === 0) {
      return res.status(400).json({ success: false, error: '无效的题目数据' });
    }
    
    // 批量插入
    const { data, error } = await client.from('questions').insert(questions).select();
    
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

// 持久化存储的PDF URL（从沙箱URL转换而来）
const PDF_KEY = 'file_af6200cf';

// 获取PDF的持久化URL
async function getPdfUrl(): Promise<string> {
  const storage = new S3Storage({});
  return await storage.generatePresignedUrl({
    key: PDF_KEY,
    expireTime: 86400,
  });
}

// 解析题库文本，提取题目
function parseQuestions(text: string) {
  const questions: any[] = [];
  
  // 匹配判断题模式
  const judgmentPattern = /(\d+)[\u3000\s]*[（(][\u4e00-\u9fa5][\u4e00-\u9fa5][\u3000\s]*[）)]\s*([^\n]+?)(?=\n\n|\d+[\u3000\s]*[（(]|答案：|$)/g;
  
  // 匹配选择题模式
  const choicePattern = /(\d+)[\u3000\s]*[（(][\u4e00-\u9fa5][\u4e00-\u9fa5][\u3000\s]*[）)]\s*([^\n]+?)(?=\nA[．.．][^\n]+(?:\n[BCDE][．.．][^\n]+)*\n*答案：|$)/g;
  
  // 更通用的解析方法：按行解析
  const lines = text.split('\n').filter(line => line.trim());
  
  let currentQuestion: any = null;
  let currentType = '';
  let options: string[] = [];
  let questionText = '';
  let answerText = '';
  let explanationText = '';
  let state: 'none' | 'question' | 'options' | 'answer' | 'explanation' = 'none';
  
  for (let i = 0; i < lines.length; i++) {
    const line = lines[i].trim();
    
    // 检测题目类型标识
    if (line.includes('判断') || line.includes('一、')) {
      currentType = 'judgment';
      if (currentQuestion) {
        questions.push({ ...currentQuestion, answer: answerText, explanation: explanationText });
      }
      currentQuestion = { type: 'judgment' };
      answerText = '';
      explanationText = '';
      continue;
    }
    
    if (line.includes('选择') || line.includes('二、')) {
      currentType = 'choice';
      if (currentQuestion && questionText) {
        questions.push({ ...currentQuestion, question: questionText, options: options.length > 0 ? options : null, answer: answerText, explanation: explanationText });
      }
      currentQuestion = { type: 'choice' };
      questionText = '';
      options = [];
      answerText = '';
      explanationText = '';
      continue;
    }
    
    if (line.includes('简答') || line.includes('三、')) {
      currentType = 'short_answer';
      if (currentQuestion && questionText) {
        questions.push({ ...currentQuestion, question: questionText, options: null, answer: answerText, explanation: explanationText });
      }
      currentQuestion = { type: 'short_answer' };
      questionText = '';
      options = [];
      answerText = '';
      explanationText = '';
      continue;
    }
    
    // 检测答案行
    if (line.startsWith('答案：') || line.startsWith('答案:')) {
      answerText = line.replace(/^答案[：:]\s*/, '').trim();
      state = 'answer';
      continue;
    }
    
    // 检测解析行
    if (line.startsWith('解析：') || line.startsWith('解析:')) {
      explanationText = line.replace(/^解析[：:]\s*/, '').trim();
      state = 'explanation';
      continue;
    }
    
    // 检测选项
    if (/^[A-G][．.．]\s*/.test(line)) {
      const optionText = line.replace(/^[A-G][．.．]\s*/, '').trim();
      options.push(optionText);
      state = 'options';
      continue;
    }
    
    // 检测题目编号（如 "1." 或 "1、"）
    if (/^\d+[.、]\s*/.test(line) && !line.includes('A.') && !line.includes('B.')) {
      // 保存之前的题目
      if (currentQuestion && questionText) {
        let answer = answerText;
        if (currentType === 'judgment') {
          answer = answerText.includes('正确') || answerText.includes('对') ? 'true' : 'false';
        } else if (currentType === 'choice' && options.length > 0) {
          // 转换字母答案为索引
          const answerIndex = ['A', 'B', 'C', 'D', 'E', 'F', 'G'].findIndex(a => 
            answerText.includes(a) || answerText.includes(String.fromCharCode(65 + ['A', 'B', 'C', 'D', 'E', 'F', 'G'].indexOf(a)))
          );
          answer = answerIndex >= 0 ? answerIndex.toString() : answerText;
        }
        
        questions.push({
          type: currentType,
          question: questionText.trim(),
          options: options.length > 0 ? options : null,
          answer: answer,
          explanation: explanationText || '暂无解析',
          difficulty: 1
        });
      }
      
      // 开始新题目
      questionText = line.replace(/^\d+[.、]\s*/, '').trim();
      options = [];
      answerText = '';
      explanationText = '';
      state = 'question';
      currentQuestion = { type: currentType || 'judgment' };
      continue;
    }
    
    // 如果是题目内容的一部分
    if (state === 'question' && questionText) {
      questionText += ' ' + line;
    }
  }
  
  // 保存最后一题
  if (currentQuestion && questionText) {
    let answer = answerText;
    if (currentType === 'judgment') {
      answer = answerText.includes('正确') || answerText.includes('对') ? 'true' : 'false';
    }
    
    questions.push({
      type: currentType,
      question: questionText.trim(),
      options: options.length > 0 ? options : null,
      answer: answer,
      explanation: explanationText || '暂无解析',
      difficulty: 1
    });
  }
  
  return questions;
}

// 导入题库路由
router.post('/import', async (req, res) => {
  try {
    const config = new Config();
    const client = new FetchClient(config);
    
    const pdfUrl = await getPdfUrl();
    console.log('正在获取PDF内容...');
    const response = await client.fetch(pdfUrl);
    
    if (response.status_code !== 0) {
      return res.status(500).json({ success: false, error: '获取PDF失败' });
    }
    
    // 提取文本内容
    const textContent = response.content
      .filter(item => item.type === 'text')
      .map(item => item.text)
      .join('\n');
    
    console.log('PDF内容长度:', textContent.length);
    
    // 解析题目
    const questions = parseQuestions(textContent);
    console.log('解析到题目数量:', questions.length);
    
    // 保存到数据库
    const supabase = getSupabaseClient();
    
    // 先清空旧题目（可选）
    // await supabase.from('questions').delete().neq('id', 0);
    
    // 批量插入题目
    const insertData = questions.map(q => ({
      type: q.type,
      question: q.question,
      options: q.options ? JSON.stringify(q.options) : null,
      answer: typeof q.answer === 'string' ? q.answer : JSON.stringify(q.answer),
      explanation: q.explanation,
      difficulty: q.difficulty || 1
    }));
    
    const { data, error } = await supabase
      .from('questions')
      .insert(insertData)
      .select();
    
    if (error) throw new Error(`插入失败: ${error.message}`);
    
    res.json({
      success: true,
      message: `成功导入 ${questions.length} 道题目`,
      questions: questions.slice(0, 5) // 返回前5题预览
    });
    
  } catch (error) {
    console.error('导入失败:', error);
    res.status(500).json({ success: false, error: '导入失败' });
  }
});

// 获取PDF文本内容（用于预览）
router.get('/preview', async (req, res) => {
  try {
    const config = new Config();
    const client = new FetchClient(config);
    
    const pdfUrl = await getPdfUrl();
    const response = await client.fetch(pdfUrl);
    
    if (response.status_code !== 0) {
      return res.status(500).json({ success: false, error: '获取PDF失败' });
    }
    
    const textContent = response.content
      .filter(item => item.type === 'text')
      .map(item => item.text)
      .join('\n');
    
    res.json({
      success: true,
      content: textContent,
      length: textContent.length
    });
    
  } catch (error) {
    console.error('获取内容失败:', error);
    res.status(500).json({ success: false, error: '获取内容失败' });
  }
});

// 获取完整PDF文本内容（不限长度）
router.get('/fulltext', async (req, res) => {
  try {
    const config = new Config();
    const client = new FetchClient(config);
    
    const pdfUrl = await getPdfUrl();
    const response = await client.fetch(pdfUrl);
    
    if (response.status_code !== 0) {
      return res.status(500).json({ success: false, error: '获取PDF失败' });
    }
    
    const textContent = response.content
      .filter(item => item.type === 'text')
      .map(item => item.text)
      .join('\n');
    
    // 直接返回原始文本，不包装JSON
    res.setHeader('Content-Type', 'text/plain; charset=utf-8');
    res.send(textContent);
    
  } catch (error) {
    console.error('获取内容失败:', error);
    res.status(500).json({ success: false, error: '获取内容失败' });
  }
});

export default router;
