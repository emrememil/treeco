import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:treeco/core/base/state/base_state.dart';
import 'package:treeco/core/base/view/base_widget.dart';
import 'package:treeco/core/constants/app/app_constants.dart';
import 'package:treeco/core/constants/navigation/navigation_constants.dart';
import 'package:treeco/core/extension/string_extension.dart';
import 'package:treeco/core/init/navigation/navigation_service.dart';
import 'package:treeco/view/constants/size_config.dart';
import 'package:treeco/view/onboarding/signin/model/signin_model.dart';
import 'package:treeco/view/onboarding/signin/view_model/signin_view_model.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends BaseState<SignInScreen> {
  SignInViewModel signInViewModel;
  SignInModel signInModel;
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BaseView<SignInViewModel>(
      viewModel: SignInViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        signInViewModel = model;
      },
      onPageBuilder: (context, value) => body,
    );
  }

  get body => Scaffold(
    resizeToAvoidBottomInset: false,
    appBar: AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black, size: SizeConfig.getProportionateScreenHeight(14)),
    ),
    body: Container(
      child: Column(
        children: <Widget>[
          signInTitle(),
          Form(
            autovalidate: false,
            key: formKey,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: SizeConfig.getProportionateScreenHeight(40),
                ),
                emailInput(),
                SizedBox(
                  height: SizeConfig.getProportionateScreenHeight(24),
                ),
                passwordInput(),
                SizedBox(
                  height: SizeConfig.getProportionateScreenHeight(10),
                ),
              ],
            ),
          ),
          forgotPassword,
          signInButton,
          SizedBox(
            height: SizeConfig.getProportionateScreenHeight(30),
          ),
          dividerOR,
          SizedBox(
            height: SizeConfig.getProportionateScreenHeight(30),
          ),
          socialMediaIconButtons,
          dontHaveAccount
        ],
      ),
    ),
  );

  Expanded get dontHaveAccount {
    return Expanded(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: EdgeInsets.only(
              bottom: SizeConfig.getProportionateScreenHeight(50)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'dontHaveAnAccount'.locale,
                style: TextStyle(
                    fontFamily: ApplicationConstants.FONT_FAMILY2,
                    color: Color(ApplicationConstants.TEXT_GREY),
                    fontSize: SizeConfig.getProportionateScreenWidth(12)),
              ),
              GestureDetector(
                onTap: (){
                  NavigationService.instance.navigatePop();
                  NavigationService.instance.navigateToPage(path: NavigationConstants.SIGN_UP);
                },
                child: Text(
                  'createNow'.locale,
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
      ),
    );
  }

  Row get socialMediaIconButtons {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          icon: Image.asset(ApplicationConstants.FACEBOOK_ICON),
          iconSize: SizeConfig.getProportionateScreenWidth(48),
          onPressed: () {},
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

  Padding get signInButton {
    return Padding(
      padding: EdgeInsets.only(top: SizeConfig.getProportionateScreenHeight(24)),
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
              'signInButton'.locale,
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

  Container get forgotPassword {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                left: SizeConfig.getProportionateScreenWidth(16)),
            child: Row(
              children: <Widget>[
                Observer(
                  builder: (context) => Checkbox(
                    activeColor: Color(ApplicationConstants.LIGHT_GREEN),
                    value: signInViewModel.rememberMe,
                    onChanged: (val) {
                      signInViewModel.changeRememberMe(val);
                    },
                  ),
                ),
                Text(
                  'rememberMe'.locale,
                  style: TextStyle(
                    color: (signInViewModel.rememberMe)
                        ? Colors.black
                        : Color(ApplicationConstants.TEXT_GREY),
                    fontFamily: ApplicationConstants.FONT_FAMILY2,
                    fontSize: SizeConfig.getProportionateScreenWidth(12),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                right: SizeConfig.getProportionateScreenWidth(32)),
            child: Text(
              'forgotPassword'.locale,
              style: TextStyle(
                  color: Color(ApplicationConstants.TEXT_GREY),
                  fontFamily: ApplicationConstants.FONT_FAMILY2,
                  fontSize: SizeConfig.getProportionateScreenWidth(12)),
            ),
          )
        ],
      ),
    );
  }

  Padding emailInput() {
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
              suffixIcon: (signInViewModel.focus1)
                  ? Icon(
                      (signInViewModel.emailCheck) ? Icons.check : Icons.error,
                      color: (signInViewModel.emailCheck)
                          ? Color(ApplicationConstants.TEXT_GREEN)
                          : Colors.red,
                    )
                  : null,
            ),
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(fontFamily: ApplicationConstants.FONT_FAMILY2),
            onChanged: (val) {
              signInViewModel.emailOnChanged(val);
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

  Padding passwordInput() {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.getProportionateScreenWidth(24)),
      child: Observer(
        builder: (context) => TextFormField(
            obscureText: true,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.getProportionateScreenWidth(24),
                    vertical: SizeConfig.getProportionateScreenHeight(18)),
                labelText: 'password'.locale,
                labelStyle: TextStyle(fontSize: SizeConfig.getProportionateScreenWidth(13)),
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
                suffixIcon: (signInViewModel.focus2)
                    ? Icon(
                        (signInViewModel.passwordCheck)
                            ? Icons.check
                            : Icons.error,
                        color: (signInViewModel.passwordCheck)
                            ? Color(ApplicationConstants.TEXT_GREEN)
                            : Colors.red,
                      )
                    : null),
            keyboardType: TextInputType.visiblePassword,
            style: TextStyle(fontFamily: ApplicationConstants.FONT_FAMILY2),
            onChanged: (val) {
              signInViewModel.passwordOnChanged(val);
            },
            validator: (value) {
              if (value.length >= 6) {
                return "";
              } else {
                return 'passwordLength'.locale;
              }
            }),
      ),
    );
  }

  Container signInTitle() {
    return Container(
      width: double.infinity,
      child: Padding(
        padding:  EdgeInsets.only(top: SizeConfig.getProportionateScreenHeight(16), left: SizeConfig.getProportionateScreenWidth(20)),
        child: Text(
          'signInButton'.locale,
          style: TextStyle(
              fontFamily: ApplicationConstants.FONT_FAMILY2,
              fontSize: SizeConfig.getProportionateScreenWidth(28),
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ),
      ),
    );
  }
}
