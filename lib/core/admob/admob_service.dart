import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:mobile/env.dart';

class AdMobService {
  static String? get interstitialAdUnitID {
    if (kDebugMode) {
      return 'ca-app-pub-3940256099942544/1033173712';
    } else {
      return Env.INTERSTITIAL_ID_ANDROID;
    }
  }

  static String? get bannerAdUnitID {
    if (kDebugMode) {
      return 'ca-app-pub-3940256099942544/6300978111';
    } else {
      return Env.BANNER_ID_ANDROID;
    }
  }

  static BannerAdListener bannerListener = BannerAdListener(
    onAdLoaded: (ad) => debugPrint('ad loaded'),
    onAdFailedToLoad: (ad, error) {
      ad.dispose();
      debugPrint("ad failed to load");
    },
    onAdOpened: (ad) => debugPrint("ad opened"),
    onAdClosed: (ad) => debugPrint("ad closed"),
  );
}
