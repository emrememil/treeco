import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:treeco/core/base/model/base_view_model.dart';
import 'package:treeco/view/community/timeline/model/timeline_model.dart';

part 'timeline_view_model.g.dart';

class TimelineViewModel = _TimelineViewModelBase with _$TimelineViewModel;

abstract class _TimelineViewModelBase with Store,BaseViewModel{

  void setContext(BuildContext context) => this.context = context;

  void init() {}

  List<TimelineModel> timeline = [
  TimelineModel("assets/images/pp.png","Emre Memil", DateTime.parse("2020-05-23"),"Yemeksepeti siparişi ile sanal ormanına 1 yeni ağaç ekledi"),
  TimelineModel("assets/images/pp.png","Emre Memil", DateTime.parse("2020-08-14"),"Boyner QR kodu ile sanal ormanına 1 yeni ağaç ekledi"),
  TimelineModel("assets/images/pp.png","Emre Memil", DateTime.parse("2020-08-14"),"Boyner QR kodu ile sanal ormanına 1 yeni ağaç ekledi"),
  TimelineModel("assets/images/pp.png","Emre Memil", DateTime.parse("2020-08-14"),"Boyner QR kodu ile sanal ormanına 1 yeni ağaç ekledi"),
  TimelineModel("assets/images/pp.png","Emre Memil", DateTime.parse("2020-08-14"),"Boyner QR kodu ile sanal ormanına 1 yeni ağaç ekledi"),
  TimelineModel("assets/images/pp.png","Emre Memil", DateTime.parse("2020-08-14"),"Boyner QR kodu ile sanal ormanına 1 yeni ağaç ekledi"),
  TimelineModel("assets/images/pp.png","Emre Memil", DateTime.parse("2020-08-14"),"Boyner QR kodu ile sanal ormanına 1 yeni ağaç ekledi"),
  ];

}