import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:treeco/core/base/model/base_view_model.dart';
import 'package:treeco/view/achievements/model/achievements_model.dart';

part 'achievements_view_model.g.dart';

class AchievementsViewModel = _AchievementsViewModelBase with _$AchievementsViewModel;

abstract class _AchievementsViewModelBase with Store,BaseViewModel{

  void setContext(BuildContext context) => this.context = context;

  void init() {}

  var achievements = AchievementsModel(DateTime.parse("2020-05-23"),2,5);

  List<AchievementsModel> achievementsList = [
    AchievementsModel.listing("Üst Üste 7 Gün Giriş", 500, "assets/icons/achievements/seven_days.png")
  ];

  sevenDaysCompletedDay(){
    var day = achievements.lastLoginDate.day;
    return day;
  }
}