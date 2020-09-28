import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:treeco/core/base/model/base_view_model.dart';
import 'package:treeco/core/constants/enums/locale_keys_enum.dart';
import 'package:treeco/core/init/cache/locale_manager.dart';
import 'package:treeco/view/achievements/model/achievements_model.dart';

part 'achievements_view_model.g.dart';

class AchievementsViewModel = _AchievementsViewModelBase with _$AchievementsViewModel;

abstract class _AchievementsViewModelBase with Store,BaseViewModel{

  void setContext(BuildContext context) => this.context = context;

  void init() {}

  var completedDay;
  var remaining;
  var counterOfConsecutiveDays;


  var achievements = AchievementsModel(2,5);

  List<AchievementsModel> achievementsList = [
    AchievementsModel.listing("Üst Üste 7 Gün Giriş", 500, "assets/icons/achievements/seven_days.png"),
    AchievementsModel.listing("Üst Üste 30 Gün Giriş", 2500, "assets/icons/achievements/thirty_days.png"),
  ];

  @action
  sevenDaysCompletedDay(){
    counterOfConsecutiveDays = LocaleManager.instance.getIntValue(PreferencesKeys.COUNTER_OF_CONSECUTIVE_DAYS);
    var section = 100/7;
    completedDay = section*counterOfConsecutiveDays;
    remaining = 100-completedDay;
  }
}