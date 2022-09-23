import 'package:flutter/material.dart';
import 'package:flutter_codelab/widget/app_score_list.dart';
import 'package:flutter_codelab/widget/detail_bottom.dart';

import '../global/styles.dart';
import '../widget/about.dart';

class DetailPage extends StatelessWidget {
  String title;
  String subTitle;
  String bgImg;

  DetailPage(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.bgImg})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // backgroundColor: Colors.transparent,
        title: const Center(
          child: Icon(
            Icons.terrain,
            // color: mainColor,
            size: 32,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Icon(
              Icons.more_horiz,
            ),
          ),
        ],
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
              height: 300,
              alignment: Alignment.bottomLeft,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                image: DecorationImage(
                  image: NetworkImage(bgImg),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: lightTitleStyleL,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      subTitle,
                      style: lightSubTitleStyle,
                    ),
                  ],
                ),
              )),
          const AppScoreList(),
          const About(),
          Expanded(
            child: Container(
              color: Colors.white,
            ),
          ),
          const DetailBottom(),
        ],
      ),
    );
  }
}
