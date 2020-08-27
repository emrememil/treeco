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
      statusBarColor: Color(ApplicationConstants.BACKGROUND_COLOR2),
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
          key: _scaffoldKey,
          appBar: AppBar(
            backgroundColor: Color(ApplicationConstants.BACKGROUND_COLOR2),
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.white),
            leading: Padding(
              padding: EdgeInsets.only(left: SizeConfig.getProportionateScreenWidth(10)),
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
          ),
          drawer: MainDrawer(),
          body: Container(
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight,
            color: Color(ApplicationConstants.BACKGROUND_COLOR2),
          ),
        ),
      );

  Padding get coinIconActions {
    return Padding(
      padding: EdgeInsets.only(
        right: SizeConfig.getProportionateScreenWidth(16),
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: SizeConfig.getProportionateScreenWidth(55),
            height: SizeConfig.getProportionateScreenHeight(32),
            decoration: BoxDecoration(
                color: Color(0xff3C7A65),
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 2.0),
                  child: Icon(
                    CustomIcons.coin,
                    size: SizeConfig.getProportionateScreenHeight(28),
                    color: Colors.orange,
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
}
