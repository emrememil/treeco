import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:treeco/core/base/view/base_widget.dart';
import 'package:treeco/core/constants/app/app_constants.dart';
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
    backgroundColor: Colors.white,
    body: Container(
        width: SizeConfig.screenWidth,
        height: SizeConfig.screenHeight,
        decoration: BoxDecoration(
            image: DecorationImage(
                image:
                AssetImage(ApplicationConstants.BACKGROUND_IMAGE_PROFILE),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(0.5), BlendMode.dstATop))),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              proVersionTopContainer,
              accountText,
              Container(width: 300, height: 800, color: Colors.red,)
            ],
          ),
        )
      ),

  );

  Padding get accountText {
    return Padding(
              padding: EdgeInsets.only(top:SizeConfig.getProportionateScreenHeight(32),
                  left: SizeConfig.getProportionateScreenWidth(16)),
              child: Text("Hesap",style: TextStyle(
                  fontSize:
                  SizeConfig.getProportionateScreenWidth(14),
                  color: Colors.black,
                  fontFamily: ApplicationConstants.FONT_FAMILY),),
            );
  }

  Center get proVersionTopContainer {
    return Center(
            child: Padding(
              padding: EdgeInsets.only(top: SizeConfig.getProportionateScreenHeight(16)),
              child: Container(
                height: SizeConfig.getProportionateScreenHeight(120),
                width: SizeConfig.screenWidth-SizeConfig.getProportionateScreenWidth(16),
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
                      size: SizeConfig.getProportionateScreenWidth(28),
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
                                fontSize: SizeConfig.getProportionateScreenWidth(12),
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

