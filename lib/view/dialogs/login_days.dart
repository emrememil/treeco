import 'package:flutter/material.dart';
import 'package:treeco/core/constants/app/app_constants.dart';
import 'package:treeco/core/constants/enums/locale_keys_enum.dart';
import 'package:treeco/core/init/cache/locale_manager.dart';
import 'package:treeco/core/init/navigation/navigation_service.dart';
import 'package:treeco/view/constants/custom_icons.dart';
import 'package:treeco/view/constants/size_config.dart';
import 'package:treeco/view/dialogs/view_models/login_days_view_model.dart';
import 'package:treeco/core/extension/string_extension.dart';
import 'package:intl/date_symbol_data_local.dart';

class CustomOpeningAppDialog extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('tr');
    LoginDays().sharedPreferencesOperations();
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(SizeConfig.getProportionateScreenWidth(16)),
          width: SizeConfig.screenWidth -
              SizeConfig.getProportionateScreenWidth(16),
          height: SizeConfig.screenHeight / 1.7,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(17),
          ),
          child: Column(
            children: <Widget>[
              Text(
                'loginStatus'.locale,
                style: TextStyle(
                    fontSize: SizeConfig.getProportionateScreenWidth(15),
                    color: Colors.black87,
                    fontFamily: ApplicationConstants.FONT_FAMILY),
              ),
              SizedBox(
                height: SizeConfig.getProportionateScreenHeight(12),
              ),
              Container(
                height: SizeConfig.screenHeight / 3.8,
                child: GridView.builder(
                    itemCount: 15,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.all(
                            SizeConfig.getProportionateScreenWidth(3)),
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: (LoginDays.counterOfConsecutiveDays<index+1) ? Color(0xff50A387):Color(0xff64CCA9),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Text(
                                    "${index + 1}" + 'xDays'.locale,
                                    style: TextStyle(
                                        fontSize: SizeConfig
                                            .getProportionateScreenWidth(11),
                                        color: Colors.white,
                                        fontFamily:
                                        ApplicationConstants.FONT_FAMILY),
                                  ),
                                ),
                                Container(
                                  decoration: (LoginDays.counterOfConsecutiveDays>=index+1) ? BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: Colors.white.withOpacity(0.2),
                                  ):null,
                                  width: SizeConfig.getProportionateScreenWidth(
                                      16),
                                  height:
                                  SizeConfig.getProportionateScreenWidth(
                                      16),
                                  child: (LoginDays.counterOfConsecutiveDays>=index+1) ? Icon(Icons.check,
                                      color: Colors.white, size: SizeConfig.getProportionateScreenWidth(
                                        16),) : Icon(Icons.access_time,
                                    color: Colors.white, size: SizeConfig.getProportionateScreenWidth(
                                        16),),
                                )
                              ],
                            )),
                      );
                    }),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.getProportionateScreenHeight(4)),
                child: Divider(
                ),
              ),
              Text(
                'yourPrizeToday'.locale,
                style: TextStyle(
                    fontSize: SizeConfig.getProportionateScreenWidth(14),
                    color: Colors.black,
                    fontFamily: ApplicationConstants.FONT_FAMILY),
              ),
              SizedBox(
                height: SizeConfig.getProportionateScreenHeight(8),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    CustomIcons.coin,
                    color: Color(0xffF6C358),
                    size: SizeConfig.getProportionateScreenWidth(18),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: SizeConfig.getProportionateScreenWidth(8)),
                    child: Text(
                      "3",
                      style: TextStyle(
                          fontSize: SizeConfig.getProportionateScreenWidth(18),
                          color: Colors.black,
                          fontFamily: ApplicationConstants.FONT_FAMILY),
                    ),
                  ),
                ],
              ),
              SizedBox(height: SizeConfig.getProportionateScreenHeight(8),),
              Expanded(
                child: SizedBox(width: SizeConfig.screenWidth/2,
                  child: RaisedButton.icon(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    color: Color(0xffF2C94D),
                    elevation: 2,
                    onPressed: () {
                    },
                    icon: Icon(Icons.local_movies, color: Colors.white,),
                    label: Text(
                      'doubleCoin'.locale,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize:
                          SizeConfig.getProportionateScreenWidth(13),
                          fontFamily: ApplicationConstants.FONT_FAMILY2),
                    ),
                  ),
                ),
              ),
              SizedBox(height: SizeConfig.getProportionateScreenHeight(8),),
              Expanded(
                child: SizedBox(width: SizeConfig.screenWidth/2,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    color: Color(0xff85CAAB),
                    elevation: 2,
                    onPressed: () {
                      print("Son giriş tarih günü: " + LocaleManager.instance.getIntValue(PreferencesKeys.LAST_LOGIN_DAY).toString());
                      print("Üst üste giriş sayısı: " +LocaleManager.instance.getIntValue(PreferencesKeys.COUNTER_OF_CONSECUTIVE_DAYS).toString());
                      NavigationService.instance.navigatePop();
                    },
                    child: Text(
                      'OK'.locale,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize:
                          SizeConfig.getProportionateScreenWidth(13),
                          fontFamily: ApplicationConstants.FONT_FAMILY2),
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }


}
