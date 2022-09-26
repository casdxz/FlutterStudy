import 'package:flutter/material.dart';
import 'package:flutter_learning/widget/hot_widget.dart';

class SamplePage extends StatefulWidget {
  const SamplePage({Key? key}) : super(key: key);

  @override
  State<SamplePage> createState() => _SamplePageState();
}

class _SamplePageState extends State<SamplePage> {
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
              'https://bearcad.oss-cn-shanghai.aliyuncs.com/phoneBanner/banner06.jpeg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        // AppBar设置背景色透明，取消阴影
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text(
            'Flutter 课程代码',
            style: TextStyle(color: Colors.purpleAccent, fontSize: 24),
          ),
          centerTitle: true,
        ),
        body: _buildBody(context),
      ),
    );
  }

  Container _buildBody(context) {
    final size = MediaQuery.of(context).size;
    var list = [
      Info(
        width: size.width,
        height: 75.0,
        color: Colors.purple.shade500.withOpacity(0.5),
        title: '21天UI挑战打卡',
        url: 'ui_index',
      ),
      Info(
        width: size.width,
        height: 75.0,
        color: Colors.purple.shade500.withOpacity(0.5),
        title: 'Flutter 数据共享',
        url: 'juejin_list_item',
      ),
      Info(
        width: size.width,
        height: 75.0,
        color: Colors.purple.shade500.withOpacity(0.5),
        title: 'Flutter 事件',
        url: 'juejin_list_item',
      ),
      Info(
        width: size.width,
        height: 75.0,
        color: Colors.purple.shade500.withOpacity(0.5),
        title: 'Flutter 路由',
        url: 'juejin_list_item',
      ),
      Info(
        width: size.width,
        height: 75.0,
        color: Colors.purple.shade500.withOpacity(0.5),
        title: 'Flutter 绘制',
        url: 'juejin_list_item',
      ),
      Info(
        width: size.width,
        height: 75.0,
        color: Colors.purple.shade500.withOpacity(0.5),
        title: 'Flutter 动画',
        url: 'juejin_list_item',
      ),
      Info(
        width: size.width,
        height: 75.0,
        color: Colors.purple.shade500.withOpacity(0.5),
        title: 'Flutter 网络请求',
        url: 'juejin_list_item',
      ),
      Info(
        width: size.width,
        height: 75.0,
        color: Colors.purple.shade500.withOpacity(0.5),
        title: 'Flutter 状态管理',
        url: 'juejin_list_item',
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
