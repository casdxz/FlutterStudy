import 'package:flutter/material.dart';
import 'package:flutter_codelab/global/styles.dart';
import 'package:flutter_codelab/pages/building_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const BuildingPage()));
    });

    return Container(
      // color: mainColor,
      decoration: BoxDecoration(
        color: mainColor
      //       image: DecorationImage(
      //     image: NetworkImage(
      //          'undefined'
      //    )
      // )
      ),
      child: Stack(

        children: const [
          Align(
            alignment: Alignment.center,
            child: Icon(
              Icons.terrain,
              size: 90,
              color: Colors.white,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child:Padding(
              // padding: EdgeInsets.symmetric(vertical: 100),
              padding: EdgeInsets.only(bottom: 80.0),
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(
                  Colors.white,
                ),
              ),
            )
          )
        ],
      )
    );
  }
}