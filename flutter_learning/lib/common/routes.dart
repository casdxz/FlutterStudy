import 'package:flutter/material.dart';
import 'package:flutter_learning/bottom/index.dart';
import 'package:flutter_learning/bottom/sample_page.dart';
import 'package:flutter_learning/pages/dashboard_one_page.dart';
import 'package:flutter_learning/pages/landing_one_page.dart';
import 'package:flutter_learning/pages/login_one_page.dart';
import 'package:flutter_learning/pages/login_two_page.dart';
import 'package:flutter_learning/pages/on_boarding_ui.dart';
import 'package:flutter_learning/pages/profile_four_page.dart';
import 'package:flutter_learning/pages/profile_one_page.dart';
import 'package:flutter_learning/pages/profile_three_page.dart';
import 'package:flutter_learning/pages/profile_two_page.dart';
import 'package:flutter_learning/pages/todo-home-one-page.dart';
import 'package:flutter_learning/pages/todo_home_two_page.dart';


Map<String, Widget Function(BuildContext)> routes = {
  'sample_page': (context) => const SamplePage(),
  'ui_index': (context) => const UiIndex(),
  'one_page': (context) => const ProfileOnePage(),
  'two_page': (context) => const ProfileTwoPage(),
  'three_page': (context) => const ProfileThreePage(),
  'four_page': (context) => const ProfileFourPage(),
  'five_page': (context) => const TodoHomeOnePage(),
  'six_page': (context) => const TodoHomeTwoPage(),
  'seven_page': (context) => const LoginOnePage(),
  'eight_page': (context) => const LoginTwoPage(),
  'nine_page': (context) => const LandingOnePage(),
  'ten_page': (context) => const DashboardOnePage(),
  'eleven_page': (context) => const OnBoardingUI()
};
