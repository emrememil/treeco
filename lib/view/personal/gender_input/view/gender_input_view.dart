import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:treeco/core/base/view/base_widget.dart';
import 'package:treeco/core/constants/app/app_constants.dart';
import 'package:treeco/core/init/navigation/navigation_service.dart';
import 'package:treeco/view/constants/size_config.dart';
import 'package:treeco/core/extension/string_extension.dart';
import 'package:treeco/view/personal/gender_input/model/gender_input_model.dart';
import 'package:treeco/view/personal/gender_input/view_model/gender_input_view_model.dart';

class GenderInputScreen extends StatefulWidget {
  @override
  _GenderInputScreenState createState() => _GenderInputScreenState();
}

class _GenderInputScreenState extends State<GenderInputScreen> {
  GenderInputModel genderInputModel;
  GenderInputViewModel genderInputViewModel;

  @override
  Widget build(BuildContext context) {
    return BaseView<GenderInputViewModel>(
      viewModel: GenderInputViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        genderInputViewModel = model;
      },
      onPageBuilder: (context, value) => body,
    );
  }

  get body => Scaffold(
        appBar: appBar,
        body: Column(
          children: <Widget>[
            Container(
              child: Observer(
                builder:(context)=> Column(
                  children: <Widget>[
                    RadioListTile<String>(
                      value: "Kadın",
                      groupValue: genderInputViewModel.gender,
                      onChanged: (value) {
                        genderInputViewModel.gender = value;
                      },
                      title: Text(
                        'woman'.locale,
                        style: TextStyle(
                            fontSize: SizeConfig.getProportionateScreenWidth(13),
                            color: Colors.black,
                            fontFamily: ApplicationConstants.FONT_FAMILY),
                      ),
                    ),
                    RadioListTile<String>(
                      value: "Erkek",
                      groupValue: genderInputViewModel.gender,
                      onChanged: (value) {
                        genderInputViewModel.gender = value;
                      },
                      title: Text(
                        'male'.locale,
                        style: TextStyle(
                            fontSize: SizeConfig.getProportionateScreenWidth(13),
                            color: Colors.black,
                            fontFamily: ApplicationConstants.FONT_FAMILY),
                      ),
                    ),
                    RadioListTile<String>(
                      value: "Özel",
                      groupValue: genderInputViewModel.gender,
                      onChanged: (value) {
                        genderInputViewModel.gender = value;
                      },
                      title: Text(
                        'private'.locale,
                        style: TextStyle(
                            fontSize: SizeConfig.getProportionateScreenWidth(13),
                            color: Colors.black,
                            fontFamily: ApplicationConstants.FONT_FAMILY),
                      ),
                    ),
                    RadioListTile<String>(
                      value: "Belirtmek istemiyorum",
                      groupValue: genderInputViewModel.gender,
                      onChanged: (value) {
                        genderInputViewModel.gender = value;
                      },
                      title: Text(
                        'notIndicate'.locale,
                        style: TextStyle(
                            fontSize: SizeConfig.getProportionateScreenWidth(13),
                            color: Colors.black,
                            fontFamily: ApplicationConstants.FONT_FAMILY),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      );

  AppBar get appBar {
    return AppBar(
      leading: GestureDetector(
          onTap: () {
            NavigationService.instance.navigatePop();
          },
          child: Icon(Icons.clear)),
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(
          color: Colors.black,
          size: SizeConfig.getProportionateScreenWidth(25)),
      title: Text(
        'gender'.locale,
        style: TextStyle(
            fontSize: SizeConfig.getProportionateScreenWidth(14),
            color: Colors.black,
            fontFamily: ApplicationConstants.FONT_FAMILY),
      ),
      actions: <Widget>[
        Padding(
          padding:
              EdgeInsets.only(right: SizeConfig.getProportionateScreenWidth(2)),
          child: IconButton(
            onPressed: () => checkAndConfirm(),
            icon: Icon(
              Icons.check,
              color: Colors.blue,
              size: SizeConfig.getProportionateScreenWidth(25),
            ),
          ),
        )
      ],
    );
  }

  checkAndConfirm() {
    debugPrint("seçilen cinsiyet: ${genderInputViewModel.gender}");
    NavigationService.instance.navigatePop();
  }
}
