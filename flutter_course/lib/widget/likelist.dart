import 'package:flutter/material.dart';
import 'package:flutter_course/mock/like_list.dart';
import 'package:flutter_course/widget/like_list_item.dart';

class LikeList extends StatelessWidget {
  const LikeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 5,
        itemBuilder: (context, index) {
          LikeListModel model = item[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: LikeListItem(model.ptoImg),
          );
        },
        shrinkWrap: true,
      ),
    );
  }
}
