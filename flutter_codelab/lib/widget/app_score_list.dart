import 'package:flutter/material.dart';

import '../mock/score_data.dart';
import 'app_score_list_item.dart';

class AppScoreList extends StatelessWidget {
  const AppScoreList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(
          vertical: 20.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(items.length, (index) {
            return AppScoreListItem(items[index].name, items[index].score);
          }),
        ));
  }
}
