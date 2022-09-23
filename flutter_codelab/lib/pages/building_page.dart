
import 'package:flutter/material.dart';
import 'package:flutter_codelab/global/styles.dart';
import 'package:flutter_codelab/widget/app_bottom_bar.dart';
import 'package:flutter_codelab/widget/app_header.dart';
import 'package:flutter_codelab/widget/app_list.dart';
import 'package:flutter_codelab/widget/app_list_item.dart';
import 'package:flutter_codelab/widget/app_search.dart';

import '../widget/app_category_list.dart';

class BuildingPage extends StatelessWidget {
  const BuildingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title:const Center(
            child: Icon(
              Icons.terrain,
              size: 32,
            ),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 8.0),
              // child: Icon(
              //   Icons.settings,
              //   color: mainColor,
              //   size: 40,
              // ),
              child: Icon(
                Icons.share,
              ),
            ),
          ],
          iconTheme: const IconThemeData(
            color: mainColor,
          ),
        ),
        drawer: const Drawer(),
        body: Column(
            children: <Widget>[
              AppHeader(),
              AppSearch(),
              AppList(),
              AppCategoryList(),
              Expanded(child: Container(color: mainColor,),),
              AppBottomBar(),
            ]
        )
    );
  }
}