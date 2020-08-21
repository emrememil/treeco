import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treeco/core/constants/app/app_constants.dart';
import 'package:treeco/core/init/lang/language_manager.dart';
import 'package:treeco/core/init/navigation/navigation_route.dart';
import 'package:treeco/core/init/navigation/navigation_service.dart';
import 'package:treeco/view/splash/view/splash_view.dart';

import 'core/init/notifier/provider_list.dart';

void main() {
  //LocaleManager.prefrencesInit();
  runApp(MultiProvider(
    providers: [...ApplicationProvider.instance.dependItems],
    child: EasyLocalization(
      saveLocale: true,
      supportedLocales: LanguageManager.instance.supportedLocales,
      path: ApplicationConstants.LANG_ASSET_PATH,
      child: MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(ApplicationConstants.DARK_GREEN),
      ),
      debugShowCheckedModeBanner: false,
      title: 'Treeco',
      home: SplashScreen(),
      onGenerateRoute: NavigationRoute.instance.generateRoute,
      navigatorKey: NavigationService.instance.navigatorKey,
    );
  }
}
