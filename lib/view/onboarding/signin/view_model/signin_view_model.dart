import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:treeco/core/base/model/base_view_model.dart';
import 'package:treeco/core/constants/app/app_constants.dart';

part 'signin_view_model.g.dart';

class SignInViewModel = _SignInViewModelBase with _$SignInViewModel;

abstract class _SignInViewModelBase with Store,BaseViewModel{

  void setContext(BuildContext context) => this.context = context;

  void init() {}

  @observable
  bool rememberMe=false;

  @observable
  bool passwordCheck=false;

  @observable
  bool emailCheck=false;

  @observable
  bool focus2=false;

  @observable
  bool focus1=false;


  @action
  void changeRememberMe(bool val){
    rememberMe=val;
  }

  @action
  void passwordOnChanged(String val){
    if(val.length>=6){
      passwordCheck=true;
      focus2=true;
    }else{
      passwordCheck=false;
      focus2=true;
    }
  }

  @action
  void emailOnChanged(String val){
    if (ApplicationConstants.emailCheck(val)) {
        emailCheck = true;
        focus1 = true;
    } else {
        emailCheck = false;
        focus1 = true;
    }
  }
}


