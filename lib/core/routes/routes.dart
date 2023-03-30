import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/core/routes/route_names.dart';
import 'package:mobile/views/auth/login/view.dart';
import 'package:mobile/views/auth/register/view.dart';
import 'package:mobile/views/diary/view.dart';
import 'package:mobile/views/home/view.dart';
import 'package:mobile/views/settings/view.dart';
import 'package:mobile/views/unknown/view.dart';

get unknownRoute => buildRoute(
      '/unknown',
      const UnknownView(),
    );

get appRoutes => [
      //Auth
      buildRoute(
        RouteName.LOGIN,
        const LoginView(),
      ),
      buildRoute(
        RouteName.REGISTER,
        const RegisterView(),
      ),

      //Home
      buildRoute(
        RouteName.HOME,
        const HomeView(),
      ),

      //Diary
      buildRoute(
        RouteName.DIARIES,
        const DiariesView(),
      ),

      //Settings
      buildRoute(
        RouteName.SETTINGS,
        const SettingView(),
      ),
    ];
GetPage<dynamic> buildRoute(
  String pageUrl,
  Widget page, {
  Object? arguments,
  List<GetPage<dynamic>>? children,
  Curve? curve,
}) {
  return GetPage(
    curve: curve ?? Curves.easeInOut,
    name: pageUrl,
    arguments: arguments,
    page: () => page,
    children: children ?? [],
    middlewares: [MyMiddelware()],
    transition: Transition.rightToLeft,
    transitionDuration: Duration(milliseconds: 400),
  );
}

class MyMiddelware extends GetMiddleware {
  @override
  List<Bindings>? onBindingsStart(List<Bindings>? bindings) {
    Get.focusScope?.unfocus();
    return super.onBindingsStart(bindings);
  }
}
