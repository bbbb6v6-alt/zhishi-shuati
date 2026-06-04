#!/bin/bash
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "1921 年7 月23 日，中国共产党第一次全国代表大会在上海法租界望志路106 号举行。参加党的一大的有来自( )个地方的 13 人，他们代表着50 多名党员。", "answer": "C", "options": [{"key": "A", "value": "6"}, {"key": "B", "value": "8"}, {"key": "C", "value": "7"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 1/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "中国共产党在( )上第一次明确提出反帝反封建的民主革命纲领。", "answer": "B", "options": [{"key": "A", "value": "党的一大"}, {"key": "B", "value": "党的二大"}, {"key": "C", "value": "党的三大"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 2/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "( )首次区分并制定了党的最高纲领和最低纲领。", "answer": "B", "options": [{"key": "A", "value": "党的一大"}, {"key": "B", "value": "党的二大"}, {"key": "C", "value": "党的三大"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 3/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "南昌起义后，中共中央在湖北汉口召开( )，确定了土地革命和武装反抗国民党反动派的总方针。", "answer": "C", "options": [{"key": "A", "value": "党的三大"}, {"key": "B", "value": "党的四大"}, {"key": "C", "value": "八七会议"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 4/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "1928 年6 月18 日至7 月11 日，中国共产党在共产国际的帮助下在( )举行第六次全国代表大会。", "answer": "B", "options": [{"key": "A", "value": "上海"}, {"key": "B", "value": "莫斯科"}, {"key": "C", "value": "香港"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 5/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "( )决议是中国共产党和红军建设的纲领性文献，解决了在农村进行战争的环境中如何将以农民为主要成分的革命军队建设成为无产阶级领导的新型人民军队这个根本性问题。", "answer": "A", "options": [{"key": "A", "value": "古田会议"}, {"key": "B", "value": "八七会议"}, {"key": "C", "value": "党的六大"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 6/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "打响武装反抗国民党反动派第一枪的是( )。", "answer": "A", "options": [{"key": "A", "value": "南昌起义"}, {"key": "B", "value": "秋收起义"}, {"key": "C", "value": "广州起义"}, {"key": "D", "value": "武昌起义"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 7/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "1935 年1 月召开的( )会议确立了毛泽东在红军和党中央的领导地位，挽救了党、挽救了红军、挽救了中国革命，成为党的历史上一个生死攸关的转折点。", "answer": "C", "options": [{"key": "A", "value": "古田"}, {"key": "B", "value": "黎平"}, {"key": "C", "value": "遵义"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 8/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "红军二万五千里长征胜利结束的标志是( )。", "answer": "C", "options": [{"key": "A", "value": "红军穿越大草地进入甘肃、陕西"}, {"key": "B", "value": "中央红军同陕北红军会师"}, {"key": "C", "value": "红军三大主力在会宁会师"}, {"key": "D", "value": "遵义会议的召开"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 9/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "党的七大确立( )为党的指导思想，使全党在思想上、政治上、组织上达到空前的统一和团结。", "answer": "B", "options": [{"key": "A", "value": "马列主义"}, {"key": "B", "value": "毛泽东思想"}, {"key": "C", "value": "实事求是"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 10/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "1978 年12 月召开的( )，是中华人民共和国成立以来中国共产党历史上具有深远意义的伟大转折，开创了我国社会主义事业发展的新时期。", "answer": "C", "options": [{"key": "A", "value": "党的十届三中全会"}, {"key": "B", "value": "党的十一大"}, {"key": "C", "value": "党的十一届三中全会"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 11/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "党的十一届六中全会通过的( )，标志着党胜利地完成了指导思想上的拨乱反正。", "answer": "B", "options": [{"key": "A", "value": "《关于若干历史问题的决议》"}, {"key": "B", "value": "《关于建国以来党的若干历史问题的决议》"}, {"key": "C", "value": "《关于党内政治生活的若干准则》"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 12/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "“全世界无产者，联合起来!”的口号是( )中提出的。", "answer": "B", "options": [{"key": "A", "value": "《共产主义原理》"}, {"key": "B", "value": "《共产党宣言》"}, {"key": "C", "value": "《关于波兰的演说》"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 13/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "( )的发表，是马克思主义建党学说创立的主要标志。", "answer": "B", "options": [{"key": "A", "value": "《共产主义者同盟章程》"}, {"key": "B", "value": "《共产党宣言》"}, {"key": "C", "value": "《共产主义原理》"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 14/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "中国特色社会主义事业的领导核心是( )。", "answer": "B", "options": [{"key": "A", "value": "农民阶级"}, {"key": "B", "value": "工人阶级"}, {"key": "C", "value": "知识分子"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 15/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "共产党的党性是( )的最高表现。", "answer": "A", "options": [{"key": "A", "value": "工人阶级的阶级性"}, {"key": "B", "value": "先进分子的先进性"}, {"key": "C", "value": "革命分子的革命性"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 16/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "中国共产党党员标准主要是由( )决定的。", "answer": "A", "options": [{"key": "A", "value": "党的工人阶级先锋队性质"}, {"key": "B", "value": "党的代表性"}, {"key": "C", "value": "党的革命性"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 17/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "申请入党时一般应采用( )，向党组织表明入党志愿。", "answer": "B", "options": [{"key": "A", "value": "口头形式"}, {"key": "B", "value": "书面形式"}, {"key": "C", "value": "口头形式、书面形式均可"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 18/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "入党时必须有( )作入党介绍人。", "answer": "A", "options": [{"key": "A", "value": "两名正式党员"}, {"key": "B", "value": "三名正式党员"}, {"key": "C", "value": "两名党员，正式、预备均可"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 19/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "党章规定，党的最高领导机关，是( )。", "answer": "C", "options": [{"key": "A", "value": "党的全国代表大会"}, {"key": "B", "value": "党的中央委员会"}, {"key": "C", "value": "党的全国代表大会和它所产生的中央委员会"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 20/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "党章规定，可以申请入党的最低年龄为( )。", "answer": "B", "options": [{"key": "A", "value": "16 岁"}, {"key": "B", "value": "18 岁"}, {"key": "C", "value": "20 岁"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 21/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "发展党员，必须坚持( )的原则。", "answer": "A", "options": [{"key": "A", "value": "个别吸收"}, {"key": "B", "value": "集体吸收"}, {"key": "C", "value": "个别吸收与集体吸收相结合"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 22/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "预备党员的预备期为( )。", "answer": "A", "options": [{"key": "A", "value": "1 年"}, {"key": "B", "value": "2 年"}, {"key": "C", "value": "3 年"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 23/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "党员的党龄，从( )之日算起。", "answer": "C", "options": [{"key": "A", "value": "递交入党志愿书"}, {"key": "B", "value": "支部大会通过其为预备党员"}, {"key": "C", "value": "预备期满转为正式党员"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 24/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "党员如果没有正当理由，连续( )不参加党的组织生活，或不交纳党费，或不做党所分配的工作，就被认为是自行脱党。", "answer": "B", "options": [{"key": "A", "value": "3 个月"}, {"key": "B", "value": "6 个月"}, {"key": "C", "value": "1 年"}, {"key": "D", "value": "2 年"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 25/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "党组织讨论决定问题，必须执行( )的原则。", "answer": "B", "options": [{"key": "A", "value": "个人服从组织"}, {"key": "B", "value": "少数服从多数"}, {"key": "C", "value": "下级服从上级"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 26/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "凡是成立党的新组织，或是撤销党的原有组织，必须由( )决定。", "answer": "B", "options": [{"key": "A", "value": "同级党的代表大会"}, {"key": "B", "value": "上级党组织"}, {"key": "C", "value": "上级党的代表大会"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 27/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "( )是党内的最高处分。", "answer": "C", "options": [{"key": "A", "value": "撤销党内职务"}, {"key": "B", "value": "留党察看"}, {"key": "C", "value": "开除党籍"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 28/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "党的思想建设的根本问题是( )。", "answer": "C", "options": [{"key": "A", "value": "宣传马克思主义"}, {"key": "B", "value": "马克思主义与中国实际相结合"}, {"key": "C", "value": "解决党员的思想入党问题"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 29/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "党的( )是党的全部工作和战斗力的基础。", "answer": "C", "options": [{"key": "A", "value": "党员"}, {"key": "B", "value": "干部"}, {"key": "C", "value": "基层党组织"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 30/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "( )是实现社会主义现代化、创造人民美好生活的必由之路。", "answer": "A", "options": [{"key": "A", "value": "中国特色社会主义道路"}, {"key": "B", "value": "中国特色社会主义理论体系"}, {"key": "C", "value": "中国特色社会主义制度"}, {"key": "D", "value": "中国特色社会主义"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 31/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "习近平新时代中国特色社会主义思想，明确中国特色社会主义最本质的特征是( )。", "answer": "D", "options": [{"key": "A", "value": "“五位一体”总体布局"}, {"key": "B", "value": "建设中国特色社会主义法治体系"}, {"key": "C", "value": "以人民利益为根本出发点"}, {"key": "D", "value": "中国共产党领导"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 32/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "深刻认识党面临的( )尖锐性和严峻性，坚持问题导向，保持战略定力，推动全面从严治党向纵深发展。", "answer": "A", "options": [{"key": "A", "value": "精神懈怠危险、能力不足危险、脱离群众危险、消极腐败危险"}, {"key": "B", "value": "精神懈怠危险、封闭僵化危险、脱离群众危险、消极腐败危险"}, {"key": "C", "value": "精神懈怠危险、能力不足危险、官僚主义危险、消极腐败危险"}, {"key": "D", "value": "精神懈怠危险、能力不足危险、脱离群众危险、腐化堕落危险"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 33/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "党的( )是党的根本性建设，决定党的建设方向和效果。", "answer": "B", "options": [{"key": "A", "value": "思想建设"}, {"key": "B", "value": "政治建设"}, {"key": "C", "value": "组织建设"}, {"key": "D", "value": "制度建设"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 34/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "为了实现中华民族伟大复兴，中国共产党团结带领中国人民，自信自强、守正创新，统揽( )，创造了新时代中国特色社会主义的伟大成就。", "answer": "D", "options": [{"key": "A", "value": "伟大斗争、伟大理论、伟大事业、伟大思想"}, {"key": "B", "value": "伟大实践、伟大理论、伟大事业、伟大梦想"}, {"key": "C", "value": "伟大实践、伟大工程、伟大事业、伟大思想"}, {"key": "D", "value": "伟大斗争、伟大工程、伟大事业、伟大梦想"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 35/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "中国共产党自1921 年成立以来，始终把为中国人民( )、为中华民族( )作为自己的初心使命。", "answer": "C", "options": [{"key": "A", "value": "谋解放，谋独立"}, {"key": "B", "value": "谋解放，谋复兴"}, {"key": "C", "value": "谋幸福，谋复兴"}, {"key": "D", "value": "谋幸福，谋富强"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 36/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "全党要坚持( )观和正确( )观，从党的百年奋斗中看清楚过去，我们为什么能够成功、弄明白未来我们怎样才能继续成功。", "answer": "A", "options": [{"key": "A", "value": "唯物史，党史"}, {"key": "B", "value": "核心价值，党史"}, {"key": "C", "value": "唯物史，发展"}, {"key": "D", "value": "核心价值，发展"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 37/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "党的百年奋斗锻造了走在时代前列的中国共产党，形成了以( )为源头的精神谱系，保持了党的先进性和纯洁性。", "answer": "C", "options": [{"key": "A", "value": "不忘初心、牢记使命"}, {"key": "B", "value": "全心全意为人民服务"}, {"key": "C", "value": "伟大建党精神"}, {"key": "D", "value": "共产主义理想"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 38/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "全党要牢记中国共产党是什么、要干什么这个根本问题，把握历史发展大势，坚定理想信念，牢记初心使命，始终( )，不为任何风险所惧，不为任何干扰所惑。", "answer": "A", "options": [{"key": "A", "value": "谦虚谨慎、艰苦奋斗、不骄不躁"}, {"key": "B", "value": "艰苦奋斗、谦虚谨慎、不骄不躁"}, {"key": "C", "value": "艰苦奋斗、不骄不躁、谦虚谨慎"}, {"key": "D", "value": "谦虚谨慎、不骄不躁、艰苦奋斗"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 39/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "党员要求退党，应当经支部大会讨论( )后宣布，并报上级党组织备案。", "answer": "B", "options": [{"key": "A", "value": "开除"}, {"key": "B", "value": "除名"}, {"key": "C", "value": "给予党纪处分"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 40/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "2021 年7 月1 日，习近平在庆祝中国共产党成立100 周年大会发表重要讲话，一百年来中国共产党团结带领中国人民进行的一切奋斗、一切牺牲、一切创造，归结起来就是一个主题：( )。", "answer": "B", "options": [{"key": "A", "value": "全面建成社会主义现代化强国"}, {"key": "B", "value": "实现中华民族伟大复兴"}, {"key": "C", "value": "实现共同富裕"}, {"key": "D", "value": "实现百年奋斗目标"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 41/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "党的十九届六中全会重点研究( )问题。", "answer": "C", "options": [{"key": "A", "value": "宪法修改"}, {"key": "B", "value": "深化党和国家机构改革"}, {"key": "C", "value": "全面总结党的百年奋斗的重大成就和历史经验"}, {"key": "D", "value": "坚持和完善中国特色社会主义制度、推进国家治理体系和治理能力现代化"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 42/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "以习近平同志为核心的党中央，以伟大的历史主动精神、巨大的政治勇气、强烈的责任担当，统筹国内国际两个大局，贯彻党的( )。", "answer": "D", "options": [{"key": "A", "value": "基本理论、基本路线、基本政策"}, {"key": "B", "value": "基本理论、基本政策、基本方略"}, {"key": "C", "value": "基本政策、基本路线、基本方略"}, {"key": "D", "value": "基本理论、基本路线、基本方略"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 43/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "在全面从严治党上，党的( )能力显著增强，管党治党宽松软状况得到根本扭转，反腐败斗争取得压倒性胜利并全面巩固，党在革命性锻造中更加坚强。", "answer": "A", "options": [{"key": "A", "value": "自我净化、自我革新、自我完善、自我提高"}, {"key": "B", "value": "自我净化、自我完善、自我革新、自我提高"}, {"key": "C", "value": "自我完善、自我净化、自我革新、自我提高"}, {"key": "D", "value": "自我完善、自我革新、自我净化、自我提高"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 44/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "( )是我们立党立国、兴党兴国的根本指导思想。", "answer": "C", "options": [{"key": "A", "value": "实用主义"}, {"key": "B", "value": "民族主义"}, {"key": "C", "value": "马克思主义"}, {"key": "D", "value": "功利主义"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 45/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "从现在起，中国共产党的中心任务就是( )。", "answer": "D", "options": [{"key": "A", "value": "社会主义现代化"}, {"key": "B", "value": "马克思主义中国化"}, {"key": "C", "value": "经济全球化"}, {"key": "D", "value": "团结带领全国各族人民全面建成社会主义现代化强国、实现第二个百年奋斗目标，以中国式现代化全面推进中华民族伟大复兴"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 46/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "我国是工人阶级领导的、以工农联盟为基础的( )的社会主义国家，国家一切权力属于人民。", "answer": "B", "options": [{"key": "A", "value": "人民当家作主"}, {"key": "B", "value": "人民民主专政"}, {"key": "C", "value": "多党派联合执政"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 47/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "党的二十大的全称是( )。", "answer": "C", "options": [{"key": "A", "value": "中国共产党第二十次党员代表大会"}, {"key": "B", "value": "中国共产党第二十次人民代表大会"}, {"key": "C", "value": "中国共产党第二十次全国代表大会"}, {"key": "D", "value": "中国共产党第二十次代表大会"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 48/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "劝党员退党，简称“劝退”，是指党员缺乏革命意志，( )，不符合党员条件，经党的支部对其进行教育并在限期内仍无改正和转变的，党组织应当劝其退党。", "answer": "A", "options": [{"key": "A", "value": "不履行党员义务"}, {"key": "B", "value": "不行使党员权利"}, {"key": "C", "value": "不参加党的组织生活"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 49/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "全面建设社会主义现代化国家的前进道路上，必须牢牢把握以下重大原则：坚持和加强党的全面领导、坚持中国特色社会主义道路、( )、坚持深化改革开放、坚持发扬斗争精神。", "answer": "C", "options": [{"key": "A", "value": "以经济建设为中心"}, {"key": "B", "value": "四项基本原则"}, {"key": "C", "value": "坚持以人民为中心的发展思想"}, {"key": "D", "value": "人民民主专政"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 50/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "( )坚持和发展中国特色社会主义的必由之路。", "answer": "C", "options": [{"key": "A", "value": "深入改革开放"}, {"key": "B", "value": "全面从严治党"}, {"key": "C", "value": "坚持党的全面领导"}, {"key": "D", "value": "全面依法治国"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 51/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "( )是实现中华民族伟大复兴的必由之路。", "answer": "B", "options": [{"key": "A", "value": "马克思主义"}, {"key": "B", "value": "中国特色社会主义"}, {"key": "C", "value": "改革开放"}, {"key": "D", "value": "坚持党的领导"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 52/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "( )是党永葆生机活力、走好新的赶考之路的必由之路。", "answer": "A", "options": [{"key": "A", "value": "全面从严治党"}, {"key": "B", "value": "全面依法治国"}, {"key": "C", "value": "全面杜绝腐败"}, {"key": "D", "value": "全面改革开放"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 53/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "全面加强党的( )，加强理想信念教育，引导全党牢记党的宗旨，自觉做共产主义远大理想和中国特色社会主义共同理想的坚定信仰者和忠实实践者。", "answer": "A", "options": [{"key": "A", "value": "思想建设"}, {"key": "B", "value": "道德建设"}, {"key": "C", "value": "政治建设"}, {"key": "D", "value": "文化建设"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 54/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "全党必须牢记，全面从严治党永远在路上，( )永远在路上。", "answer": "A", "options": [{"key": "A", "value": "党的自我革命"}, {"key": "B", "value": "党的反腐败斗争"}, {"key": "C", "value": "党的政治建设"}, {"key": "D", "value": "党的法治建设"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 55/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "( )是国家治理的一场深刻革命，关系党执政兴国，关系人民幸福安康，关系党和国家长治久安。", "answer": "B", "options": [{"key": "A", "value": "全面从严治党"}, {"key": "B", "value": "全面依法治国"}, {"key": "C", "value": "全面反对腐败"}, {"key": "D", "value": "加强基层治理"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 56/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "开展了史无前例的反腐败斗争，以“得罪千百人、不负十四亿”的使命担当祛疴治乱，不敢腐、( )、一体推进。", "answer": "B", "options": [{"key": "A", "value": "不想腐、不能腐"}, {"key": "B", "value": "不能腐、不想腐"}, {"key": "C", "value": "不能腐"}, {"key": "D", "value": "不想腐"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 57/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "中国共产党第二十次全国代表大会召开时间为( )。", "answer": "C", "options": [{"key": "A", "value": "2022 年10 月1 日"}, {"key": "B", "value": "2021 年10 月16 日"}, {"key": "C", "value": "2022 年10 月16 日"}, {"key": "D", "value": "2022 年10 月22 日"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 58/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "( )概括和提出了习近平新时代中国特色社会主义思想，将其确立为党必须长期坚持的指导思想并写进党章，实现了党的指导思想的与时俱进。", "answer": "C", "options": [{"key": "A", "value": "党的十七大"}, {"key": "B", "value": "党的十八大"}, {"key": "C", "value": "党的十九大"}, {"key": "D", "value": "党的二十大"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 59/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "全面建成社会主义现代化强国，第二步：( )把我国建成富强民主文明和谐美丽的社会主义现代化强国。", "answer": "C", "options": [{"key": "A", "value": "从二0 二0 年到本世纪中叶"}, {"key": "B", "value": "从二0 二0 年到本世纪初"}, {"key": "C", "value": "从二0 三五年到本世纪中叶"}, {"key": "D", "value": "从二0 三五年到本世纪初"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 60/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "中国式现代化，是( )的社会主义现代化。", "answer": "A", "options": [{"key": "A", "value": "中国共产党领导"}, {"key": "B", "value": "中华民族"}, {"key": "C", "value": "中国特色"}, {"key": "D", "value": "全国各族人民"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 61/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "坚持( )以严的基调强化正风肃纪，锲而不舍落实，持续深化纠治“四风”，重点纠治形式主义、官僚主义，坚决破除特权思想和特权行为。", "answer": "C", "options": [{"key": "A", "value": "三不一体"}, {"key": "B", "value": "反腐败斗争"}, {"key": "C", "value": "中央八项规定精神"}, {"key": "D", "value": "全面从严治党"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 62/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "( )是危害党的生命力和战斗力的最大毒瘤。", "answer": "C", "options": [{"key": "A", "value": "脱离群众"}, {"key": "B", "value": "作风问题"}, {"key": "C", "value": "腐败"}, {"key": "D", "value": "思想抛锚"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 63/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "我们创立了习近平新时代中国特色社会主义思想，明确坚持和发展中国特色社会主义的基本方略，提出一系列治国理政( )，实现了马克思主义中国化时代化新的飞跃。", "answer": "A", "options": [{"key": "A", "value": "新理念、新思想、新战略"}, {"key": "B", "value": "新理论、新思想、新战略"}, {"key": "C", "value": "新理念、新思想、新举措"}, {"key": "D", "value": "新理论、新思想、新举措"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 64/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "明确我国社会主要矛盾是人民日益增长的( )需要和( )的发展之间的矛盾，并紧紧围绕这个社会主要矛盾推进各项工作，不断丰富和发展人类文明新形态。", "answer": "C", "options": [{"key": "A", "value": "幸福生活不均衡不充分"}, {"key": "B", "value": "美好生活不均衡不充分"}, {"key": "C", "value": "美好生活不平衡不充分"}, {"key": "D", "value": "幸福生活不平衡不充分"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 65/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "( )是国家治理的一场深刻革命，关系党执政兴国，关系人民幸福安康，关系党和国家长治久安。", "answer": "A", "options": [{"key": "A", "value": "全面依法治国"}, {"key": "B", "value": "全面从严治党"}, {"key": "C", "value": "全面深化改革"}, {"key": "D", "value": "全面建设社会主义现代化"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 66/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "“( )”是中国特色社会主义的伟大创举，是香港、澳门回归后保持长期繁荣稳定的最佳制度安排，必须长期坚持。", "answer": "B", "options": [{"key": "A", "value": "“特别行政区”"}, {"key": "B", "value": "“一国两制”"}, {"key": "C", "value": "“港人治港、澳人治澳”"}, {"key": "D", "value": "“依法治港治澳”"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 67/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "中国坚定奉行( )的和平外交政策。", "answer": "D", "options": [{"key": "A", "value": "互利共赢"}, {"key": "B", "value": "独立平等"}, {"key": "C", "value": "友好共处"}, {"key": "D", "value": "独立自主"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 68/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "( )继续推进实践基础上的理论创新，首先要把握好的世界观和方法论，坚持好、运用好贯穿其中的立场观点方法。", "answer": "D", "options": [{"key": "A", "value": "马克思主义"}, {"key": "B", "value": "毛泽东思想"}, {"key": "C", "value": "邓小平理论"}, {"key": "D", "value": "习近平新时代中国特色社会主义思想"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 69/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "党员除了享有表决权、选举权和被选举权以外，还有权要求( )或撤换不称职的干部。", "answer": "B", "options": [{"key": "A", "value": "开除"}, {"key": "B", "value": "罢免"}, {"key": "C", "value": "辞退"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 70/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "新时代十年的伟大变革，在党史、新中国史、改革开放史、( )、中华民族发展史上具有里程碑意义。", "answer": "A", "options": [{"key": "A", "value": "社会主义发展史"}, {"key": "B", "value": "人民奋斗史"}, {"key": "C", "value": "阶级斗争史"}, {"key": "D", "value": "中华崛起"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 71/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "贯彻( )，以坚定的意志品质维护国家主权、安全、发展利益，国家安全得到全面加强。", "answer": "A", "options": [{"key": "A", "value": "总体国家安全观"}, {"key": "B", "value": "总体安全观"}, {"key": "C", "value": "国家安全观"}, {"key": "D", "value": "总体国家观"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 72/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "习近平在党的二十大报告中说，必须坚定不移走中国特色社会主义政治发展道路，坚持党的领导、人民当家作主、依法治国有机统一。加强( )，全面发展( )，积极发展( )，巩固和发展( )。\n①人民当家作主制度保障②协商民主\n③最广泛的爱国统一战线④基层民主", "answer": "B", "options": [{"key": "A", "value": "①②③④"}, {"key": "B", "value": "①②④③"}, {"key": "C", "value": "②①③④"}, {"key": "D", "value": "②①④③"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 73/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "习近平在党的二十大报告中指出，要实现好、维护好、发展好( )，紧紧抓住人民最关心最直接最现实的利益问题，坚持尽力而为、量力而行。完善( )，实施( )，健全( )，推进( )。\n①分配制度②社会保障体系③健康中国建设④就业优先战略\n⑤最广大人民根本利益", "answer": "B", "options": [{"key": "A", "value": "⑤②④③①"}, {"key": "B", "value": "⑤①④②③"}, {"key": "C", "value": "①②⑤④③"}, {"key": "D", "value": "③②④①⑤"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 74/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "坚定“四个自信”是哪“四个自信”?( )", "answer": "B", "options": [{"key": "A", "value": "道路自信、制度自信、文化自信、思想自信"}, {"key": "B", "value": "道路自信、理论自信、制度自信、文化自信"}, {"key": "C", "value": "道路自信、文化自信、体制自信、思想自信"}, {"key": "D", "value": "理论自信、体制自信、制度自信、思想自信"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 75/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "中国共产党第二十次全国代表大会的主题是：高举中国特色社会主义伟大旗帜，全面贯彻新时代中国特色社会主义思想，弘扬( )，自信自强、守正创新，踔厉奋发、勇毅前行，为全面建设社会主义现代化国家、全面推进中华民族伟大复兴而团结奋斗。", "answer": "B", "options": [{"key": "A", "value": "时代创新精神"}, {"key": "B", "value": "伟大建党精神"}, {"key": "C", "value": "中国共产党人精神谱系"}, {"key": "D", "value": "伟大奋斗精神"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 76/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "完善科技创新体系，坚持( )在我国现代化建设全局中的核心地位。", "answer": "D", "options": [{"key": "A", "value": "人才"}, {"key": "B", "value": "教育"}, {"key": "C", "value": "科技"}, {"key": "D", "value": "创新"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 77/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "深入开展社会主义核心价值观宣传教育，深化( )教育，着力培养担当民族复兴大任的时代新人。", "answer": "A", "options": [{"key": "A", "value": "爱国主义、集体主义、社会主义"}, {"key": "B", "value": "爱国主义、社会主义"}, {"key": "C", "value": "社会主义、集体主义"}, {"key": "D", "value": "爱国主义、集体主义"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 78/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "坚持以严的基调强化正风肃纪，锲而不舍落实中央八项规定精神，持续深化纠治“四风”，重点纠治( )、( )，坚决破除特权思想和特权行为。", "answer": "A", "options": [{"key": "A", "value": "形式主义官僚主义"}, {"key": "B", "value": "享乐主义官僚主义"}, {"key": "C", "value": "形式主义教条主义"}, {"key": "D", "value": "形式主义享乐主义"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 79/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "要坚持以社会主义核心价值观为引领，发展( )，弘扬( )，传承( )，满足人民日益增长的精神文化需求。", "answer": "D", "options": [{"key": "A", "value": "革命文化、中华优秀传统文化、社会主义先进文化"}, {"key": "B", "value": "中华优秀传统文化、社会主义先进文化、革命文化"}, {"key": "C", "value": "中华优秀传统文化、革命文化、社会主义先进文化"}, {"key": "D", "value": "社会主义先进文化、革命文化、中华优秀传统文化"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 80/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "我们要坚持以( )安全为宗旨、以( )安全为根本、以( )安全为基础，以军事科技文化社会安全为保障。", "answer": "C", "options": [{"key": "A", "value": "政治人民经济"}, {"key": "B", "value": "经济政治人民"}, {"key": "C", "value": "人民政治经济"}, {"key": "D", "value": "人民经济政治"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 81/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "坚持社会主义市场经济改革方向，坚持高水平对外开放，加快构建以( )为主体( )相互促进的新发展格局。", "answer": "C", "options": [{"key": "A", "value": "国际大循环、国内国际双循环"}, {"key": "B", "value": "国内大循环、国际大循环"}, {"key": "C", "value": "国内大循环、国内国际双循环"}, {"key": "D", "value": "国内国际双循环、国内大循环"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 82/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "当党员对党的决议和政策有不同意见时，下列说法中，正确的应该是( )。", "answer": "B", "options": [{"key": "A", "value": "可以不执行党的决议和政策"}, {"key": "B", "value": "在坚决执行的前提下，可以声明保留，并且可以把自己的意见向党的上级组织直至中央提出"}, {"key": "C", "value": "必须坚决执行，不可以声明保留，也不允许向上级组织提出"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 83/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "为了实现中华民族伟大复兴，中国共产党团结带领中国人民，浴血奋战、百折不挠，创造了( )的伟大成就。", "answer": "B", "options": [{"key": "A", "value": "民主主义革命"}, {"key": "B", "value": "新民主主义革命"}, {"key": "C", "value": "土地革命"}, {"key": "D", "value": "反封建主义革命"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 84/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "( )是指导党和人民实现中华民族伟大复兴的正确理论。", "answer": "B", "options": [{"key": "A", "value": "中国特色社会主义道路"}, {"key": "B", "value": "中国特色社会主义理论体系"}, {"key": "C", "value": "中国特色社会主义制度"}, {"key": "D", "value": "中国特色社会主义核心价值观"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 85/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "新的征程上，我们必须坚持党的( )，统筹推进“五位一体”总体布局，协调推进“四个全面”战略布局，全面深化改革开放，立足新发展阶段，完整、准确、全面贯彻新发展理念，构建新发展格局。", "answer": "B", "options": [{"key": "A", "value": "基本理论、基本路线、基本方针"}, {"key": "B", "value": "基本理论、基本路线、基本方略"}, {"key": "C", "value": "基本原理、基本路线、基本方针"}, {"key": "D", "value": "基本原理、基本路线、基本方略"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 86/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "中国共产党江西师范大学第七次代表大会，是在全校上下学习贯彻党的二十大精神和省委十五届四次全体(扩大)会议精神，全力推进“双一流”建设的关键时期，召开的一次十分重要的会议。一方面，2023 年是全面贯彻落实( )的开局之年，是全面建设社会主义现代化国家开局起步的关键一年。", "answer": "A", "options": [{"key": "A", "value": "党的二十大精神"}, {"key": "B", "value": "习近平新时代中国特色社会主义思想"}, {"key": "C", "value": "党的方针、政策"}, {"key": "D", "value": "“十四五”规划"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 87/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "习近平指出，要总结运用第一批主题教育的成功经验，高质量开展第二批主题教育，用( )砥砺党员、干部，教育引导党员、干部坚定理想信念、牢记初心使命、积极开拓进取、勇于担当作为。要把实的要求贯穿主题教育全过程，坚决防止和克服形式主义、官僚主义，实实在在抓好理论学习和调查研究，实实在在检视整改突出问题，实实在在办好惠民利民实事，用实干推动发展、取信于民。", "answer": "A", "options": [{"key": "A", "value": "井冈山精神、苏区精神"}, {"key": "B", "value": "井冈山精神、苏区精神、长征精神"}, {"key": "C", "value": "井冈山精神、长征精神"}, {"key": "D", "value": "井冈山精神、长征精神、红军精神"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 88/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "我们深入推进全面从严治党，提出和落实新时代党的建设总要求，以党的( )统领党的建设各项工作。", "answer": "C", "options": [{"key": "A", "value": "思想建设"}, {"key": "B", "value": "制度建设"}, {"key": "C", "value": "政治建设"}, {"key": "D", "value": "组织建设"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 89/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "经过不懈努力，党找到了( )这一跳出治乱兴衰历史周期率的第二个答案。", "answer": "B", "options": [{"key": "A", "value": "人民监督"}, {"key": "B", "value": "自我革命"}, {"key": "C", "value": "社会改革"}, {"key": "D", "value": "阶级斗争"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 90/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "八七会议上毛泽东提出了( )的著名论断。", "answer": "B", "options": [{"key": "A", "value": "一切反动派都是纸老虎"}, {"key": "B", "value": "枪杆子里出政权"}, {"key": "C", "value": "星星之火，可以燎原"}, {"key": "D", "value": "没有调查，没有发言权"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 91/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "健全党统一领导、全面覆盖、权威高效的监督体系，完善权力监督制约机制，以( )为主导，促进各类监督贯通协调。", "answer": "A", "options": [{"key": "A", "value": "党内监督"}, {"key": "B", "value": "司法监督"}, {"key": "C", "value": "社会监督"}, {"key": "D", "value": "媒体监督"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 92/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "( )是社会主义民主政治的本质属性，是最广泛、最真实、最管用的民主。", "answer": "B", "options": [{"key": "A", "value": "直接民主"}, {"key": "B", "value": "全过程人民民主"}, {"key": "C", "value": "代议民主"}, {"key": "D", "value": "选举民主"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 93/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "党的二十大报告指出，必须持之以恒推进全面从严治党，深入推进新时代党的建设新的伟大工程，以党的( )引领社会革命。", "answer": "C", "options": [{"key": "A", "value": "组织建设"}, {"key": "B", "value": "政治领导"}, {"key": "C", "value": "自我革命"}, {"key": "D", "value": "全面领导"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 94/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "党的二十大把推进( )常态化制度化写入了党章。", "answer": "C", "options": [{"key": "A", "value": "党的群众路线教育实践活动"}, {"key": "B", "value": "“三严三实”专题教育"}, {"key": "C", "value": "党史学习教育"}, {"key": "D", "value": "“不忘初心、牢记使命”主题教育"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 95/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "根据新修订《中国共产党纪律处分条例》规定，党员受到警告处分( )内、受到严重警告处分( )内，不得在党内提拔职务或者进一步使用，也不得向党外组织推荐担任高于其原任职务的党外职务或者进一步使用。", "answer": "A", "options": [{"key": "A", "value": "一年、一年半"}, {"key": "B", "value": "一年半、一年"}, {"key": "C", "value": "半年、一年"}, {"key": "D", "value": "一年半、一年半"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 96/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "要坚持( )一起抓，把《条例》纳入党员、干部(培训)必修课，增强遵规守纪的自觉。", "answer": "B", "options": [{"key": "A", "value": "党章党规党纪"}, {"key": "B", "value": "党性党风党纪"}, {"key": "C", "value": "党风政风作风"}, {"key": "D", "value": "规定纪律法律"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 97/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "预备党员预备期满后，党组织经过考察认为其不履行党员义务，不具备党员条件的，应当( )。", "answer": "C", "options": [{"key": "A", "value": "留党察看"}, {"key": "B", "value": "延长预备期"}, {"key": "C", "value": "取消预备党员资格"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 98/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "社会主义初级阶段需要( )的时间。", "answer": "C", "options": [{"key": "A", "value": "十几年"}, {"key": "B", "value": "几十年"}, {"key": "C", "value": "上百年"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 99/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "《中国共产党章程》中关于党员权利的规定，下列说法中，错误的是( )。", "answer": "A", "options": [{"key": "A", "value": "党员只能向所在的党组织提出请求、申诉和控告"}, {"key": "B", "value": "党员可以向党的上级组织直至中央提出请求、申诉和控告，并要求有关组织给以负责的答复"}, {"key": "C", "value": "对党的决议和政策如有不同意见，在坚决执行的前提下，可以声明保留"}, {"key": "D", "value": "在党组织讨论决定对党员的党纪处分或作出鉴定时，本人有权参加和进行申辩，其他党员可以为他作证和辩护"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 100/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "《中国共产党章程》中关于被留党察看的党员的权利，表述正确的是( )。", "answer": "A", "options": [{"key": "A", "value": "党员在留党察看期间没有表决权、选举权和被选举权"}, {"key": "B", "value": "党员在留党察看期间没有表决权，但有选举权和被选举权"}, {"key": "C", "value": "党员在留党察看期间有表决权，但没有选举权和被选举权"}, {"key": "D", "value": "党员在留党察看期间有表决权、选举权和被选举权"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 101/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "入党介绍人的任务是认真了解申请人的思想、品质、经历和工作表现，向他解释( )，说明党员的条件、义务和权利，并向党组织作出负责的报告。", "answer": "B", "options": [{"key": "A", "value": "党的路线方针政策"}, {"key": "B", "value": "党的纲领和党的章程"}, {"key": "C", "value": "党的历史"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 102/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "《中国共产党发展党员工作细则》第十七条规定，基层党委或县级党委组织部门应当对发展对象进行短期集中培训。培训时间一般不少于( )。", "answer": "A", "options": [{"key": "A", "value": "三天(或不少于二十四个学时)"}, {"key": "B", "value": "五天(或不少于四十八个学时)"}, {"key": "C", "value": "三天(或不少于四十八学时)"}, {"key": "D", "value": "七天(或不少于二十四个学时)"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 103/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "每一个党员都是自愿加入中国共产党的，这个“自愿”在一定意义上是表明对中国共产党的“( )”性质的认同。", "answer": "A", "options": [{"key": "A", "value": "两个先锋队"}, {"key": "B", "value": "无产阶级"}, {"key": "C", "value": "社会主义"}, {"key": "D", "value": "工人阶级"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 104/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "党员是一种( )，是公民基于政治理想和认同而作出的自愿选择。", "answer": "B", "options": [{"key": "A", "value": "自然身份"}, {"key": "B", "value": "政治身份"}, {"key": "C", "value": "社会身份"}, {"key": "D", "value": "文化身份"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 105/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "申请入党的人必须有两名党员作介绍人。这里的党员是指( )。", "answer": "B", "options": [{"key": "A", "value": "党员领导干部"}, {"key": "B", "value": "正式党员"}, {"key": "C", "value": "预备党员"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 106/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "中国共产党第一次全国代表大会是在( )召开的。", "answer": "A", "options": [{"key": "A", "value": "上海"}, {"key": "B", "value": "北京"}, {"key": "C", "value": "长沙"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 107/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "中国共产党成立后集中力量从事( )。", "answer": "B", "options": [{"key": "A", "value": "学生运动"}, {"key": "B", "value": "工人运动"}, {"key": "C", "value": "农民运动"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 108/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "中国共产党成立后的第一部党章是在党的( )制定的。", "answer": "B", "options": [{"key": "A", "value": "一大"}, {"key": "B", "value": "二大"}, {"key": "C", "value": "三大"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 109/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "“须知政权是由枪杆子中取得的”的著名论断是( )提出的。", "answer": "A", "options": [{"key": "A", "value": "毛泽东"}, {"key": "B", "value": "周恩来"}, {"key": "C", "value": "李立三"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 110/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "( )指出:“深入学习宣传贯彻党的二十大精神，是当前和今后一个时期全党的首要政治任务，要推动学习宣传贯彻往深里走、往实里走。”", "answer": "D", "options": [{"key": "A", "value": "党的二十届二中全会"}, {"key": "B", "value": "党的二十届三中全会"}, {"key": "C", "value": "党的十九大"}, {"key": "D", "value": "党的二十大"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 111/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "二十届三中全会指出，开放是中国式现代化的______。()", "answer": "A", "options": [{"key": "A", "value": "鲜明标识"}, {"key": "B", "value": "本质要求"}, {"key": "C", "value": "首要任务"}, {"key": "D", "value": "战略支撑"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 112/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "中国共产党第二十届中央委员会第三次全体会议召开时间是______。()", "answer": "A", "options": [{"key": "A", "value": "2024 年7 月15—18 日"}, {"key": "B", "value": "2024 年9 月15—18 日"}, {"key": "C", "value": "2025 年7 月15—18 日"}, {"key": "D", "value": "2025 年9 月15—18 日"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 113/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "全会强调，______是全面建设社会主义现代化国家的首要任务。()", "answer": "B", "options": [{"key": "A", "value": "改革开放"}, {"key": "B", "value": "高质量发展"}, {"key": "C", "value": "科技创新"}, {"key": "D", "value": "共同富裕"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 114/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "毛泽东在( )文章中提出”没有调查，没有发言权”的科学论断。", "answer": "A", "options": [{"key": "A", "value": "《反对本本主义》"}, {"key": "B", "value": "《井冈山的斗争》"}, {"key": "C", "value": "《星星之火可以燎原》"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 115/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "我们党在( )上确立了建立抗日民族统一战线的新策略。", "answer": "A", "options": [{"key": "A", "value": "瓦密堡会议"}, {"key": "B", "value": "洛川会议"}, {"key": "C", "value": "党的六届六中全会"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 116/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "抗日战争以来，中国共产党公开颁布的第一个关于土地制度改革的纲领性文件是( )。", "answer": "C", "options": [{"key": "A", "value": "《中国土地法大纲》"}, {"key": "B", "value": "《关于土地问题的指示》"}, {"key": "C", "value": "《五四指示》"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 117/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "中华人民共和国第一部宪法是( )年通过并正式公布的。", "answer": "C", "options": [{"key": "A", "value": "1949"}, {"key": "B", "value": "1953"}, {"key": "C", "value": "1954"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 118/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "党的十五大把( )写入党章，确立为党的指导思想。", "answer": "B", "options": [{"key": "A", "value": "建设中国特色社会主义理论"}, {"key": "B", "value": "邓小平理论"}, {"key": "C", "value": "“三个代表”重要思想"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 119/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "党的十八大以后，中央决定以县处级以上领导机关、领导班子、领导干部为重点开展了( )教育实践活动。", "answer": "A", "options": [{"key": "A", "value": "党的群众路线"}, {"key": "B", "value": "党的思想路线"}, {"key": "C", "value": "党的基本路线"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 120/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "我国社会主义现代化建设的三个重要支点是( )。", "answer": "B", "options": [{"key": "A", "value": "革命发展建设"}, {"key": "B", "value": "改革发展稳定"}, {"key": "C", "value": "稳增长调结构促改革"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 121/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "2016 年2 月，中共中央办公厅印发有关方案，决定2016 年在全体党员中开展“学党章党规、学系列讲话，做( )”学习教育(简称“两学一做”学习教育)。", "answer": "B", "options": [{"key": "A", "value": "模范干部"}, {"key": "B", "value": "合格党员"}, {"key": "C", "value": "先进典型"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 122/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "修改党的章程的职权属于( )。", "answer": "A", "options": [{"key": "A", "value": "党的全国代表大会"}, {"key": "B", "value": "中央政治局会议"}, {"key": "C", "value": "中央全会"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 123/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "( )就是党的根本大法，是全党必须遵循的总规矩。", "answer": "A", "options": [{"key": "A", "value": "党章"}, {"key": "B", "value": "宪法"}, {"key": "C", "value": "党纪国法"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 124/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "党的基层组织有( )基本任务。", "answer": "C", "options": [{"key": "A", "value": "4 项"}, {"key": "B", "value": "6 项"}, {"key": "C", "value": "8 项"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 125/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "党章规定，党总支部委员会和支部委员会每届任期( )。", "answer": "C", "options": [{"key": "A", "value": "2 年"}, {"key": "B", "value": "3 年"}, {"key": "C", "value": "2 年或3 年"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 126/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "《中国共产党纪律处分条例》是依据( )制定的。", "answer": "A", "options": [{"key": "A", "value": "《中国共产党章程》"}, {"key": "B", "value": "《中国共产党廉洁自律准则》"}, {"key": "C", "value": "《中华人民共和国宪法》"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 127/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "在党的所有纪律中最重要、最根本、最关键的纪律是( )。", "answer": "A", "options": [{"key": "A", "value": "政治纪律"}, {"key": "B", "value": "廉洁纪律"}, {"key": "C", "value": "组织纪律"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 128/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "对中共党员的纪律处分有( )。", "answer": "B", "options": [{"key": "A", "value": "记过、记大过、撤销党内职务、留党察看、开除党籍"}, {"key": "B", "value": "警告、严重警告、撤销党内职务、留党察看、开除党籍"}, {"key": "C", "value": "警告、记过、撤销党内职务、留党察看、开除党籍"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 129/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "民主集中制是( )。", "answer": "C", "options": [{"key": "A", "value": "民主基础上的集中"}, {"key": "B", "value": "集中指导下的民主"}, {"key": "C", "value": "民主基础上的集中和集中指导下的民主相结合"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 130/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "中国共产党党员必须( )，不惜牺牲个人的一切，为实现共产主义奋斗终身。", "answer": "C", "options": [{"key": "A", "value": "以经济建设为中心"}, {"key": "B", "value": "以人为本"}, {"key": "C", "value": "全心全意为人民服务"}, {"key": "D", "value": "全面从严治党"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 131/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "中国共产党党员永远是( )的普通一员。除了法律和政策规定范围内的个人利益和工作职权以外，所有共产党员都不得谋求任何私利和特权。", "answer": "B", "options": [{"key": "A", "value": "无产阶级"}, {"key": "B", "value": "劳动人民"}, {"key": "C", "value": "工人阶级"}, {"key": "D", "value": "民众"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 132/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "从( )党章开始，中央委员会委员长的职务改称为“总书记”，地方各级党的执行委员会的委员长职务改称为“书记”。", "answer": "B", "options": [{"key": "A", "value": "四大"}, {"key": "B", "value": "五大"}, {"key": "C", "value": "六大"}, {"key": "D", "value": "七大"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 133/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "党的各级委员会实行( )的制度。", "answer": "C", "options": [{"key": "A", "value": "集体领导"}, {"key": "B", "value": "个人分工负责"}, {"key": "C", "value": "集体领导和个人分工负责相结合"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 134/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "( )是党的生命，是党内政治生活积极健康的重要基础。", "answer": "B", "options": [{"key": "A", "value": "民主集中制"}, {"key": "B", "value": "党内民主"}, {"key": "C", "value": "党的组织生活制度"}, {"key": "D", "value": "批评与自我批评"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 135/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "中国共产党第二十届中央委员会第四次全体会议于( )在北京举行。", "answer": "A", "options": [{"key": "A", "value": "2025 年10 月18 日至21 日"}, {"key": "B", "value": "2025 年10 月20 日至23 日"}, {"key": "C", "value": "2024 年10 月20 日至23 日"}, {"key": "D", "value": "2025 年11 月20 日至23 日"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 136/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "党的二十大党章明确，中国共产党以( )作为自己的行动指南。", "answer": "D", "options": [{"key": "A", "value": "马克思列宁主义、毛泽东思想、邓小平理论"}, {"key": "B", "value": "“三个代表”重要思想、科学发展观"}, {"key": "C", "value": "习近平新时代中国特色社会主义思想"}, {"key": "D", "value": "以上都是"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 137/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "党的最高理想和最终目标是( )。", "answer": "C", "options": [{"key": "A", "value": "实现共同富裕"}, {"key": "B", "value": "实现社会主义现代化"}, {"key": "C", "value": "实现共产主义"}, {"key": "D", "value": "实现中华民族伟大复兴"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 138/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "党的二十届四中全会强调，“十五五”时期经济社会发展必须坚持以( )为中心。", "answer": "B", "options": [{"key": "A", "value": "人民为中心"}, {"key": "B", "value": "经济建设"}, {"key": "C", "value": "高质量发展"}, {"key": "D", "value": "改革创新"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 139/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "党章规定，我国正处于并将长期处于( )。", "answer": "C", "options": [{"key": "A", "value": "社会主义中级阶段"}, {"key": "B", "value": "社会主义高级阶段"}, {"key": "C", "value": "社会主义初级阶段"}, {"key": "D", "value": "共产主义初级阶段"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 140/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "党的二十届四中全会提出，( )是“十五五”时期经济社会发展的根本动力。", "answer": "B", "options": [{"key": "A", "value": "科技创新"}, {"key": "B", "value": "改革创新"}, {"key": "C", "value": "人才支撑"}, {"key": "D", "value": "对外开放"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 141/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "坚持深化改革开放，强调的是( )问题。", "answer": "C", "options": [{"key": "A", "value": "发展目的"}, {"key": "B", "value": "前进方向"}, {"key": "C", "value": "发展动力"}, {"key": "D", "value": "方式手段"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 142/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "( )时期是基本实现社会主义现代化的关键时期。", "answer": "D", "options": [{"key": "A", "value": "“十二五”"}, {"key": "B", "value": "“十三五”"}, {"key": "C", "value": "“十四五”"}, {"key": "D", "value": "“十五五”"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 143/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "党的二十届四中全会提出，要加快构建新发展格局，坚持( )这个战略基点。", "answer": "A", "options": [{"key": "A", "value": "扩大内需"}, {"key": "B", "value": "扩大外需"}, {"key": "C", "value": "深化改革"}, {"key": "D", "value": "对外开放"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 144/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "党的二十届四中全会强调，我国国家制度和国家治理体系具有多方面的显著优势，共有( )", "answer": "C", "options": [{"key": "A", "value": "10 个方面"}, {"key": "B", "value": "12 个方面"}, {"key": "C", "value": "13 个方面"}, {"key": "D", "value": "14 个方面"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 145/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "党的二十届四中全会提出，要建立什么样的执政体制?", "answer": "A", "options": [{"key": "A", "value": "总揽全局、协调各方的党的领导体制"}, {"key": "B", "value": "服务人民、高效执行的政府管理体制"}, {"key": "C", "value": "民主集中、科学决策的协商体制"}, {"key": "D", "value": "多方参与、人民监督的民主体制"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 146/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "党的二十届四中全会《建议》的编制，其根本遵循和最高原则是?", "answer": "C", "options": [{"key": "A", "value": "新发展理念"}, {"key": "B", "value": "高质量发展"}, {"key": "C", "value": "习近平新时代中国特色社会主义思想"}, {"key": "D", "value": "中国式现代化"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 147/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "党的二十届四中全会《建议》将“发展新质生产力”作为首要任务。从生产力理论看，新质生产力区别于传统生产力的最根本标志是?", "answer": "C", "options": [{"key": "A", "value": "产业形态的先进性"}, {"key": "B", "value": "资源配置的高效率"}, {"key": "C", "value": "科技创新的主导性"}, {"key": "D", "value": "生态环境的友好性"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 148/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "党的二十届四中全会《建议》将什么摆在“十五五”时期经济社会发展各项任务的首位?", "answer": "A", "options": [{"key": "A", "value": "坚持创新驱动发展，加快发展新质生产力"}, {"key": "B", "value": "全面推进乡村振兴，加快农业农村现代化"}, {"key": "C", "value": "促进区域协调发展，优化重大经济布局"}, {"key": "D", "value": "深化改革开放，激发各类市场主体活力"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 149/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "党的二十届四中全会《建议》在“十五五”时期对区域协调发展的部署中，特别提出要发挥哪个区域的引领带动作用?", "answer": "D", "options": [{"key": "A", "value": "京津冀、长三角、粤港澳大湾区"}, {"key": "B", "value": "长江经济带、黄河流域生态保护和高质量发展"}, {"key": "C", "value": "成渝地区双城经济圈、长江中游城市群"}, {"key": "D", "value": "以上都是"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 150/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "在推进乡村全面振兴方面，党的二十届四中全会《建议》提出，要学习运用“千万工程”经验，其核心要义是?", "answer": "B", "options": [{"key": "A", "value": "大规模推进农村基础设施建设"}, {"key": "B", "value": "因地制宜、循序渐进、久久为功，统筹推进城乡融合发展"}, {"key": "C", "value": "以工业化理念谋划农业农村发展"}, {"key": "D", "value": "重点发展乡村特色产业和乡村旅游"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 151/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "党的二十届四中全会《建议》提出，要健全多层次社会保障体系，其覆盖范围的核心要求是?", "answer": "A", "options": [{"key": "A", "value": "覆盖全民、统筹城乡、公平统一、可持续"}, {"key": "B", "value": "保基本、多层次、全覆盖、可持续"}, {"key": "C", "value": "城乡一体、保障适度、权责清晰、运行高效"}, {"key": "D", "value": "与经济发展水平相适应、与人口结构变化相匹配"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 152/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "党的二十届四中全会强调，要健全国家安全体系，必须统筹哪些方面的安全?", "answer": "A", "options": [{"key": "A", "value": "传统安全与非传统安全"}, {"key": "B", "value": "经济安全与国防安全"}, {"key": "C", "value": "内部安全与外部安全"}, {"key": "D", "value": "国土安全与国民安全"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 153/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "留党察看处分，分为留党察看( )、留党察看( )。", "answer": "C", "options": [{"key": "A", "value": "半年、一年"}, {"key": "B", "value": "二年、三年"}, {"key": "C", "value": "一年、二年"}, {"key": "D", "value": "一年、三年"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 154/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "对出国(境)学习研究党员，由原就读高校或者工作单位党组织保留其组织关系，( )至少与其联系1 次。", "answer": "C", "options": [{"key": "A", "value": "每月"}, {"key": "B", "value": "每季度"}, {"key": "C", "value": "每半年"}, {"key": "D", "value": "每年"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 155/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "我国土地制度改革在全国范围内基本完成是在( )。", "answer": "B", "options": [{"key": "A", "value": "1951 年"}, {"key": "B", "value": "1952 年"}, {"key": "C", "value": "1960 年"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 156/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "1982 年2 月，中共中央作出《关于建立老干部退休制度的决定》，废除了干部领导职务实际上存在的( )。", "answer": "C", "options": [{"key": "A", "value": "任期制"}, {"key": "B", "value": "连任制"}, {"key": "C", "value": "终身制"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 157/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "我国社会主义初级阶段的基本经济制度是( )。", "answer": "A", "options": [{"key": "A", "value": "公有制为主体、多种多样所有制经济共同发展"}, {"key": "B", "value": "国有制为主体、多种多样所有制经济共同发展"}, {"key": "C", "value": "私有制为主体、多种多样所有制经济共同发展"}, {"key": "D", "value": "集体所有制"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 158/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "党的第( )全国代表大会阐明当代中国正处在社会主义初级阶段。", "answer": "B", "options": [{"key": "A", "value": "十二次"}, {"key": "B", "value": "十三次"}, {"key": "C", "value": "十四次"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 159/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "建设中国特色社会主义，总依据是( )。", "answer": "B", "options": [{"key": "A", "value": "“一个中心，两个基本点”"}, {"key": "B", "value": "社会主义初级阶段"}, {"key": "C", "value": "实现社会主义现代化"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 160/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "贯穿《共产党宣言》的基本思想是( )。", "answer": "C", "options": [{"key": "A", "value": "马克思主义"}, {"key": "B", "value": "辩证唯物主义"}, {"key": "C", "value": "历史唯物主义"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 161/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "对马克思主义的信仰，对社会主义和共产主义的信念，是共产党人的( )。", "answer": "A", "options": [{"key": "A", "value": "政治灵魂"}, {"key": "B", "value": "精神支柱"}, {"key": "C", "value": "政治底线"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 162/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "经济体制改革的核心问题是处理好( )和市场的关系，必须更加尊重市场规律，更好发挥政府作用。", "answer": "B", "options": [{"key": "A", "value": "企业"}, {"key": "B", "value": "政府"}, {"key": "C", "value": "社会"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 163/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "习近平新时代中国特色社会主义思想，明确坚持和发展中国特色社会主义，总任务是实现社会主义现代化和中华民族伟大复兴，在全面建成小康社会的基础上，分( )在本世纪中叶建成富强民主文明和谐美丽的社会主义现代化强国。", "answer": "A", "options": [{"key": "A", "value": "两步走"}, {"key": "B", "value": "三步走"}, {"key": "C", "value": "四步走"}, {"key": "D", "value": "五步走"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 164/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "党的十八大以来，在文化建设上，我国意识形态领域形势发生全局性、根本性转变，全党全国各族人民( )明显增强，全社会凝聚力和向心力极大提升。", "answer": "D", "options": [{"key": "A", "value": "文明素质"}, {"key": "B", "value": "精神素养"}, {"key": "C", "value": "物质需求"}, {"key": "D", "value": "文化自信"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 165/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "全会强调，党的十八大以来，在坚持党的全面领导上，党中央权威和集中统一领导得到有力保证，党的领导制度体系不断完善，党的领导方式更科学，全党思想上( )、政治上( )、行动上( )。", "answer": "A", "options": [{"key": "A", "value": "更加统一更加团结更加一致"}, {"key": "B", "value": "更加团结更加统一更加一致"}, {"key": "C", "value": "更加一致更加统一更加团结"}, {"key": "D", "value": "更加统一更加一致更加团结"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 166/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "党的百年奋斗展示了马克思主义的强大生命力，马克思主义的( )在中国得到充分检验。", "answer": "C", "options": [{"key": "A", "value": "人民性和实践性"}, {"key": "B", "value": "开放性和时代性"}, {"key": "C", "value": "科学性和真理性"}, {"key": "D", "value": "先进性和纯洁性"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 167/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "2021年7月1日，习近平在庆祝中国共产党成立100周年大会发表重要讲话，提到“以史为鉴，可以知兴替”，此语出自( )。", "answer": "C", "options": [{"key": "A", "value": "《贞观政要》"}, {"key": "B", "value": "《史记》"}, {"key": "C", "value": "《资治通鉴》"}, {"key": "D", "value": "《闲闲老人滏水文集》"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 168/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "2021年7月1日，习近平在庆祝中国共产党成立100周年大会发表重要讲话，我们创造了新民主主义革命的伟大成就，以( )反对武装的反革命，推翻帝国主义、封建主义、官僚资本主义三座大山。", "answer": "C", "options": [{"key": "A", "value": "无产阶级革命"}, {"key": "B", "value": "武装的力量"}, {"key": "C", "value": "武装的革命"}, {"key": "D", "value": "工人阶级革命"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 169/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "2021年7月1日，习近平在庆祝中国共产党成立100周年大会发表重要讲话，一百年来，中国共产党团结带领中国人民进行的一切( )、一切( )、一切( )，归结起来就是一个主题：实现中华民族伟大复兴。", "answer": "A", "options": [{"key": "A", "value": "奋斗;牺牲;创造"}, {"key": "B", "value": "革命;奋斗;创造"}, {"key": "C", "value": "牺牲;奋斗;创新"}, {"key": "D", "value": "革命;奋斗;牺牲"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 170/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "2021年7月1日，习近平在庆祝中国共产党成立100周年大会发表重要讲话，我们党为了实现中华民族伟大复兴，创造了四个历史阶段的伟大成就，指的是( )。\n①土地革命和新民主主义革命②社会主义革命和建设\n③改革开放和社会主义现代化建设④新时代中国特色社会主义 ⑤新民主主义革命。", "answer": "B", "options": [{"key": "A", "value": "①③④⑤"}, {"key": "B", "value": "②③④⑤"}, {"key": "C", "value": "①②③⑤"}, {"key": "D", "value": "①②③④"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 171/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "《决议》中提到的“四力”指的是( )。", "answer": "C", "options": [{"key": "A", "value": "党的政治统领力、思想凝聚力、群众组织力、社会号召力"}, {"key": "B", "value": "党的政治统领力、思想引领力、群众凝聚力、社会号召力"}, {"key": "C", "value": "党的政治领导力、思想引领力、群众组织力、社会号召力"}, {"key": "D", "value": "党的政治领导力、思想引领力、群众凝聚力、社会号召力"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 172/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "在经济建设上，我国经济发展( )明显增强。", "answer": "A", "options": [{"key": "A", "value": "平衡性、协调性、可持续性"}, {"key": "B", "value": "协调性、平衡性、可持续性"}, {"key": "C", "value": "可持续性、平衡性、协调性"}, {"key": "D", "value": "平衡性、可持续性、协调性"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 173/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "全面推进中国特色大国外交，推动构建人类命运共同体，坚定维护国家国际公平正义，毫不动摇反对任何单边主义、保护主义、( )。", "answer": "A", "options": [{"key": "A", "value": "霸凌主义"}, {"key": "B", "value": "霸道主义"}, {"key": "C", "value": "霸凌行径"}, {"key": "D", "value": "霸道行径"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 174/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "国家的一切权利属于( )。", "answer": "C", "options": [{"key": "A", "value": "公民"}, {"key": "B", "value": "群众"}, {"key": "C", "value": "人民"}, {"key": "D", "value": "工农"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 175/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "( )是社会主义的生命。", "answer": "B", "options": [{"key": "A", "value": "法制"}, {"key": "B", "value": "人民民主"}, {"key": "C", "value": "紧密联系群众"}, {"key": "D", "value": "人民当家作主"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 176/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "我们要坚持在意识形态领域指导地位的根本制度( )。", "answer": "A", "options": [{"key": "A", "value": "马克思主义"}, {"key": "B", "value": "革命文化"}, {"key": "C", "value": "创新思想"}, {"key": "D", "value": "社会主义核心价值观"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 177/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "全面落实意识形态工作责任制，巩固壮大奋进新时代的主流思想舆论，加强( )建设，推动形成良好网络生态。", "answer": "B", "options": [{"key": "A", "value": "网络传播体系"}, {"key": "B", "value": "全媒体传播体系"}, {"key": "C", "value": "意识形态"}, {"key": "D", "value": "群众价值"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 178/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "全面加强人民军队党的建设，确保枪杆子永远听党指挥。健全贯彻( )体制机制。", "answer": "A", "options": [{"key": "A", "value": "军委主席负责制"}, {"key": "B", "value": "建强人民军队党的组织体系"}, {"key": "C", "value": "深化军事治理"}, {"key": "D", "value": "政治整训常态化"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 179/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "2021年11月16日，习近平就《中共中央关于党的百年奋斗重大成就和历史经验的决议》起草的有关情况向全会作说明，深入研究历史发展规律和大势，始终掌握新时代新征程党和国家事业发展的( )，增强锚定既定奋斗目标、意气风发走向未来的勇气和力量。", "answer": "A", "options": [{"key": "A", "value": "历史主动"}, {"key": "B", "value": "历史规律"}, {"key": "C", "value": "思想脉络"}, {"key": "D", "value": "光荣历程"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 180/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "习近平在党的二十大报告中说，必须坚定不移走中国特色社会主义政治发展道路，坚持党的领导、人民当家作主、依法治国有机统一。加强( )，全面发展( )，积极发展( )，巩固和发展( )。\n①人民当家作主制度保障\n②协商民主\n③最广泛的爱国统一战线\n④基层民主", "answer": "C", "options": [{"key": "A", "value": "②④③①"}, {"key": "B", "value": "①③②④"}, {"key": "C", "value": "①②④③"}, {"key": "D", "value": "②①④③"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 181/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "教育、科技、人才是全面建设社会主义现代化国家的( )、( )支撑。", "answer": "C", "options": [{"key": "A", "value": "长期性、持久性"}, {"key": "B", "value": "战略性、长期性"}, {"key": "C", "value": "基础性、战略性"}, {"key": "D", "value": "决定性、战略性"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 182/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "夯实粮食安全根基，牢牢守住( )亿亩耕地红线，确保中国人的饭碗牢牢端在自己手中。", "answer": "B", "options": [{"key": "A", "value": "十六"}, {"key": "B", "value": "十八"}, {"key": "C", "value": "十七"}, {"key": "D", "value": "十九"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 183/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "坚持( )基本国策，保障妇女儿童合法权益。", "answer": "B", "options": [{"key": "A", "value": "全面平等"}, {"key": "B", "value": "男女平等"}, {"key": "C", "value": "人人平等"}, {"key": "D", "value": "绝对平等"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 184/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "严格( )司法，深化司法体制综合配套改革，全面准确落实司法责任制。", "answer": "D", "options": [{"key": "A", "value": "高效"}, {"key": "B", "value": "合理"}, {"key": "C", "value": "公平"}, {"key": "D", "value": "公正"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 185/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "坚持运用( )主义和( )主义，才能正确回答时代和实践提出的重大问题，才能始终保持马克思主义蓬勃生机和旺盛活力。", "answer": "C", "options": [{"key": "A", "value": "主观唯心、客观唯心"}, {"key": "B", "value": "朴素唯物、辩证唯物"}, {"key": "C", "value": "辩证唯物、历史唯物"}, {"key": "D", "value": "历史唯物、朴素唯物"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 186/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "必须更好发挥法治固( )、稳( )、利( )的保障作用，在法治轨道上全面建设社会主义现代化国家。", "answer": "B", "options": [{"key": "A", "value": "长远、根本、预期"}, {"key": "B", "value": "根本、长远、预期"}, {"key": "C", "value": "根本、预期、长远"}, {"key": "D", "value": "长远、预期、根本"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 187/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "要坚持以社会主义核心价值观为引领，发展( )，弘扬( )，传承( )，满足人民日益增长的精神文化需求。", "answer": "D", "options": [{"key": "A", "value": "革命文化、中华优秀传统文化、社会主义先进文化"}, {"key": "B", "value": "中华优秀传统文化、社会主义先进文化、革命文化"}, {"key": "C", "value": "中华优秀传统文化、革命文化、社会主义先进文化"}, {"key": "D", "value": "社会主义先进文化、革命文化、中华优秀传统文化"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 188/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "我们必须增强( )意识、坚持( )思维，做到居安思危、未雨绸缪，准备经受风高浪急甚至惊涛骇浪的重大考验。", "answer": "D", "options": [{"key": "A", "value": "危机底线"}, {"key": "B", "value": "忧患红线"}, {"key": "C", "value": "危机红线"}, {"key": "D", "value": "忧患底线"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 189/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "以铸牢( )为主线，加强和改进党的民族工作。", "answer": "B", "options": [{"key": "A", "value": "中华民族综合体意识"}, {"key": "B", "value": "中华民族共同体意识"}, {"key": "C", "value": "中华民族联合体意识"}, {"key": "D", "value": "中华民族共保体意识"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 190/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "健全党( )、( )、( )的监督体系，发挥政治巡视利剑作用，落实全面从严治党主体责任，用好问责利器。", "answer": "B", "options": [{"key": "A", "value": "统一领导全面覆盖完善高效"}, {"key": "B", "value": "统一领导全面覆盖权威高效"}, {"key": "C", "value": "全面覆盖统一领导权威完善"}, {"key": "D", "value": "全面覆盖统一领导权威健全"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 191/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "我们始终尊重、关爱、造福台湾同胞，继续致力于促进两岸经济文化交流合作，推动两岸共同弘扬中华文化，促进两岸同胞( )契合。", "answer": "B", "options": [{"key": "A", "value": "思想"}, {"key": "B", "value": "心灵"}, {"key": "C", "value": "精神"}, {"key": "D", "value": "文化"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 192/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "“一国两制”的前提是。( )", "answer": "D", "options": [{"key": "A", "value": "大陆主体社会主义制度和港、澳、台地区的资本主义制度并存"}, {"key": "B", "value": "港、澳、台享有高度自治权"}, {"key": "C", "value": "用和平方式统一祖国"}, {"key": "D", "value": "国家主权统一于中华人民共和国"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 193/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "党的二十大报告指出，要坚持和加强党中央集中统一领导，坚持不懈用新时代中国特色社会主义思想凝心铸魂，完善( )，建设堪当民族复兴重任的高素质干部队伍。", "answer": "A", "options": [{"key": "A", "value": "党的自我革命制度规范体系"}, {"key": "B", "value": "党的自我完善制度规范体系"}, {"key": "C", "value": "党的自我提高制度规范体系"}, {"key": "D", "value": "党的自我净化制度规范体系"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 194/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "中华人民共和国第一部宪法是( )年通过并正式公布的。", "answer": "C", "options": [{"key": "A", "value": "1949"}, {"key": "B", "value": "1953"}, {"key": "C", "value": "1954"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 195/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "新中国成立后的第一部党章是( )通过的。", "answer": "C", "options": [{"key": "A", "value": "中国人民政治协商会议第一届全体会议"}, {"key": "B", "value": "党的七大"}, {"key": "C", "value": "党的八大"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 196/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "20世纪60年代大庆石油工人的代表人物是( )。", "answer": "B", "options": [{"key": "A", "value": "焦裕禄"}, {"key": "B", "value": "王进喜"}, {"key": "C", "value": "黄继光"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 197/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "( )标志着中美两国关系正常化进程的开始。", "answer": "A", "options": [{"key": "A", "value": "中美上海《联合公报》的发表"}, {"key": "B", "value": "美国乒乓球代表团应邀访华"}, {"key": "C", "value": "基辛格访华"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 198/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "2014年1月，中共中央印发( )，体现了中央对干部工作的新精神新要求，是做好党政领导干部选拔任用工作的基本遵循。", "answer": "C", "options": [{"key": "A", "value": "《中国共产党廉洁自律准则》"}, {"key": "B", "value": "《中国共产党纪律处分条例》"}, {"key": "C", "value": "《党政领导干部选拔任用工作条例》"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 199/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "党的思想路线的具体内容是( )。", "answer": "C", "options": [{"key": "A", "value": "一切从实际出发，理论联系实际，实事求是"}, {"key": "B", "value": "实事求是，在实践中检验真理和发展真理"}, {"key": "C", "value": "一切从实际出发，理论联系实际，实事求是，在实践中检验真理和发展真理"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 200/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "“一带一路”倡议具体指( )。", "answer": "A", "options": [{"key": "A", "value": "“新丝绸之路经济带”和“21世纪海上丝绸之路”"}, {"key": "B", "value": "沿海一带经济开发区"}, {"key": "C", "value": "丝绸之路经济带"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 201/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "标志着中国新民主主义革命的开端的事件是( )。", "answer": "B", "options": [{"key": "A", "value": "新文化运动"}, {"key": "B", "value": "五四运动"}, {"key": "C", "value": "中国共产党的成立"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 202/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "全国抗战开始后，中共中央在( )召开政治局扩大会议，通过《中国共产党抗日救国十大纲领》，提出实行全面抗战的方针。", "answer": "A", "options": [{"key": "A", "value": "洛川"}, {"key": "B", "value": "瓦窑堡"}, {"key": "C", "value": "延安"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 203/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "八路军在华北战场上对日军作战取得的第一个大胜仗是( )。", "answer": "A", "options": [{"key": "A", "value": "平型关大捷"}, {"key": "B", "value": "台儿庄大捷"}, {"key": "C", "value": "昆仑关大捷"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 204/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "( )发生，标志着日本帝国主义发动全面侵华战争和全国抗战的开始。", "answer": "B", "options": [{"key": "A", "value": "九一八事变"}, {"key": "B", "value": "七七事变"}, {"key": "C", "value": "八一三事变"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 205/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "拥有马克思主义科学理论指导是我们党坚定信仰信念、把握历史主动的( )。", "answer": "D", "options": [{"key": "A", "value": "本质所在"}, {"key": "B", "value": "根本要求"}, {"key": "C", "value": "本质要求"}, {"key": "D", "value": "根本所在"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 206/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "我们要建设具有强大凝聚力和引领力的社会主义意识形态，牢牢掌握党对意识形态工作( )。", "answer": "A", "options": [{"key": "A", "value": "领导权"}, {"key": "B", "value": "主导权"}, {"key": "C", "value": "把握权"}, {"key": "D", "value": "协调权"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 207/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "( )是新时代我国发展壮大的必由之路。", "answer": "B", "options": [{"key": "A", "value": "全面改革开放"}, {"key": "B", "value": "深化改革开放"}, {"key": "C", "value": "全面从严治党"}, {"key": "D", "value": "贯彻新发展理念"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 208/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "在政治建设上，积极发展全过程人民民主，我国社会主义民主政治( )全面推进，中国特色社会主义政治制度优越性得到更好发挥，生动活泼、安定团结的政治局面得到巩固和发展。", "answer": "A", "options": [{"key": "A", "value": "制度化、规范化、程序化"}, {"key": "B", "value": "制度化、长效化、标准化"}, {"key": "C", "value": "规范化、长效化、标准化"}, {"key": "D", "value": "规范化、标准化、程序化"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 209/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "在文化建设上，我国意识形态领域形势发生( )转变，全党全国各族人民文化自信明显增强，全社会凝聚力和向心力极大提升，为新时代开创党和国家事业新局面提供了坚强思想保证和强大精神力量。", "answer": "B", "options": [{"key": "A", "value": "整体性、长期性"}, {"key": "B", "value": "全局性、根本性"}, {"key": "C", "value": "阶段性、根本性"}, {"key": "D", "value": "全局性、长期性"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 210/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "在社会建设上，人民生活全方位改善，社会治理( )水平大幅度提升，发展了人民安居乐业、社会安定有序的良好局面，续写了社会长期稳定奇迹。", "answer": "A", "options": [{"key": "A", "value": "社会化、法治化、智能化、专业化"}, {"key": "B", "value": "现代化、法治化、智能化、专业化"}, {"key": "C", "value": "社会化、现代化、智能化、专业化"}, {"key": "D", "value": "社会化、法治化、现代化、智能化"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 211/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "在生态文明建设上，党中央以前所未有的力度抓生态文明建设，美丽中国建设迈出重大步伐，我国生态环境保护发生( )变化。", "answer": "D", "options": [{"key": "A", "value": "根本性、阶段性、整体性"}, {"key": "B", "value": "根本性、转折性、全局性"}, {"key": "C", "value": "历史性、阶段性、整体性"}, {"key": "D", "value": "历史性、转折性、全局性"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 212/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "在国防和军队建设上，人民军队实现整体性革命性重塑、重整行装再出发，国防实力和经济实力同步提升，人民军队坚决履行新时代使命任务，以顽强斗争精神和实际行动捍卫了国家( )。", "answer": "A", "options": [{"key": "A", "value": "主权、安全、发展利益"}, {"key": "B", "value": "主权、领土、发展利益"}, {"key": "C", "value": "主权、领土、安全"}, {"key": "D", "value": "主权、安全、经济利益"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 213/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "在外交工作上，中国特色大国外交全面推进，构建人类命运共同体成为引领时代潮流和人类前进方向的鲜明旗帜，我国外交在世界大变局中开创新局、在世界乱局中化危为机，我国国际( )显著提升。", "answer": "C", "options": [{"key": "A", "value": "统筹力、领导力、凝聚力"}, {"key": "B", "value": "统筹力、感召力、塑造力"}, {"key": "C", "value": "影响力、感召力、塑造力"}, {"key": "D", "value": "影响力、领导力、凝聚力"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 214/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "社会主义革命和建设时期，党面临的主要任务是，实现从新民主主义到社会主义的转变，进行社会主义革命，推进社会主义建设，为实现中华民族伟大复兴奠定根本( )前提和( )基础。", "answer": "A", "options": [{"key": "A", "value": "政治，制度"}, {"key": "B", "value": "物质，经济"}, {"key": "C", "value": "政治，经济"}, {"key": "D", "value": "政治，思想"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 215/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "在经济建设上，我国经济发展( )明显增强。", "answer": "A", "options": [{"key": "A", "value": "平衡性、协调性、可持续性"}, {"key": "B", "value": "协调性、平衡性、可持续性"}, {"key": "C", "value": "可持续性、平衡性、协调性"}, {"key": "D", "value": "平衡性、可持续性、协调性"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 216/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "在经济建设上，国家( )跃上新台阶。", "answer": "C", "options": [{"key": "A", "value": "经济实力、科技实力、国防实力"}, {"key": "B", "value": "经济实力、科技实力、文化实力"}, {"key": "C", "value": "经济实力、科技实力、综合实力"}, {"key": "D", "value": "经济实力、科技实力、综合国力"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 217/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "我国经济迈上( )、更可持续、更为安全的发展之路。", "answer": "B", "options": [{"key": "A", "value": "更高速度、更加高效、更加公正"}, {"key": "B", "value": "更高质量、更有效率、更加公平"}, {"key": "C", "value": "更高速度、更加高效、更加公平"}, {"key": "D", "value": "更高质量、更有效率、更加公正"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 218/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "习近平指出，要坚持农业农村优先发展，加快农业农村现代化建设步伐，牢牢守住粮食安全底线，推进农业产业化，推动农村( )产业融合发展，全面推进乡村振兴。", "answer": "C", "options": [{"key": "A", "value": "一二"}, {"key": "B", "value": "一三"}, {"key": "C", "value": "一二三"}, {"key": "D", "value": "二三"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 219/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "未来五年是全面建设社会主义现代化国家开局起步的关键时期，主要目标任务包括：( )取得新突破，科技自立自强能力显著提升，构建新发展格局和建设现代化经济体系取得重大进展。", "answer": "C", "options": [{"key": "A", "value": "经济高速发展"}, {"key": "B", "value": "经济平稳增长"}, {"key": "C", "value": "经济高质量发展"}, {"key": "D", "value": "经济绿色发展"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 220/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "党的二十大报告指出，要努力提高居民收入在国民收入分配中的比重，提高( )在初次分配中的比重。", "answer": "A", "options": [{"key": "A", "value": "劳动报酬"}, {"key": "B", "value": "资本报酬"}, {"key": "C", "value": "土地报酬"}, {"key": "D", "value": "技术报酬"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 221/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "党的二十大报告指出，要坚持多劳多得，鼓励勤劳致富，促进( )，增加低收入者收入，扩大中等收入群体。", "answer": "B", "options": [{"key": "A", "value": "绝对公平"}, {"key": "B", "value": "机会公平"}, {"key": "C", "value": "起点公平"}, {"key": "D", "value": "结果公平"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 222/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "必须坚持制度治党、依规治党，以( )为根本，以民主集中制为核心，完善党内法规制度体系。", "answer": "D", "options": [{"key": "A", "value": "宪法"}, {"key": "B", "value": "法律法规"}, {"key": "C", "value": "党内法规"}, {"key": "D", "value": "党章"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 223/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "实现中华民族伟大复兴的中国梦，必须紧密围绕党的基本路线，坚持和加强党的( )领导。", "answer": "A", "options": [{"key": "A", "value": "全面"}, {"key": "B", "value": "政治"}, {"key": "C", "value": "经济"}, {"key": "D", "value": "组织"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 224/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "改革开放和社会主义现代化建设深入推进，书写了经济快速发展和( )两大奇迹新篇章。", "answer": "C", "options": [{"key": "A", "value": "社会相对稳定"}, {"key": "B", "value": "人民安居乐业"}, {"key": "C", "value": "社会长期稳定"}, {"key": "D", "value": "构建新发展格局"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 225/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "全面建设社会主义现代化国家，最艰巨最繁重的任务仍然在( )。", "answer": "A", "options": [{"key": "A", "value": "农村"}, {"key": "B", "value": "城市"}, {"key": "C", "value": "县域"}, {"key": "D", "value": "城中村"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 226/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "全方位夯实粮食安全根基，全面落实粮食安全( )，牢牢守住十八亿亩耕地红线，逐步把永久基本农田全部建成高标准农田。", "answer": "C", "options": [{"key": "A", "value": "政府责任"}, {"key": "B", "value": "党委责任"}, {"key": "C", "value": "党政同责"}, {"key": "D", "value": "集体责任"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 227/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "新修订的《中国共产党纪律处分条例》，于2024年1月1日起施行。这是党的十八大以来，条例的第( )次修订。", "answer": "B", "options": [{"key": "A", "value": "二"}, {"key": "B", "value": "三"}, {"key": "C", "value": "四"}, {"key": "D", "value": "五"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 228/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "王某担任紫云苗族布依族自治县四大寨乡党委书记期间，未经论证，盲目要求乡政府入股企业养殖龙虾项目；未经集体研判和选址审批，盲目安排申报鲈鱼养殖项目；明知该乡另一龙虾养殖项目虾苗大量死亡，且分管领导已提出终止项目，仍要求继续投入资金。按照新修订《中国共产党纪律处分条例》相关规定，王某的行为违反了( )。", "answer": "B", "options": [{"key": "A", "value": "组织纪律"}, {"key": "B", "value": "工作纪律"}, {"key": "C", "value": "政治纪律"}, {"key": "D", "value": "群众纪律"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 229/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "根据新修订《中国共产党纪律处分条例》规定，不得通过网络、广播、电视、报刊、传单、书籍等，或者利用讲座、论坛、报告会、座谈会等方式( )\n①公开发表坚持资产阶级自由化立场的文章、演说、宣言、声明等②公开发表违背四项基本原则，违背、歪曲党的改革开放决策，或者其他有严重政治问题的文章、演说、宣言、声明③妄议党中央大政方针，破坏党的集中统一④丑化党和国家形象，或者诋毁、污蔑党和国家领导人、英雄模范，或者歪曲党的历史、中华人民共和国历史、人民军队历史。", "answer": "A", "options": [{"key": "A", "value": "①②③④"}, {"key": "B", "value": "①③④"}, {"key": "C", "value": "②③④"}, {"key": "D", "value": "①②④"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 230/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "某领导干部(中共党员)将其所辖的汽车城当成“家族产业”，利用职权大肆为亲属经营活动打招呼、批项目，非法牟取巨额利益。按照新修订《中国共产党纪律处分条例》相关规定，其行为违反了( )。", "answer": "D", "options": [{"key": "A", "value": "组织纪律"}, {"key": "B", "value": "工作纪律"}, {"key": "C", "value": "政治纪律"}, {"key": "D", "value": "廉洁纪律"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 231/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "根据新修订《中国共产党纪律处分条例》规定，党员干部相互利用职权或者职务上的影响为对方及其配偶、子女及其配偶等亲属、身边工作人员和其他特定关系人谋取利益搞权权交易的，给予( )处分。", "answer": "A", "options": [{"key": "A", "value": "警告或者严重警告"}, {"key": "B", "value": "撤销党内职务"}, {"key": "C", "value": "留党察看"}, {"key": "D", "value": "开除党籍"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 232/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "根据新修订《中国共产党纪律处分条例》规定，在推进领导干部能上能下工作中，搞好人主义，有以下哪些行为，对直接责任者和领导责任者，情节较重的，给予警告或者严重警告处分；情节严重的，给予撤销党内职务或者留党察看处分：( )\n①以个人职务行权宜之计；\n②以党纪政务处分规避组织调整；\n③以组织调整代替党纪政务处分；\n④其他避重就轻作出处理行为。", "answer": "C", "options": [{"key": "A", "value": "①②③"}, {"key": "B", "value": "①③④"}, {"key": "C", "value": "②③④"}, {"key": "D", "value": "①②④"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 233/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "王某，中共党员，B市市长。2015年至2021年，王某之子王小某(无业)长期沉迷享乐，多次参与嫖娼、赌博、吸毒等违法行为，造成严重不良影响。但直至案发，王某对其子的行为始终不知情。按照新修订《中国共产党纪律处分条例》相关规定，王某的行为违反了( )。", "answer": "A", "options": [{"key": "A", "value": "生活纪律"}, {"key": "B", "value": "工作纪律"}, {"key": "C", "value": "政治纪律"}, {"key": "D", "value": "群众纪律"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 234/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "习近平总书记指出，共产党人必须牢记，( )是最大政绩。( )", "answer": "B", "options": [{"key": "A", "value": "经济增长"}, {"key": "B", "value": "为民造福"}, {"key": "C", "value": "工程建设"}, {"key": "D", "value": "上级认可"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 235/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "树立和践行正确政绩观，起决定性作用的是( )。", "answer": "D", "options": [{"key": "A", "value": "能力"}, {"key": "B", "value": "担当"}, {"key": "C", "value": "作风"}, {"key": "D", "value": "党性"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 236/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "政绩观问题是一个( )问题，关乎立党为公、执政为民。", "answer": "B", "options": [{"key": "A", "value": "一般性"}, {"key": "B", "value": "根本性"}, {"key": "C", "value": "阶段性"}, {"key": "D", "value": "技术性"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 237/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "正确政绩观要求我们坚持( )，通过科学决策和实干苦干，创造经得起实践和历史检验、真正造福人民、得到群众公认的业绩。", "answer": "A", "options": [{"key": "A", "value": "从实际出发、按规律办事"}, {"key": "B", "value": "快速见效、重点造势"}, {"key": "C", "value": "以GDP为核心"}, {"key": "D", "value": "重痕迹、轻实效"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 238/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "“思想建党、政治建军”的建军原则是( )上确立的。", "answer": "A", "options": [{"key": "A", "value": "古田会议"}, {"key": "B", "value": "黎平会议"}, {"key": "C", "value": "八七会议"}, {"key": "D", "value": "中共五大"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 239/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "新时代党员必须践行( )的党的根本宗旨。", "answer": "C", "options": [{"key": "A", "value": "以人为本"}, {"key": "B", "value": "不断解放和发展社会生产力"}, {"key": "C", "value": "全心全意为人民服务"}, {"key": "D", "value": "实现共产主义"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 240/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "党能否得到最广大人民群众的信任和拥护的根本条件是 ()。", "answer": "C", "options": [{"key": "A", "value": "党的宗旨"}, {"key": "B", "value": "党的指导思想"}, {"key": "C", "value": "党的先进性"}, {"key": "D", "value": "党的奋斗目标"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 241/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "( )的发表和共产主义者同盟的成立，标志着科学社会主义理论的诞生和共产主义运动的开始。", "answer": "D", "options": [{"key": "A", "value": "《哥达纲领批判》"}, {"key": "B", "value": "《罢工和工人同盟》"}, {"key": "C", "value": "《关于费尔巴哈的提纲》"}, {"key": "D", "value": "《共产党宣言》"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 242/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "中国共产党历史上第一次明确提出“群众路线”概念的文件是( )", "answer": "D", "options": [{"key": "A", "value": "《古田会议决议》"}, {"key": "B", "value": "《星星之火，可以燎原》"}, {"key": "C", "value": "《反对本本主义》"}, {"key": "D", "value": "《中共中央给红军第四军前委的指示信》"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 243/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "中国共产主义青年团是中国共产党领导的什么组织?", "answer": "B", "options": [{"key": "A", "value": "青年群众自治组织"}, {"key": "B", "value": "先进青年的群团组织"}, {"key": "C", "value": "青年社会服务组织"}, {"key": "D", "value": "青年学术组织"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 244/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "中国共产党首次将“美丽”纳入社会主义现代化强国目标的会议是( )。", "answer": "B", "options": [{"key": "A", "value": "党的十八大"}, {"key": "B", "value": "党的十九大"}, {"key": "C", "value": "党的十九届五中全会"}, {"key": "D", "value": "党的二十大"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 245/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "中国共产主义青年团是广大青年在实践中学习( )的学校。", "answer": "C", "options": [{"key": "A", "value": "市场经济和现代管理"}, {"key": "B", "value": "法律与科技"}, {"key": "C", "value": "中国特色社会主义和共产主义"}, {"key": "D", "value": "国际关系与外交"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 246/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "中国共产主义青年团是中国共产党的( )。", "answer": "B", "options": [{"key": "A", "value": "宣传机构和执行机关"}, {"key": "B", "value": "助手和后备军"}, {"key": "C", "value": "青年智库和参谋部"}, {"key": "D", "value": "外围组织"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 247/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "中国共产党历史上第一次用法律形式把“工农武装割据”思想固定下来的文件是( )。", "answer": "A", "options": [{"key": "A", "value": "《井冈山土地法》"}, {"key": "B", "value": "《兴国土地法》"}, {"key": "C", "value": "《中华苏维埃共和国宪法大纲》"}, {"key": "D", "value": "《中国革命战争的战略问题》"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 248/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "最早在中国提出“中国共产党”这个名称的是( )。", "answer": "C", "options": [{"key": "A", "value": "李大钊"}, {"key": "B", "value": "陈独秀"}, {"key": "C", "value": "蔡和森"}, {"key": "D", "value": "胡适"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 249/250"
curl -s -X POST http://localhost:9091/api/v1/questions -H "Content-Type: application/json" -d '{"type": "choice", "question": "成为抗日战争取得完全胜利的重要标志是( )。", "answer": "D", "options": [{"key": "A", "value": "日本天皇发表“终战诏书”"}, {"key": "B", "value": "日本政府签署向同盟国的投降书"}, {"key": "C", "value": "中、美、英三国发表波茨坦公告"}, {"key": "D", "value": "中国政府在台湾举行受降仪式，台湾以及澎湖列岛由中国收回"}], "explanation": ""}' > /dev/null 2>&1
echo "单选题 250/250"
