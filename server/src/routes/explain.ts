import { Router } from 'express';
import { LLMClient, Config } from 'coze-coding-dev-sdk';
import type { Message } from 'coze-coding-dev-sdk';
import { getSupabaseClient } from '../storage/database/supabase-client.js';

const router = Router();

const SYSTEM_PROMPT = `你是中国共产党历史学习的专业辅导老师，擅长对党史题目进行详细解析。

请对以下题目进行智能解析，要求：
1. 简要分析题目涉及的党史知识点
2. 解释为什么正确答案是正确的
3. 如果是选择题，也需要解释其他选项为什么不正确
4. 语言简洁专业，适合学习使用
5. 字数控制在200字以内

请直接输出解析内容，不要使用引号包裹，不要添加"解析："等前缀。`;

router.post('/', async (req, res) => {
  try {
    const { questionId } = req.body;
    
    if (!questionId) {
      return res.status(400).json({ success: false, error: '缺少题目ID' });
    }

    // 获取题目信息
    const client = getSupabaseClient();
    const { data: question, error } = await client
      .from('questions')
      .select('*')
      .eq('id', questionId)
      .single();

    if (error || !question) {
      return res.status(404).json({ success: false, error: '题目不存在' });
    }

    // 构建prompt
    let prompt = '';
    
    if (question.type === 'judgment') {
      prompt = `题目：${question.question}\n题型：判断题\n正确答案：${question.answer === 'true' ? '正确' : '错误'}`;
    } else if (question.type === 'choice') {
      const options: string[] = JSON.parse(question.options || '[]');
      const optionsText = options.map((opt: string, i: number) => `${String.fromCharCode(65 + i)}. ${opt}`).join('\n');
      prompt = `题目：${question.question}\n题型：单选题\n选项：\n${optionsText}\n正确答案：${question.answer}`;
    } else if (question.type === 'multiple_choice') {
      const options: string[] = JSON.parse(question.options || '[]');
      const optionsText = options.map((opt: string, i: number) => `${String.fromCharCode(65 + i)}. ${opt}`).join('\n');
      prompt = `题目：${question.question}\n题型：多选题\n选项：\n${optionsText}\n正确答案：${question.answer}`;
    } else if (question.type === 'fill_blank') {
      prompt = `题目：${question.question}\n题型：填空题\n正确答案：${question.answer}`;
    }
    
    // 调用LLM生成解析
    const config = new Config();
    const llmClient = new LLMClient(config);

    const messages: Message[] = [
      { role: 'system', content: SYSTEM_PROMPT },
      { role: 'user', content: prompt }
    ];

    let explanation = '';
    try {
      const response = await llmClient.invoke(messages, { temperature: 0.7 });
      explanation = response.content;
    } catch (llmError) {
      console.error('LLM调用失败:', llmError);
      // 如果LLM调用失败，使用原有解析
      explanation = question.explanation || '暂无解析';
    }

    res.json({
      success: true,
      data: {
        questionId,
        explanation,
        originalExplanation: question.explanation
      }
    });
  } catch (error) {
    console.error('解析API错误:', error);
    res.status(500).json({ success: false, error: '服务器错误' });
  }
});

export default router;
