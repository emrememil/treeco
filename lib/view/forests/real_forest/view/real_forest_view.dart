import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:treeco/core/base/view/base_widget.dart';
import 'package:treeco/core/constants/app/app_constants.dart';
import 'package:treeco/core/constants/navigation/navigation_constants.dart';
import 'package:treeco/core/extension/string_extension.dart';
import 'package:treeco/core/init/navigation/navigation_service.dart';
import 'package:treeco/view/constants/size_config.dart';
import 'package:treeco/view/forests/real_forest/model/real_forest_model.dart';
import 'package:treeco/view/forests/real_forest/view_model/real_forest_view_model.dart';

class RealForestScreen extends StatefulWidget {
  @override
  _RealForestScreenState createState() => _RealForestScreenState();
}

class _RealForestScreenState extends State<RealForestScreen> {
  RealForestModel _realForestModel;
  RealForestViewModel _realForestViewModel;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: BaseView<RealForestViewModel>(
        viewModel: RealForestViewModel(),
        onModelReady: (model) {
          model.setContext(context);
          _realForestViewModel = model;
        },
        onPageBuilder: (context, value) => body,
      ),
    );
  }

  get body => Scaffold(
        body: Column(
          children: <Widget>[
            topBodyImage,
            titleRealForest,
            subtitle,
            icons,
            divider,
            plantedStatistics,
            bottomRow,
          ],
        ),
      );

  Padding get divider {
    return Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.getProportionateScreenWidth(16),
                vertical: SizeConfig.getProportionateScreenHeight(24)),
            child: Divider(
              color: Colors.black54,
            ),
          );
  }

  Stack get topBodyImage {
    return Stack(
            children: <Widget>[
              Hero(
                tag: "realforest_background",
                child: Container(
                  width: SizeConfig.screenWidth,
                  height: SizeConfig.screenHeight / 2.1,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            "assets/images/realforest_background.jpg"),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              Positioned(
                left: SizeConfig.getProportionateScreenWidth(16),
                top: SizeConfig.getProportionateScreenHeight(48),
                child: GestureDetector(
                  child: Container(
                    width: SizeConfig.getProportionateScreenWidth(30),
                    height: SizeConfig.getProportionateScreenWidth(30),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black.withOpacity(0.7)),
                    child: Icon(
                      Icons.clear,
                      color: Colors.white,
                    ),
                  ),
                  onTap: ()=> NavigationService.instance.navigatePop()
                ),
              )
            ],
          );
  }

  Expanded get bottomRow {
    return Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Container(
                width: SizeConfig.screenWidth,
                height: SizeConfig.getProportionateScreenHeight(75),
                decoration: BoxDecoration(
                  border: Border(top: BorderSide(color: Colors.black38)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal:SizeConfig.getProportionateScreenWidth(8)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('plantRealTree'.locale,
                              style: TextStyle(
                                  fontSize: SizeConfig.getProportionateScreenWidth(14),
                                  color: Colors.black,
                                  fontFamily: ApplicationConstants.FONT_FAMILY2),),
                          Container(
                            width: SizeConfig.getProportionateScreenWidth(150),
                            child: Text('plantRealTreeProAccount'.locale,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: SizeConfig.getProportionateScreenWidth(9),
                                    color: Colors.black,
                                    fontFamily: ApplicationConstants.FONT_FAMILY2)),
                          ),

                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right:SizeConfig.getProportionateScreenWidth(8)),
                      child: InkWell(
                        onTap: () => NavigationService.instance.navigateToPage(path: NavigationConstants.STORE),
                        child: Container(
                          height: SizeConfig.getProportionateScreenHeight(55),
                          width: SizeConfig.getProportionateScreenWidth(150),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
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
                    )
                  ],
                ),
              ),
            ),
          );
  }

  Padding get subtitle {
    return Padding(
            padding: EdgeInsets.only(
                top: SizeConfig.getProportionateScreenHeight(8)),
            child: Text('loginAppEveryDay'.locale,
                style: TextStyle(
                    fontSize: SizeConfig.getProportionateScreenWidth(13),
                    color: Colors.black,
                    fontFamily: ApplicationConstants.FONT_FAMILY2)),
          );
  }

  Padding get titleRealForest {
    return Padding(
            padding: EdgeInsets.only(
                top: SizeConfig.getProportionateScreenHeight(16)),
            child: Text('realForest'.locale,
                style: TextStyle(
                    fontSize: SizeConfig.getProportionateScreenWidth(21),
                    color: Colors.black,
                    fontFamily: ApplicationConstants.FONT_FAMILY)),
          );
  }

  Padding get icons {
    return Padding(
            padding: EdgeInsets.only(
                top: SizeConfig.getProportionateScreenHeight(32)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.info_outline,
                    size: SizeConfig.getProportionateScreenWidth(26),
                    color: Colors.black87),
                SizedBox(
                  width: SizeConfig.getProportionateScreenWidth(32),
                ),
                Icon(
                  Icons.share,
                  size: SizeConfig.getProportionateScreenWidth(26),
                  color: Colors.black87,
                ),
              ],
            ),
          );
  }

  Padding get plantedStatistics {
    return Padding(
            padding: EdgeInsets.symmetric(horizontal:SizeConfig.getProportionateScreenWidth(8)),
            child: Observer(
              builder:(context) => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Text(
                          _realForestViewModel.byYou.toString(),
                          style: TextStyle(
                              fontSize:
                              SizeConfig.getProportionateScreenWidth(28),
                              color: Colors.black,
                              fontFamily: ApplicationConstants.FONT_FAMILY),
                        ),
                        Text(
                          'byYou'.locale,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize:
                              SizeConfig.getProportionateScreenWidth(12),
                              color: Colors.black,
                              fontFamily: ApplicationConstants.FONT_FAMILY2),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Text(
                          _realForestViewModel.byYourFriends.toString(),
                          style: TextStyle(
                              fontSize:
                              SizeConfig.getProportionateScreenWidth(28),
                              color: Colors.black,
                              fontFamily: ApplicationConstants.FONT_FAMILY),
                        ),
                        Text(
                          'byYourFriends'.locale,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize:
                              SizeConfig.getProportionateScreenWidth(12),
                              color: Colors.black,
                              fontFamily: ApplicationConstants.FONT_FAMILY2),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Text(
                          _realForestViewModel.byEveryone.toString(),
                          style: TextStyle(
                              fontSize:
                              SizeConfig.getProportionateScreenWidth(28),
                              color: Colors.black,
                              fontFamily: ApplicationConstants.FONT_FAMILY),
                        ),
                        Text(
                          'byEveryone'.locale,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize:
                              SizeConfig.getProportionateScreenWidth(12),
                              color: Colors.black,
                              fontFamily: ApplicationConstants.FONT_FAMILY2),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
  }
}
