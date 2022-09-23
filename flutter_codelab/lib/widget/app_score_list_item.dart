import 'package:flutter/material.dart';
import 'package:flutter_codelab/global/styles.dart';

class AppScoreListItem extends StatelessWidget {
  String name;
  String score;

  AppScoreListItem(this.name, this.score, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 70,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border:
              Border.all(width: 1, style: BorderStyle.solid, color: mainColor)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            name,
            style: tipStyleB,
          ),
          Text(
            score,
            style: tipStyleR,
          )
        ],
      ),
    );
  }
}
