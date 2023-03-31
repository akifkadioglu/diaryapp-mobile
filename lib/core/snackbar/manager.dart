import 'package:get/get.dart';

class SnackbarManager {
  static SnackbarController show({String? title, String? message}) {
    return Get.showSnackbar(
      GetSnackBar(
        title: title,
        message: message,
        duration: Duration(seconds: 3),
      ),
    );
  }
}
