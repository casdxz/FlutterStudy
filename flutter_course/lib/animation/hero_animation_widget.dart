import 'package:flutter/material.dart';

class HeroAnimationWidget extends StatefulWidget {
  const HeroAnimationWidget({Key? key}) : super(key: key);

  @override
  State<HeroAnimationWidget> createState() => _HeroAnimationWidgetState();
}

class _HeroAnimationWidgetState extends State<HeroAnimationWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child:GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => const Page2())
          );
        },
        child: Row(
          children: [
            Hero(
              tag: 'hero',
              child: SizedBox(
                width: 100,
                height: 100,
                child: FlutterLogo(),
              ),
            ),
            Text('点击Logo查看Hero动画效果')
          ],
        ),
      )
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page2'),
      ),
      body: const Center(
        child: Hero(
          tag: 'hero',
          child: SizedBox(
            width: 300,
            height: 300,
            child: FlutterLogo(),
          ),
        ),
      ),
    );
  }
}
