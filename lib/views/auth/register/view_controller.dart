import 'package:get/get.dart';

class RegisterViewController extends GetxController {
  var mail = ''.obs;
  var name = ''.obs;
  var password = ''.obs;
  var isLoading = false.obs;
  get setLoading => isLoading.value = !isLoading.value;
}
