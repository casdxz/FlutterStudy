// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

final Color color1 = Colors.pink.shade100;
final Color color2 = Colors.pink.shade200;
final Color color3 = Colors.pink.shade300;
final Color color4 = Colors.pink.shade400;

TextStyle titleStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.w700,
  fontSize: 30,
);

TextStyle tipStyle = TextStyle(
  color: Colors.pink,
  fontWeight: FontWeight.w700,
  fontSize: 12,
);

class LoginOnePage extends StatefulWidget {
  const LoginOnePage({Key? key}) : super(key: key);

  @override
  State<LoginOnePage> createState() => _LoginOnePageState();
}

class _LoginOnePageState extends State<LoginOnePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipPath(
                  clipper: WaveClipperOne(),
                  child: Container(
                    child: Column(),
                    width: double.infinity,
                    height: 300,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [color1, color2]
                      ),
                    ),
                  ),
                ),
                ClipPath(
                  clipper: WaveClipperTwo(),
                  child: Container(
                    width: double.infinity,
                    height: 300,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [color3, color4]
                      ),

                    ),
                    child:Column(
                      children: <Widget>[
                        SizedBox(height: 50),
                        Icon(
                            Icons.code,
                          color: Colors.white,
                          size: 60,
                        ),
                        SizedBox(height: 20),
                        Text('Coding Life', style: titleStyle),
                      ],
                    ) ,
                  ),
                ),
              ],
            ),
            SizedBox(height: 32),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: TextField(
                onChanged: (String value) {},
                cursorColor: color4,
                decoration: InputDecoration(
                  hintText: 'Email',
                  prefixIcon: Material(
                    elevation: 0,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    child: Icon(Icons.email, color: color4),
                  ),
                  border: InputBorder.none,
                  contentPadding:
                    EdgeInsets.symmetric(horizontal: 22, vertical: 12),
                ),
              ),
            ),
            SizedBox(height: 32),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Material(
                elevation: 3,
                borderRadius: BorderRadius.all(Radius.circular(30)),
                child: TextField(
                  onChanged: (String value) {},
                  cursorColor: color4,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    prefixIcon: Material(
                      elevation: 0,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      child: Icon(Icons.lock, color: color4),
                    ),
                    border: InputBorder.none,
                    contentPadding:
                      EdgeInsets.symmetric(horizontal: 22, vertical: 12),
                  ),
                ),
              ),
            ),
            SizedBox(height: 32),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(100)),
                color: color4,
              ),
              child: MaterialButton(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: Text('Login', style: titleStyle.copyWith(fontSize: 18)),
                onPressed: () {},
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text('FORGOT PASSWORD ?', style: tipStyle),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Don't have an Account ?",
                  style: tipStyle.copyWith(
                    color: Colors.black87, fontWeight: FontWeight.normal
                  ),
                ),
                Text(
                  'Sign Up',
                  style:
                  tipStyle.copyWith(decoration: TextDecoration.underline),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
