import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/percent_indicator.dart';

final Color color1 = Color(0xff8d70fe);
final Color color2 = Color(0xff2da9ef);

class LayoutPage extends StatefulWidget {
  const LayoutPage({Key? key}) : super(key: key);

  @override
  State<LayoutPage> createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {
  int countDown = 0;
  static const DEFAULT_COUNT_DOWN = Duration.secondsPerMinute * 1;
  bool isState = false;
  double percent = 0;
  int restTime = 0;

  Timer? timer;

  @override
  Widget build(BuildContext context) {
    SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
    );
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);

    _StartTimer() {
      timer?.cancel();
      countDown = restTime == 0 ? DEFAULT_COUNT_DOWN : restTime;
      if(isState) {
        timer = Timer.periodic(Duration(seconds: 1), (timer) {
          setState(() {
            countDown--;
            restTime = countDown;
            percent = 1 - countDown / DEFAULT_COUNT_DOWN;
          });
          print(countDown.toString());

          if (countDown == 0) {
            timer.cancel();
            // showToast();
            showDialog(
              context: context,
              builder: (context) {
                return  AlertDialog(
                  title: Text('兔兔钟温馨提示您！', style: TextStyle(color: Colors.red,fontSize: 30),),
                  content: Text(
                    '恭喜您完成了一个学习目标，可以休息一下哦!',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 25.0,
                    ),
                  ),
                  contentPadding: EdgeInsets.only(left: 50, top:20),
                  actions: <Widget>[
                    // FlatButton是扁平化按钮
                    FlatButton(
                      child: Text(
                        '确定',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20.0,
                        ),
                      ),
                      onPressed: (){
                        Navigator.of(context, rootNavigator: true).pop();
                        setState((){
                          isState = !isState;
                          percent = 0;
                        });
                      },
                    ),
                  ],
                );
              }
            );
          }
        });
      }
    }

    String padDigits(int value) {
      return value.toString().padLeft(2,'0');
    }

    String parseText() {
      return '${padDigits(countDown ~/ 60)} : ${padDigits(countDown % 60)}';
    }

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color1, color2],
            begin: FractionalOffset(0.5, 1)
          )
        ),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 100.0),
              child: Text(
                "兔兔钟",
                style: TextStyle(
                  fontFamily: '锐字真言体',
                  color: Colors.white,
                  fontSize: 40,
                  // letterSpacing: 10,
                ),
              ),
            ),
            SizedBox(height: 30.0),
            Padding(
              padding: EdgeInsets.only(top: 30),
              // CircularPercentIndicator 具有动态值
              child: CircularPercentIndicator(
                percent: percent, // 当前进度
                circularStrokeCap: CircularStrokeCap.round,
                animation: true,
                animateFromLastPercent: true,
                radius: 180.0,
                lineWidth: 20.0,
                backgroundColor: Colors.orangeAccent,
                progressColor: Colors.white, // 进度条颜色
                center: Text(
                  parseText(),
                  style: TextStyle(
                    fontFamily: '锐字真言体',
                    fontSize: 48,
                    color: Colors.white,
                    letterSpacing: 10,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30.0),
            Padding(
              padding: EdgeInsets.only(top: 50),
              // 在2个或者多个子组件之间切换时使用动画
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 200),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return ScaleTransition(
                    scale: animation,
                    child: FadeTransition(
                      child: child,
                      opacity: animation,
                    ),
                  );
                },
                // RaisedButton 是一个非常常用的组件，有很多属性来设置按钮的各个状态
                child:  RaisedButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onPressed: () {
                    isState = !isState;
                    _StartTimer();
                  },
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      isState ? "Stop Studying" : "Start Studying",
                      key: ValueKey<bool>(isState),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22.0
                      ),
                    ),
                  )
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}
