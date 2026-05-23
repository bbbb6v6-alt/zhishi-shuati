const { getSupabaseClient } = require('./src/storage/database/supabase-client.ts');

async function fixMultiChoiceOptions() {
  const supabase = getSupabaseClient();
  
  // 获取所有多选题
  const { data: questions, error } = await supabase
    .from('questions')
    .select('id, options')
    .eq('type', 'multiple_choice');
  
  if (error) {
    console.error('Error fetching:', error);
    return;
  }
  
  console.log('Found', questions.length, 'multiple choice questions');
  
  // 修复每个问题的 options
  for (const q of questions) {
    // 设置标准选项 ["A", "B", "C", "D"]
    const { error: updateError } = await supabase
      .from('questions')
      .update({ options: ['A', 'B', 'C', 'D'] })
      .eq('id', q.id);
    
    if (updateError) {
      console.error('Error updating id', q.id, ':', updateError);
    }
  }
  
  console.log('Done!');
}

fixMultiChoiceOptions();
