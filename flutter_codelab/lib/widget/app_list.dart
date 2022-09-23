import 'package:flutter/material.dart';
import 'package:flutter_codelab/widget/app_list_item.dart';

import '../mock/data.dart';
import '../model/list_model.dart';

class AppList extends StatelessWidget {
  const AppList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 8,
        itemBuilder: (context,index){
          ListModel model = items[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppListItem(
              model.title, model.subTitle,model.bgImg
            ),
          );
        },
      ),
    );
  }
}