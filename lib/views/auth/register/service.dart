import 'package:get/get.dart';
import 'package:mobile/core/models/auth_model.dart';
import 'package:mobile/core/models/network_model.dart';
import 'package:mobile/core/network/constant.dart';
import 'package:mobile/core/network/manager.dart';
import 'package:mobile/core/routes/go_route.dart';
import 'package:mobile/core/routes/route_names.dart';
import 'package:mobile/core/storage/keys.dart';
import 'package:mobile/core/storage/manager.dart';
import 'package:mobile/views/auth/register/view_controller.dart';

void register() async {
  RegisterViewController c = Get.put(RegisterViewController());
  c.setLoading;
  Map<String, String> body = {
    'email': c.mail.value,
    'name': c.name.value,
    'password': c.password.value,
  };
  NetworkModel token =
      await NetworkManager.instance.fetchData(NetworkConstant.POST, NetworkConstant.AUTH_REGISTER, body: body);
  if (token.result.isNotEmpty) {
    StorageManager.instance.setData(StorageKeys.TOKEN, authModelFromJson(token.result).token);
    RouteManager.goRouteAndRemoveUntil(RouteName.HOME);
  }
  c.setLoading;
}
