import 'package:flutter/material.dart';
import 'package:flutter_demo/common/style.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dataColor = [
      Colors.red,
      Colors.yellow,
      Colors.blue,
      Colors.green,
    ];
    var dataThickness = [10.0, 20.0, 30.0, 40.0];
    var data = Map.fromIterables(dataColor, dataThickness);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Divider'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                '水平分割线',
                style: titleStyle,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 5.0,
                ),
                child: const Text(
                  '水平分割线，可指定颜色、改读、粗细、左右边距等信息，常用语于列表的item分割线。',
                  style: descStyle,
                ),
              ),
              Container(
                child: Column(
                  children: dataColor.map((e) => Divider(
                    // 分割线颜色
                    color: e,
                    // 前面空缺长度
                    indent: data[e],
                    // 后面空缺长度
                    endIndent: data[e]! * 2,
                    // 占位宽
                    height: data[e],
                    // 线粗细
                    thickness: data[e]! / 10,
                  ))
                  .toList(),
                ),
              ),
              const Text(
                '垂直分割线',
                style: titleStyle,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 5.0,
                ),
                child: const Text(
                  '垂直分割线，可指定颜色、改读、粗细、左右边距等信息，常用语于列表的item分割线。',
                  style: descStyle,
                ),
              ),
              Container(
                height: 200,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: dataColor.map((e) => VerticalDivider(
                    // 分割线颜色
                    color: e,
                    // 前面空缺长度
                    indent: data[e],
                    // 后面空缺长度
                    endIndent: data[e]! * 2,
                    // 占位宽
                    width: data[e],
                    // 线粗细
                    thickness: data[e]! / 10,
                  ))
                      .toList(),
                ),
              ),
            ],
          ),

      ),
    );
  }
}

class Test extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TestState();
}

class _TestState extends State<Test> with TickerProviderStateMixin{
  late AnimationController animationContainer;

  @override
  void initState() {
    super.initState();
    animationContainer =
    AnimationController(duration: Duration(seconds: 1), vsync: this)
      ..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          animationContainer.reverse();
        }
      }
      );
    animationContainer.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      alignment: Alignment.center,
      child: AnimatedIcon(
        icon: AnimatedIcons.view_list,
        progress: animationContainer,
        color: Colors.blue,
        size: 50,
      ),
    );
  }

  @override
  dispose() {
    super.dispose();
    animationContainer.dispose();
  }
}

