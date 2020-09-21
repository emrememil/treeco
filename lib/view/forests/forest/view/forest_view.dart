import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:treeco/core/base/view/base_widget.dart';
import 'package:treeco/core/constants/app/app_constants.dart';
import 'package:treeco/core/extension/string_extension.dart';
import 'package:treeco/view/constants/custom_icons.dart';
import 'package:treeco/view/constants/size_config.dart';
import 'package:treeco/view/forests/forest/model/forest_model.dart';
import 'package:treeco/view/forests/forest/view_model/forest_view_model.dart';

class ForestScreen extends StatefulWidget {
  @override
  _ForestScreenState createState() => _ForestScreenState();
}

class _ForestScreenState extends State<ForestScreen> {
  ForestModel forestModel;
  ForestViewModel forestViewModel;

  @override
  Widget build(BuildContext context) {
    return BaseView<ForestViewModel>(
      viewModel: ForestViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        forestViewModel = model;
      },
      onPageBuilder: (context, value) => body,
    );
  }

  get body => Scaffold(
        backgroundColor: Color(ApplicationConstants.BACKGROUND_COLOR),
        appBar: appBar,
        body: Align(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: SizeConfig.getProportionateScreenHeight(16),
              ),
              Container(
                width: SizeConfig.screenWidth -
                    SizeConfig.getProportionateScreenWidth(32),
                height: SizeConfig.screenHeight / 3.4,
                decoration: BoxDecoration(
                  color: Color(ApplicationConstants.BACKGROUND_COLOR2),
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage("assets/images/forest_background.png"),
                      fit: BoxFit.cover),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Ormanındaki Ağaç Sayısı",
                      style: TextStyle(
                          fontSize: SizeConfig.getProportionateScreenWidth(16),
                          color: Colors.white,
                          fontFamily: ApplicationConstants.FONT_FAMILY2),
                    ),
                    SizedBox(height: SizeConfig.getProportionateScreenHeight(16),),
                    Container(
                      height: SizeConfig.getProportionateScreenWidth(80),
                      width: SizeConfig.getProportionateScreenWidth(80),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(ApplicationConstants.BACKGROUND_COLOR).withOpacity(0.3),

                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "5",
                          style: TextStyle(
                              fontSize: SizeConfig.getProportionateScreenWidth(36),
                              color: Colors.white,
                              fontFamily: ApplicationConstants.FONT_FAMILY2),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );

  AppBar get appBar {
    return AppBar(
      //backgroundColor: Color(0xff0B806E),
      backgroundColor: Color(ApplicationConstants.BACKGROUND_COLOR),
      elevation: 4,
      iconTheme: IconThemeData(color: Colors.white),
      title: Text(
        'forest'.locale,
        style: TextStyle(
            fontSize: SizeConfig.getProportionateScreenWidth(14),
            color: Colors.white,
            fontFamily: ApplicationConstants.FONT_FAMILY),
      ),
      actions: <Widget>[
        Padding(
          padding:
              EdgeInsets.only(right: SizeConfig.getProportionateScreenWidth(8)),
          child: Row(
            children: <Widget>[
              Icon(
                MdiIcons.pineTree,
                color: Colors.white,
                size: SizeConfig.getProportionateScreenWidth(21),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: SizeConfig.getProportionateScreenWidth(3)),
                child: Text("5",
                    style: TextStyle(
                        fontSize: SizeConfig.getProportionateScreenWidth(13),
                        color: Colors.white,
                        fontFamily: ApplicationConstants.FONT_FAMILY)),
              ),
              Padding(
                  padding: EdgeInsets.only(
                    left: SizeConfig.getProportionateScreenWidth(8),
                  ),
                  child: Icon(
                    CustomIcons.coin,
                    color: Color(0xffF6C358),
                    size: SizeConfig.getProportionateScreenWidth(16),
                  )),
              Padding(
                padding: EdgeInsets.only(
                  left: SizeConfig.getProportionateScreenWidth(4),
                ),
                child: Text(
                  "582",
                  style: TextStyle(
                      fontSize: SizeConfig.getProportionateScreenWidth(14),
                      color: Color(0xffF6C358),
                      fontFamily: ApplicationConstants.FONT_FAMILY),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
