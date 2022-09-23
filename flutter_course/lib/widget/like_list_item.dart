import 'package:flutter/material.dart';

class LikeListItem extends StatelessWidget {

  String ptoImg;

  LikeListItem(this.ptoImg, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 180,
      alignment: Alignment.bottomLeft,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: NetworkImage(ptoImg),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
