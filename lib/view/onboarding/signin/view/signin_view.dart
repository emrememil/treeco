import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:treeco/core/base/state/base_state.dart';
import 'package:treeco/core/base/view/base_widget.dart';
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

  get body => SafeArea(
        child: Scaffold(
          body: Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 16),child: Icon(Icons.arrow_back_ios)),
              Text("Giriş Yap", style: TextStyle(
                fontSize: SizeConfig.getProportionateScreenWidth(24)
              ),),
            ],
          ),
        ),
      );
}
