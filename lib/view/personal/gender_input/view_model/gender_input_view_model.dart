import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:treeco/core/base/model/base_view_model.dart';

part 'gender_input_view_model.g.dart';

class GenderInputViewModel = _GenderInputViewModelBase with _$GenderInputViewModel;

abstract class _GenderInputViewModelBase with Store,BaseViewModel{

  void setContext(BuildContext context) => this.context = context;

  void init() {}

  @observable
  String gender="";

}