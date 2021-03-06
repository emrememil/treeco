import 'package:flutter/material.dart';
import 'package:treeco/core/base/view/base_widget.dart';
import 'package:treeco/core/constants/app/app_constants.dart';
import 'package:treeco/core/constants/navigation/navigation_constants.dart';
import 'package:treeco/core/init/navigation/navigation_service.dart';
import 'package:treeco/view/constants/size_config.dart';
import 'package:treeco/core/extension/string_extension.dart';
import 'package:treeco/view/personal/profile_edit/model/profile_edit_model.dart';
import 'package:treeco/view/personal/profile_edit/view_model/profile_edit_view_model.dart';

class ProfileEditScreen extends StatefulWidget {
  @override
  _ProfileEditScreenState createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  ProfileEditModel profileEditModel;
  ProfileEditViewModel profileEditViewModel;
  var formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BaseView<ProfileEditViewModel>(
      viewModel: ProfileEditViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        profileEditViewModel = model;
      },
      onPageBuilder: (context, value) => body,
    );
  }

  get body => Scaffold(
        appBar: appBar,
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //infoText,
              profilePicture,
              changeProfilePhotoText,
              Form(
                key: formKey,
                child: Column(
                  children: <Widget>[
                    nameAndSurnameTextField,
                    usernameTextField,
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: SizeConfig.getProportionateScreenHeight(32)),
                child: Divider(),
              ),
              personalInformationSettingsText,
              Padding(
                padding: EdgeInsets.only(
                    top: SizeConfig.getProportionateScreenHeight(8)),
                child: Divider(),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: SizeConfig.getProportionateScreenHeight(1)),
                child: Divider(),
              ),
              switchToProAccountText,
              Padding(
                padding: EdgeInsets.only(
                    top: SizeConfig.getProportionateScreenHeight(8)),
                child: Divider(),
              ),
            ],
          ),
        ),
      );

  AppBar get appBar {
    return AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black, size: SizeConfig.getProportionateScreenWidth(22)),
        title: Text(
          'editProfile'.locale,
          style: TextStyle(
              fontSize: SizeConfig.getProportionateScreenWidth(14),
              color: Colors.black,
              fontFamily: ApplicationConstants.FONT_FAMILY),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right:SizeConfig.getProportionateScreenWidth(2)),
            child: IconButton(
              icon: Icon(
                Icons.check,
                color: Colors.blue,
                size: SizeConfig.getProportionateScreenWidth(22),
              ),
            ),
          )
        ],
      );
  }

  Padding get switchToProAccountText {
    return Padding(
              padding: EdgeInsets.only(
                  top: SizeConfig.getProportionateScreenHeight(8),
                  left: SizeConfig.getProportionateScreenWidth(16),),
              child: GestureDetector(
                onTap: () {},
                child: Text(
                  'switchToProAccount'.locale,
                  style: TextStyle(
                    fontFamily: ApplicationConstants.FONT_FAMILY2,
                    color: Colors.blue,
                    fontSize: SizeConfig.getProportionateScreenWidth(13),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
  }

  Padding get personalInformationSettingsText {
    return Padding(
              padding: EdgeInsets.only(
                  top: SizeConfig.getProportionateScreenHeight(8),
                  left: SizeConfig.getProportionateScreenWidth(16)),
              child: GestureDetector(
                onTap: () {
                  NavigationService.instance.navigateToPage(path: NavigationConstants.INFORMATION_SETTINGS);
                },
                child: Text(
                  'personalInformationSettings'.locale,
                  style: TextStyle(
                    fontFamily: ApplicationConstants.FONT_FAMILY2,
                    color: Colors.blue,
                    fontSize: SizeConfig.getProportionateScreenWidth(13),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
  }

  Align get changeProfilePhotoText {
    return Align(
              alignment: Alignment.center,
              child: Text(
                'changeProfilePhoto'.locale,
                style: TextStyle(
                  fontFamily: ApplicationConstants.FONT_FAMILY2,
                  color: Colors.blue,
                  fontSize: SizeConfig.getProportionateScreenWidth(13),
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
  }

  Padding get usernameTextField {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.getProportionateScreenWidth(16)),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: 'username'.locale,
          labelStyle: TextStyle(
            fontSize: SizeConfig.getProportionateScreenWidth(13),
          ),
        ),
        style: TextStyle(
            fontSize: SizeConfig.getProportionateScreenWidth(13),
            color: Colors.black,
            fontFamily: ApplicationConstants.FONT_FAMILY2),
      ),
    );
  }

  Padding get nameAndSurnameTextField {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.getProportionateScreenWidth(16)),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: 'nameAndSurname'.locale,
          labelStyle: TextStyle(
            fontSize: SizeConfig.getProportionateScreenWidth(13),
          ),
        ),
        style: TextStyle(
            fontSize: SizeConfig.getProportionateScreenWidth(13),
            color: Colors.black,
            fontFamily: ApplicationConstants.FONT_FAMILY2),
      ),
    );
  }

  get profilePicture {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircleAvatar(
          radius: SizeConfig.getProportionateScreenWidth(78),
          backgroundColor: Color(ApplicationConstants.TEXT_GREEN),
          child: CircleAvatar(
            radius: SizeConfig.getProportionateScreenWidth(75),
            backgroundImage: AssetImage("assets/images/pp.png"),
          ),
        ),
      ),
    );
  }
}
