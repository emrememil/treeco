import 'package:flutter/material.dart';
import 'package:treeco/core/base/view/base_widget.dart';
import 'package:treeco/core/constants/app/app_constants.dart';
import 'package:treeco/view/constants/size_config.dart';
import 'package:treeco/view/profile/model/profile_model.dart';
import 'package:treeco/view/profile_edit/model/profile_edit_model.dart';
import 'package:treeco/view/profile_edit/view_model/profile_edit_view_model.dart';
import 'package:treeco/core/extension/string_extension.dart';

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
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            "Düzenle",
            style: TextStyle(
                fontSize: SizeConfig.getProportionateScreenWidth(14),
                color: Colors.black,
                fontFamily: ApplicationConstants.FONT_FAMILY),
          ),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              //infoText,
              profilePicture,
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
                padding: EdgeInsets.only(top: SizeConfig.getProportionateScreenHeight(32)),
                child: Divider(),
              ),
              GestureDetector(
                onTap: (){
                },
                child: Text(
                  "Kişisel Bilgiler Ayarları".locale,
                  style: TextStyle(
                    fontFamily: ApplicationConstants.FONT_FAMILY2,
                    color: Colors.blue,
                    fontSize: SizeConfig.getProportionateScreenWidth(13),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: SizeConfig.getProportionateScreenHeight(8)),
                child: Divider(),
              ),
            ],
          ),
        ),
      );

  Padding get usernameTextField {
    return Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal:
                            SizeConfig.getProportionateScreenWidth(16)),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'username'.locale,
                        labelStyle: TextStyle(
                          fontSize:
                          SizeConfig.getProportionateScreenWidth(13),
                        ),
                      ),
                      style: TextStyle(
                          fontSize:
                              SizeConfig.getProportionateScreenWidth(13),
                          color: Colors.black,
                          fontFamily: ApplicationConstants.FONT_FAMILY),
                    ),
                  );
  }

  Padding get nameAndSurnameTextField {
    return Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal:
                            SizeConfig.getProportionateScreenWidth(16)),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'nameAndSurname'.locale,
                        labelStyle: TextStyle(
                          fontSize:
                          SizeConfig.getProportionateScreenWidth(13),
                        ),
                      ),
                      style: TextStyle(
                          fontSize:
                              SizeConfig.getProportionateScreenWidth(13),
                          color: Colors.black,
                          fontFamily: ApplicationConstants.FONT_FAMILY),
                    ),
                  );
  }

  Padding get infoText {
    return Padding(
      padding: EdgeInsets.all(SizeConfig.getProportionateScreenWidth(8)),
      child: Text(
        "Gerçek bir ormana ağaç dikebilmek için kişisel bilgilerini girmelisin. Bu kısımlar herkese açık profilinde görünmeyecek.",
        style: TextStyle(
            color: Colors.black,
            fontSize: SizeConfig.getProportionateScreenWidth(13),
            fontFamily: ApplicationConstants.FONT_FAMILY),
      ),
    );
  }
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
}
