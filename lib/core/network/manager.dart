import 'dart:convert';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mobile/core/models/unauthorized_model.dart';
import 'package:mobile/core/network/constant.dart';
import 'package:mobile/core/routes/go_route.dart';
import 'package:mobile/core/routes/route_names.dart';
import 'package:mobile/core/snackbar/manager.dart';
import 'package:mobile/core/storage/keys.dart';
import 'package:mobile/core/storage/manager.dart';

class NetworkManager {
  static final NetworkManager _instance = NetworkManager._init();

  static NetworkManager get instance => _instance;
  GetStorage? box;
  NetworkManager._init() {
    box = GetStorage();
  }

  Future<String> fetchData(String method, String url, {Map<String, String>? params, Map<String, dynamic>? body}) async {
    bool isConnect = await InternetConnectionChecker().hasConnection;
    String result = "";
    if (isConnect == false) {
      SnackbarManager.show(message: result);
      return result;
    }
    try {
      var request = http.Request(method, Uri.parse(url));
      var response = await http.Client().send(request);

      NetworkConstant().headers.forEach((key, value) {
        request.headers[key] = value;
      });
      if (body != null) {
        request.body = jsonEncode(body);
      }
      if (params != null) {
        request.url.queryParameters.addAll(params);
      }

      switch (response.statusCode) {
        case HttpStatus.ok:
          result = await response.stream.bytesToString();
          break;
        case HttpStatus.unauthorized:
          RouteManager.goRouteAndRemoveUntil(RouteName.LOGIN);
          SnackbarManager.show(message: unauthorizedModelFromJson(result).error);
          break;
        case HttpStatus.badRequest:
          var err = await response.stream.bytesToString();
          print(err);
          SnackbarManager.show(message: err);
          break;
        default:
          SnackbarManager.show(message: result);
      }
    } catch (e) {
      SnackbarManager.show(message: result);
    }
    return result;
  }
}
