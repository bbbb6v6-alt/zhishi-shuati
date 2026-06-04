#!/bin/bash
# 导入多选题到题库

BASE_URL="http://localhost:9091"

# 多选题数据
MULTIPLE_CHOICE_QUESTIONS='[
  {"type":"multiple_choice","question":"中国共产党党员必须履行下列义务( )。","answer":"ABCD","options":[{"key":"A","value":"认真学习马克思列宁主义、毛泽东思想、邓小平理论、三个代表重要思想、科学发展观、习近平新时代中国特色社会主义思想"},{"key":"B","value":"贯彻执行党的基本路线和各项方针、政策"},{"key":"C","value":"坚持党和人民的利益高于一切"},{"key":"D","value":"维护党的团结和统一"}]},
  {"type":"multiple_choice","question":"中国共产党党员享有下列权利( )。","answer":"ABCD","options":[{"key":"A","value":"参加党的有关会议，阅读党的有关文件，接受党的教育和培训"},{"key":"B","value":"在党的会议上和党报党刊上，参加关于党的政策问题的讨论"},{"key":"C","value":"对党的工作提出建议和倡议"},{"key":"D","value":"行使表决权、选举权，有被选举权"}]},
  {"type":"multiple_choice","question":"党的全国代表大会的职权是( )。","answer":"ABCD","options":[{"key":"A","value":"听取和审查中央委员会的报告"},{"key":"B","value":"审查中央纪律检查委员会的报告"},{"key":"C","value":"讨论并决定党的重大问题"},{"key":"D","value":"修改党的章程"}]},
  {"type":"multiple_choice","question":"党的地方各级代表大会的职权是( )。","answer":"ABCD","options":[{"key":"A","value":"听取和审查同级委员会的报告"},{"key":"B","value":"审查同级纪律检查委员会的报告"},{"key":"C","value":"讨论本地区范围内的重大问题并作出决议"},{"key":"D","value":"选举同级党的委员会和纪律检查委员会"}]},
  {"type":"multiple_choice","question":"党支部是党的基础组织，担负直接( )群众的职责。","answer":"ABCD","options":[{"key":"A","value":"教育党员"},{"key":"B","value":"管理党员"},{"key":"C","value":"监督党员"},{"key":"D","value":"组织群众、宣传群众、凝聚群众、服务群众"}]},
  {"type":"multiple_choice","question":"党的纪律主要包括政治纪律、组织纪律、廉洁纪律、群众纪律、工作纪律和( )。","answer":"CD","options":[{"key":"A","value":"思想纪律"},{"key":"B","value":"政治规矩"},{"key":"C","value":"生活纪律"},{"key":"D","value":"政治纪律"}]},
  {"type":"multiple_choice","question":"对党员的纪律处分有( )。","answer":"ABCD","options":[{"key":"A","value":"警告"},{"key":"B","value":"严重警告"},{"key":"C","value":"撤销党内职务"},{"key":"D","value":"留党察看、开除党籍"}]},
  {"type":"multiple_choice","question":"党员个人服从党的组织，( )，全党各个组织和全体党员服从党的全国代表大会和中央委员会。","answer":"ABC","options":[{"key":"A","value":"少数服从多数"},{"key":"B","value":"下级组织服从上级组织"},{"key":"C","value":"个人服从组织"},{"key":"D","value":"组织服从个人"}]},
  {"type":"multiple_choice","question":"习近平新时代中国特色社会主义思想的核心内容是( )。","answer":"ABC","options":[{"key":"A","value":"十个明确"},{"key":"B","value":"十四个坚持"},{"key":"C","value":"十三个方面成就"},{"key":"D","value":"八个明确"}]},
  {"type":"multiple_choice","question":"中国式现代化的特征是( )。","answer":"ABCD","options":[{"key":"A","value":"人口规模巨大"},{"key":"B","value":"全体人民共同富裕"},{"key":"C","value":"物质文明和精神文明相协调"},{"key":"D","value":"人与自然和谐共生、走和平发展道路"}]},
  {"type":"multiple_choice","question":"全面建成社会主义现代化强国，总的战略安排是分两步走：从二〇二〇年到二〇三五年基本实现社会主义现代化；从二〇三五年到本世纪中叶把我国建成富强民主文明和谐美丽的社会主义现代化强国。基本实现社会主义现代化时，我国要( )。","answer":"ABCD","options":[{"key":"A","value":"经济实力、科技实力、综合国力大幅跃升"},{"key":"B","value":"实现高水平科技自立自强"},{"key":"C","value":"建成现代化经济体系"},{"key":"D","value":"人民生活更加幸福美好"}]},
  {"type":"multiple_choice","question":"高质量发展是( )。","answer":"AB","options":[{"key":"A","value":"全面建设社会主义现代化国家的首要任务"},{"key":"B","value":"新时代的硬道理"},{"key":"C","value":"社会主义市场经济的全部内容"},{"key":"D","value":"可以替代其他发展理念"}]},
  {"type":"multiple_choice","question":"全过程人民民主是( )的民主。","answer":"BCD","options":[{"key":"A","value":"最直接"},{"key":"B","value":"最广泛"},{"key":"C","value":"最真实"},{"key":"D","value":"最管用"}]},
  {"type":"multiple_choice","question":"全面依法治国必须( )。","answer":"ABCD","options":[{"key":"A","value":"坚持党的领导、人民当家作主、依法治国有机统一"},{"key":"B","value":"坚持依法治国、依法执政、依法行政共同推进"},{"key":"C","value":"坚持法治国家、法治政府、法治社会一体建设"},{"key":"D","value":"坚持依法治国和以德治国相结合"}]},
  {"type":"multiple_choice","question":"全面从严治党必须( )。","answer":"ABCD","options":[{"key":"A","value":"增强自我净化、自我完善、自我革新、自我提高能力"},{"key":"B","value":"把严的基调、严的措施、严的氛围长期坚持下去"},{"key":"C","value":"一体推进不敢腐、不能腐、不想腐"},{"key":"D","value":"纠正四风不止步"}]},
  {"type":"multiple_choice","question":"一体推进不敢腐、不能腐、不想腐，( )。","answer":"ABCD","options":[{"key":"A","value":"不敢腐是前提"},{"key":"B","value":"不能腐是关键"},{"key":"C","value":"不想腐是根本"},{"key":"D","value":"三者相互依存、相互促进的有机整体"}]},
  {"type":"multiple_choice","question":"社会主义核心价值观的内容是( )。","answer":"ABC","options":[{"key":"A","value":"富强、民主、文明、和谐（国家层面）"},{"key":"B","value":"自由、平等、公正、法治（社会层面）"},{"key":"C","value":"爱国、敬业、诚信、友善（个人层面）"},{"key":"D","value":"公正、诚信、友善、和谐（个人层面）"}]},
  {"type":"multiple_choice","question":"伟大建党精神的内涵是( )。","answer":"ABCD","options":[{"key":"A","value":"坚持真理、坚守理想"},{"key":"B","value":"践行初心、担当使命"},{"key":"C","value":"不怕牺牲、英勇斗争"},{"key":"D","value":"对党忠诚、不负人民"}]},
  {"type":"multiple_choice","question":"两个确立是指( )。","answer":"CD","options":[{"key":"A","value":"确立党的基本路线不动摇"},{"key":"B","value":"确立改革开放的正确方向"},{"key":"C","value":"确立习近平同志党中央的核心、全党的核心地位"},{"key":"D","value":"确立习近平新时代中国特色社会主义思想的指导地位"}]},
  {"type":"multiple_choice","question":"两个维护是指( )。","answer":"AB","options":[{"key":"A","value":"坚决维护习近平总书记党中央的核心、全党的核心地位"},{"key":"B","value":"坚决维护党中央权威和集中统一领导"},{"key":"C","value":"坚决维护党的路线方针政策"},{"key":"D","value":"坚决维护党的光辉形象"}]}
]'

echo "正在导入多选题..."

curl -X POST "${BASE_URL}/api/v1/questions/batch" \
  -H "Content-Type: application/json" \
  -d "${MULTIPLE_CHOICE_QUESTIONS}"

echo ""
echo "多选题导入完成！"
