// ignore_for_file: non_constant_identifier_names

import 'package:mobile/core/storage/keys.dart';
import 'package:mobile/core/storage/manager.dart';

class NetworkConstant {
  static String BASE_URL = 'https://akifkadioglu-diary-app.onrender.com';

  //auth
  static String AUTH_LOGIN = '$BASE_URL/auth/login';
  static String AUTH_REGISTER = '$BASE_URL/auth/register';

  static String DIARY_ALL = '$BASE_URL/diary/all';
  static String DIARY_CREATE = '$BASE_URL/diary/create';
  static String DIARY_DELETE = '$BASE_URL/diary/delete';

  // When the "location" changes, the "header" below should also change, so it's not static
  Map<String, String> headers = {
    'accept': 'Application/json',
    'content-type': 'Application/json',
    'Authorization': StorageManager.instance.getString(StorageKeys.TOKEN) ?? '',
  };

  //methods
  static String POST = "post";
  static String GET = "get";
  static String DELETE = "delete";
}
