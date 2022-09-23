import 'package:flutter/material.dart';
import 'package:flutter_codelab/global/styles.dart';
import 'package:flutter_codelab/model/CategoryModel.dart';
import 'package:flutter_codelab/mock/category_data.dart';
import 'package:flutter_codelab/widget/app_category_list_item.dart';

class AppCategoryList extends StatelessWidget {
  const AppCategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(15, 30, 15, 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Category',
                style: titleStyleL,
              ),
              Text(
                'See More',
                style: summaryStyleL,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (context, index) {
              CategoryModel model = items[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: AppCategoryListItem(model.icon, model.name),
              );
            },
          ),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
