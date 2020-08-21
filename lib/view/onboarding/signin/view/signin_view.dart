import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:treeco/core/base/state/base_state.dart';
import 'package:treeco/core/base/view/base_widget.dart';
import 'package:treeco/core/constants/app/app_constants.dart';
import 'package:treeco/core/extension/string_extension.dart';
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
  bool automaticCheck = false;
  bool emailCheck = false;
  bool passwordCheck = false;
  bool focus1 = false;
  bool focus2 = false;
  bool rememberMe=false;

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

  get body => SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.black),
          ),
          body: Container(
            child: Column(
              children: <Widget>[
                signInTitle(),
                Form(
                  autovalidate: automaticCheck,
                  key: formKey,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: SizeConfig.getProportionateScreenHeight(32),
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
                  height: SizeConfig.getProportionateScreenHeight(15),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Divider(),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        "VEYA",
                        style: TextStyle(
                            color: Color(ApplicationConstants.TEXT_GREY),
                            fontFamily: ApplicationConstants.FONT_FAMILY2,
                            fontSize:
                                SizeConfig.getProportionateScreenWidth(12)),
                      ),
                    ),
                    Expanded(
                      child: Divider(),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );

  SizedBox get signInButton {
    return SizedBox(
      width: double.infinity,
      height: SizeConfig.getProportionateScreenHeight(70),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.getProportionateScreenWidth(24)),
        child: RaisedButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          color: Color(ApplicationConstants.LIGHT_GREEN),
          onPressed: () {},
          child: Text(
            'letStart'.locale,
            style: TextStyle(
                color: Colors.white,
                fontFamily: ApplicationConstants.FONT_FAMILY),
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
            padding: EdgeInsets.only(left: SizeConfig.getProportionateScreenWidth(16)),
            child: Row(
              children: <Widget>[
                Checkbox(
                  activeColor: Color(ApplicationConstants.LIGHT_GREEN),
                  value: rememberMe,
                  onChanged: (val){
                      setState(() {
                        rememberMe=val;
                      });
                  },
                ),
                Text("Beni hatırla",style: TextStyle(
                    color: (rememberMe) ? Colors.black:Color(ApplicationConstants.TEXT_GREY),
                    fontFamily: ApplicationConstants.FONT_FAMILY2,
                    fontSize: SizeConfig.getProportionateScreenWidth(13),
                ),)
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: SizeConfig.getProportionateScreenWidth(32)),
            child: Text(
              "Şifremi Unuttum",
              style: TextStyle(
                  color: Color(ApplicationConstants.TEXT_GREY),
                  fontFamily: ApplicationConstants.FONT_FAMILY2,
                  fontSize: SizeConfig.getProportionateScreenWidth(13)),
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
      child: TextFormField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                horizontal: SizeConfig.getProportionateScreenWidth(24),
                vertical: SizeConfig.getProportionateScreenHeight(22)),
            labelText: "Email",
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
            suffixIcon: (focus1)
                ? Icon(
                    (emailCheck) ? Icons.check : Icons.error,
                    color: (emailCheck)
                        ? Color(ApplicationConstants.TEXT_GREEN)
                        : Colors.red,
                  )
                : null,
          ),
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(fontFamily: 'Montserrat'),
          onChanged: (val) {
            if (ApplicationConstants.emailCheck(val)) {
              setState(() {
                emailCheck = true;
                focus1 = true;
              });
            } else {
              setState(() {
                emailCheck = false;
                focus1 = true;
              });
            }
          },
          validator: (value) {
            if (ApplicationConstants.emailCheck(value)) {
              return "";
            } else {
              return 'Geçersiz Email';
            }
          }),
    );
  }

  Padding passwordInput() {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.getProportionateScreenWidth(24)),
      child: TextFormField(
          obscureText: true,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.getProportionateScreenWidth(24),
                  vertical: SizeConfig.getProportionateScreenHeight(22)),
              labelText: "Şifre",
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
              suffixIcon: (focus2)
                  ? Icon(
                      (passwordCheck) ? Icons.check : Icons.error,
                      color: (passwordCheck)
                          ? Color(ApplicationConstants.TEXT_GREEN)
                          : Colors.red,
                    )
                  : null),
          keyboardType: TextInputType.visiblePassword,
          style: TextStyle(fontFamily: 'Montserrat'),
          onChanged: (val) {
            if (val.length >= 6) {
              setState(() {
                passwordCheck = true;
                focus2 = true;
              });
            } else {
              setState(() {
                passwordCheck = false;
                focus2 = true;
              });
            }
          },
          validator: (value) {
            if (value.length >= 6) {
              return "";
            } else {
              return 'Şifre en az 6 karakter olmalı';
            }
          }),
    );
  }

  Container signInTitle() {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, left: 20),
        child: Text(
          "Giriş Yap",
          style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: SizeConfig.getProportionateScreenWidth(28),
              fontWeight: FontWeight.w500,
              color: Colors.black),
        ),
      ),
    );
  }

}
