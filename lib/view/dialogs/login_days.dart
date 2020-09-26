import 'package:flutter/material.dart';
import 'package:treeco/core/constants/app/app_constants.dart';
import 'package:treeco/core/init/navigation/navigation_service.dart';
import 'package:treeco/view/constants/custom_icons.dart';
import 'package:treeco/view/constants/size_config.dart';

class CustomOpeningAppDialog extends StatelessWidget {
  final int consecutiveDays;
  final int prizeCoin;

  CustomOpeningAppDialog(this.consecutiveDays, this.prizeCoin);

  @override
  Widget build(BuildContext context) {
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
          height: SizeConfig.screenHeight / 1.8,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(17),
          ),
          child: Column(
            children: <Widget>[
              Text(
                "Giriş Durumu",
                style: TextStyle(
                    fontSize: SizeConfig.getProportionateScreenWidth(15),
                    color: Colors.black87,
                    fontFamily: ApplicationConstants.FONT_FAMILY),
              ),
              SizedBox(
                height: SizeConfig.getProportionateScreenHeight(12),
              ),
              Container(
                height: SizeConfig.screenHeight / 4,
                child: GridView.builder(
                    itemCount: 12,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.all(
                            SizeConfig.getProportionateScreenWidth(3)),
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Color(0xff50A387),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Text(
                                    "${index + 1}.gün",
                                    style: TextStyle(
                                        fontSize: SizeConfig
                                            .getProportionateScreenWidth(12),
                                        color: Colors.white,
                                        fontFamily:
                                        ApplicationConstants.FONT_FAMILY),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color: Colors.white.withOpacity(0.2),
                                  ),
                                  width: SizeConfig.getProportionateScreenWidth(
                                      24),
                                  height:
                                  SizeConfig.getProportionateScreenWidth(
                                      24),
                                  child: Icon(Icons.check,
                                      color: Colors.white),
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
                "Bugünkü ödülün",
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
              SizedBox(width: SizeConfig.getProportionateScreenWidth(200),
                child: RaisedButton.icon(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  color: Color(0xffF2C94D),
                  elevation: 2,
                  onPressed: () {
                  },
                  icon: Icon(Icons.local_movies, color: Colors.white,),
                  label: Text(
                    'İki kat coin',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize:
                        SizeConfig.getProportionateScreenWidth(13),
                        fontFamily: ApplicationConstants.FONT_FAMILY2),
                  ),
                ),
              ),
              SizedBox(width: SizeConfig.getProportionateScreenWidth(200),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  color: Color(0xff85CAAB),
                  elevation: 2,
                  onPressed: () {
                    NavigationService.instance.navigatePop();
                  },
                  child: Text(
                    'Tamam',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize:
                        SizeConfig.getProportionateScreenWidth(13),
                        fontFamily: ApplicationConstants.FONT_FAMILY2),
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
