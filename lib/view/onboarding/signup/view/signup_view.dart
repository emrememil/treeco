import 'package:flutter/material.dart';
import 'package:treeco/core/base/state/base_state.dart';
import 'package:treeco/core/base/view/base_widget.dart';
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


  @override
  Widget build(BuildContext context) {
    return BaseView<SignUpViewModel>(
      viewModel: SignUpViewModel(),
      onModelReady: (model){
        model.setContext(context);
        signUpViewModel=model;
      },
      onPageBuilder: (context,value)=>body,
    );
  }
  get body => null;
}
