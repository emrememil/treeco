import 'package:flutter/material.dart';
import 'package:treeco/core/components/card/not_found_navigation_widget.dart';
import 'package:treeco/core/constants/navigation/navigation_constants.dart';
import 'package:treeco/view/community/friends/view/friends_view.dart';
import 'package:treeco/view/community/leaderboard/view/leaderboard_view.dart';
import 'package:treeco/view/community/timeline/view/timeline_view.dart';
import 'package:treeco/view/onboarding/signin/view/signin_view.dart';
import 'package:treeco/view/onboarding/signup/view/signup_view.dart';
import 'package:treeco/view/onboarding/welcome/welcome_view.dart';
import 'package:treeco/view/personal/birthday_input/view/birthday_input_view.dart';
import 'package:treeco/view/personal/email_input/view/email_input_view.dart';
import 'package:treeco/view/personal/gender_input/view/gender_input_view.dart';
import 'package:treeco/view/personal/personal_information_settings/view/information_settings_view.dart';
import 'package:treeco/view/personal/phone_number_input/view/phone_input_view.dart';
import 'package:treeco/view/personal/profile/view/profile_view.dart';
import 'package:treeco/view/personal/profile_edit/view/profile_edit_view.dart';
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
      case NavigationConstants.SIGN_UP:
        return normalNavigate(SignUpScreen());
      case NavigationConstants.PROFILE:
        return normalNavigate(ProfileScreen());
      case NavigationConstants.PROFILE_EDIT:
        return normalNavigate(ProfileEditScreen());
      case NavigationConstants.INFORMATION_SETTINGS:
        return normalNavigate(InformationSettingsScreen());
      case NavigationConstants.EMAIL_INPUT:
        return normalNavigate(EmailInputScreen());
      case NavigationConstants.PHONE_NUMBER_INPUT:
        return normalNavigate(PhoneInputScreen());
      case NavigationConstants.GENDER_INPUT:
        return normalNavigate(GenderInputScreen());
      case NavigationConstants.BIRTHDAY_INPUT:
        return normalNavigate(BirthdayInputScreen());
      case NavigationConstants.FRIENDS:
        return normalNavigate(FriendsScreen());
      case NavigationConstants.TIMELINE:
        return normalNavigate(TimelineScreen());
      case NavigationConstants.LEADER_BOARD:
        return normalNavigate(LeaderBoardScreen());
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

