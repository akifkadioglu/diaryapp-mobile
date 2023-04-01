import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/core/localization/keys.dart';
import 'package:mobile/core/localization/languages.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:mobile/core/localization/messages.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mobile/core/routes/route_names.dart';
import 'package:mobile/core/routes/routes.dart';

import 'color_schemes.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      onGenerateTitle: (BuildContext context) => IKey.APP_NAME.tr,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: lightColorScheme),
      darkTheme: ThemeData(colorScheme: darkColorScheme),
      supportedLocales: const [
        Languages.ENGLISH,
        Languages.TURKISH,
      ],
      translations: AppTranslations(),
      fallbackLocale: Languages.ENGLISH,
      locale: Get.deviceLocale,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      initialRoute: RouteName.IS_AUTH,
      getPages: appRoutes,
      unknownRoute: unknownRoute,
    );
  }
}
