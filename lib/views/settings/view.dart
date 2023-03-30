import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/core/localization/keys.dart';
import 'package:mobile/core/localization/languages.dart';
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
        title: Text(IKey.SETTINGS.tr),
        elevation: 0,
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text(IKey.CHANGE_LANG.tr),
            onTap: () {
              Get.locale?.languageCode == Languages.TURKISH.languageCode
                  ? Get.updateLocale(Languages.ENGLISH)
                  : Get.updateLocale(Languages.TURKISH);
            },
          ),
          ListTile(
            title: Text(
              IKey.LOGOUT.tr,
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
