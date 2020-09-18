import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:treeco/core/base/view/base_widget.dart';
import 'package:treeco/core/constants/app/app_constants.dart';
import 'package:treeco/core/extension/string_extension.dart';
import 'package:treeco/view/community/leaderboard/model/leaderboard_model.dart';
import 'package:treeco/view/community/leaderboard/view_model/leaderboard_view_model.dart';
import 'package:treeco/view/constants/size_config.dart';

class LeaderBoardScreen extends StatefulWidget {
  @override
  _LeaderBoardScreenState createState() => _LeaderBoardScreenState();
}

class _LeaderBoardScreenState extends State<LeaderBoardScreen> {
  LeaderBoardModel leaderBoardModel;
  LeaderBoardViewModel leaderBoardViewModel;

  @override
  Widget build(BuildContext context) {
    return BaseView<LeaderBoardViewModel>(
      viewModel: LeaderBoardViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        leaderBoardViewModel = model;
      },
      onPageBuilder: (context, value) => body,
    );
  }

  get body => Scaffold(
        appBar: appBar,
        body: Column(
          children: <Widget>[
            allHeroesText,
            Expanded(
              child: ListView.builder(
                  itemCount: leaderBoardViewModel.leaderBoard.length,
                  itemBuilder: (context, index) {
                    return (leaderBoardViewModel.leaderBoard.length - 1 !=
                            index)
                        ? Card(
                            child: ListTile(
                              leading: leadingRow(index),
                              title: nameTitle(index),
                              subtitle: usernameSubtitle(index),
                              trailing: statisticsTrailing(index),
                            ),
                          )
                        : Card(
                            color: Color(ApplicationConstants.BACKGROUND_COLOR),
                            child: ListTile(
                              leading: leadingRow(index),
                              title: nameTitle(index),
                              subtitle: usernameSubtitle(index),
                              trailing: statisticsTrailing(index),
                            ),
                          );
                  }),
            )
          ],
        ),
      );

  Row leadingRow(int index) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          (index + 1).toString(),
          style: TextStyle(
              fontSize: SizeConfig.getProportionateScreenWidth(22),
              color: (leaderBoardViewModel.leaderBoard.length - 1 != index)
                  ? Color(ApplicationConstants.TEXT_GREY)
                  : Colors.white,
              fontFamily: ApplicationConstants.FONT_FAMILY2),
        ),
        Padding(
          padding:
              EdgeInsets.only(left: SizeConfig.getProportionateScreenWidth(16)),
          child: CircleAvatar(
            backgroundImage: AssetImage(
                leaderBoardViewModel.leaderBoard[index].profilePicture),
          ),
        ),
      ],
    );
  }

  Row statisticsTrailing(int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding:
              EdgeInsets.only(right: SizeConfig.getProportionateScreenWidth(8)),
          child: Row(
            children: <Widget>[
              Icon(
                MdiIcons.pineTree,
                color: (leaderBoardViewModel.leaderBoard.length - 1 != index)
                    ? Color(ApplicationConstants.BACKGROUND_COLOR2)
                    : Colors.white,
                size: SizeConfig.getProportionateScreenWidth(21),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: SizeConfig.getProportionateScreenWidth(3)),
                child: Text(
                    leaderBoardViewModel.leaderBoard[index].plantedTree
                        .toString(),
                    style: TextStyle(
                        fontSize: SizeConfig.getProportionateScreenWidth(13),
                        color: (leaderBoardViewModel.leaderBoard.length - 1 !=
                                index)
                            ? Color(ApplicationConstants.BACKGROUND_COLOR2)
                            : Colors.white,
                        fontFamily: ApplicationConstants.FONT_FAMILY)),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: SizeConfig.getProportionateScreenWidth(8),
                ),
                child: ImageIcon(
                  AssetImage('assets/icons/coin.png'), //CustomIcons.coin,
                  size: SizeConfig.getProportionateScreenHeight(20),
                  color: Colors.yellow.shade700,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: SizeConfig.getProportionateScreenWidth(4),
                ),
                child: Text(
                  leaderBoardViewModel.leaderBoard[index].coin.toString(),
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

  Text usernameSubtitle(int index) {
    return Text(
      "@${leaderBoardViewModel.leaderBoard[index].username}",
      style: TextStyle(
          fontSize: SizeConfig.getProportionateScreenWidth(11),
          color: (leaderBoardViewModel.leaderBoard.length - 1 != index)
              ? Color(ApplicationConstants.TEXT_GREY)
              : Colors.white,
          fontFamily: ApplicationConstants.FONT_FAMILY),
    );
  }

  Text nameTitle(int index) {
    return Text(
      leaderBoardViewModel.leaderBoard[index].name,
      style: TextStyle(
          fontSize: SizeConfig.getProportionateScreenWidth(14),
          color: (leaderBoardViewModel.leaderBoard.length - 1 != index)
              ? Colors.black
              : Colors.white,
          fontFamily: ApplicationConstants.FONT_FAMILY),
    );
  }

  AppBar get appBar {
    return AppBar(
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.black),
      title: Text(
        'leaderboard'.locale,
        style: TextStyle(
            fontSize: SizeConfig.getProportionateScreenWidth(14),
            color: Colors.black,
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
                color: Color(ApplicationConstants.BACKGROUND_COLOR2),
                size: SizeConfig.getProportionateScreenWidth(21),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: SizeConfig.getProportionateScreenWidth(3)),
                child: Text("5",
                    style: TextStyle(
                        fontSize: SizeConfig.getProportionateScreenWidth(13),
                        color: Colors.green,
                        fontFamily: ApplicationConstants.FONT_FAMILY)),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: SizeConfig.getProportionateScreenWidth(8),
                ),
                child: ImageIcon(
                  AssetImage('assets/icons/coin.png'), //CustomIcons.coin,
                  size: SizeConfig.getProportionateScreenHeight(20),
                  color: Colors.yellow.shade700,
                ),
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

  Padding get allHeroesText {
    return Padding(
      padding: EdgeInsets.all(SizeConfig.getProportionateScreenWidth(16)),
      child: Row(
        children: <Widget>[
          Text(
            'allHeroes'.locale,
            style: TextStyle(
                fontSize: SizeConfig.getProportionateScreenWidth(14),
                color: Colors.black87,
                fontFamily: ApplicationConstants.FONT_FAMILY),
          ),
          Text(
            " (${leaderBoardViewModel.leaderBoard.length.toString()})",
            style: TextStyle(
                fontSize: SizeConfig.getProportionateScreenWidth(14),
                color: Colors.black87,
                fontFamily: ApplicationConstants.FONT_FAMILY2),
          )
        ],
      ),
    );
  }
}
