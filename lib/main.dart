import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/core/base/state.dart';
import 'package:mobile/core/base/view.dart';
import 'package:mobile/core/localization/keys.dart';
import 'package:mobile/core/localization/languages.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:mobile/core/localization/messages.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'color_schemes.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      onGenerateTitle: (BuildContext context) => IKey.APP_NAME.tr,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: lightColorScheme),
      themeMode: ThemeMode.light,
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
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends BaseState<Home> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BaseView(
      onPageBuilder: (context) {
        return Scaffold(
            appBar: AppBar(
              elevation: 2,
              title: Text(IKey.APP_NAME.tr),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Update with your UI',
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(onPressed: () => {}, tooltip: 'Increment'));
      }
    );
  }
}
