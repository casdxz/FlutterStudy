import 'package:flutter/material.dart';
import 'package:flutter_learning/pages/profile_two_page.dart';

import 'pages/profile_one_page.dart';


void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:
        // ProfileOnePage(),
        ProfileTwoPage(),
    )
  );
}