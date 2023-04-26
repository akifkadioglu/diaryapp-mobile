import 'package:get/get.dart';
import 'package:mobile/core/localization/keys.dart';

String translate(IKey? key) {
  var result = "";
  if (key != null) {
    result = key.toString().tr;
  }
  return result;
}
