import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:treeco/core/base/view/base_widget.dart';
import 'package:treeco/core/constants/app/app_constants.dart';
import 'package:treeco/core/init/navigation/navigation_service.dart';
import 'package:treeco/view/constants/size_config.dart';
import 'package:treeco/core/extension/string_extension.dart';
import 'package:treeco/view/personal/email_input/model/email_input_model.dart';
import 'package:treeco/view/personal/email_input/view_model/email_input_view_model.dart';

class EmailInputScreen extends StatefulWidget {
  @override
  _EmailInputScreenState createState() => _EmailInputScreenState();
}

class _EmailInputScreenState extends State<EmailInputScreen> {
  EmailInputModel emailInputModel;
  EmailInputViewModel emailInputViewModel;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BaseView<EmailInputViewModel>(
      viewModel: EmailInputViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        emailInputViewModel = model;
      },
      onPageBuilder: (context, value) => body,
    );
  }

  get body => Scaffold(
        appBar: appBar,
        body: Column(
          children: <Widget>[
            SizedBox(
              height: SizeConfig.getProportionateScreenHeight(16),
            ),
            Form(
              key: _formKey,
              child: emailTextField,
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
        'changeEmail'.locale,
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

  void checkAndConfirm() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      NavigationService.instance.navigatePop();
    }
  }

  Padding get emailTextField {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.getProportionateScreenWidth(16)),
      child: Observer(
        builder: (context) => TextFormField(
          decoration: InputDecoration(
            labelText: 'email'.locale,
            labelStyle: TextStyle(
              fontSize: SizeConfig.getProportionateScreenWidth(13),
            ),
            prefixIcon: Icon(
              Icons.mail_outline,
              size: SizeConfig.getProportionateScreenWidth(25),
            ),
            suffixIcon: (emailInputViewModel.emailFocus)
                ? Icon(
                    (emailInputViewModel.emailCheck)
                        ? Icons.check
                        : Icons.error,
                    color: (emailInputViewModel.emailCheck)
                        ? Color(ApplicationConstants.TEXT_GREEN)
                        : Colors.red,
                    size: SizeConfig.getProportionateScreenWidth(22))
                : null,
          ),
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(
              fontSize: SizeConfig.getProportionateScreenWidth(13),
              color: Colors.black,
              fontFamily: ApplicationConstants.FONT_FAMILY2),
          onChanged: (val) {
            emailInputViewModel.emailOnChanged(val);
          },
          validator: (value) {
            if (!ApplicationConstants.emailCheck(value)) {
              return 'invalidEmail'.locale;
            }
            return null;
          },
          onSaved: (value) {
            emailInputViewModel.emailAddress = value;
            debugPrint("girilen mail: ${emailInputViewModel.emailAddress}");
          },
        ),
      ),
    );
  }
}
