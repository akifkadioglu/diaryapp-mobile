import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeViewController extends GetxController {
  var rate = 3.0.obs;
  var header = TextEditingController().obs;
  var body = TextEditingController().obs;
  var isLoading = false.obs;
  get setLoading => isLoading.value = !isLoading.value;
}
