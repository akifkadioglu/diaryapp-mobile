import 'package:get/get.dart';
import 'package:mobile/core/routes/route_names.dart';

class RouteManager {
  static void normalRoute(String path, {Map<String, String>? parameters}) {
    Get.toNamed(path, parameters: parameters);
  }

  static void goRouteAndRemoveUntil(String path, {Map<String, String>? parameters}) {
    Get.offAllNamed(path, parameters: parameters);
  }

  static void goRouteAndRemoveUntilExceptHome(String path, {Map<String, String>? parameters}) {
    Get.offAllNamed(RouteName.HOME);
    Get.toNamed(path, parameters: parameters);
  }
}
