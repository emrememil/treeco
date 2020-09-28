import 'package:jiffy/jiffy.dart';
import 'package:treeco/core/constants/enums/locale_keys_enum.dart';
import 'package:treeco/core/init/cache/locale_manager.dart';


class LoginDays{

  int thisDay;
  int lastDay;
  static int counterOfConsecutiveDays;

  void sharedPreferencesOperations(){
    thisDay = Jiffy().dayOfYear;
    lastDay = LocaleManager.instance.getIntValue(PreferencesKeys.LAST_LOGIN_DAY);
    counterOfConsecutiveDays = LocaleManager.instance.getIntValue(PreferencesKeys.COUNTER_OF_CONSECUTIVE_DAYS);

    if(lastDay == thisDay-1){
      counterOfConsecutiveDays = counterOfConsecutiveDays+1;
      LocaleManager.instance.setIntValue(PreferencesKeys.LAST_LOGIN_DAY, thisDay);
      LocaleManager.instance.setIntValue(PreferencesKeys.COUNTER_OF_CONSECUTIVE_DAYS, counterOfConsecutiveDays);
    }
    else{
      LocaleManager.instance.setIntValue(PreferencesKeys.LAST_LOGIN_DAY, thisDay);
      LocaleManager.instance.setIntValue(PreferencesKeys.COUNTER_OF_CONSECUTIVE_DAYS, 1);
    }

  }
}