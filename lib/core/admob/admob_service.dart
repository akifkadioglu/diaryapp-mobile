import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:mobile/env.dart';

class AdMobService {
  static String? get interstitialAdUnitID {
    if (kDebugMode) {
      if (Platform.isAndroid) {
        return 'ca-app-pub-3940256099942544/1033173712';
      } else {
        return 'ca-app-pub-3940256099942544/4411468910';
      }
    } else {
      if (Platform.isAndroid) {
        return Env.INTERSTITIAL_ID_ANDROID;
      } else {
        return Env.INTERSTITIAL_ID_IOS;
      }
    }
  }
}
