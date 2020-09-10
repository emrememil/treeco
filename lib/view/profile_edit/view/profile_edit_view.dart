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

  get body => SafeArea(
        child: Scaffold(
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
                infoText,
                Form(
                  key: formKey,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 16.0),
                        child: TextFormField(
                          decoration:
                              InputDecoration(labelText: 'nameAndSurname'.locale,),
                          style: TextStyle(
                              fontSize: SizeConfig.getProportionateScreenWidth(14),
                              color: Colors.black,
                              fontFamily: ApplicationConstants.FONT_FAMILY),
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 16.0),
                        child: TextFormField(
                          decoration:
                          InputDecoration(labelText: 'email'.locale,),
                          style: TextStyle(
                              fontSize: SizeConfig.getProportionateScreenWidth(14),
                              color: Colors.black,
                              fontFamily: ApplicationConstants.FONT_FAMILY),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );

  Padding get infoText {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        "Gerçek bir ormana ağaç dikebilmek için kişisel bilgilerini girmelisin. Bu kısımlar herkese açık profilinde görünmeyecek.",
        style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontFamily: ApplicationConstants.FONT_FAMILY),
      ),
    );
  }
}
