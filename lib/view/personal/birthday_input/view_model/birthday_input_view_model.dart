import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:treeco/core/base/model/base_view_model.dart';

part 'birthday_input_view_model.g.dart';

class BirthdayInputViewModel = _BirthdayInputViewModelBase with _$BirthdayInputViewModel;

abstract class _BirthdayInputViewModelBase with Store,BaseViewModel{

  void setContext(BuildContext context) => this.context = context;

  void init() {}

  @observable
  DateTime dateTime;
  @observable
  String birthday;
  @observable
  DateTime initData = DateTime(1997,06,12);

}