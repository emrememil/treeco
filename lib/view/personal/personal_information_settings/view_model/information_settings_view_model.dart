import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:treeco/core/base/model/base_view_model.dart';

part 'information_settings_view_model.g.dart';

class InformationSettingsViewModel = _InformationSettingsViewModelBase with _$InformationSettingsViewModel;

abstract class _InformationSettingsViewModelBase with Store,BaseViewModel{

  void setContext(BuildContext context) => this.context = context;

  void init() {}

}