import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:treeco/core/constants/app/app_constants.dart';
import 'package:treeco/core/init/lang/language_manager.dart';
import 'package:treeco/view/constants/size_config.dart';
import 'package:treeco/core/extension/string_extension.dart';

class ChangeLanguageScreen extends StatefulWidget {
  @override
  _ChangeLanguageScreenState createState() => _ChangeLanguageScreenState();
}

class _ChangeLanguageScreenState extends State<ChangeLanguageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      backgroundColor: Color(0xff11806F),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: SizeConfig.getProportionateScreenHeight(48),),
          Divider(
            thickness: 1,
            color: Colors.white,
          ),
          englishText,
          paddingLeftDivider,
          turkishText

        ],
      ),
    );
  }

  AppBar get appBar {
    return AppBar(
      backgroundColor: Color(ApplicationConstants.BACKGROUND_COLOR),
      elevation: 4,
      iconTheme: IconThemeData(color: Colors.white),
      title: Text(
        'changeLanguage'.locale,
        style: TextStyle(
            fontSize: SizeConfig.getProportionateScreenWidth(14),
            color: Colors.white,
            fontFamily: ApplicationConstants.FONT_FAMILY),
      ),
    );
  }

  Padding get paddingLeftDivider {
    return Padding(
      padding: EdgeInsets.only(left:SizeConfig.getProportionateScreenWidth(32),
          top: SizeConfig.getProportionateScreenWidth(8)),
      child: Divider(thickness: 1, color: Colors.white,),
    );
  }

  Padding get englishText {
    return Padding(
      padding: EdgeInsets.only(
          top: SizeConfig.getProportionateScreenHeight(8),
          left: SizeConfig.getProportionateScreenWidth(32)),
      child: InkWell(
        onTap: () => EasyLocalization.of(context).locale = LanguageManager.instance.enLocale,
        child: Row(
          children: <Widget>[
            Text(
              'english'.locale,
              style: TextStyle(
                  fontSize: SizeConfig.getProportionateScreenWidth(13),
                  color: Colors.white,
                  fontFamily: ApplicationConstants.FONT_FAMILY),
            ),
            (EasyLocalization.of(context).locale.countryCode == 'US') ? Padding(
              padding: EdgeInsets.only(left:SizeConfig.getProportionateScreenWidth(16)),
              child: Icon(Icons.check, color: Colors.white70,),
            ) : Container()
          ],
        ),
      ),
    );
  }

  Padding get turkishText {
    return Padding(
      padding: EdgeInsets.only(
          top: SizeConfig.getProportionateScreenHeight(8),
          left: SizeConfig.getProportionateScreenWidth(32)),
      child: InkWell(
        onTap: () => EasyLocalization.of(context).locale = LanguageManager.instance.trLocale,
        child: Row(
          children: <Widget>[
            Text(
              'turkish'.locale,
              style: TextStyle(
                  fontSize: SizeConfig.getProportionateScreenWidth(13),
                  color: Colors.white,
                  fontFamily: ApplicationConstants.FONT_FAMILY),
            ),
            (EasyLocalization.of(context).locale.countryCode == 'TR') ? Padding(
              padding: EdgeInsets.only(left:SizeConfig.getProportionateScreenWidth(16)),
              child: Icon(Icons.check, color: Colors.white70,),
            ) : Container()

          ],
        ),
      ),
    );
  }
}
