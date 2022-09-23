import 'package:flutter/material.dart';
import 'package:flutter_codelab/global/styles.dart';
import '../pages/detail_page.dart';

class AppListItem extends StatelessWidget {
  // const AppListItem({Key? key}) : super(key: key);
  String title;
  String subTitle;
  String bgImg;

  AppListItem(this.title, this.subTitle, this.bgImg ,{super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(
              title: title, subTitle: subTitle, bgImg: bgImg)));
      },
      child: Container(
        width: 180,
        height: 250,
        alignment: Alignment.bottomLeft,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: NetworkImage(bgImg),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: lightTitleStyle,
            ),
            Text(
              subTitle,
              style: lightSubTitleStyle,
            ),
          ],
        ),
      ),
    );
  }
}