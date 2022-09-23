import 'package:flutter/material.dart';

import '../global/styles.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          Row(
            children: const [
              Text(
                'About java',
                style: titleStyleL,
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Column(
            children: const [
              Text(
                'Java具有简单性、面向对象、分布式、健壮性、安全性、平台独立与可移植性、多线程、动态性等特点。Java可以编写桌面应用程序、Web应用程序、分布式系统和嵌入式系统应用程序等',
                style: aboutStyle,
              ),
            ],
          )
        ],
      ),
    );
  }
}
