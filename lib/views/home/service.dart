import 'package:mobile/core/network/constant.dart';
import 'package:mobile/core/network/manager.dart';

deneme() async {
  String a = await NetworkManager.instance.fetchData(NetworkConstant.GET, NetworkConstant.DIARY_ALL);
  print(a);
}
