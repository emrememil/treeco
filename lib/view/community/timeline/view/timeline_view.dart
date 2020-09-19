import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:treeco/core/base/view/base_widget.dart';
import 'package:treeco/core/constants/app/app_constants.dart';
import 'package:treeco/view/community/timeline/model/timeline_model.dart';
import 'package:treeco/view/community/timeline/view_model/timeline_view_model.dart';
import 'package:treeco/core/extension/string_extension.dart';
import 'package:treeco/view/constants/custom_icons.dart';
import 'package:treeco/view/constants/size_config.dart';

class TimelineScreen extends StatefulWidget {
  @override
  _TimelineScreenState createState() => _TimelineScreenState();
}

class _TimelineScreenState extends State<TimelineScreen> {
  TimelineModel timelineModel;
  TimelineViewModel timelineViewModel;

  @override
  Widget build(BuildContext context) {
    return BaseView<TimelineViewModel>(
      viewModel: TimelineViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        timelineViewModel = model;
      },
      onPageBuilder: (context, value) => body,
    );
  }

  get body => Scaffold(
      appBar: appBar,
      backgroundColor: Color(0xff0B806E),
      body: Column(
        children: <Widget>[
          SizedBox(height: 8,),
          Expanded(
            child: ListView.builder(
                itemCount: timelineViewModel.timeline.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: SizeConfig.getProportionateScreenWidth(8),
                    vertical: SizeConfig.getProportionateScreenHeight(4)),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.white70, width: 0.5),
                        borderRadius: BorderRadius.circular(15)
                      ),
                      elevation: 4,
                      color: Color(0xff3D9886),
                      child: ListTile(
                        leading: CircleAvatar(radius: SizeConfig.getProportionateScreenWidth(25),
                          backgroundImage: AssetImage(
                              timelineViewModel.timeline[index].profilePicture),
                        ),
                        title: Row(
                          children: <Widget>[
                            Text(
                              timelineViewModel.timeline[index].name,
                              style: TextStyle(
                                  fontSize:
                                  SizeConfig.getProportionateScreenWidth(14),
                                  color: Colors.greenAccent.shade100,
                                  fontFamily: ApplicationConstants.FONT_FAMILY),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: SizeConfig.getProportionateScreenWidth(12)),
                              child: Container(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: SizeConfig.getProportionateScreenWidth(4)),
                                  child: Text(
                                    formatDate(timelineViewModel.timeline[index].date, [dd, '.', mm, '.',yyyy]),
                                    style: TextStyle(
                                        fontSize:
                                        SizeConfig.getProportionateScreenWidth(10),
                                        color: Color(0xffA0EFB7),
                                        fontFamily: ApplicationConstants.FONT_FAMILY),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Color(0xffA0EFB7),
                                  width: 0.5)
                                ),

                              ),
                            ),
                          ],
                        ),
                        subtitle: Padding(
                          padding: EdgeInsets.only(top:SizeConfig.getProportionateScreenHeight(8),
                          bottom: SizeConfig.getProportionateScreenHeight(8)),
                          child: Text(
                            timelineViewModel.timeline[index].message,
                            style: TextStyle(
                                fontSize:
                                    SizeConfig.getProportionateScreenWidth(14),
                                color: Colors.white,
                                fontFamily: ApplicationConstants.FONT_FAMILY2),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ));

  AppBar get appBar {
    return AppBar(
      backgroundColor: Color(0xff0B806E),
      elevation: 4,
      iconTheme: IconThemeData(color: Colors.white),
      title: Text(
        'timeLine'.locale,
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
                  child:Icon(CustomIcons.coin,color: Color(0xffF6C358),size: SizeConfig.getProportionateScreenWidth(16),)
              ),
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
