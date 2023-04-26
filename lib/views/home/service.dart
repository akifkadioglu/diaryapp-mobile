import 'package:get/get.dart';
import 'package:mobile/core/localization/keys.dart';
import 'package:mobile/core/localization/translate.dart';
import 'package:mobile/core/models/network_model.dart';
import 'package:mobile/core/network/constant.dart';
import 'package:mobile/core/network/manager.dart';
import 'package:mobile/core/snackbar/manager.dart';
import 'package:mobile/views/home/view_controller.dart';

create() async {
  HomeViewController c = Get.put(HomeViewController());
  c.setLoading;
  Map<String, dynamic> body = {
    "header": c.header.value.text,
    "body": c.body.value.text,
    "rate": c.rate.value,
  };
  NetworkModel r =
      await NetworkManager.instance.fetchData(NetworkConstant.POST, NetworkConstant.DIARY_CREATE, body: body);
  if (r.statusCode == 200) {
    c.header.value.text = "";
    c.body.value.text = "";
    c.rate.value = 3.0;
    SnackbarManager.show(title: translate(IKey.APP_NAME),message: translate(IKey.CREATED));
  }
  c.setLoading;
}
