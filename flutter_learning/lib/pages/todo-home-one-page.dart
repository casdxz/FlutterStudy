import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final Color color1 = Color(0xffFA696C);
final Color color2 = Color(0xffFA8165);
final Color color3 = Color(0xffFB8964);

TextStyle lightText = TextStyle(
  color: Colors.white,
  fontSize: 18,
);

TextStyle darkText = TextStyle(
  color: Colors.black54,
  fontSize: 18,
);

TextStyle titleText = TextStyle(
  color: Colors.grey.shade700,
  fontSize: 36,
  fontWeight: FontWeight.bold
);

class TodoHomeOnePage extends StatefulWidget {
  const TodoHomeOnePage({Key? key}) : super(key: key);

  @override
  State<TodoHomeOnePage> createState() => _TodoHomeOnePageState();
}

class _TodoHomeOnePageState extends State<TodoHomeOnePage> {
  final List tasks = [
    {'title': "购买跨平台开发相关书籍", 'completed': true},
    {'title': "编写代码，修改 Bug", 'completed': false},
    {'title': "还支付宝账单", 'completed': false},
    {'title': "准备项目申报书", 'completed': false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // 顶部半圆形区
            _buildHeader(),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "今日任务",
                style: titleText,
              ),
            ),
            SizedBox(height: 30),
            // 任务列表，使用扩展运算符遍历 tasks数组
            ...tasks.map(
              (task) => Padding(
                padding: const EdgeInsets.only(left: 10),
                child: GestureDetector(
                  // 点击改变任务完成状态
                  onTap: () {
                    setState(() {
                      task['completed'] = !task['completed'];
                    });
                  },
                  child: CheckboxListTile(
                    activeColor: color1,
                    secondary: const Icon(Icons.alarm_on),
                    title: Text(
                      task['title'],
                      // 根据任务是否完成来使用文字中划线样式
                      style: TextStyle(
                        decoration: task['completed']
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                        decorationColor: Colors.red,
                        fontSize: 20,
                      ),
                    ),
                    // 任务未完成， 则显示响铃提示
                    subtitle: task['completed'] ? Text('') : Text('58分钟后响铃'),
                    value: task['completed'],
                    onChanged: (value) {
                      setState(() {
                        task['completed'] = value;
                      });
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      // 底部带凸起按钮的导航栏
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: Container(
          height: 50,
          child: Row(
            children: <Widget>[
              SizedBox(width: 20),
              IconButton(
                color: Colors.grey.shade700,
                icon: Icon(
                  Icons.menu,
                  size: 30,
                ),
                onPressed: () {},
              ),
              Spacer(),
              IconButton(
                color: Colors.grey.shade700,
                icon: Icon(
                  FontAwesomeIcons.calendarMinus,
                  size: 30,
                ),
                onPressed: () {},
              ),
              SizedBox(width: 20),
            ],
          ),
        ),
      ),
      // 悬浮按钮设置居中， 即可实现效果
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: color2,
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }

  Container _buildHeader() {
    return Container(
      height: 260,
      width: double.infinity,
      // 调试的时候， 可以把 Container的背景色加上，方便理解
      // color: Colors.blue
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 0,
            left: -100,
            top: -150,
            child: Container(
              width: 360,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(colors: [color1, color2]),
                boxShadow: [
                  BoxShadow(
                    color: color3,
                    offset: Offset(4, 4),
                    blurRadius: 10,
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 60, left: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "熊殿下",
                  style: lightText.copyWith(
                    fontSize: 28,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "今天你还有 3 项\n任务未完成 ！",
                  style: lightText,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
