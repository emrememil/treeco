import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:treeco/core/base/model/base_view_model.dart';

part 'phone_input_view_model.g.dart';

class PhoneInputViewModel = _PhoneInputViewModelBase with _$PhoneInputViewModel;

abstract class _PhoneInputViewModelBase with Store,BaseViewModel{

  void setContext(BuildContext context) => this.context = context;

  void init() {}

  @observable
  bool inputValidated = false;
  @observable
  bool errorMesage = false;
  @observable
  String phoneNumber;

}