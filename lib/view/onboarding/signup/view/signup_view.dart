import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:treeco/core/base/state/base_state.dart';
import 'package:treeco/core/base/view/base_widget.dart';
import 'package:treeco/core/constants/app/app_constants.dart';
import 'package:treeco/core/constants/navigation/navigation_constants.dart';
import 'package:treeco/core/init/navigation/navigation_service.dart';
import 'package:treeco/view/constants/date_picker_config.dart';
import 'package:treeco/view/constants/size_config.dart';
import 'package:treeco/core/extension/string_extension.dart';
import 'package:treeco/view/onboarding/signup/model/signup_model.dart';
import 'package:treeco/view/onboarding/signup/view_model/signup_view_model.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends BaseState<SignUpScreen> {
  SignUpViewModel signUpViewModel;
  SignUpModel signUpModel;
  var formKey = GlobalKey<FormState>();
  TextEditingController _controller = new TextEditingController();
  bool otomatikKontrol = false;
  DateTime _dateTime;

  @override
  Widget build(BuildContext context) {
    return BaseView<SignUpViewModel>(
      viewModel: SignUpViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        signUpViewModel = model;
        _dateTime = DatePickerConfig.minDateTime;
      },
      onPageBuilder: (context, value) => body,
    );
  }

  get body => Scaffold(
    //resizeToAvoidBottomInset: false,
    //resizeToAvoidBottomPadding: false,
    appBar: AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
    ),
    body: SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            signUpTitle,
            Form(
              key: formKey,
              autovalidate: false,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: SizeConfig.getProportionateScreenHeight(24),
                  ),
                  nameAndSurnameInput,
                  SizedBox(
                    height: SizeConfig.getProportionateScreenHeight(12),
                  ),
                  usernameInput,
                  SizedBox(
                    height: SizeConfig.getProportionateScreenHeight(12),
                  ),
                  emailInput,
                  SizedBox(
                    height: SizeConfig.getProportionateScreenHeight(12),
                  ),
                  passwordInput,
                  SizedBox(
                    height: SizeConfig.getProportionateScreenHeight(12),
                  ),
                  confirmPasswordInput,
                  SizedBox(
                    height: SizeConfig.getProportionateScreenHeight(12),
                  ),
                ],
              ),
            ),
            signUpButton,
            dividerOR,
            socialMediaIconButtons,
            alreadyHaveAccount
          ],
        ),
      ),
    ),
  );

  Container get signUpTitle {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, left: 20),
        child: Text(
          'signUpButton'.locale,
          style: TextStyle(
              fontFamily: ApplicationConstants.FONT_FAMILY2,
              fontSize: SizeConfig.getProportionateScreenWidth(28),
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ),
      ),
    );
  }

  Padding get nameAndSurnameInput {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.getProportionateScreenWidth(24)),
      child: TextFormField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                horizontal: SizeConfig.getProportionateScreenWidth(24),
                vertical: SizeConfig.getProportionateScreenHeight(18)),
            labelText: 'nameAndSurname'.locale,
            labelStyle: TextStyle(fontSize: SizeConfig.getProportionateScreenWidth(13)),
            fillColor: Colors.green,
            hoverColor: Color(ApplicationConstants.DARK_GREEN),
            border: OutlineInputBorder(
              borderRadius: new BorderRadius.circular(35.0),
              borderSide: new BorderSide(),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: new BorderRadius.circular(35.0),
              borderSide:
                  new BorderSide(color: Color(ApplicationConstants.DARK_GREEN)),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: new BorderRadius.circular(35.0),
              borderSide:
                  new BorderSide(color: Color(ApplicationConstants.DARK_GREEN)),
            ),
          ),
          keyboardType: TextInputType.text,
          style: TextStyle(fontFamily: ApplicationConstants.FONT_FAMILY2),
          validator: (value) {
            if (value.length >= 6) {
              return "";
            } else {
              return 'invalidName'.locale;
            }
          }),
    );
  }

  Padding get usernameInput {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.getProportionateScreenWidth(24)),
      child: TextFormField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                horizontal: SizeConfig.getProportionateScreenWidth(24),
                vertical: SizeConfig.getProportionateScreenHeight(18)),
            labelText: 'username'.locale,
            labelStyle: TextStyle(fontSize: SizeConfig.getProportionateScreenWidth(13)),
            fillColor: Colors.green,
            hoverColor: Color(ApplicationConstants.DARK_GREEN),
            border: OutlineInputBorder(
              borderRadius: new BorderRadius.circular(35.0),
              borderSide: new BorderSide(),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: new BorderRadius.circular(35.0),
              borderSide:
              new BorderSide(color: Color(ApplicationConstants.DARK_GREEN)),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: new BorderRadius.circular(35.0),
              borderSide:
              new BorderSide(color: Color(ApplicationConstants.DARK_GREEN)),
            ),
          ),
          keyboardType: TextInputType.text,
          style: TextStyle(fontFamily: ApplicationConstants.FONT_FAMILY2),
          validator: (value) {
            if (value.length >= 6) {
              return "";
            } else {
              return 'invalidUsername'.locale;
            }
          }),
    );
  }

  Padding get emailInput {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.getProportionateScreenWidth(24)),
      child: Observer(
        builder: (context) => TextFormField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.getProportionateScreenWidth(24),
                  vertical: SizeConfig.getProportionateScreenHeight(18)),
              labelText: 'email'.locale,
              labelStyle: TextStyle(fontSize: SizeConfig.getProportionateScreenWidth(13)),
              fillColor: Colors.green,
              hoverColor: Color(ApplicationConstants.DARK_GREEN),
              border: OutlineInputBorder(
                borderRadius: new BorderRadius.circular(35.0),
                borderSide: new BorderSide(),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: new BorderRadius.circular(35.0),
                borderSide: new BorderSide(
                    color: Color(ApplicationConstants.DARK_GREEN)),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: new BorderRadius.circular(35.0),
                borderSide: new BorderSide(
                    color: Color(ApplicationConstants.DARK_GREEN)),
              ),
              suffixIcon: (signUpViewModel.emailFocus)
                  ? Icon(
                      (signUpViewModel.emailCheck) ? Icons.check : Icons.error,
                      color: (signUpViewModel.emailCheck)
                          ? Color(ApplicationConstants.TEXT_GREEN)
                          : Colors.red,
                    )
                  : null,
            ),
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(fontFamily: ApplicationConstants.FONT_FAMILY2),
            onChanged: (val) {
              signUpViewModel.emailOnChanged(val);
            },
            validator: (value) {
              if (ApplicationConstants.emailCheck(value)) {
                return "";
              } else {
                return 'invalidEmail'.locale;
              }
            }),
      ),
    );
  }

  Padding get passwordInput {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.getProportionateScreenWidth(24)),
      child: Observer(
        builder: (context) => TextFormField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.getProportionateScreenWidth(24),
                  vertical: SizeConfig.getProportionateScreenHeight(18)),
              labelText: 'password'.locale,
              labelStyle: TextStyle(fontSize: SizeConfig.getProportionateScreenWidth(13)),
              fillColor: Colors.green,
              hoverColor: Color(ApplicationConstants.DARK_GREEN),
              border: OutlineInputBorder(
                borderRadius: new BorderRadius.circular(35.0),
                borderSide: new BorderSide(),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: new BorderRadius.circular(35.0),
                borderSide: new BorderSide(
                    color: Color(ApplicationConstants.DARK_GREEN)),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: new BorderRadius.circular(35.0),
                borderSide: new BorderSide(
                    color: Color(ApplicationConstants.DARK_GREEN)),
              ),
              suffixIcon: (signUpViewModel.passwordFocus)
                  ? Icon(
                (signUpViewModel.passwordCheck) ? Icons.check : Icons.error,
                color: (signUpViewModel.passwordCheck)
                    ? Color(ApplicationConstants.TEXT_GREEN)
                    : Colors.red,
              )
                  : null,
            ),
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            style: TextStyle(fontFamily: ApplicationConstants.FONT_FAMILY2),
            onChanged: (val) {
              signUpViewModel.passwordOnChanged(val);
              signUpViewModel.password=val;
            },
            validator: (value) {
              if (signUpViewModel.passwordCheck) {
                return "";
              } else {
                return 'invalidPassword'.locale;
              }
            }),
      ),
    );
  }

  Padding get confirmPasswordInput {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.getProportionateScreenWidth(24)),
      child: Observer(
        builder: (context) => TextFormField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.getProportionateScreenWidth(24),
                  vertical: SizeConfig.getProportionateScreenHeight(18)),
              labelText: 'confirmPassword'.locale,
              labelStyle: TextStyle(fontSize: SizeConfig.getProportionateScreenWidth(13)),
              fillColor: Colors.green,
              hoverColor: Color(ApplicationConstants.DARK_GREEN),
              border: OutlineInputBorder(
                borderRadius: new BorderRadius.circular(35.0),
                borderSide: new BorderSide(),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: new BorderRadius.circular(35.0),
                borderSide: new BorderSide(
                    color: Color(ApplicationConstants.DARK_GREEN)),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: new BorderRadius.circular(35.0),
                borderSide: new BorderSide(
                    color: Color(ApplicationConstants.DARK_GREEN)),
              ),
              suffixIcon: (signUpViewModel.confirmPasswordFocus)
                  ? Icon(
                (signUpViewModel.confirmPasswordCheck) ? Icons.check : Icons.error,
                color: (signUpViewModel.confirmPasswordCheck)
                    ? Color(ApplicationConstants.TEXT_GREEN)
                    : Colors.red,
              )
                  : null,
            ),
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            style: TextStyle(fontFamily: ApplicationConstants.FONT_FAMILY2),
            onChanged: (val) {
              signUpViewModel.confirmPassword=val;
              signUpViewModel.confirmPasswordOnChanged(val);
            },
            validator: (value) {
              if (signUpViewModel.confirmPasswordCheck) {
                return "";
              } else {
                return 'notMatchPasswords'.locale;
              }
            }),
      ),
    );
  }

  Padding get signUpButton {
    return Padding(
      padding: EdgeInsets.only(top: 1.0,bottom: SizeConfig.getProportionateScreenHeight(32)),
      child: SizedBox(
        width: double.infinity,
        height: SizeConfig.getProportionateScreenHeight(60),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.getProportionateScreenWidth(24)),
          child: RaisedButton(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            color: Color(ApplicationConstants.LIGHT_GREEN),
            onPressed: () {},
            child: Text(
              'signUpButton'.locale,
              style: TextStyle(
                fontSize: SizeConfig.getProportionateScreenWidth(13),
                  color: Colors.white,
                  fontFamily: ApplicationConstants.FONT_FAMILY),
            ),
          ),
        ),
      ),
    );
  }

  Row get dividerOR {
    return Row(
      children: <Widget>[
        Expanded(
          child: Divider(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            'or'.locale,
            style: TextStyle(
                color: Color(ApplicationConstants.TEXT_GREY),
                fontFamily: ApplicationConstants.FONT_FAMILY2,
                fontSize: SizeConfig.getProportionateScreenWidth(12)),
          ),
        ),
        Expanded(
          child: Divider(),
        ),
      ],
    );
  }

  Row get socialMediaIconButtons {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          icon: Image.asset(ApplicationConstants.FACEBOOK_ICON),
          iconSize: SizeConfig.getProportionateScreenWidth(48),
          onPressed: () {
          },
        ),
        IconButton(
          icon: Image.asset(ApplicationConstants.GOOGLE_ICON),
          iconSize: SizeConfig.getProportionateScreenWidth(40),
          onPressed: () {},
        ),
        IconButton(
          icon: Image.asset(ApplicationConstants.TWITTER_ICON),
          iconSize: SizeConfig.getProportionateScreenWidth(40),
          onPressed: () {},
        ),
      ],
    );
  }

  get alreadyHaveAccount {
    return Container(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(top:SizeConfig.getProportionateScreenHeight(50)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'alreadyHaveAnAccount'.locale,
              style: TextStyle(
                  fontFamily: ApplicationConstants.FONT_FAMILY2,
                  color: Color(ApplicationConstants.TEXT_GREY),
                  fontSize: SizeConfig.getProportionateScreenWidth(12)),
            ),
            GestureDetector(
              onTap: (){
                NavigationService.instance.navigatePop();
                NavigationService.instance.navigateToPage(path: NavigationConstants.SIGN_IN);
              },
              child: Text(
                'signInButton'.locale,
                style: TextStyle(
                  fontFamily: ApplicationConstants.FONT_FAMILY2,
                  color: Colors.blue,
                  fontSize: SizeConfig.getProportionateScreenWidth(12),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
