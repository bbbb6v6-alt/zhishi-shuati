// 修复数据库中的双重编码问题
const { createClient } = require('@supabase/supabase-js');
const { execSync } = require('child_process');

// 获取环境变量
const pythonCode = `
import os
import sys
try:
    from coze_workload_identity import Client
    client = Client()
    env_vars = client.get_project_env_vars()
    client.close()
    for env_var in env_vars:
        print(f"{env_var.key}={env_var.value}")
except Exception as e:
    pass
`;

const output = execSync(`python3 -c '${pythonCode.replace(/'/g, "'\"'\"'")}'`, {
  encoding: 'utf-8',
  timeout: 10000
});

const lines = output.trim().split('\n');
for (const line of lines) {
  if (line.startsWith('#') || !line.includes('=')) continue;
  const eqIndex = line.indexOf('=');
  const key = line.substring(0, eqIndex);
  let value = line.substring(eqIndex + 1);
  if ((value.startsWith("'") && value.endsWith("'")) ||
      (value.startsWith('"') && value.endsWith('"'))) {
    value = value.slice(1, -1);
  }
  process.env[key] = value;
}

const supabase = createClient(process.env.COZE_SUPABASE_URL, process.env.COZE_SUPABASE_ANON_KEY);

async function fixOptions() {
  // 获取所有多选题和选择题
  const { data, error } = await supabase
    .from('questions')
    .select('id, options, type')
    .in('type', ['choice', 'multiple_choice'])
    .not('options', 'is', null);
  
  if (error) {
    console.error('Error fetching:', error);
    return;
  }
  
  console.log(`Found ${data.length} questions with options`);
  
  let fixed = 0;
  for (const q of data) {
    if (q.options && q.options.includes('\\"')) {
      // 去除双重编码
      let cleaned = q.options.replace(/\\"/g, '"');
      cleaned = cleaned.replace(/\\"/g, '"');
      cleaned = cleaned.replace(/^"|"$/g, '');
      
      const { error: updateError } = await supabase
        .from('questions')
        .update({ options: cleaned })
        .eq('id', q.id);
      
      if (!updateError) {
        fixed++;
        console.log(`Fixed Q${q.id}: ${cleaned.substring(0, 50)}...`);
      }
    }
  }
  
  console.log(`\nFixed ${fixed} questions`);
}

fixOptions().then(() => process.exit(0)).catch(e => {
  console.error(e);
  process.exit(1);
});
