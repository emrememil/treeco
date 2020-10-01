import 'package:flutter/material.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:treeco/core/base/view/base_widget.dart';
import 'package:treeco/core/constants/app/app_constants.dart';
import 'package:treeco/core/extension/string_extension.dart';
import 'package:treeco/view/achievements/model/achievements_model.dart';
import 'package:treeco/view/achievements/view_model/achievements_view_model.dart';
import 'package:treeco/view/constants/custom_icons.dart';
import 'package:treeco/view/constants/size_config.dart';

class AchievementsScreen extends StatefulWidget {
  @override
  _AchievementsScreenState createState() => _AchievementsScreenState();
}

class _AchievementsScreenState extends State<AchievementsScreen> {
  AchievementsModel _achievementsModel;
  AchievementsViewModel _achievementsViewModel;
  final GlobalKey<AnimatedCircularChartState> _chartKey = new GlobalKey<AnimatedCircularChartState>();

  @override
  Widget build(BuildContext context) {
    return BaseView<AchievementsViewModel>(
      viewModel: AchievementsViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        _achievementsViewModel = model;
        _achievementsViewModel.calculateChart();
      },
      onPageBuilder: (context, value) => body,
    );
  }

  get body => Scaffold(
        appBar: appBar,
        backgroundColor: Color(ApplicationConstants.BACKGROUND_COLOR),
        body: Column(
          children: <Widget>[
            SizedBox(
              height: SizeConfig.getProportionateScreenHeight(8),
            ),
            Expanded(
              child: ListView.builder(
                    itemCount: _achievementsViewModel.achievementsList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(top:SizeConfig.getProportionateScreenHeight(8)),
                        child: Container(
                          width: SizeConfig.screenWidth,
                          height: SizeConfig.getProportionateScreenHeight(75),
                          color: Color(0xff0B806E),
                          child: Center(
                            child: ListTile(
                                leading: Image(
                                  //width: SizeConfig.getProportionateScreenWidth(60),
                                  image: AssetImage(_achievementsViewModel
                                      .achievementsList[index].imagePath),
                                ),
                                title: Text(
                                  _achievementsViewModel
                                      .achievementsList[index].title,
                                  style: TextStyle(
                                      fontSize:
                                          SizeConfig.getProportionateScreenWidth(
                                              14),
                                      color: Colors.white,
                                      fontFamily: ApplicationConstants.FONT_FAMILY),
                                ),
                                subtitle: Row(
                                  children: <Widget>[
                                    Text(
                                      "Ödül:",
                                      style: TextStyle(
                                          fontSize: SizeConfig
                                              .getProportionateScreenWidth(11),
                                          color: Colors.white,
                                          fontFamily:
                                              ApplicationConstants.FONT_FAMILY2),
                                    ),
                                    SizedBox(
                                      width:
                                          SizeConfig.getProportionateScreenWidth(8),
                                    ),
                                    Icon(
                                      CustomIcons.coin,
                                      color: Color(0xffF6C358),
                                      size: SizeConfig.getProportionateScreenWidth(
                                          12),
                                    ),
                                    SizedBox(
                                      width:
                                          SizeConfig.getProportionateScreenWidth(4),
                                    ),
                                    Text(
                                      _achievementsViewModel
                                          .achievementsList[index].prizeCoin
                                          .toString(),
                                      style: TextStyle(
                                          fontSize: SizeConfig
                                              .getProportionateScreenWidth(11),
                                          color: Colors.white,
                                          fontFamily:
                                              ApplicationConstants.FONT_FAMILY),
                                    ),
                                  ],
                                ),
                              trailing: AnimatedCircularChart(
                                size: Size(SizeConfig.getProportionateScreenWidth(60),
                                    SizeConfig.getProportionateScreenHeight(60)),
                                initialChartData: <CircularStackEntry>[
                                  new CircularStackEntry(
                                    <CircularSegmentEntry>[
                                      new CircularSegmentEntry(
                                        _achievementsViewModel.achievementsList[index].completedChart,
                                        Color(0xff1ABC9C),
                                        rankKey: 'completed',
                                      ),
                                      new CircularSegmentEntry(
                                       _achievementsViewModel.achievementsList[index].remainingChart,
                                        Colors.white,
                                        rankKey: 'remaining',
                                      ),
                                    ],
                                    rankKey: 'progress',
                                  ),
                                ],
                                chartType: CircularChartType.Radial,
                                percentageValues: true,
                                holeLabel: '${_achievementsViewModel.counterOfConsecutiveDays.toString()}/${_achievementsViewModel.achievementsList[index].holeLabel.toString()}',
                                labelStyle:  TextStyle(
                                  fontSize: SizeConfig
                                  .getProportionateScreenWidth(16),
                                color: Colors.white,
                                fontFamily:
                                ApplicationConstants.FONT_FAMILY),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ]),
      );

  AppBar get appBar {
    return AppBar(
      backgroundColor: Color(ApplicationConstants.BACKGROUND_COLOR),
      elevation: 4,
      iconTheme: IconThemeData(color: Colors.white),
      title: Text(
        'achievements'.locale,
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
