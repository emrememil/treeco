import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LanguageManager {
  static LanguageManager _instance;
  static LanguageManager get instance {
    if (_instance == null) _instance = LanguageManager._init();
    return _instance;
  }

  LanguageManager._init();

  final enLocale = Locale('en', 'US');
  final trLocale = Locale('tr','TR');

  List<Locale> get supportedLocales => [enLocale,trLocale];

  void languageChangeTurkish(BuildContext context){
    EasyLocalization.of(context).locale = LanguageManager.instance.trLocale;

  }
  void languageChangeEnglish(BuildContext context){
    EasyLocalization.of(context).locale = LanguageManager.instance.enLocale;

  }
}
