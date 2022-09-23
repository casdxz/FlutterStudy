import 'package:flutter/material.dart';

class BuilderAnimationWidget extends StatefulWidget {
  const BuilderAnimationWidget({Key? key}) : super(key: key);

  @override
  State<BuilderAnimationWidget> createState() => _BuilderAnimationWidgetState();
}

class _BuilderAnimationWidgetState extends State<BuilderAnimationWidget>
    with SingleTickerProviderStateMixin{
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    //创建动画周期为1秒的AnimationController对象
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    final CurvedAnimation curve = CurvedAnimation(
      parent: controller,
      curve: Curves.easeInCirc,
    );

    //创建从50-200线性变化的Animation对象，不受冻刷新 UI
    animation = Tween(begin: 50.0, end: 200.0).animate(curve);

    // 启动动画并让七重复执行
    controller.repeat(reverse: true);
  }



  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        child: const FlutterLogo(),
        builder: (context,child) => SizedBox(
          width: animation.value,
          height: animation.value,
          child: child,
        ),
      ),
    );
  }
}
