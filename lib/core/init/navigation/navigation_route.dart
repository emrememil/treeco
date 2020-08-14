import 'package:flutter/material.dart';
import 'package:treeco/core/components/card/not_found_navigation_widget.dart';
import 'package:treeco/core/constants/navigation/navigation_constants.dart';
import 'package:treeco/main.dart';

class NavigationRoute {
  static NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.SPLASH_VIEW:
        return normalNavigate(SplashScreen());
      default:
        return MaterialPageRoute(
          builder: (context) => NotFoundNavigationWidget(),
        );
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(
      builder: (context) => widget,
    );
  }
}

