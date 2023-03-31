import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginViewController extends GetxController {
  var mail = ''.obs;
  var password = ''.obs;
  var isLoading = false.obs;
  get setLoading => isLoading.value = !isLoading.value;
}
