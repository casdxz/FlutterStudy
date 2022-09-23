import 'package:flutter/material.dart';
import 'package:flutter_course/pages/app_store_page.dart';
import 'package:flutter_course/pages/event_page.dart';
import 'package:flutter_course/pages/layout_page.dart';
import 'package:flutter_course/pages/painter_page.dart';


void main() {
  runApp(
      const MaterialApp(
        debugShowCheckedModeBanner: false,
        home:
        // LayoutPage(),
        // AppStorePage(),
        PainterPage()
      )
  );
}
