import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/core/base/state.dart';
import 'package:mobile/core/localization/keys.dart';

class DiariesView extends StatefulWidget {
  const DiariesView({super.key});

  @override
  State<DiariesView> createState() => _DiariesViewState();
}

class _DiariesViewState extends BaseState<DiariesView> {
  @override
  void initState() {
    loadBannerAd();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(IKey.APP_NAME.tr),
        elevation: 0,
      ),
      body: Center(
        child: Text('sdmkflskdf'),
      ),
      bottomSheet: bannerAdWidget(),
    );
  }
}
