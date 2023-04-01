import 'package:get/get.dart';
import 'package:mobile/core/models/diary_model.dart';

class DiaryViewController extends GetxController {
  var diary = <Datum>[].obs;
  var isLoading = false.obs;
  var currIndex = 10000.obs;
  get setLoading => isLoading.value = !isLoading.value;
  void setCurrIndex(int index) => currIndex.value = index;
}
