import 'dart:developer';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:treeco/core/constants/app/app_constants.dart';
import 'package:treeco/core/constants/navigation/navigation_constants.dart';
import 'package:treeco/core/init/navigation/navigation_service.dart';
import 'package:treeco/view/achievements/view/achievements_view.dart';
import 'package:treeco/view/constants/size_config.dart';
import 'package:treeco/view/home/view/home_view.dart';
import 'package:treeco/view/onboarding/welcome/welcome_view.dart';
import 'package:treeco/view/store/view/store_view.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    _checkForSession().then((status) {
      if (status) {
        splashNavigator(HomeScreen());
      }
      else{
        // ---TO DO---: NAVIGATE TO HOME PAGE!
      }
    });

  }
  splashNavigator(Widget widget) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) =>widget,
    ));
  }

  Future<bool> _checkForSession() async {
    await Future.delayed(Duration(milliseconds: 3000), () {
    });

    return true;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: body(context),
    );
  }

  Container body(BuildContext context) {
    return Container(
      height: MediaQuery
          .of(context)
          .size
          .height,
      width: MediaQuery
          .of(context)
          .size
          .width,
      color: Color(ApplicationConstants.DARK_GREEN),
      child: text(),
    );
  }

  Row text() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "T",
          style: TextStyle(
              color: Colors.white,
              fontSize: SizeConfig.textMultiplier*10,
              fontFamily: ApplicationConstants.FONT_FAMILY,
              fontWeight: FontWeight.w800
          ),
        ),
        Text(
          "REECO",
          style: TextStyle(
              color: Colors.white,
              fontSize: SizeConfig.textMultiplier*7.5,
              fontFamily: ApplicationConstants.FONT_FAMILY,
              fontWeight: FontWeight.w800
          ),
        )
      ],
    );
  }
}
