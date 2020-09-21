import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:treeco/core/base/model/base_view_model.dart';

part 'forest_view_model.g.dart';

class ForestViewModel = _ForestViewModelBase with _$ForestViewModel;

abstract class _ForestViewModelBase with Store,BaseViewModel{

  void setContext(BuildContext context) => this.context = context;

  void init() {}

}