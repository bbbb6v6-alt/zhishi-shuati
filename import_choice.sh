#!/bin/bash
# 导入单选题和多选题到题库

BASE_URL="http://localhost:9091"

# 单选题数据
SINGLE_CHOICE_QUESTIONS='[
  {"type":"choice","question":"中国共产党的最高理想和最终目标是（ ）。","answer":"C","options":[{"key":"A","value":"实现共产主义"},{"key":"B","value":"实现社会主义现代化"},{"key":"C","value":"实现共产主义社会制度"},{"key":"D","value":"实现中国特色社会主义"}]},
  {"type":"choice","question":"中国共产党以（ ）作为自己的行动指南。","answer":"B","options":[{"key":"A","value":"马克思列宁主义"},{"key":"B","value":"马克思列宁主义、毛泽东思想、邓小平理论、三个代表重要思想、科学发展观、习近平新时代中国特色社会主义思想"},{"key":"C","value":"邓小平理论"},{"key":"D","value":"习近平新时代中国特色社会主义思想"}]},
  {"type":"choice","question":"我国正处于并将长期处于（ ）。","answer":"B","options":[{"key":"A","value":"社会主义阶段"},{"key":"B","value":"社会主义初级阶段"},{"key":"C","value":"初级阶段"},{"key":"D","value":"共产主义阶段"}]},
  {"type":"choice","question":"党章规定，党的最高领导机关是（ ）。","answer":"D","options":[{"key":"A","value":"党的全国代表大会"},{"key":"B","value":"中央政治局"},{"key":"C","value":"中央委员会总书记"},{"key":"D","value":"党的全国代表大会和它所产生的中央委员会"}]},
  {"type":"choice","question":"申请入党的人，要填写入党志愿书，须有（ ）作介绍人。","answer":"B","options":[{"key":"A","value":"一名党员"},{"key":"B","value":"两名正式党员"},{"key":"C","value":"三名正式党员"},{"key":"D","value":"一名正式党员和一名预备党员"}]},
  {"type":"choice","question":"党员的预备期，从（ ）之日算起。","answer":"C","options":[{"key":"A","value":"递交入党申请书"},{"key":"B","value":"支部大会通过他为预备党员"},{"key":"C","value":"支部大会通过他为预备党员之日"},{"key":"D","value":"上级党组织批准"}]},
  {"type":"choice","question":"党员的党龄，从（ ）之日算起。","answer":"D","options":[{"key":"A","value":"递交入党申请书"},{"key":"B","value":"支部大会通过他为预备党员"},{"key":"C","value":"预备期满转为正式党员之日"},{"key":"D","value":"预备期满转为正式党员之日"}]},
  {"type":"choice","question":"预备党员的权利与正式党员享有的权利相比，有一点不同，这一点是（ ）。","answer":"A","options":[{"key":"A","value":"没有表决权、选举权和被选举权"},{"key":"B","value":"没有建议权"},{"key":"C","value":"没有批评权"},{"key":"D","value":"没有监督权"}]},
  {"type":"choice","question":"发展党员，必须把（ ）放在首位。","answer":"A","options":[{"key":"A","value":"政治标准"},{"key":"B","value":"思想觉悟"},{"key":"C","value":"业务能力"},{"key":"D","value":"工作成绩"}]},
  {"type":"choice","question":"党员如果没有正当理由，连续（ ）个月不参加党的组织生活，或不交纳党费，或不做党所分配的工作，就被认为是自行脱党。","answer":"B","options":[{"key":"A","value":"3"},{"key":"B","value":"6"},{"key":"C","value":"9"},{"key":"D","value":"12"}]},
  {"type":"choice","question":"中国共产党党员是（ ）的有共产主义觉悟的先锋战士。","answer":"A","options":[{"key":"A","value":"中国工人阶级"},{"key":"B","value":"中国农民阶级"},{"key":"C","value":"中国资产阶级"},{"key":"D","value":"中国知识分子"}]},
  {"type":"choice","question":"党员必须履行的义务共有（ ）。","answer":"C","options":[{"key":"A","value":"6项"},{"key":"B","value":"7项"},{"key":"C","value":"8项"},{"key":"D","value":"9项"}]},
  {"type":"choice","question":"党员享有的权利共有（ ）。","answer":"C","options":[{"key":"A","value":"6项"},{"key":"B","value":"7项"},{"key":"C","value":"8项"},{"key":"D","value":"9项"}]},
  {"type":"choice","question":"预备党员的义务同正式党员一样，权利完全相同。","answer":"B","options":[{"key":"A","value":"正确"},{"key":"B","value":"不正确，预备党员没有表决权、选举权和被选举权"},{"key":"C","value":""},{"key":"D","value":""}]},
  {"type":"choice","question":"预备党员的预备期为（ ）。","answer":"B","options":[{"key":"A","value":"三个月"},{"key":"B","value":"一年"},{"key":"C","value":"两年"},{"key":"D","value":"三年"}]},
  {"type":"choice","question":"中国共产党是中国特色社会主义事业的领导核心，是（ ）的先锋队。","answer":"A","options":[{"key":"A","value":"中国工人阶级"},{"key":"B","value":"中国人民"},{"key":"C","value":"中国各阶层"},{"key":"D","value":"中国先进分子"}]},
  {"type":"choice","question":"发展党员，必须把政治标准放在首位，经过党的支部，坚持（ ）的原则。","answer":"A","options":[{"key":"A","value":"个别吸收"},{"key":"B","value":"集体吸收"},{"key":"C","value":"批量吸收"},{"key":"D","value":"突击吸收"}]},
  {"type":"choice","question":"党员如果没有正当理由，连续六个月不参加党的组织生活，或不交纳党费，或不做党所分配的工作，就被认为是自行脱党。这个说法是（ ）。","answer":"A","options":[{"key":"A","value":"正确的"},{"key":"B","value":"错误的"},{"key":"C","value":""},{"key":"D","value":""}]},
  {"type":"choice","question":"预备党员的权利除了没有表决权、选举权和被选举权以外，也同正式党员一样。这个说法是（ ）。","answer":"A","options":[{"key":"A","value":"正确"},{"key":"B","value":"错误"},{"key":"C","value":""},{"key":"D","value":""}]},
  {"type":"choice","question":"中国共产党是中国特色社会主义事业的领导核心，是（ ）的先锋队，同时也是中国人民和中华民族的先锋队。","answer":"B","options":[{"key":"A","value":"中国人民"},{"key":"B","value":"中国工人阶级"},{"key":"C","value":"中国资产阶级"},{"key":"D","value":"中国新生力量"}]}
]'

echo "正在导入单选题..."

curl -X POST "${BASE_URL}/api/v1/questions/batch" \
  -H "Content-Type: application/json" \
  -d "${SINGLE_CHOICE_QUESTIONS}"

echo ""
echo "单选题导入完成！"
