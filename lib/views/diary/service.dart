import 'dart:convert';
import 'dart:io';
import 'package:mobile/core/localization/keys.dart';
import 'package:mobile/core/localization/translate.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';

import 'package:get/get.dart';
import 'package:mobile/core/models/diary_model.dart';
import 'package:mobile/core/models/network_model.dart';
import 'package:mobile/core/network/constant.dart';
import 'package:mobile/core/network/manager.dart';
import 'package:mobile/views/diary/view_controller.dart';

void diaries() async {
  DiaryViewController c = Get.put(DiaryViewController());
  c.setLoading;
  NetworkModel res = await NetworkManager.instance.fetchData(NetworkConstant.GET, NetworkConstant.DIARY_ALL);
  if (res.statusCode == 200) {
    c.diary.value = diaryModelFromJson(res.result).data;
  }
  c.setLoading;
}

void share() async {
  DiaryViewController c = Get.put(DiaryViewController());
  final Directory output = await getTemporaryDirectory();
  final String filePath = '${output.path}/diary.json';
  final File file = File(filePath);
  await file.writeAsString(json.encode(c.diary.value));
  if (filePath.isNotEmpty) {
    Share.shareXFiles(
      [
        XFile(filePath),
      ],
      text: translate(IKey.SHARE_TEXT),
      subject: translate(IKey.APP_NAME),
    );
  }
}

void delete(String id, int index) async {
  DiaryViewController c = Get.put(DiaryViewController());
  c.setCurrIndex(index);

  NetworkModel res =
      await NetworkManager.instance.fetchData(NetworkConstant.DELETE, NetworkConstant.DIARY_DELETE, query: {
    "id": id,
  });
  if (res.statusCode == 200) {
    c.diary.removeAt(index);
  }
  c.setCurrIndex(10000);
}
