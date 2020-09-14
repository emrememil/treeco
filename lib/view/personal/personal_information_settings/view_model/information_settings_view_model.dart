import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:treeco/core/base/model/base_view_model.dart';
import 'package:treeco/core/constants/app/app_constants.dart';

part 'information_settings_view_model.g.dart';

class InformationSettingsViewModel = _InformationSettingsViewModelBase with _$InformationSettingsViewModel;

abstract class _InformationSettingsViewModelBase with Store,BaseViewModel{

  void setContext(BuildContext context) => this.context = context;

  void init() {}
  @observable
  bool emailCheck = false;
  @observable
  bool emailFocus = false;

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
}