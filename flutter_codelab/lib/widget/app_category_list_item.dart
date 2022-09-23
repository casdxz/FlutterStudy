import 'package:flutter/material.dart';
import 'package:flutter_codelab/global/styles.dart';

// ignore: must_be_immutable
class AppCategoryListItem extends StatelessWidget {
  IconData? icon;
  String name;

  AppCategoryListItem(this.icon, this.name, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 80,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border:
              Border.all(width: 1, style: BorderStyle.solid, color: mainColor)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: mainColor,
            size: 30,
          ),
          Text(
            name,
            style: titleStyle,
          )
        ],
      ),
    );
  }
}
