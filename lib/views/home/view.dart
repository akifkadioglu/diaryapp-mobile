import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/core/base/state.dart';
import 'package:mobile/core/base/view.dart';
import 'package:mobile/core/localization/keys.dart';
import 'package:mobile/core/routes/go_route.dart';
import 'package:mobile/core/routes/route_names.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends BaseState<HomeView> {
  @override
  void initState() {
    loadInterstitialAd();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: Text(IKey.APP_NAME.tr),
            elevation: 0,
            actions: [
              IconButton(
                onPressed: () {
                  RouteManager.normalRoute(RouteName.DIARIES);
                },
                icon: const Icon(Icons.auto_stories),
              ),
              Builder(builder: (context) {
                return IconButton(
                  onPressed: () {
                    RouteManager.normalRoute(RouteName.SETTINGS);
                  },
                  icon: const Icon(Icons.settings),
                );
              }),
            ],
          ),
          body: Center(
            child: TextButton(
              child: const Text("home"),
              onPressed: () {
                RouteManager.normalRoute(RouteName.LOGIN);
              },
            ),
          ),
        );
      },
    );
  }
}
