import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:treeco/core/base/state/base_state.dart';
import 'package:treeco/core/base/view/base_widget.dart';
import 'package:treeco/core/constants/app/app_constants.dart';
import 'package:treeco/view/constants/custom_icons.dart';
import 'package:treeco/view/constants/drawer/drawer.dart';
import 'package:treeco/view/constants/size_config.dart';
import 'package:treeco/view/home/model/home_model.dart';
import 'package:treeco/view/home/view_model/home_view_model.dart';
import 'package:treeco/core/extension/string_extension.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseState<HomeScreen> {
  HomeViewModel homeViewModel;
  HomeModel homeModel;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(ApplicationConstants.BACKGROUND_COLOR),
    ));
    return BaseView<HomeViewModel>(
      viewModel: HomeViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        homeViewModel = model;
      },
      onPageBuilder: (context, value) => body,
    );
  }

  get body => SafeArea(
        child: Scaffold(
          backgroundColor: Color(ApplicationConstants.BACKGROUND_COLOR),
          key: _scaffoldKey,
          appBar: appBar,
          drawer: MainDrawer(),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              statisticsText,
              statisticsContainer,
              plantText,
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: SizeConfig.screenWidth -
                      SizeConfig.getProportionateScreenWidth(46),
                  height: SizeConfig.screenHeight / 4,
                  decoration: BoxDecoration(
                    color: Color(0xff11806F),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 0,
                        blurRadius: 2,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Row(
                    children: <Widget>[
                      Image.asset(
                        'assets/icons/coin.png',
                        width: SizeConfig.screenWidth / 4,
                        height: SizeConfig.screenHeight / 7,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );

  AppBar get appBar {
    return AppBar(
          backgroundColor: Color(ApplicationConstants.BACKGROUND_COLOR),
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
          leading: Padding(
            padding: EdgeInsets.only(
                left: SizeConfig.getProportionateScreenWidth(10)),
            child: IconButton(
              icon: Icon(
                Icons.menu,
                size: SizeConfig.getProportionateScreenHeight(40),
                color: Colors.white,
              ),
              onPressed: () => _scaffoldKey.currentState.openDrawer(),
            ),
          ),
          actions: <Widget>[coinIconActions],
        );
  }

  Align get statisticsContainer {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width:
            SizeConfig.screenWidth - SizeConfig.getProportionateScreenWidth(46),
        height: SizeConfig.getProportionateScreenHeight(65),
        decoration: BoxDecoration(
          color: Color(0xff58B294),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 0,
              blurRadius: 2,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: SizeConfig.screenWidth / 2.5,
                height: 40,
                decoration: BoxDecoration(
                  color: Color(0xff11806F),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'myRank'.locale,
                        style: TextStyle(
                          fontSize: SizeConfig.getProportionateScreenWidth(14),
                          color: Colors.white,
                          fontFamily: ApplicationConstants.FONT_FAMILY,
                        ),
                      ),
                    ),
                    Text(
                      "112.765",
                      style: TextStyle(
                        fontSize: SizeConfig.getProportionateScreenWidth(14),
                        color: Color(0xff2EE574),
                        fontFamily: ApplicationConstants.FONT_FAMILY,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: 90,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    //Icon(MdiIcons.pineTree, color: Colors.green,)
                    Image.asset(
                      'assets/icons/tree.png',
                      width: SizeConfig.getProportionateScreenWidth(24),
                      height: SizeConfig.getProportionateScreenHeight(24),
                    ),
                    Text(
                      "412",
                      style: TextStyle(
                        fontSize: SizeConfig.getProportionateScreenWidth(17),
                        color: Colors.green,
                        fontFamily: ApplicationConstants.FONT_FAMILY,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding get statisticsText {
    return Padding(
      padding: EdgeInsets.only(
          left: SizeConfig.getProportionateScreenWidth(25), top: 10, bottom: 5),
      child: Text(
        'statistics'.locale,
        style: TextStyle(
          fontSize: SizeConfig.getProportionateScreenWidth(14),
          color: Colors.white,
          fontFamily: ApplicationConstants.FONT_FAMILY,
        ),
      ),
    );
  }

  Padding get coinIconActions {
    return Padding(
      padding: EdgeInsets.only(
        right: SizeConfig.getProportionateScreenWidth(16),
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: SizeConfig.getProportionateScreenWidth(65),
            height: SizeConfig.getProportionateScreenHeight(32),
            decoration: BoxDecoration(
                color: Color(0xff3C7A65),
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: ImageIcon(
                    AssetImage('assets/icons/coin.png'), //CustomIcons.coin,
                    size: SizeConfig.getProportionateScreenHeight(20),
                    color: Colors.yellow.shade700,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    "3",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: ApplicationConstants.FONT_FAMILY,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Padding get plantText {
    return Padding(
      padding: EdgeInsets.only(
          left: SizeConfig.getProportionateScreenWidth(25), top: 20, bottom: 5),
      child: Text(
        "Bugün bir ağaç dik!",
        style: TextStyle(
          fontSize: SizeConfig.getProportionateScreenWidth(14),
          color: Colors.white,
          fontFamily: ApplicationConstants.FONT_FAMILY,
        ),
      ),
    );
  }
}

class PlantOptions extends StatelessWidget {
  final String text, imagePath;

  const PlantOptions({Key key, this.text, this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
