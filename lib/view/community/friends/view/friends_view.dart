import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:treeco/core/base/view/base_widget.dart';
import 'package:treeco/core/constants/app/app_constants.dart';
import 'package:treeco/core/constants/navigation/navigation_constants.dart';
import 'package:treeco/core/extension/string_extension.dart';
import 'package:treeco/core/init/navigation/navigation_service.dart';
import 'package:treeco/view/community/friends/model/friends_model.dart';
import 'package:treeco/view/community/friends/view_model/friends_view_model.dart';
import 'package:treeco/view/constants/custom_icons.dart';
import 'package:treeco/view/constants/size_config.dart';

class FriendsScreen extends StatefulWidget {
  @override
  _FriendsScreenState createState() => _FriendsScreenState();
}

class _FriendsScreenState extends State<FriendsScreen> {
  FriendsModel friendsModel;
  FriendsViewModel friendsViewModel;

  @override
  Widget build(BuildContext context) {
    return BaseView<FriendsViewModel>(
      viewModel: FriendsViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        friendsViewModel = model;
      },
      onPageBuilder: (context, value) => body,
    );
  }

  get body => Scaffold(
        appBar: appBar,
        body: Column(
          children: <Widget>[
            familiarHeroesText,
            Expanded(
              child: ListView.builder(
                  itemCount: friendsViewModel.allFriend.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: SizeConfig.getProportionateScreenWidth(20),
                          backgroundImage: AssetImage(
                              friendsViewModel.allFriend[index].profilePicture),
                        ),
                        title: Text(friendsViewModel.allFriend[index].name,
                          style: TextStyle(
                              fontSize: SizeConfig.getProportionateScreenWidth(14),
                              color: Colors.black,
                              fontFamily: ApplicationConstants.FONT_FAMILY),),
                        subtitle: Padding(
                          padding: EdgeInsets.only(top: SizeConfig.getProportionateScreenHeight(2)),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                MdiIcons.pineTree,
                                color: Color(ApplicationConstants.BACKGROUND_COLOR2),
                                size: SizeConfig.getProportionateScreenWidth(21),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left:SizeConfig.getProportionateScreenWidth(3)),
                                child: Text(friendsViewModel.allFriend[index].plantedTree.toString(),
                                    style: TextStyle(
                                        fontSize: SizeConfig.getProportionateScreenWidth(13),
                                        color: Colors.green,
                                        fontFamily: ApplicationConstants.FONT_FAMILY)
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left:SizeConfig.getProportionateScreenWidth(8),),
                                child: Icon(CustomIcons.coin,color: Color(0xffF6C358),size: SizeConfig.getProportionateScreenWidth(16),)
                              ),
                              Padding(
                                padding: EdgeInsets.only(left:SizeConfig.getProportionateScreenWidth(4),),
                                child: Text(
                                  friendsViewModel.allFriend[index].coin.toString(),
                                  style: TextStyle(
                                      fontSize: SizeConfig.getProportionateScreenWidth(14),
                                      color: Color(0xffF6C358),
                                      fontFamily: ApplicationConstants.FONT_FAMILY),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      );

  Padding get familiarHeroesText {
    return Padding(
      padding: EdgeInsets.all(SizeConfig.getProportionateScreenWidth(16)),
      child: Row(
        children: <Widget>[
          Text(
            'familiarHeroes'.locale,
            style: TextStyle(
                fontSize: SizeConfig.getProportionateScreenWidth(14),
                color: Colors.black87,
                fontFamily: ApplicationConstants.FONT_FAMILY),
          ),
          Text(
            " (${friendsViewModel.allFriend.length.toString()})",
            style: TextStyle(
                fontSize: SizeConfig.getProportionateScreenWidth(14),
                color: Colors.black87,
                fontFamily: ApplicationConstants.FONT_FAMILY2),
          )
        ],
      ),
    );
  }

  AppBar get appBar {
    return AppBar(
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.black),
      title: Text(
        'friends'.locale,
        style: TextStyle(
            fontSize: SizeConfig.getProportionateScreenWidth(14),
            color: Colors.black,
            fontFamily: ApplicationConstants.FONT_FAMILY),
      ),
      actions: <Widget>[
        Padding(
          padding: EdgeInsets.only(
              right: SizeConfig.getProportionateScreenWidth(16)),
          child: Icon(
            Icons.notifications_none,
            color: Color(ApplicationConstants.LIGHT_GREEN),
            size: SizeConfig.getProportionateScreenWidth(20),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              right: SizeConfig.getProportionateScreenWidth(16)),
          child: InkWell(
            onTap: () => NavigationService.instance.navigateToPage(path: NavigationConstants.ADD_FRIENDS),
            child: Icon(
              Icons.person_add,
              color: Color(ApplicationConstants.LIGHT_GREEN),
              size: SizeConfig.getProportionateScreenWidth(20),
            ),
          ),
        ),
      ],
    );
  }
}
