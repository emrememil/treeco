import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:treeco/core/base/view/base_widget.dart';
import 'package:treeco/core/constants/app/app_constants.dart';
import 'package:treeco/core/constants/navigation/navigation_constants.dart';
import 'package:treeco/core/init/navigation/navigation_service.dart';
import 'package:treeco/view/constants/size_config.dart';
import 'package:treeco/core/extension/string_extension.dart';
import 'package:treeco/view/personal/personal_information_settings/model/information_settings_model.dart';
import 'package:treeco/view/personal/personal_information_settings/view_model/information_settings_view_model.dart';

class InformationSettingsScreen extends StatefulWidget {
  @override
  _InformationSettingsScreenState createState() =>
      _InformationSettingsScreenState();
}

class _InformationSettingsScreenState extends State<InformationSettingsScreen> {
  InformationSettingsViewModel informationSettingsViewModel;
  InformationSettingsModel informationSettingsModel;
  var formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return BaseView<InformationSettingsViewModel>(
      viewModel: InformationSettingsViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        informationSettingsViewModel = model;

      },
      onPageBuilder: (context, value) => body,
    );
  }

  get body => Scaffold(
    resizeToAvoidBottomInset: false,
        appBar: appBar,
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              infoText,
              GestureDetector(
                onTap: () => NavigationService.instance.navigateToPage(path: NavigationConstants.EMAIL_INPUT),
                child: Wrap(
                  direction: Axis.vertical,
                  children: <Widget>[ePostaTitle, ePostaAdress],
                ),
              ),
              divider,
              GestureDetector(
                onTap: () => NavigationService.instance.navigateToPage(path: NavigationConstants.PHONE_NUMBER_INPUT),
                child: Wrap(
                  direction: Axis.vertical,
                  children: <Widget>[phoneNumberTitle, phoneNumber],
                ),
              ),
              divider,
              GestureDetector(
                onTap: () => NavigationService.instance.navigateToPage(path: NavigationConstants.GENDER_INPUT),
                child: Wrap(
                  direction: Axis.vertical,
                  children: <Widget>[genderTitle, gender],
                ),
              ),
              divider,
              GestureDetector(
                onTap: () => NavigationService.instance.navigateToPage(path: NavigationConstants.BIRTHDAY_INPUT),
                child: Wrap(
                  direction: Axis.vertical,
                  children: <Widget>[birthdayTitle, birthday],
                ),
              ),
              dividerLong,
            ],
          ),
        ),
      );

  Padding get divider {
    return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.getProportionateScreenWidth(16)),
        child: Divider());
  }
  Divider get dividerLong {
    return Divider();
  }

  Padding get ePostaAdress {
    return Padding(
      padding: EdgeInsets.only(
        left: SizeConfig.getProportionateScreenWidth(16),
        top: SizeConfig.getProportionateScreenHeight(4),
      ),
      child: Text(
        'enterAnEmailAddress'.locale,
        style: TextStyle(
            color: Colors.black,
            fontSize: SizeConfig.getProportionateScreenWidth(13),
            fontFamily: ApplicationConstants.FONT_FAMILY),
      ),
    );
  }

  Padding get phoneNumber {
    return Padding(
      padding: EdgeInsets.only(
        left: SizeConfig.getProportionateScreenWidth(16),
        top: SizeConfig.getProportionateScreenHeight(4),
      ),
      child: Text(
        'enterPhoneNumber'.locale,
        style: TextStyle(
            color: Colors.black,
            fontSize: SizeConfig.getProportionateScreenWidth(13),
            fontFamily: ApplicationConstants.FONT_FAMILY),
      ),
    );
  }

  Padding get gender {
    return Padding(
      padding: EdgeInsets.only(
        left: SizeConfig.getProportionateScreenWidth(16),
        top: SizeConfig.getProportionateScreenHeight(4),
      ),
      child: Text(
        'specify'.locale,
        style: TextStyle(
            color: Colors.black,
            fontSize: SizeConfig.getProportionateScreenWidth(13),
            fontFamily: ApplicationConstants.FONT_FAMILY),
      ),
    );
  }

  Padding get birthday {
    return Padding(
      padding: EdgeInsets.only(
        left: SizeConfig.getProportionateScreenWidth(16),
        top: SizeConfig.getProportionateScreenHeight(4),
      ),
      child: Text(
        'enterDateOfBirth'.locale,
        style: TextStyle(
            color: Colors.black,
            fontSize: SizeConfig.getProportionateScreenWidth(13),
            fontFamily: ApplicationConstants.FONT_FAMILY),
      ),
    );
  }

  Padding get ePostaTitle {
    return Padding(
      padding: EdgeInsets.only(
          left: SizeConfig.getProportionateScreenWidth(16),
          top: SizeConfig.getProportionateScreenHeight(16)),
      child: Text(
        'eMailAddress'.locale,
        style: TextStyle(
            color: Colors.grey,
            fontSize: SizeConfig.getProportionateScreenWidth(13),
            fontFamily: ApplicationConstants.FONT_FAMILY),
      ),
    );
  }

  Padding get phoneNumberTitle {
    return Padding(
      padding: EdgeInsets.only(
          left: SizeConfig.getProportionateScreenWidth(16),
          top: SizeConfig.getProportionateScreenHeight(8)),
      child: Text(
        'telNo'.locale,
        style: TextStyle(
            color: Colors.grey,
            fontSize: SizeConfig.getProportionateScreenWidth(13),
            fontFamily: ApplicationConstants.FONT_FAMILY),
      ),
    );
  }

  Padding get genderTitle {
    return Padding(
      padding: EdgeInsets.only(
          left: SizeConfig.getProportionateScreenWidth(16),
          top: SizeConfig.getProportionateScreenHeight(8)),
      child: Text(
        'gender'.locale,
        style: TextStyle(
            color: Colors.grey,
            fontSize: SizeConfig.getProportionateScreenWidth(13),
            fontFamily: ApplicationConstants.FONT_FAMILY),
      ),
    );
  }

  Padding get birthdayTitle {
    return Padding(
      padding: EdgeInsets.only(
          left: SizeConfig.getProportionateScreenWidth(16),
          top: SizeConfig.getProportionateScreenHeight(8)),
      child: Text(
        'birthday'.locale,
        style: TextStyle(
            color: Colors.grey,
            fontSize: SizeConfig.getProportionateScreenWidth(13),
            fontFamily: ApplicationConstants.FONT_FAMILY),
      ),
    );
  }

  AppBar get appBar {
    return AppBar(
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(
          color: Colors.black,
          size: SizeConfig.getProportionateScreenWidth(22)),
      title: Text(
        'personalInformationSettings'.locale,
        style: TextStyle(
            fontSize: SizeConfig.getProportionateScreenWidth(14),
            color: Colors.black,
            fontFamily: ApplicationConstants.FONT_FAMILY),
      ),
    );
  }

  Padding get infoText {
    return Padding(
      padding: EdgeInsets.all(SizeConfig.getProportionateScreenWidth(16)),
      child: Text(
        'personalSettingsInfoText'.locale,
        style: TextStyle(
            color: Color(ApplicationConstants.TEXT_GREY),
            fontSize: SizeConfig.getProportionateScreenWidth(13),
            fontFamily: ApplicationConstants.FONT_FAMILY),
      ),
    );
  }


}
