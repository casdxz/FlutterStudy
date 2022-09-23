
import 'package:flutter/material.dart';

import '../global/styles.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: Row(
        children: [
          // ClipOval(
          const CircleAvatar(
            backgroundImage: NetworkImage(
              'https://bearcad.oss-cn-shanghai.aliyuncs.com/%E5%A4%B4%E5%83%8F/%E6%88%91%E7%9A%84%E5%A4%B4%E5%83%8F/share.jpg',
            ),
            radius: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Text(
                  'hello,bear',
                  style: titleStyle,
                ),
                Text(
                  'good morning',
                  style: summaryStyle,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}