import 'package:flutter/material.dart';

class MyListItem extends StatelessWidget {
  // const MyListItem({Key? key}) : super(key: key);
  String title;
  String subTitle;
  String bgImg;

  MyListItem(this.title, this.subTitle, this.bgImg, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 160,
          height: 160,
          alignment: Alignment.bottomLeft,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: NetworkImage(bgImg),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
      ],
    );
  }
}
