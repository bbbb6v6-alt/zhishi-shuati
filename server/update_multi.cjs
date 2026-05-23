const { createClient } = require('@supabase/supabase-js');

const supabase = createClient(
  'https://7642934632354381864.supabase.co',
  'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Ijc2NDI5MzQ2MzIzNTQzODE4NCIsInN0YWciOiIxIiwiZXhwIjoxOTk4MTc1MjI1fQ.H4J7R7iT5Q8Z9Y5K6L2F3D8N1M4P6Q8R0S2T4U6V8W0X2Y4Z6A8B0C2D4E6F8'
);

// 选择题答案（1-189题，ABCD格式）
const choiceAnswers = {
  1:"ABCDEF", 2:"ABCD", 3:"AB", 4:"A", 5:"BD", 6:"BD", 7:"ABCD", 8:"ABCDE",
  9:"ABCD", 10:"A", 11:"B", 12:"AB", 13:"A", 14:"AB", 15:"AC", 16:"BD",
  17:"ABC", 18:"ABCD", 19:"ABCD", 20:"ABCD", 21:"AB", 22:"AB", 23:"A",
  24:"AB", 25:"ABC", 26:"ABCD", 27:"AB", 28:"ABC", 29:"A", 30:"A",
  31:"A", 32:"ABCD", 33:"ABCDE", 34:"AB", 35:"ABC", 36:"ABCD", 37:"ABCDE",
  38:"ABCD", 39:"ABCD", 40:"ABCD", 41:"ABCD", 42:"AB", 43:"A", 44:"A",
  45:"AB", 46:"ABCD", 47:"AB", 48:"ABCD", 49:"A", 50:"ABCD", 51:"AB",
  52:"ABC", 53:"ABCD", 54:"A", 55:"A", 56:"ABCD", 57:"ABC", 58:"ABCDE",
  59:"ABC", 60:"A", 61:"A", 62:"A", 63:"AB", 64:"A", 65:"A", 66:"AB",
  67:"ABCD", 68:"A", 69:"A", 70:"A", 71:"ABCD", 72:"ABCD", 73:"A", 74:"A",
  75:"A", 76:"A", 77:"A", 78:"A", 79:"A", 80:"A", 81:"AB", 82:"ABC",
  83:"ABCDE", 84:"ABCD", 85:"AB", 86:"AB", 87:"AB", 88:"AB", 89:"ABCD",
  90:"ABCD", 91:"ABC", 92:"AB", 93:"ABCDE", 94:"ABCD", 95:"AB", 96:"A",
  97:"ABCD", 98:"ABC", 99:"ABCD", 100:"ABCD", 101:"ABCDE", 102:"AB", 103:"ABCD",
  104:"A", 105:"ABCD", 106:"ABCD", 107:"AB", 108:"A", 109:"ABCDE", 110:"ABC",
  111:"ABCD", 112:"ABCDE", 113:"A", 114:"ABCD", 115:"ABCD", 116:"ABC", 117:"ABCD",
  118:"A", 119:"ABCD", 120:"ABCDE", 121:"ABCD", 122:"AB", 123:"ABC", 124:"ABCD",
  125:"ABC", 126:"AB", 127:"AB", 128:"A", 129:"ABCD", 130:"ABCD", 131:"AB",
  132:"ABCD", 133:"ABC", 134:"A", 135:"ABCD", 136:"ABCD", 137:"A", 138:"A",
  139:"ABCD", 140:"ABCD", 141:"ABCD", 142:"ABC", 143:"A", 144:"AB", 145:"AB",
  146:"AB", 147:"AB", 148:"A", 149:"ABCD", 150:"ABCD", 151:"ABCD", 152:"ABCD",
  153:"AB", 154:"ABCD", 155:"ABCDE", 156:"ABC", 157:"A", 158:"ABCD", 159:"ABCD",
  160:"A", 161:"AB", 162:"AB", 163:"ABCD", 164:"ABCD", 165:"ABCD", 166:"A",
  167:"A", 168:"ABCD", 169:"AB", 170:"AB", 171:"A", 172:"A", 173:"A", 174:"A",
  175:"ABCD", 176:"A", 177:"A", 178:"A", 179:"A", 180:"A", 181:"ABCD",
  182:"ABCD", 183:"A", 184:"ABCD", 185:"A", 186:"AB", 187:"ABCD", 188:"ABCD",
  189:"A"
};

async function updateAnswers() {
  // 获取所有多选题
  const { data: questions, error } = await supabase
    .from('questions')
    .select('id, type, question')
    .eq('type', 'multiple_choice')
    .order('id');
  
  if (error) {
    console.error('Error fetching questions:', error);
    return;
  }
  
  console.log(`Found ${questions.length} multiple choice questions`);
  
  let updated = 0;
  for (let i = 0; i < questions.length; i++) {
    const q = questions[i];
    const answerNum = i + 1; // 题号从1开始
    const answer = choiceAnswers[answerNum];
    
    if (answer) {
      const { error: updateError } = await supabase
        .from('questions')
        .update({ answer: answer })
        .eq('id', q.id);
      
      if (!updateError) {
        updated++;
      }
    }
    
    if ((i + 1) % 50 === 0) {
      console.log(`Updated ${i + 1}/${questions.length}`);
    }
  }
  
  console.log(`Total updated: ${updated} questions`);
}

updateAnswers().catch(console.error);
