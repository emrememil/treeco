import 'package:flutter/material.dart';
import 'package:treeco/core/constants/enums/device_screen_type.dart';
import 'package:treeco/core/constants/navigation/navigation_constants.dart';
import 'package:treeco/core/extension/string_extension.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:treeco/core/base/view/base_widget.dart';
import 'package:treeco/core/constants/app/app_constants.dart';
import 'package:treeco/core/init/navigation/navigation_service.dart';
import 'package:treeco/view/constants/size_config.dart';
import 'package:treeco/view/constants/ui_utils.dart';
import 'package:treeco/view/profile/model/joined_project.dart';
import 'package:treeco/view/profile/model/profile_model.dart';
import 'package:treeco/view/profile/view_model/profile_view_model.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ProfileModel profileModel;
  ProfileViewModel profileViewModel;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BaseView<ProfileViewModel>(
      viewModel: ProfileViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        profileViewModel = model;
      },
      onPageBuilder: (context, value) => body,
    );
  }

  get body => Scaffold(
        appBar: appBar,
        body: Container(
          width: SizeConfig.screenWidth,
          height: SizeConfig.screenHeight,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image:
                      AssetImage(ApplicationConstants.BACKGROUND_IMAGE_PROFILE),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.white.withOpacity(0.5), BlendMode.dstATop))),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: SizeConfig.getProportionateScreenHeight(10),
              ),
              Text(
                "Emre Memil",
                style: TextStyle(
                    fontSize: SizeConfig.getProportionateScreenWidth(15),
                    color: Color(ApplicationConstants.DARK_GREEN),
                    fontFamily: ApplicationConstants.FONT_FAMILY),
              ),
              Text(
                "@emrememil",
                style: TextStyle(
                    fontSize: SizeConfig.getProportionateScreenWidth(11),
                    color: Color(ApplicationConstants.DARK_GREEN),
                    fontFamily: ApplicationConstants.FONT_FAMILY),
              ),
              profilePicture,
              statisticContainers,
              editProfileButton,
              SizedBox(
                height: SizeConfig.getProportionateScreenHeight(8),
              ),
              joinedProjectText,
              joinedProjectContainer,
            ],
          ),
        ),
      );

  Padding get profilePicture {
    return Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: SizeConfig.getProportionateScreenWidth(78),
                backgroundColor: Color(ApplicationConstants.TEXT_GREEN),
                child: CircleAvatar(
                  radius: SizeConfig.getProportionateScreenWidth(75),
                  backgroundImage: AssetImage("assets/images/pp.png"),
                ),
              ),
            );
  }

  Container get joinedProjectContainer {
    return Container(
      width:
          SizeConfig.screenWidth - SizeConfig.getProportionateScreenWidth(32),
      height: SizeConfig.blockSizeVertical * 25,
      //SizeConfig.screenHeight / 3.8,
      decoration: BoxDecoration(
        color: Color(0xff92BEA7),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Swiper(
          itemCount: joinedProjects.length,
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
                  children: <Widget>[
                    mapImageProjectContainer(index),
                    infoProject(index)
                  ],
                )
              ],
            );
          }),
    );
  }

  Container get joinedProjectText {
    return Container(
      width: SizeConfig.screenWidth,
      child: Padding(
        padding: EdgeInsets.only(
            left: SizeConfig.getProportionateScreenWidth(24),
            top: SizeConfig.getProportionateScreenHeight(16),
            bottom: 5),
        child: Text(
          'projectsIParticipatedIn'.locale,
          style: TextStyle(
            fontSize: SizeConfig.getProportionateScreenWidth(13),
            color: Colors.black,
            fontFamily: ApplicationConstants.FONT_FAMILY,
          ),
        ),
      ),
    );
  }

  Padding get editProfileButton {
    return Padding(
      padding: EdgeInsets.only(top: SizeConfig.getProportionateScreenWidth(16)),
      child: SizedBox(
        width: double.infinity,
        height: SizeConfig.getProportionateScreenHeight(35),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.getProportionateScreenWidth(16)),
          child: RaisedButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: Color(0xff11806F),
            onPressed: () {
              NavigationService.instance
                  .navigateToPage(path: NavigationConstants.PROFILE_EDIT);
            },
            child: Text(
              'editProfile'.locale,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: SizeConfig.getProportionateScreenWidth(13),
                  fontFamily: ApplicationConstants.FONT_FAMILY),
            ),
          ),
        ),
      ),
    );
  }

  Row get statisticContainers {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Padding(
          padding:
              EdgeInsets.only(left: SizeConfig.getProportionateScreenWidth(16)),
          child: RotationTransition(
            turns: AlwaysStoppedAnimation(-6 / 360),
            child: Container(
              width: SizeConfig.getProportionateScreenWidth(110),
              height: SizeConfig.getProportionateScreenHeight(90),
              decoration: BoxDecoration(
                color: Colors.white,
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "15",
                    style: TextStyle(
                        fontSize: SizeConfig.getProportionateScreenWidth(16),
                        color: Color(ApplicationConstants.LIGHT_GREEN),
                        fontFamily: ApplicationConstants.FONT_FAMILY),
                  ),
                  Text(
                    'plantedTree'.locale,
                    style: TextStyle(
                        fontSize: SizeConfig.getProportionateScreenWidth(13),
                        color: Color(ApplicationConstants.TEXT_GREY),
                        fontFamily: ApplicationConstants.FONT_FAMILY),
                  )
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          width: SizeConfig.getProportionateScreenWidth(16),
        ),
        Padding(
          padding: EdgeInsets.only(
              right: SizeConfig.getProportionateScreenWidth(16)),
          child: RotationTransition(
            turns: AlwaysStoppedAnimation(6 / 360),
            child: Container(
              width: SizeConfig.getProportionateScreenWidth(110),
              height: SizeConfig.getProportionateScreenHeight(90),
              decoration: BoxDecoration(
                color: Colors.white,
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "112.368",
                    style: TextStyle(
                        fontSize: SizeConfig.getProportionateScreenWidth(16),
                        color: Color(ApplicationConstants.LIGHT_GREEN),
                        fontFamily: ApplicationConstants.FONT_FAMILY),
                  ),
                  Text(
                    'rank'.locale,
                    style: TextStyle(
                        fontSize: SizeConfig.getProportionateScreenWidth(13),
                        color: Color(ApplicationConstants.TEXT_GREY),
                        fontFamily: ApplicationConstants.FONT_FAMILY),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  AppBar get appBar {
    return AppBar(
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.black),
      title: Text(
        'profile'.locale,
        style: TextStyle(
            fontSize: SizeConfig.getProportionateScreenWidth(14),
            color: Colors.black,
            fontFamily: ApplicationConstants.FONT_FAMILY),
      ),
      actions: <Widget>[
        Row(
          children: <Widget>[
            Icon(
              MdiIcons.pineTree,
              color: Color(ApplicationConstants.LIGHT_GREEN),
              size: SizeConfig.getProportionateScreenWidth(20),
            ),
            Text(
              "15",
              style: TextStyle(
                  fontSize: SizeConfig.getProportionateScreenWidth(14),
                  color: Colors.black,
                  fontFamily: ApplicationConstants.FONT_FAMILY),
            )
          ],
        ),
        SizedBox(
          width: 16,
        ),
        Row(
          children: <Widget>[
            ImageIcon(
              AssetImage('assets/icons/coin.png'), //CustomIcons.coin,
              size: SizeConfig.getProportionateScreenHeight(20),
              color: Colors.yellow.shade700,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "128",
                style: TextStyle(
                    fontSize: SizeConfig.getProportionateScreenWidth(14),
                    color: Colors.black,
                    fontFamily: ApplicationConstants.FONT_FAMILY),
              ),
            )
          ],
        ),
      ],
    );
  }

  Padding titleProject(int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        joinedProjects[index].title,
        style: TextStyle(
            fontSize: SizeConfig.getProportionateScreenWidth(13),
            color: Colors.white,
            fontFamily: ApplicationConstants.FONT_FAMILY),
      ),
    );
  }

  Padding mapImageProjectContainer(int index) {
    return Padding(
      padding: EdgeInsets.only(
          left: SizeConfig.blockSizeHorizontal * 2,
          top: SizeConfig.blockSizeVertical * 1.2),
      child: Image.asset(joinedProjects[index].imagePath,
          width:
              (getDeviceType(SizeConfig.screenWidth) == DeviceScreenType.Mobile)
                  ? SizeConfig.imageSizeMultiplier * 32
                  : SizeConfig.imageSizeMultiplier * 25,
          fit: BoxFit.fill),
    );
  }

  Padding infoProject(int index) {
    return Padding(
      padding:
          EdgeInsets.only(left: SizeConfig.getProportionateScreenWidth(16)),
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
                  padding: EdgeInsets.only(
                      left: SizeConfig.getProportionateScreenWidth(8)),
                  child: Text(
                    joinedProjects[index].plantedTreeCount + 'planted'.locale,
                    style: TextStyle(
                        fontSize: SizeConfig.getProportionateScreenWidth(12),
                        color: Colors.black,
                        fontFamily: ApplicationConstants.FONT_FAMILY2),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: SizeConfig.getProportionateScreenHeight(8)),
              child: Row(
                children: <Widget>[
                  Icon(Icons.people, color: Colors.green.shade900),
                  Padding(
                    padding: EdgeInsets.only(
                        left: SizeConfig.getProportionateScreenWidth(8)),
                    child: Text(
                      joinedProjects[index].heroes + 'heroes'.locale,
                      style: TextStyle(
                          fontSize: SizeConfig.getProportionateScreenWidth(12),
                          color: Colors.black,
                          fontFamily: ApplicationConstants.FONT_FAMILY2),
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
      padding: EdgeInsets.only(
          top: SizeConfig.getProportionateScreenHeight(16),
          left: SizeConfig.getProportionateScreenWidth(32)),
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
                fontSize: SizeConfig.getProportionateScreenWidth(13),
                fontFamily: ApplicationConstants.FONT_FAMILY),
          ),
        ),
      ),
    );
  }
}
