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
