import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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

        final barGroup1 = forestViewModel.makeGroupData(0, 1, 12);
        final barGroup2 = forestViewModel.makeGroupData(1, 16, 12);
        final barGroup3 = forestViewModel.makeGroupData(2, 18, 5);
        final barGroup4 = forestViewModel.makeGroupData(3, 20, 16);
        final barGroup5 = forestViewModel.makeGroupData(4, 17, 6);
        final barGroup6 = forestViewModel.makeGroupData(5, 19, 1.5);
        final barGroup7 = forestViewModel.makeGroupData(6, 10, 1.5);

        final items = [
          barGroup1,
          barGroup2,
          barGroup3,
          barGroup4,
          barGroup5,
          barGroup6,
          barGroup7,
        ];

        forestViewModel.rawBarGroups = items;

        forestViewModel.showingBarGroups = forestViewModel.rawBarGroups;
      },
      onPageBuilder: (context, value) => body,
    );
  }

  get body => Scaffold(
        backgroundColor: Color(0xffFCFCFC),
        appBar: appBar,
        body: SingleChildScrollView(
          child: Align(
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      height: SizeConfig.screenHeight / 3.5,
                      width: SizeConfig.screenWidth,
                      decoration: BoxDecoration(
                        color: Color(ApplicationConstants.BACKGROUND_COLOR),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: SizeConfig.getProportionateScreenWidth(32),
                            top: SizeConfig.getProportionateScreenHeight(16)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'treePlantingSituation'.locale,
                              style: TextStyle(
                                  fontSize:
                                  SizeConfig.getProportionateScreenWidth(21),
                                  color: Colors.white,
                                  fontFamily: ApplicationConstants.FONT_FAMILY),
                            ),
                            Text(
                              'lastWeekChart'.locale,
                              style: TextStyle(
                                  fontSize:
                                  SizeConfig.getProportionateScreenWidth(14),
                                  color: Colors.white,
                                  fontFamily: ApplicationConstants.FONT_FAMILY),
                            ),
                          ],
                        )
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: SizeConfig.screenHeight / 9),
                      child: Align(
                          alignment: Alignment.bottomCenter, child: Chart),
                    )
                  ],
                ),
                treeCountContainer,
                changeRealTreeContainer,

                //Chart,
              ],
            ),
          ),
        ),
      );

  get Chart {
    return Container(
      width:
          SizeConfig.screenWidth - SizeConfig.getProportionateScreenWidth(50),
      height: SizeConfig.screenHeight / 2.9,
      child: AspectRatio(
        aspectRatio: 1.4,
        child: Card(
          elevation: 2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          //color: const Color(0xff0D6C5E),
          color: Color(0xffF8F8F8),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                      left: SizeConfig.getProportionateScreenWidth(16),
                      top: SizeConfig.getProportionateScreenHeight(8)),
                  child: chartTitleRow,
                ),
                const SizedBox(
                  height: 38,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Observer(
                      builder: (context) => BarChart(
                        BarChartData(
                            barTouchData: BarTouchData(
                              touchTooltipData: BarTouchTooltipData(
                                tooltipBgColor: Colors.grey,
                                getTooltipItem: (_a, _b, _c, _d) => null,
                              ),
                              touchCallback: (response) {
                                if (response.spot == null) {
                                  forestViewModel.touchedGroupIndex = -1;
                                  forestViewModel.showingBarGroups =
                                      List.of(forestViewModel.rawBarGroups);
                                  return;
                                }
                                forestViewModel.touchedGroupIndex =
                                    response.spot.touchedBarGroupIndex;

                                if (response.touchInput is FlLongPressEnd ||
                                    response.touchInput is FlPanEnd) {
                                  forestViewModel.touchInputIf();
                                } else {
                                  forestViewModel.touchInputElse();
                                }
                              },
                            ),
                            titlesData: FlTitlesData(
                                show: true,
                                bottomTitles: SideTitles(
                                  showTitles: true,
                                  textStyle: TextStyle(
                                      fontSize: SizeConfig
                                          .getProportionateScreenWidth(11),
                                      color: Colors.black,
                                      fontFamily:
                                          ApplicationConstants.FONT_FAMILY),
                                  margin:
                                      SizeConfig.getProportionateScreenWidth(
                                          10),
                                  getTitles: (double value) {
                                    return forestViewModel.getTitlesData(value);
                                  },
                                ),
                                leftTitles: SideTitles(
                                    showTitles: true,
                                    textStyle: TextStyle(
                                        fontSize: SizeConfig
                                            .getProportionateScreenWidth(13),
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontFamily:
                                            ApplicationConstants.FONT_FAMILY2),
                                    margin:
                                        SizeConfig.getProportionateScreenWidth(
                                            24),
                                    reservedSize:
                                        SizeConfig.getProportionateScreenWidth(
                                            10),
                                    getTitles: (value) {
                                      return forestViewModel
                                          .leftGetTitles(value);
                                    })),
                            borderData: FlBorderData(
                              show: false,
                            ),
                            barGroups: forestViewModel.showingBarGroups),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.getProportionateScreenWidth(12),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row get chartTitleRow {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          width: SizeConfig.getProportionateScreenWidth(2),
        ),
        Container(
          width: SizeConfig.getProportionateScreenWidth(10),
          height: SizeConfig.getProportionateScreenWidth(10),
          color: Color(0xffF6C358),
        ),
        Padding(
          padding:
              EdgeInsets.only(left: SizeConfig.getProportionateScreenWidth(4)),
          child: Text(
            'forest'.locale,
            style: TextStyle(
                fontSize: SizeConfig.getProportionateScreenWidth(10),
                color: Colors.black,
                fontFamily: ApplicationConstants.FONT_FAMILY),
          ),
        ),
        SizedBox(
          width: SizeConfig.getProportionateScreenWidth(8),
        ),
        Container(
          width: SizeConfig.getProportionateScreenWidth(10),
          height: SizeConfig.getProportionateScreenWidth(10),
          color: Color(0xff50A387),
        ),
        Padding(
          padding:
              EdgeInsets.only(left: SizeConfig.getProportionateScreenWidth(4)),
          child: Text(
            'realForest'.locale,
            style: TextStyle(
                fontSize: SizeConfig.getProportionateScreenWidth(10),
                color: Colors.black,
                fontFamily: ApplicationConstants.FONT_FAMILY),
          ),
        ),
      ],
    );
  }

  Padding get changeRealTreeContainer {
    return Padding(
      padding:
          EdgeInsets.only(top: SizeConfig.getProportionateScreenHeight(16)),
      child: Container(
        width:
            SizeConfig.screenWidth - SizeConfig.getProportionateScreenWidth(50),
        height: SizeConfig.getProportionateScreenHeight(70),
        decoration: BoxDecoration(
          color: Color(0xff468773),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              width: SizeConfig.getProportionateScreenWidth(40),
              height: SizeConfig.getProportionateScreenHeight(40),
              decoration: BoxDecoration(
                color: Color(0xffF8F8F8).withOpacity(0.5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(MdiIcons.treeOutline, color: Color(0xff468773)),
            ),
            Padding(
              padding: EdgeInsets.only(
                  //left: SizeConfig.getProportionateScreenWidth(8),
                  right: SizeConfig.getProportionateScreenWidth(8)),
              child: Text(
                'turnItIntoRealTree'.locale,
                style: TextStyle(
                    fontSize: SizeConfig.getProportionateScreenWidth(14),
                    color: Colors.white,
                    fontFamily: ApplicationConstants.FONT_FAMILY),
              ),
            ),
            Container(
              width: SizeConfig.getProportionateScreenWidth(35),
              height: SizeConfig.getProportionateScreenHeight(35),
              decoration: BoxDecoration(
                color: Color(0xffF8F8F8),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(Icons.arrow_forward_ios, color: Color(0xff468773),),
            )
          ],
        ),
      ),
    );
  }

  get treeCountContainer {
    return Padding(
      padding:
          EdgeInsets.only(top: SizeConfig.getProportionateScreenHeight(16)),
      child: Container(
        width:
            SizeConfig.screenWidth - SizeConfig.getProportionateScreenWidth(24),
        height: SizeConfig.screenHeight / 3.5,
        decoration: BoxDecoration(
          color: Color(ApplicationConstants.BACKGROUND_COLOR2),
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
              image: AssetImage("assets/images/forest_background.png"),
              fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              'numberOfTreeVirtualForest'.locale,
              style: TextStyle(
                  fontSize: SizeConfig.getProportionateScreenWidth(16),
                  color: Colors.white,
                  fontFamily: ApplicationConstants.FONT_FAMILY2),
            ),
            Padding(
              padding: EdgeInsets.only(bottom:SizeConfig.getProportionateScreenHeight(32)),
              child: Container(
                height: SizeConfig.getProportionateScreenWidth(80),
                width: SizeConfig.getProportionateScreenWidth(80),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(ApplicationConstants.BACKGROUND_COLOR)
                      .withOpacity(0.3),
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
            ),
            //raisedButton,
          ],
        ),
      ),
    );
  }


  AppBar get appBar {
    return AppBar(
      //backgroundColor: Color(0xff0B806E),
      backgroundColor: Color(ApplicationConstants.BACKGROUND_COLOR),
      elevation: 0,
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
