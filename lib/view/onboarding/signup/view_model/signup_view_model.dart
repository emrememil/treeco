import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:treeco/core/base/model/base_view_model.dart';
import 'package:treeco/core/constants/app/app_constants.dart';

part 'signup_view_model.g.dart';

class SignUpViewModel = _SignUpViewModelBase with _$SignUpViewModel;

abstract class _SignUpViewModelBase with Store, BaseViewModel {
  void setContext(BuildContext context) => this.context = context;

  void init() {}

  @observable
  bool emailCheck = false;
  @observable
  bool emailFocus = false;
  @observable
  bool passwordCheck=false;
  @observable
  bool passwordFocus=false;
  @observable
  bool confirmPasswordCheck=false;
  @observable
  bool confirmPasswordFocus=false;

  @observable
  String password="";
  @observable
  String confirmPassword="";

  @action
  void emailOnChanged(String val) {
    if (ApplicationConstants.emailCheck(val)) {
      emailCheck = true;
      emailFocus = true;
    } else {
      emailCheck = false;
      emailFocus = true;
    }
  }

  @action
  void passwordOnChanged(String val) {
    if (val.length >= 8) {
      passwordCheck = true;
      passwordFocus = true;
    } else {
      passwordCheck = false;
      passwordFocus = true;
    }
  }

    @action
    void confirmPasswordOnChanged(String val) {
      if (password == confirmPassword) {
        confirmPasswordCheck = true;
        confirmPasswordFocus = true;
      } else {
        confirmPasswordCheck = false;
        confirmPasswordFocus = true;
      }
  }


}
