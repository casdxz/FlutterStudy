// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_course/animation/builder_animation_widget.dart';
import 'package:flutter_course/animation/hero_animation_widget.dart';
import 'package:flutter_course/animation/normal_animation_widget.dart';
import 'package:flutter_course/animation/widget_animation_widget.dart';

class AnimationPage extends StatefulWidget {
  const AnimationPage({Key? key}) : super(key: key);

  @override
  State<AnimationPage> createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('动画学习'),
          centerTitle: true,
        ),
        body: const TabBarView(
          children: [
            NormalAnimationWidget(),
            BuilderAnimationWidget(),
            WidgetAnimationWidget(),
            HeroAnimationWidget(),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.home),
                text: '普通 动画',
              ),
              Tab(
                icon: Icon(Icons.rss_feed),
                text: 'Builder 动画',
              ),
              Tab(
                icon: Icon(Icons.share),
                text: 'Widget 动画',
              ),
              Tab(
                icon: Icon(Icons.percent),
                text: 'Hero 动画',
              ),
            ],
            unselectedLabelColor: Colors.blueGrey,
            labelColor: Colors.orange,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: Colors.orange,
          ),
        )
      ),
    );
  }
}
