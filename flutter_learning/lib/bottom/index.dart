import 'package:flutter/material.dart';

import 'package:flutter_learning/widget/hot_widget.dart';

class UiIndex extends StatefulWidget {
  const UiIndex({Key? key}) : super(key: key);

  @override
  State<UiIndex> createState() => _UiIndexState();
}

class _UiIndexState extends State<UiIndex> {
  @override
  Widget build(BuildContext context) {
    //获取当前组件的尺寸
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    // 用Container包裹Scaffold,设置背景图充满
    return Container(
      width: width,
      height: height,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              'https://bearcad.oss-cn-shanghai.aliyuncs.com/phoneBanner/banner02.jpeg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          title: const Text(
            '21天UI挑战',
            style: TextStyle(fontSize: 20),
          ),
          backgroundColor: Colors.teal,
        ),
        body: _buildBody(context),
        // AppBar设置背景色透明，取消阴影
      ),
    );
  }

  Container _buildBody(context) {
    final size = MediaQuery.of(context).size;
    var list = [
      Info(
        width: size.width,
        height: 75.0,
        color: Colors.teal.shade400.withOpacity(0.5),
        title: 'Day01',
        url: 'one_page',
      ),
      Info(
        width: size.width,
        height: 75.0,
        color: Colors.teal.shade400.withOpacity(0.5),
        title: 'Day02',
        url: 'two_page',
      ),
      Info(
        width: size.width,
        height: 75.0,
        color: Colors.teal.shade400.withOpacity(0.5),
        title: 'Day03',
        url: 'three_page',
      ),
      Info(
        width: size.width,
        height: 75.0,
        color: Colors.teal.shade400.withOpacity(0.5),
        title: 'Day04',
        url: 'four_page',
      ),
      Info(
        width: size.width,
        height: 75.0,
        color: Colors.teal.shade400.withOpacity(0.5),
        title: 'Day05',
        url: 'five_page',
      ),
      Info(
        width: size.width,
        height: 75.0,
        color: Colors.teal.shade400.withOpacity(0.5),
        title: 'Day06',
        url: 'six_page',
      ),
      Info(
        width: size.width,
        height: 75.0,
        color: Colors.teal.shade400.withOpacity(0.5),
        title: 'Day07',
        url: 'seven_page',
      ),
      Info(
        width: size.width,
        height: 75.0,
        color: Colors.teal.shade400.withOpacity(0.5),
        title: 'Day08',
        url: 'eight_page',
      ),
      Info(
        width: size.width,
        height: 75.0,
        color: Colors.teal.shade400.withOpacity(0.5),
        title: 'Day09',
        url: 'nine_page',
      ),
      Info(
        width: size.width,
        height: 75.0,
        color: Colors.teal.shade400.withOpacity(0.5),
        title: 'Day10',
        url: 'ten_page',
      ),
      Info(
        width: size.width,
        height: 75.0,
        color: Colors.teal.shade400.withOpacity(0.5),
        title: 'Day11',
        url: 'eleven_page',
      ),
    ];
    return Container(
      width: size.width,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: list
              .map(
                (e) => HotWidget(info: e),
          )
              .toList(),
        ),
      ),
    );
  }
}
