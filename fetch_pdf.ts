import { FetchClient, Config } from 'coze-coding-dev-sdk';

const config = new Config();
const client = new FetchClient(config);

const pdfUrl = 'https://code.coze.cn/api/sandbox/coze_coding/file/proxy?expire_time=-1&file_path=assets%2F1_2025%E5%B9%B4%E4%B8%8B%E5%8D%8A%E5%B9%B4%E5%AD%A6%E4%B9%A0%E8%B5%84%E6%96%99%EF%BC%88%E5%8F%91%EF%BC%89.pdf&nonce=18229bfd-a38c-4c09-bc78-cbccd43557d7&project_id=7642937026089615412&sign=9eda5a21c1c7584452e4a8a228896f5387496ccac6803e98deeea00cb9649f29';

async function fetchPdfContent() {
  console.log('正在获取PDF内容...');
  const response = await client.fetch(pdfUrl);
  
  console.log(`状态码: ${response.status_code}`);
  console.log(`标题: ${response.title}`);
  console.log(`文件类型: ${response.filetype}`);
  
  // 提取文本内容
  const textContent = response.content
    .filter(item => item.type === 'text')
    .map(item => item.text)
    .join('\n');
  
  console.log('\n=== PDF文本内容 ===\n');
  console.log(textContent);
  
  // 保存到文件
  const fs = await import('fs');
  fs.writeFileSync('/tmp/pdf_content.txt', textContent);
  console.log('\n内容已保存到 /tmp/pdf_content.txt');
}

fetchPdfContent().catch(console.error);
