import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:treeco/core/base/model/base_view_model.dart';

part 'timeline_view_model.g.dart';

class TimelineViewModel = _TimelineViewModelBase with _$TimelineViewModel;

abstract class _TimelineViewModelBase with Store,BaseViewModel{

  void setContext(BuildContext context) => this.context = context;

  void init() {}

}