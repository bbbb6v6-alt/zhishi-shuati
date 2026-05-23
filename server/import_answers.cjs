const { createClient } = require('@supabase/supabase-js');
const fs = require('fs');

// 读取答案文件
const answerText = fs.readFileSync('/tmp/answer_full.txt', 'utf-8');

// 解析单选题答案
const choiceAnswers = {};
const choiceMatch = answerText.match(/单项选择题[^\d]*([\d.]+\s+[A-D][\s\n]*)+/g);
if (choiceMatch) {
  const choiceSection = choiceMatch[0];
  const lines = choiceSection.split('\n');
  for (const line of lines) {
    const m = line.match(/(\d+)\.\s*([A-D])/i);
    if (m) {
      choiceAnswers[parseInt(m[1])] = m[2].toUpperCase();
    }
  }
}

// 解析填空题答案
const fillAnswers = [];
const fillMatch = answerText.match(/填空题[^\d]*((?:\d+[\.、]\s*[^\n]+\n?)+)/);
if (fillMatch) {
  const fillSection = fillMatch[1];
  const lines = fillSection.split('\n');
  for (const line of lines) {
    const m = line.match(/(\d+)[\.、]\s*(.+)/);
    if (m) {
      fillAnswers.push({
        num: parseInt(m[1]),
        answer: m[2].trim()
      });
    }
  }
}

// 如果上面的方法没匹配到，用备选方案
if (fillAnswers.length === 0) {
  const lines = answerText.split('\n');
  let inFillSection = false;
  for (const line of lines) {
    if (line.includes('填空题') && !line.includes('单项选择')) {
      inFillSection = true;
      continue;
    }
    if (inFillSection && line.trim()) {
      const m = line.match(/^(\d+)[\.、]\s*(.+)/);
      if (m) {
        fillAnswers.push({
          num: parseInt(m[1]),
          answer: m[2].trim()
        });
      }
    }
    if (inFillSection && line.includes('三、') || (inFillSection && line.includes('简答题'))) {
      break;
    }
  }
}

console.log(`Found ${Object.keys(choiceAnswers).length} choice answers`);
console.log(`Found ${fillAnswers.length} fill-in-blank answers`);

// 输出答案供检查
console.log('\n=== Choice Answers ===');
console.log(JSON.stringify(choiceAnswers, null, 2));

console.log('\n=== Fill Answers (first 10) ===');
console.log(JSON.stringify(fillAnswers.slice(0, 10), null, 2));

// 保存到文件
fs.writeFileSync('/tmp/parsed_answers.json', JSON.stringify({
  choices: choiceAnswers,
  fills: fillAnswers
}, null, 2));

console.log('\nAnswers saved to /tmp/parsed_answers.json');
