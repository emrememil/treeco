import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:treeco/core/base/view/base_widget.dart';
import 'package:treeco/core/constants/app/app_constants.dart';
import 'package:treeco/core/constants/navigation/navigation_constants.dart';
import 'package:treeco/core/init/navigation/navigation_service.dart';
import 'package:treeco/view/constants/size_config.dart';
import 'package:treeco/view/settings/model/settings_model.dart';
import 'package:treeco/view/settings/view_model/settings_view_model.dart';
import 'package:treeco/core/extension/string_extension.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  SettingsModel settingsModel;
  SettingsViewModel settingsViewModel;

  @override
  Widget build(BuildContext context) {
    return BaseView<SettingsViewModel>(
      viewModel: SettingsViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        settingsViewModel = model;
      },
      onPageBuilder: (context, value) => body,
    );
  }

  get body => Scaffold(
        appBar: appBar,
        backgroundColor: Color(0xff11806F),
        body: Container(
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        ApplicationConstants.BACKGROUND_IMAGE_PROFILE),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.1), BlendMode.dstATop))),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  proVersionTopContainer,
                  accountText,
                  Divider(
                    thickness: 1,
                    color: Colors.white,
                  ),
                  signOutText,
                  paddingLeftDivider,
                  forgotPasswordText,
                  paddingLeftDivider,
                  settingsText,
                  Divider(
                    thickness: 1,
                    color: Colors.white,
                  ),
                  changeLanguageText,
                  paddingLeftDivider,
                  notificationText,
                  paddingOnlyLeftDivider,
                  aboutUsText,
                  Divider(
                    thickness: 1,
                    color: Colors.white,
                  ),
                  sssAndSupportText,
                  paddingLeftDivider,
                  rateUsText,
                  paddingLeftDivider,
                  playHelpGuideText,
                  paddingLeftDivider,
                  privacyPolicyText,
                  paddingLeftDivider,
                  versionText
                ],
              ),
            )),
      );

  Padding get paddingLeftDivider {
    return Padding(
                  padding: EdgeInsets.only(left:SizeConfig.getProportionateScreenWidth(32),
                  top: SizeConfig.getProportionateScreenWidth(8)),
                  child: Divider(thickness: 1, color: Colors.white,),
                );
  }

  Padding get paddingOnlyLeftDivider {
    return Padding(
      padding: EdgeInsets.only(left:SizeConfig.getProportionateScreenWidth(32)),
      child: Divider(thickness: 1, color: Colors.white,),
    );
  }

  Padding get accountText {
    return Padding(
      padding: EdgeInsets.only(
          top: SizeConfig.getProportionateScreenHeight(32),
          left: SizeConfig.getProportionateScreenWidth(16),
      bottom: SizeConfig.getProportionateScreenHeight(8)),
      child: Text(
        'account'.locale,
        style: TextStyle(
            fontSize: SizeConfig.getProportionateScreenWidth(13),
            color: Colors.white70,
            fontFamily: ApplicationConstants.FONT_FAMILY),
      ),
    );
  }

  Padding get settingsText {
    return Padding(
      padding: EdgeInsets.only(
          top: SizeConfig.getProportionateScreenHeight(16),
          left: SizeConfig.getProportionateScreenWidth(16),
          bottom: SizeConfig.getProportionateScreenHeight(8),),
      child: Text(
        'settings'.locale,
        style: TextStyle(
            fontSize: SizeConfig.getProportionateScreenWidth(13),
            color: Colors.white70,
            fontFamily: ApplicationConstants.FONT_FAMILY),
      ),
    );
  }

  Padding get aboutUsText {
    return Padding(
      padding: EdgeInsets.only(
        top: SizeConfig.getProportionateScreenHeight(16),
        left: SizeConfig.getProportionateScreenWidth(16),
        bottom: SizeConfig.getProportionateScreenHeight(8),),
      child: Text(
        'aboutUs'.locale,
        style: TextStyle(
            fontSize: SizeConfig.getProportionateScreenWidth(13),
            color: Colors.white70,
            fontFamily: ApplicationConstants.FONT_FAMILY),
      ),
    );
  }

  Padding get signOutText {
    return Padding(
      padding: EdgeInsets.only(
          top: SizeConfig.getProportionateScreenHeight(16),
          left: SizeConfig.getProportionateScreenWidth(32)),
      child: Text(
        'signOut'.locale,
        style: TextStyle(
            fontSize: SizeConfig.getProportionateScreenWidth(13),
            color: Colors.white,
            fontFamily: ApplicationConstants.FONT_FAMILY),
      ),
    );
  }

  Padding get forgotPasswordText {
    return Padding(
      padding: EdgeInsets.only(
          top: SizeConfig.getProportionateScreenHeight(8),
          left: SizeConfig.getProportionateScreenWidth(32)),
      child: Text(
        'forgotPassword'.locale,
        style: TextStyle(
            fontSize: SizeConfig.getProportionateScreenWidth(13),
            color: Colors.white,
            fontFamily: ApplicationConstants.FONT_FAMILY),
      ),
    );
  }

  Padding get changeLanguageText {
    return Padding(
      padding: EdgeInsets.only(
          top: SizeConfig.getProportionateScreenHeight(8),
          left: SizeConfig.getProportionateScreenWidth(32)),
      child: InkWell(
        onTap: () => NavigationService.instance.navigateToPage(path: NavigationConstants.CHANGE_LANGUAGE),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'changeLanguage'.locale,
              style: TextStyle(
                  fontSize: SizeConfig.getProportionateScreenWidth(13),
                  color: Colors.white,
                  fontFamily: ApplicationConstants.FONT_FAMILY),
            ),
            Padding(
              padding: EdgeInsets.only(right:SizeConfig.getProportionateScreenWidth(16)),
              child: Text(
                (EasyLocalization.of(context).locale.countryCode == 'TR') ? 'turkish'.locale : 'english'.locale,
                style: TextStyle(
                    fontSize: SizeConfig.getProportionateScreenWidth(13),
                    color: Colors.white,
                    fontFamily: ApplicationConstants.FONT_FAMILY),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding get notificationText {
    return Padding(
      padding: EdgeInsets.only(
          top: SizeConfig.getProportionateScreenHeight(0),
          left: SizeConfig.getProportionateScreenWidth(32)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'notification'.locale,
            style: TextStyle(
                fontSize: SizeConfig.getProportionateScreenWidth(13),
                color: Colors.white,
                fontFamily: ApplicationConstants.FONT_FAMILY),
          ),
          Observer(
            builder: (context) => Padding(
              padding: EdgeInsets.only(right:SizeConfig.getProportionateScreenWidth(16)),
              child: Switch(
                value: settingsViewModel.notificationSwitch,
                activeTrackColor: Color(ApplicationConstants.BACKGROUND_COLOR),
                activeColor: Color(0xff1ABC9C),
                onChanged: (value) {
                  settingsViewModel.notificationSwitch=value;
                  print("seçilen:"+settingsViewModel.notificationSwitch.toString());
                },
              )
            ),
          ),
        ],
      ),
    );
  }

  Padding get sssAndSupportText {
    return Padding(
      padding: EdgeInsets.only(
          top: SizeConfig.getProportionateScreenHeight(8),
          left: SizeConfig.getProportionateScreenWidth(32)),
      child: Text(
        'faqAndSupport'.locale,
        style: TextStyle(
            fontSize: SizeConfig.getProportionateScreenWidth(13),
            color: Colors.white,
            fontFamily: ApplicationConstants.FONT_FAMILY),
      ),
    );
  }

  Padding get rateUsText {
    return Padding(
      padding: EdgeInsets.only(
          top: SizeConfig.getProportionateScreenHeight(8),
          left: SizeConfig.getProportionateScreenWidth(32)),
      child: Text(
        'rateUs'.locale,
        style: TextStyle(
            fontSize: SizeConfig.getProportionateScreenWidth(13),
            color: Colors.white,
            fontFamily: ApplicationConstants.FONT_FAMILY),
      ),
    );
  }

  Padding get playHelpGuideText {
    return Padding(
      padding: EdgeInsets.only(
          top: SizeConfig.getProportionateScreenHeight(8),
          left: SizeConfig.getProportionateScreenWidth(32)),
      child: Text(
        'playHelpGuide'.locale,
        style: TextStyle(
            fontSize: SizeConfig.getProportionateScreenWidth(13),
            color: Colors.white,
            fontFamily: ApplicationConstants.FONT_FAMILY),
      ),
    );
  }

  Padding get privacyPolicyText {
    return Padding(
      padding: EdgeInsets.only(
          top: SizeConfig.getProportionateScreenHeight(8),
          left: SizeConfig.getProportionateScreenWidth(32)),
      child: Text(
        'privacyPolicy'.locale,
        style: TextStyle(
            fontSize: SizeConfig.getProportionateScreenWidth(13),
            color: Colors.white,
            fontFamily: ApplicationConstants.FONT_FAMILY),
      ),
    );
  }

  Padding get versionText {
    return Padding(
      padding: EdgeInsets.only(
          top: SizeConfig.getProportionateScreenHeight(8),
          left: SizeConfig.getProportionateScreenWidth(32)),
      child: Text(
        "VER 1.24.8",
        style: TextStyle(
            fontSize: SizeConfig.getProportionateScreenWidth(13),
            color: Colors.white,
            fontFamily: ApplicationConstants.FONT_FAMILY),
      ),
    );
  }

  Center get proVersionTopContainer {
    return Center(
      child: Padding(
        padding:
            EdgeInsets.only(top: SizeConfig.getProportionateScreenHeight(16)),
        child: Container(
          height: SizeConfig.getProportionateScreenHeight(120),
          width: SizeConfig.screenWidth -
              SizeConfig.getProportionateScreenWidth(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Color(ApplicationConstants.BACKGROUND_COLOR2),
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xff91D183), Color(0xff5CA985)]),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                MdiIcons.crown,
                color: Colors.yellow,
                size: SizeConfig.getProportionateScreenWidth(42),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      'proVersion'.locale,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: ApplicationConstants.FONT_FAMILY2,
                          fontWeight: FontWeight.bold,
                          fontSize: SizeConfig.getProportionateScreenWidth(16),
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar get appBar {
    return AppBar(
      backgroundColor: Color(ApplicationConstants.BACKGROUND_COLOR),
      elevation: 4,
      iconTheme: IconThemeData(color: Colors.white),
      title: Text(
        'settings'.locale,
        style: TextStyle(
            fontSize: SizeConfig.getProportionateScreenWidth(14),
            color: Colors.white,
            fontFamily: ApplicationConstants.FONT_FAMILY),
      ),
    );
  }
}
