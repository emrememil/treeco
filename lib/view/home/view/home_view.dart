import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:lottie/lottie.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:treeco/core/base/state/base_state.dart';
import 'package:treeco/core/base/view/base_widget.dart';
import 'package:treeco/core/constants/app/app_constants.dart';
import 'package:treeco/view/constants/custom_icons.dart';
import 'package:treeco/view/constants/drawer/drawer.dart';
import 'package:treeco/view/constants/size_config.dart';
import 'package:treeco/view/home/model/current_project_data.dart';
import 'package:treeco/view/home/model/home_model.dart';
import 'package:treeco/view/home/model/plant_options_data.dart';
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
              statisticsContainer,
              plantOptionsContainer,
              currentProjectContainer
            ],
          ),
        ),
      );

  Expanded get currentProjectContainer {
    return Expanded(
      child: Align(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            projectText,
            Container(
              width: SizeConfig.screenWidth -
                  SizeConfig.getProportionateScreenWidth(32),
              height: SizeConfig.screenHeight / 3.8,
              decoration: BoxDecoration(
                color: Color(0xff92BEA7),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Swiper(
                  itemCount: currentProjects.length,
                  layout: SwiperLayout.DEFAULT,
                  pagination: SwiperPagination(
                      builder: DotSwiperPaginationBuilder(
                          space: 3,
                          size: 6,
                          activeColor: Color(ApplicationConstants.DARK_GREEN))),
                  itemBuilder: (context, index) {
                    return Column(
                      children: <Widget>[
                        titleProject(index),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            mapImageProjectContainer(index),
                            infoProject(index)
                          ],
                        )
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Padding titleProject(int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        currentProjects[index].title,
        style: TextStyle(
            fontSize: SizeConfig.getProportionateScreenWidth(14),
            color: Colors.white,
            fontFamily: ApplicationConstants.FONT_FAMILY),
      ),
    );
  }

  Padding mapImageProjectContainer(int index) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.getProportionateScreenWidth(16), vertical: SizeConfig.getProportionateScreenHeight(8)),
      child: Image.asset(currentProjects[index].imagePath),
    );
  }

  Padding infoProject(int index) {
    return Padding(
      padding: EdgeInsets.only(left: 32),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(
                  MdiIcons.pineTree,
                  color: Colors.green.shade900,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text(
                    currentProjects[index].woodland,
                    style: TextStyle(
                        fontSize: SizeConfig.getProportionateScreenWidth(14),
                        color: Colors.black,
                        fontFamily: ApplicationConstants.FONT_FAMILY),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: SizeConfig.getProportionateScreenHeight(8)),
              child: Row(
                children: <Widget>[
                  Icon(Icons.people, color: Colors.green.shade900),
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      currentProjects[index].population,
                      style: TextStyle(
                          fontSize: SizeConfig.getProportionateScreenWidth(14),
                          color: Colors.black,
                          fontFamily: ApplicationConstants.FONT_FAMILY),
                    ),
                  )
                ],
              ),
            ),
            buttonDetailProject,
          ],
        ),
      ),
    );
  }

  Padding get buttonDetailProject {
    return Padding(
      padding: EdgeInsets.only(top: SizeConfig.getProportionateScreenHeight(16)),
      child: Container(
        height: SizeConfig.getProportionateScreenHeight(30),
        child: RaisedButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: Color(0xff64CBA9),
          onPressed: () {},
          child: Text(
            'details'.locale,
            style: TextStyle(
                color: Colors.white,
                fontFamily: ApplicationConstants.FONT_FAMILY),
          ),
        ),
      ),
    );
  }

  Expanded get plantOptionsContainer {
    return Expanded(
      child: Align(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            plantText,
            Container(
                width: SizeConfig.screenWidth -
                    SizeConfig.getProportionateScreenWidth(32),
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
                child: Swiper(
                  itemCount: plantOptions.length,
                  layout: SwiperLayout.DEFAULT,
                  pagination: SwiperPagination(
                      builder: DotSwiperPaginationBuilder(
                          space: 3,
                          size: 6,
                          activeColor: Color(ApplicationConstants.DARK_GREEN))),
                  itemBuilder: (context, index) {
                    return Row(
                      children: <Widget>[
                        Lottie.asset(plantOptions[index].imagePath,
                            fit: BoxFit.fill,
                            width: SizeConfig.getProportionateScreenWidth(150)),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              plantOptions[index].text,
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: ApplicationConstants.FONT_FAMILY2,
                                fontSize:
                                    SizeConfig.getProportionateScreenWidth(15),
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                  },
                )),
          ],
        ),
      ),
    );
  }

  AppBar get appBar {
    return AppBar(
      backgroundColor: Color(ApplicationConstants.BACKGROUND_COLOR),
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
      leading: Padding(
        padding:
            EdgeInsets.only(left: SizeConfig.getProportionateScreenWidth(10)),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          statisticsText,
          Container(
            width: SizeConfig.screenWidth -
                SizeConfig.getProportionateScreenWidth(32),
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
                              fontSize:
                                  SizeConfig.getProportionateScreenWidth(14),
                              color: Colors.white,
                              fontFamily: ApplicationConstants.FONT_FAMILY,
                            ),
                          ),
                        ),
                        Text(
                          "112.765",
                          style: TextStyle(
                            fontSize:
                                SizeConfig.getProportionateScreenWidth(14),
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
                            fontSize:
                                SizeConfig.getProportionateScreenWidth(17),
                            color: Color(ApplicationConstants.LIGHT_GREEN),
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
        ],
      ),
    );
  }

  Padding get statisticsText {
    return Padding(
      padding: EdgeInsets.only(
          left: SizeConfig.getProportionateScreenWidth(8), top: SizeConfig.getProportionateScreenHeight(10), bottom: 5),
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
          left: SizeConfig.getProportionateScreenWidth(8),
          top: SizeConfig.getProportionateScreenHeight(28),
          bottom: 5),
      child: Text(
        'plantATreeToday'.locale,
        style: TextStyle(
          fontSize: SizeConfig.getProportionateScreenWidth(14),
          color: Colors.white,
          fontFamily: ApplicationConstants.FONT_FAMILY,
        ),
      ),
    );
  }

  Padding get projectText {
    return Padding(
      padding: EdgeInsets.only(
          left: SizeConfig.getProportionateScreenWidth(8), top: 2, bottom: 2),
      child: Text(
        'currentProjects'.locale,
        style: TextStyle(
          fontSize: SizeConfig.getProportionateScreenWidth(14),
          color: Colors.white,
          fontFamily: ApplicationConstants.FONT_FAMILY,
        ),
      ),
    );
  }
}