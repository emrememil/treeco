import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:treeco/core/base/view/base_widget.dart';
import 'package:treeco/core/constants/app/app_constants.dart';
import 'package:treeco/core/init/navigation/navigation_service.dart';
import 'package:treeco/view/constants/size_config.dart';
import 'package:treeco/core/extension/string_extension.dart';
import 'package:treeco/view/personal/phone_number_input/model/phone_input_model.dart';
import 'package:treeco/view/personal/phone_number_input/view_model/phone_input_view_model.dart';

class PhoneInputScreen extends StatefulWidget {
  @override
  _PhoneInputScreenState createState() => _PhoneInputScreenState();
}

class _PhoneInputScreenState extends State<PhoneInputScreen> {
  PhoneInputModel phoneInputModel;
  PhoneInputViewModel phoneInputViewModel;

  String initialCountry = 'TR';
  PhoneNumber number = PhoneNumber(isoCode: 'TR');

  @override
  Widget build(BuildContext context) {
    return BaseView<PhoneInputViewModel>(
      viewModel: PhoneInputViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        phoneInputViewModel = model;
      },
      onPageBuilder: (context, value) => body,
    );
  }

  get body => Scaffold(
        appBar: appBar,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            telNoTextField,
            Padding(
              padding: EdgeInsets.only(left: SizeConfig.getProportionateScreenWidth(24)),
              child: Observer(
                builder: (context)=> (phoneInputViewModel.errorMesage)
                    ? Text("Geçerli bir telefon numarası girin",
                    style: TextStyle(
                        fontSize: SizeConfig.getProportionateScreenWidth(11),
                        color: Colors.red,
                        fontFamily: ApplicationConstants.FONT_FAMILY))
                    : Text(""),
              ),
            ),
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
        'telNo'.locale,
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

  Padding get telNoTextField {
    return Padding(
      padding: EdgeInsets.all(
        SizeConfig.getProportionateScreenWidth(16),
      ),
      child: InternationalPhoneNumberInput(
          onInputChanged: (PhoneNumber number) {
            phoneInputViewModel.phoneNumber = number.toString();
            print(number.phoneNumber);
          },
          onInputValidated: (bool value) {
            phoneInputViewModel.inputValidated = value;
            print(value);
          },
          selectorConfig: SelectorConfig(
              showFlags: false, selectorType: PhoneInputSelectorType.DIALOG),
          ignoreBlank: false,
          autoValidate: false,
          selectorTextStyle: TextStyle(color: Colors.black),
          initialValue: number,
          //textFieldController: informationSettingsViewModel.controller,
          inputBorder: OutlineInputBorder(),
          inputDecoration: InputDecoration.collapsed(
            hintText: 'enterPhoneNumber'.locale,
            hintStyle: TextStyle(
                fontSize: SizeConfig.getProportionateScreenWidth(13),
                color: Colors.black,
                fontFamily: ApplicationConstants.FONT_FAMILY2),
            filled: false,
          ),
        ),
    );
  }

  checkAndConfirm() {
    if (phoneInputViewModel.inputValidated) {
      phoneInputViewModel.errorMesage = false;
      debugPrint("girilen numara: ${phoneInputViewModel.phoneNumber}");
      NavigationService.instance.navigatePop();
    } else {
      phoneInputViewModel.errorMesage = true;
    }
  }
}
