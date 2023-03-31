import 'package:flutter/material.dart';
import 'package:mobile/core/network/manager.dart';
import 'package:mobile/core/routes/go_route.dart';
import 'package:mobile/core/routes/route_names.dart';
import 'package:mobile/core/storage/keys.dart';
import 'package:mobile/core/storage/manager.dart';

class IsAuthView extends StatefulWidget {
  const IsAuthView({super.key});

  @override
  State<IsAuthView> createState() => _IsAuthViewState();
}

class _IsAuthViewState extends State<IsAuthView> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      check();
    });
    super.initState();
  }

  void check() {
    String? token = StorageManager.instance.getString(StorageKeys.TOKEN);
    if (token != null && token.isNotEmpty) {
      RouteManager.goRouteAndRemoveUntil(RouteName.HOME);
    } else {
      RouteManager.goRouteAndRemoveUntil(RouteName.LOGIN);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
