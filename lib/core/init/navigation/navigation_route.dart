import 'package:flutter/material.dart';
import 'package:treeco/core/components/card/not_found_navigation_widget.dart';
import 'package:treeco/core/constants/navigation/navigation_constants.dart';
import 'package:treeco/view/onboarding/signin/view/signin_view.dart';
import 'package:treeco/view/onboarding/welcome/welcome_view.dart';
import 'package:treeco/view/splash/view/splash_view.dart';


class NavigationRoute {
  static NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.SPLASH_VIEW:
        return normalNavigate(SplashScreen());
      case NavigationConstants.WELCOME_VIEW:
        return normalNavigate(WelcomeScreen());
      case NavigationConstants.SIGN_IN:
        return normalNavigate(SignInScreen());
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

