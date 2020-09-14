import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:treeco/core/base/model/base_view_model.dart';

part 'email_input_view_model.g.dart';

class EmailInputViewModel = _EmailInputViewModelBase with _$EmailInputViewModel;

abstract class _EmailInputViewModelBase with Store,BaseViewModel{

  void setContext(BuildContext context) => this.context = context;

  void init() {}

}