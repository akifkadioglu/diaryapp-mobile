import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:mobile/core/admob/admob_service.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  ThemeData get themeData => Theme.of(context);
  double dynamicHeight(double value) => MediaQuery.of(context).size.height * value;
  double dynamicWidth(double value) => MediaQuery.of(context).size.width * value;

  InterstitialAd? _interstitialAd;
  BannerAd? _bannerAd;

  void loadBannerAd() {
    _bannerAd = BannerAd(
      size: AdSize.fullBanner,
      adUnitId: AdMobService.bannerAdUnitID!,
      listener: AdMobService.bannerListener,
      request: const AdRequest(),
    );
    _bannerAd?.load();
  }

  Widget bannerAdWidget() {
    return _bannerAd == null
        ? Container()
        : Container(
            height: (_bannerAd?.size.height ?? 0) * 1,
            child: AdWidget(ad: _bannerAd!),
          );
  }

  void loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: AdMobService.interstitialAdUnitID!,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: onAdLoaded,
        onAdFailedToLoad: (error) => _interstitialAd = null,
      ),
    );
  }

  void onAdLoaded(InterstitialAd ad) {
    _interstitialAd = ad;
    _interstitialAd!.show();
  }
}
