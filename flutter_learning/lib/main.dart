import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_learning/bottom/sample_page.dart';
import 'package:flutter_learning/pages/dashboard_one_page.dart';
import 'package:flutter_learning/pages/landing_one_page.dart';
import 'package:flutter_learning/pages/login_one_page.dart';
import 'package:flutter_learning/pages/login_two_page.dart';
import 'package:flutter_learning/pages/on_boarding_ui.dart';
import 'package:flutter_learning/pages/profile_four_page.dart';
import 'package:flutter_learning/pages/profile_three_page.dart';
import 'package:flutter_learning/pages/profile_two_page.dart';
import 'package:flutter_learning/pages/profile_one_page.dart';
import 'package:flutter_learning/pages/todo-home-one-page.dart';
import 'package:flutter_learning/pages/todo_home_two_page.dart';
import 'package:flutter_learning/common/routes.dart';


void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    // 设置状态栏颜色
    statusBarColor: Colors.transparent,
  ));
  runApp(
    const MyApp()
    // const MaterialApp(
      // debugShowCheckedModeBanner: false,
      // home:
        // ProfileOnePage(),
        // ProfileTwoPage(),
        // ProfileThreePage(),
        // ProfileFourPage(),
        // TodoHomeOnePage(),
        // TodoHomeTwoPage(),
        // LoginOnePage(),
        // LoginTwoPage(),
        // LandingOnePage()
        // DashboardOnePage()
        // OnBoardingUI()
    // )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // brightness: Brightness.light,
        primarySwatch: Colors.red,
      ),
      routes: routes,
      initialRoute: '/',
      home: const SamplePage(),
    );
  }
}