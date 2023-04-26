import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/core/localization/keys.dart';
import 'package:mobile/core/localization/languages.dart';
import 'package:mobile/core/localization/translate.dart';
import 'package:mobile/core/routes/go_route.dart';
import 'package:mobile/core/routes/route_names.dart';
import 'package:mobile/core/storage/manager.dart';

class SettingView extends StatefulWidget {
  const SettingView({super.key});

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(translate(IKey.SETTINGS)),
        elevation: 0,
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text(translate(IKey.CHANGE_LANG)),
            onTap: () {
              Get.locale?.languageCode == Languages.TURKISH.languageCode
                  ? Get.updateLocale(Languages.ENGLISH)
                  : Get.updateLocale(Languages.TURKISH);
            },
          ),
          ListTile(
            title: Text(translate(IKey.CHANGE_THEME)),
            onTap: () {
              Get.changeThemeMode(
                Get.isDarkMode ? ThemeMode.light : ThemeMode.dark,
              );
            },
          ),
          ListTile(
            title: Text(
              translate(IKey.LOGOUT),
              style: TextStyle(color: context.theme.colorScheme.error),
            ),
            onTap: () {
              StorageManager.instance.clearData();
              RouteManager.goRouteAndRemoveUntil(RouteName.LOGIN);
            },
          ),
        ],
      ),
    );
  }
}
