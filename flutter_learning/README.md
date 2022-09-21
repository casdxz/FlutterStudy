# flutter学习21天

### 一、oneDay

##### (一)、分析

整体页面采用无 AppBar ，body 用 Stack 布局，拆解成了三部分。

1. 封装方法，实现顶部渐变内容区：背景渐变，内容从上到下，第一部分是左右图标中间头像，其余为昵称等；
2. 封装方法，实现中间对称分割页面宽度的信息区；

3. 封装方法，占用剩余空间，使用封装的数据列表渲染 ListView

整体没什么难度，特点是：因为没有把这三部分内容封装在一个滚动容器中，所以只有第三部分能滚动，上面两部分是定死的。

##### (二)、参考代码

```dart
import 'package:flutter/material.dart';

TextStyle _titleStyle = TextStyle(color: Colors.deepOrange, fontSize: 15.0);
TextStyle _subTitleStyle = TextStyle(fontSize: 14.0);

class ProfileOnePage extends StatelessWidget {
  const ProfileOnePage ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: <Widget>[
              _buildHeader(),
              _buildRow(),
              Expanded(child: _buildListTile()),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      height: 270,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          stops: const [0.2, 0.9],
          colors: [
            Colors.red,
            Colors.deepOrange.shade300,
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                CircleAvatar(
                  minRadius: 30.0,
                  backgroundColor: Colors.red.shade600,
                  child: const Icon(
                    Icons.call,
                    size: 30.0,
                  ),
                ),
                CircleAvatar(
                  minRadius: 60,
                  backgroundColor: Colors.deepOrange.shade300,
                  child: const CircleAvatar(
                    backgroundImage:  NetworkImage(
                      'https://bearcad.oss-cn-shanghai.aliyuncs.com/head/bear.png',
                    ),
                    minRadius: 50,
                  ),
                ),
                CircleAvatar(
                  minRadius: 30,
                  backgroundColor: Colors.red.shade600,
                  child: const Icon(
                    Icons.message,
                    size: 30.0,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Bear',
            style: TextStyle(fontSize: 22.0, color: Colors.white),
          ),
          Text(
            '熊殿下',
            style: TextStyle(fontSize: 14.0, color: Colors.red.shade100),
          )
        ],
      ),
    );
  }

  Widget _buildRow() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            color: Colors.deepOrange.shade300,
            child: const ListTile(
              title: Text(
                '50898',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
              ),
              subtitle: Text(
                'FOLLOWERS',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.red),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.red,
            child: const ListTile(
              title: Text(
                '345288',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
              ),
              subtitle: Text(
                'FOLLOWING',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white70),
              ),
            ),
          )
        )
      ],
    );
  }

  Widget _buildListTile() {
    return ListView.builder(
      itemCount: infoList.length,
      itemExtent: 100,
      itemBuilder: (context, index) {
        return ListTile(
          dense: true,
          title: Text(
            '${infoList[index].title}',
            style: _titleStyle,
          ),
          subtitle: Text(
            '${infoList[index].subTitle}',
            style: _subTitleStyle,
          ),
        );
      },
    );
  }
}

class Info {
  String title;
  String subTitle;

  Info(this.title, this.subTitle);
}

List<Info> infoList = [
  Info('Email', 'caxzbar@gmail.com'),
  Info('Phone', '+86 19851903253'),
  Info('Github', 'https://github.com/casdxz'),
  Info('Google', 'https://www.google.com'),
  Info('Baidu', 'https://www.baidu.com'),
];

```

##### (三)、示例图

![ProfileOne](https://bearcad.oss-cn-shanghai.aliyuncs.com/Code/ProfileOne.png)



### 二、twoDay

##### (一)、分析

​	注意实现头像上浮的做法，背景底图。整部分和底部列表均可滚动。

##### (二)、代码

```dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProfileTwoPage extends StatelessWidget {
  const ProfileTwoPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    // 页面局部改变状态栏和图标颜色
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
    );
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);

    return Scaffold(
      backgroundColor: Colors.indigo.shade100,
      body: Stack(
        children: <Widget>[
          SizedBox(
           // 背景底图
            height: MediaQuery.of(context).size.height,
            child: Image.network(
              'https://bearcad.oss-cn-shanghai.aliyuncs.com/banner/banner3.jpg',
              fit: BoxFit.fitHeight,
            ),
          ),
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.fromLTRB(16, 120, 16, 16),
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(16),
                        margin: EdgeInsets.only(top: 32),
                        decoration: BoxDecoration(
                          color: Colors.white.withAlpha(180),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 100),
                              child: _buildColumn(context),
                            ),
                            SizedBox(height: 5,),
                            _buildRow(),
                          ],
                        ),
                      ),
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(
                              'https://bearcad.oss-cn-shanghai.aliyuncs.com/head/bear.png',
                              // 'https://bearcad.oss-cn-shanghai.aliyuncs.com/banner/banner3.jpg'
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        margin: EdgeInsets.only(left: 16),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Card(
                    color: Colors.white.withAlpha(160),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 5,
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          title: Text(
                            "User Information",
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          leading: Icon(Icons.person),
                          trailing: Icon(Icons.arrow_forward_ios),
                        ),
                        ListView(
                          shrinkWrap: true,
                          children: infoList
                          .map((info) => SizedBox(
                            height: 80,
                            child: ListTile(
                              title: Text(info.title),
                              subtitle: Text(info.subTitle),
                              leading: Icon(info.icon),
                            )
                          ))
                            .toList()
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 构建名片上方区域
Column _buildColumn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Little Butterfly',
          style: Theme.of(context).textTheme.headline4,
        ),
        ListTile(
          contentPadding: EdgeInsets.all(0),
          title: Text("Flutter Developer"),
          subtitle: Text("Bear"),
        ),
      ],
    );
  }

  //构建名片下方一行三列区域
  Row _buildRow() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Column(
            children: <Widget>[Text("288"), Text("Likes")],
          ),
        ),
        Expanded(
          child: Column(
            children: <Widget>[Text("366"), Text("Comments")],
          ),
        ),
        Expanded(
          child: Column(
            children: <Widget>[Text("678"), Text("Favourites")],
          ),
        ),
      ],
    );
  }
}

class Info {
  IconData icon;
  String title;
  String subTitle;

  Info(this.icon, this.title, this.subTitle);
}

List<Info> infoList = [
  Info(Icons.email, 'Email', 'caszbar@gmail.com'),
  Info(Icons.phone, 'Phone', '+86-19851903253'),
  Info(Icons.web, 'Website', 'https://www.bearcad.top'),
  Info(Icons.code, 'Git', 'https://www.github.com'),
  Info(Icons.calendar_view_day, 'Join', '14 September 2022'),
];

```

##### (三)、示例图

![ProfileTwo](https://bearcad.oss-cn-shanghai.aliyuncs.com/Code/ProfileTwo.png)



### 三、threeDay

##### (一)、分析

​		不规则爱好者
​		不规则、渐变、圆角、阴影，效果你说如何？
​		熟练掌握 ClipRRect 的使用，Stack 子组件先后摆放顺序，还有 margin 的作用。
​		各位安卓设备er，沉浸式弄起来，不然和这种顶部不配啊。

##### (二)、代码

```dart
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileThreePage extends StatelessWidget {
  const ProfileThreePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color color1 = Color(0xffFC5CF0);
    final Color color2 = Color(0xffFE8852);

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: 360,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
              gradient: LinearGradient(
                colors: [color1, color2],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 80),
            child: Column(
              children: <Widget>[
                Text(
                  "About Me",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                SizedBox(height: 20,),
                Expanded(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        // 头像容器
                        height: double.infinity,
                        margin: const EdgeInsets.only(
                          left: 30,
                          right: 30,
                          top: 10,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.network(
                            'https://bearcad.oss-cn-shanghai.aliyuncs.com/myBanner/banner01.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topCenter,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.orange.shade200,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text("Flutter Developer"),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Text(
                  "SCS - 212",
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(fontSize: 18, color: Colors.red),
                ),
                SizedBox(height: 5.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.location_on, size: 16.0, color: Colors.grey),
                    Text(
                      "Yangshan North Street 1, NANJING",
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                  ],
                ),
                SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      color: Colors.blue,
                      icon: Icon(FontAwesomeIcons.qq),
                      onPressed: () {},
                    ),
                    IconButton(
                      color: Colors.green,
                      icon: Icon(FontAwesomeIcons.weixin),
                      onPressed: () {},
                    ),
                    IconButton(
                      color: Colors.red.shade600,
                      icon: Icon(FontAwesomeIcons.weibo),
                      onPressed: () {},
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Container(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        // 底部渐变容器
                        padding: const EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 16,
                        ),
                        margin: const EdgeInsets.fromLTRB(20, 30, 20, 30),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [color1, color2],
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          // 步行局的图标按钮
                          children: <Widget>[
                            IconButton(
                              color: Colors.white,
                              icon: Icon(FontAwesomeIcons.user),
                              onPressed: () {},
                            ),
                            IconButton(
                              color: Colors.white,
                              icon: Icon(Icons.location_on),
                              onPressed: () {},
                            ),
                            Spacer(),
                            IconButton(
                              color: Colors.white,
                              icon: Icon(Icons.add),
                              onPressed: () {},
                            ),
                            IconButton(
                              color: Colors.white,
                              icon: Icon(Icons.message),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                      Center(
                        // 中间的爱心悬浮按钮
                        child: FloatingActionButton(
                          child: Icon(
                            Icons.favorite,
                            color: Colors.pink,
                          ),
                          backgroundColor: Colors.white,
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          AppBar(
            // AppBar， 要最后放哦，不然会被后面的组件覆盖掉， 就看不到了
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.notifications),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {},
              )
            ],
          )
        ],
      ),
    );
  }
}

```

##### (三)、示例图

![ProfileThree](https://bearcad.oss-cn-shanghai.aliyuncs.com/Code/ProfileThree.png)



### 四、fourDay

##### (一)、分析

​		虽迟但到，Profile 系列之最爱！
​		看惯了 Flutter 的精美，再看以前的UniApp。。
​		使用了自定义裁剪的第三方包：https://pub.dev/packages/flutter_custom_clippers
​		认真体会下：顶部头图区域的实现、Favorite 水平滚动列表的卡片组件下方层叠的色彩制作、Friends 类似 DY 直播间观众列表的做法。
​		本次头部区域延展使用了之前很多人用过的：extendBody: true,extendBodyBehindAppBar: true,
​		精美绝伦我的菜，今天的 Carbon 截图需要也为它美化一下。

##### (二)、代码

```dart
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class ProfileFourPage extends StatelessWidget {
  const ProfileFourPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          ClipPath(
            clipper: OvalBottomBorderClipper(),
            child: Container(
              margin: const EdgeInsets.only(top: 30),
              height: 380,
              decoration: BoxDecoration(
                color: Colors.pink,
              ),
            ),
          ),
          ClipPath(
            clipper: OvalBottomBorderClipper(),
            child: Container(
              height: 380,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://bearcad.oss-cn-shanghai.aliyuncs.com/head/bear.png'),
                  fit: BoxFit.cover,
                ),
              ),
              foregroundDecoration: BoxDecoration(
                color: Colors.pink.withOpacity(0.7),
              ),
            ),
          ),
          ListView(
            padding: const EdgeInsets.all(8.0),
            children: [
              const SizedBox(height: 90),
              _buildAvatar(
                'https://bearcad.oss-cn-shanghai.aliyuncs.com/head/head1.png'
              ),
              const SizedBox(height: 10.0),
              Text(
                "Bear",
                style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(color: Colors.white),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 5.0),
              Text(
                "Flutter & Full Stack Developer",
                style: TextStyle(
                  color: Colors.white70,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10.0),
              Card(
                color: Colors.white70,
                elevation: 10,
                margin: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 32,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              "266K",
                              style: Theme.of(context).textTheme.headline4,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "Followers",
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              "106K",
                              style: Theme.of(context).textTheme.headline4,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "Following",
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Favorite",
                style: Theme.of(context).textTheme.headline5,
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildFavoriteCard(context, "Design"),
                    const SizedBox(width: 10),
                    _buildFavoriteCard(context, "Fruits"),
                    const SizedBox(width: 10),
                    _buildFavoriteCard(context, "Nature"),
                    const SizedBox(width: 10),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Friends",
                style: Theme.of(context).textTheme.headline5,
              ),
              Container(
                height: 60,
                width: double.infinity,
                child: Stack(
                  children: [
                    ...avatars
                        .asMap()
                          .map(
                            (i, e) => MapEntry(
                              i,
                              Transform.translate(
                                offset: Offset(i * 30.0, 0),
                                child: SizedBox(
                                    height: 60,
                                    width: 60,
                                    child: _buildAvatar(e, radius: 30)),
                              ),
                            ),
                          )
                          .values
                          .toList(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.pink,
        onPressed: () {},
      ),
    );
  }

  CircleAvatar _buildAvatar(String image, {double radius = 80}) {
    return CircleAvatar(
      backgroundColor: Colors.white70,
      radius: radius,
      child: CircleAvatar(
        radius: radius - 5,
        backgroundImage: NetworkImage(image),
      ),
    );
  }

  Widget _buildFavoriteCard(BuildContext context, String title) {
    return Container(
      width: 150,
      height: 150,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.pink.shade300,
              borderRadius: BorderRadius.circular(10),
            ),
            height: double.infinity,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(
              horizontal: 8.0,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.indigo.shade300,
              borderRadius: BorderRadius.circular(10),
            ),
            height: double.infinity,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 4,
            ),
          ),
          Container(
            clipBehavior: Clip.antiAlias,
            alignment: Alignment.center,
            height: double.infinity,
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://bearcad.oss-cn-shanghai.aliyuncs.com/head/head7.png'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10)),
              foregroundDecoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.3),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Container(
            alignment: Alignment.center,
            height: double.infinity,
            width: double.infinity,
            margin: const EdgeInsets.only(top: 20),
            child: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

const List<String> avatars =  [
    'https://bearcad.oss-cn-shanghai.aliyuncs.com/head/head2.png',
    'https://bearcad.oss-cn-shanghai.aliyuncs.com/head/head3.png',
    'https://bearcad.oss-cn-shanghai.aliyuncs.com/head/head4.png',
    'https://bearcad.oss-cn-shanghai.aliyuncs.com/head/head5.png',
    'https://bearcad.oss-cn-shanghai.aliyuncs.com/head/head6.png',
];


```

##### (三)、示例图

![ProfileFour](https://bearcad.oss-cn-shanghai.aliyuncs.com/Code/ProfileFour.png)



### 五、fiveDay

##### (一)、分析

​		TodoList ，永远可以拥有姓名。
​		今日份左上角区域值得关注，Stack 结合 Positioned 真是 yyds，前端那些负值都来了。
​		使用了状态，结合 CheckboxListTile 组件，实现任务状态的切换。
​		样式小细节：自己定义一些公用的样式，具体使用依然可以 copyWith ，方便。
​		以及 ... 运算符的闪现。

##### (二)、代码

```dart
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

```

##### (三)、示例图

![TodoHomeOne](https://bearcad.oss-cn-shanghai.aliyuncs.com/Code/TodoHomeOne.png)



### 六、sixDay

##### (一)、分析

1. Card也是一个好用的组件，设置阴影很方便；
2. ListTile精雕细琢，leading设置宽度，放置左边的竖线；
3. 背景不弄点渐变感觉都有点过于敷衍；
4. 一个新的star数很多的格式化库：intl，可以自行在 pub.dev ([Dart packages](https://pub.flutter-io.cn/)) 上搜索导入；
5. 养成习惯，把颜色、样式等抽离出来，用起来更舒适；

##### (二)、代码

```dart
import 'package:flutter/material.dart';
import 'package:flutter_learning/list/list_task.dart';
import 'package:flutter_learning/widget/card_widget.dart';

final Color color1 = Color(0xff8d70fe);
final Color color2 = Color(0xff2da9ef);

class TodoHomeTwoPage extends StatefulWidget {
  const TodoHomeTwoPage({Key? key}) : super(key: key);

  @override
  State<TodoHomeTwoPage> createState() => _TodoHomeTwoPageState();
}

class _TodoHomeTwoPageState extends State<TodoHomeTwoPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Positioned(
              child: Container(
                width: size.width,
                height: size.height / 3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(10),
                    right: Radius.circular(10),
                  ),
                  gradient: LinearGradient(
                    colors: [color1, color2],
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                  ),
                ),
                child: Column(
                  children: const [
                    SizedBox(height: 60),
                    Text(
                      'Todo App',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    ListTile(
                      leading: Text(
                        '20',
                        style: TextStyle(
                          fontSize: 56,
                          color: Colors.amber,
                        ),
                      ),
                      title: Padding(
                        padding: EdgeInsets.symmetric(vertical: 4),
                        child: Text(
                          'September',
                          style: TextStyle(
                            fontSize: 28,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      subtitle: Text(
                        '2022',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: size.height / 4.5,
              left: 16,
              child: Container(
                width: size.width - 32,
                height: size.height / 1.4,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(10),
                    right: Radius.circular(10),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: ListView.separated(
                      padding: const EdgeInsets.only(top: 8),
                      itemBuilder: (context, index) {
                        return CardWidget(task: listTask[index]);
                      },
                    itemCount: listTask.length,
                    separatorBuilder: (context, index) {
                        return const SizedBox(height: 4);
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xff4696ec),
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.list_alt_rounded,
                color: Colors.white,
                size: 28,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.archive_outlined,
                color: Colors.white,
                size: 28,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add, size: 36),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

```

```da
class Task {
  final String taskName;
  final String description;
  final DateTime taskTime;
  final bool isDone;

  Task(
    this.taskName,
    this.description,
    this.taskTime,
    this.isDone,
  );
}

List<Task> listTask = [
  Task(
    '跑步',
    '有氧运动',
    DateTime(2022, 9, 20, 7, 30),
    false,
  ),
  Task(
      '网络会议',
      '编程俱乐部周会',
      DateTime(2022, 9, 20, 10, 00),
      false,
  ),
  Task(
      '追剧',
      '芒果TV',
      DateTime(2022, 9, 20, 12, 30),
      false,
  ),
  Task(
      '写材料',
      '项目申报材料',
      DateTime(2022, 9, 20, 15, 30),
      false,
  ),
  Task(
      '学习新技术',
      '微服务技术栈学习',
      DateTime(2022, 9, 20, 17),
      false,
  ),
  Task(
      '茶颜悦色',
      '幽蓝拿铁双倍奶油',
      DateTime(2022, 9, 17, 11),
      true,
  ),
  Task(
      '健康上报',
      '企业微信',
      DateTime(2022, 9, 18, 8),
      true,
  ),
];
```

```dart
import 'package:flutter/material.dart';
import 'package:flutter_learning/list/list_task.dart';
import 'package:intl/intl.dart';

final Color color1 = Color(0xff8d70fe);
final Color color2 = Color(0xff2da9ef);

final titleStyle = TextStyle(
  fontSize: 22,
  color: Colors.grey.shade700,
  fontWeight: FontWeight.bold,
);

final subTitleStyle = TextStyle(
  color: color2,
  fontSize: 16,
);

final TextStyle notDoneStyle = const TextStyle(
  color: Colors.black45,
  fontSize: 16,
);

final TextStyle doneStyle = const TextStyle(
  color: Colors.green,
  fontSize: 16,
  fontWeight: FontWeight.bold,
);

class CardWidget extends StatelessWidget {
  final Task task;
  const CardWidget({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shadowColor: color2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 16,
        ),
        minLeadingWidth: 2,
        leading: Container(width: 2, color: color2),
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(task.taskName, style: titleStyle),
        ),
        subtitle: Text(task.description, style: subTitleStyle),
        trailing: task.isDone
            ? Text('Done', style: doneStyle)
            : Text(DateFormat('hh:mm a').format(task.taskTime),
                style: notDoneStyle),
      ),
    );
  }
}



```

##### (三)、示例图

![TodoHomeTwo](https://bearcad.oss-cn-shanghai.aliyuncs.com/Code/TodoHomeTwo.png)



### 七、sevenDay

##### (一)、分析

不规则的裁剪让页面灵动，叠加了两个波浪形的裁剪
借助了第三方裁剪的库 https://pub.dev/packages/flutter_custom_clippers
就这样简简单单就挺好
今天用了安卓真机，在文本框中输入的时候，键盘出现不会把输入框顶上去，nice

##### (二)、代码

```dart
// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

final Color color1 = Colors.pink.shade100;
final Color color2 = Colors.pink.shade200;
final Color color3 = Colors.pink.shade300;
final Color color4 = Colors.pink.shade400;

TextStyle titleStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.w700,
  fontSize: 30,
);

TextStyle tipStyle = TextStyle(
  color: Colors.pink,
  fontWeight: FontWeight.w700,
  fontSize: 12,
);

class LoginOnePage extends StatefulWidget {
  const LoginOnePage({Key? key}) : super(key: key);

  @override
  State<LoginOnePage> createState() => _LoginOnePageState();
}

class _LoginOnePageState extends State<LoginOnePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipPath(
                  clipper: WaveClipperOne(),
                  child: Container(
                    child: Column(),
                    width: double.infinity,
                    height: 300,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [color1, color2]
                      ),
                    ),
                  ),
                ),
                ClipPath(
                  clipper: WaveClipperTwo(),
                  child: Container(
                    width: double.infinity,
                    height: 300,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [color3, color4]
                      ),

                    ),
                    child:Column(
                      children: <Widget>[
                        SizedBox(height: 50),
                        Icon(
                            Icons.code,
                          color: Colors.white,
                          size: 60,
                        ),
                        SizedBox(height: 20),
                        Text('Coding Life', style: titleStyle),
                      ],
                    ) ,
                  ),
                ),
              ],
            ),
            SizedBox(height: 32),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: TextField(
                onChanged: (String value) {},
                cursorColor: color4,
                decoration: InputDecoration(
                  hintText: 'Email',
                  prefixIcon: Material(
                    elevation: 0,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    child: Icon(Icons.email, color: color4),
                  ),
                  border: InputBorder.none,
                  contentPadding:
                    EdgeInsets.symmetric(horizontal: 22, vertical: 12),
                ),
              ),
            ),
            SizedBox(height: 32),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Material(
                elevation: 3,
                borderRadius: BorderRadius.all(Radius.circular(30)),
                child: TextField(
                  onChanged: (String value) {},
                  cursorColor: color4,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    prefixIcon: Material(
                      elevation: 0,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      child: Icon(Icons.lock, color: color4),
                    ),
                    border: InputBorder.none,
                    contentPadding:
                      EdgeInsets.symmetric(horizontal: 22, vertical: 12),
                  ),
                ),
              ),
            ),
            SizedBox(height: 32),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(100)),
                color: color4,
              ),
              child: MaterialButton(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: Text('Login', style: titleStyle.copyWith(fontSize: 18)),
                onPressed: () {},
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text('FORGOT PASSWORD ?', style: tipStyle),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Don't have an Account ?",
                  style: tipStyle.copyWith(
                    color: Colors.black87, fontWeight: FontWeight.normal
                  ),
                ),
                Text(
                  'Sign Up',
                  style:
                  tipStyle.copyWith(decoration: TextDecoration.underline),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

```

##### (三)、示例图

![LoginOne](https://bearcad.oss-cn-shanghai.aliyuncs.com/Code/LoginOne.png)



### 八、eightDay

##### (一)、分析

​		顶部那个大大的圆弧，其实就是把圆角设置得超级大（300），并且指定圆角只是右下角一个方向；
​		使用Stack+Pisitioned来对点缀元素绝对定位；

##### (二)、代码

```dart
import 'package:flutter/material.dart';

class LoginTwoPage extends StatelessWidget {
  const LoginTwoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // 左上角半圆背景
            Container(
              height: 360,
              foregroundDecoration: BoxDecoration(
                color: Colors.black.withOpacity(0.15),
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(300),
                ),
              ),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(300) // 角度和半径，显示了大院的一部分作为左上角装饰
                ),
                image: DecorationImage(
                  image: NetworkImage(
                    'https://bearcad.oss-cn-shanghai.aliyuncs.com/banner/banner3.jpg',
                  ),
                  fit: BoxFit.fill
                ),
              ),
              // 使用Stack和绝对定位装饰图片和 SING IN 文字
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 70,
                    right: 50,
                    width: 100,
                    height: 150,
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://bearcad.oss-cn-shanghai.aliyuncs.com/float_element/float-8.png'
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    child: Container(
                      margin: const EdgeInsets.only(top: 60, right: 120),
                      child: Center(
                        child: Text(
                          "SING IN",
                          style: TextStyle(
                            color: Colors.indigo.shade300,
                            fontSize: 36,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: <Widget>[
                  Container(
                    // Email 和 Password外层容器的装饰效果
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromRGBO(143, 148, 251, 0.4),
                          blurRadius: 20,
                          offset: Offset(5, 10),
                        ),
                      ]
                    ),
                    child: Column(
                      children: <Widget>[
                        // 输入框Container包裹，设置边框效果
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: Colors.grey.shade200),
                            ),
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Email",
                              hintStyle: TextStyle(color: Colors.grey.shade400),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Password",
                              hintStyle: TextStyle(color: Colors.grey.shade400),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        colors: [
                          Colors.indigo.shade100,
                          Colors.indigo.shade300,
                        ],
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        "SING IN",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  Text(
                    "Forgot Password ?",
                    style: TextStyle(
                      color: Colors.indigo.shade200
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

```

##### (三)、示例图

![LoginTwo](https://bearcad.oss-cn-shanghai.aliyuncs.com/Code/LoginTwo.png)
