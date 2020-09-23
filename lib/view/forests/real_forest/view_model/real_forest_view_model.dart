import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:treeco/core/base/model/base_view_model.dart';

part 'real_forest_view_model.g.dart';

class RealForestViewModel = _RealForestViewModelBase with _$RealForestViewModel;

abstract class _RealForestViewModelBase with Store,BaseViewModel{

  void setContext(BuildContext context) => this.context = context;

  void init() {}

}