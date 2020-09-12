import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:treeco/core/base/model/base_view_model.dart';

part 'profile_edit_view_model.g.dart';

class ProfileEditViewModel = _ProfileEditViewModelBase with _$ProfileEditViewModel;

abstract class _ProfileEditViewModelBase with Store,BaseViewModel{

  void setContext(BuildContext context) => this.context = context;

  void init() {}

}