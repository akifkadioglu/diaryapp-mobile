import 'package:mobile/core/models/auth_model.dart';
import 'package:mobile/core/network/constant.dart';
import 'package:mobile/core/network/manager.dart';
import 'package:mobile/core/routes/go_route.dart';
import 'package:mobile/core/routes/route_names.dart';
import 'package:mobile/core/storage/keys.dart';
import 'package:mobile/core/storage/manager.dart';

void login() async {
  String token = await NetworkManager.instance.fetchData(NetworkConstant.POST, NetworkConstant.AUTH_LOGIN);
  if (token.isNotEmpty) {
    StorageManager.instance.setData(StorageKeys.TOKEN, authModelFromJson(token).token);
    RouteManager.goRouteAndRemoveUntil(RouteName.HOME);
  }
}
