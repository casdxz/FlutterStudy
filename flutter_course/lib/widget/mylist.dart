import 'package:flutter/material.dart';
import 'package:flutter_course/mock/dart.dart';
import 'package:flutter_course/model/mylist_model.dart';
import 'package:flutter_course/widget/my_list_item.dart';

class MyList extends StatelessWidget {
  const MyList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context,index) {
          MyListModel model = items[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: MyListItem(
              model.title, model.subTitle, model.bgImg,
            ),
          );
        },
      ),
    );
  }
}
