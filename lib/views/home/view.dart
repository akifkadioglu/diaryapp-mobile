import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/core/base/state.dart';
import 'package:mobile/core/base/view.dart';
import 'package:mobile/core/component/app_button.dart';
import 'package:mobile/core/component/app_text_field.dart';
import 'package:mobile/core/component/app_textarea.dart';
import 'package:mobile/core/localization/keys.dart';
import 'package:mobile/core/routes/go_route.dart';
import 'package:mobile/core/routes/route_names.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mobile/views/home/service.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends BaseState<HomeView> {
  @override
  void initState() {
    loadInterstitialAd();
    super.initState();
  }

  double _userRating = 3.0;

  @override
  Widget build(BuildContext context) {
    return BaseView(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: Text(IKey.APP_NAME.tr),
            elevation: 0,
            actions: [
              IconButton(
                onPressed: () {
                  RouteManager.normalRoute(RouteName.DIARIES);
                },
                icon: const Icon(Icons.auto_stories),
              ),
              Builder(builder: (context) {
                return IconButton(
                  onPressed: () {
                    RouteManager.normalRoute(RouteName.SETTINGS);
                  },
                  icon: const Icon(Icons.settings),
                );
              }),
            ],
          ),
          body: SingleChildScrollView(
            child: Card(
              color: context.theme.canvasColor,
              elevation: 0,
              margin: const EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                side: BorderSide(
                  color: context.theme.disabledColor,
                  width: 0.5,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const AppTextField(textKey: IKey.HEADER),
                    const AppTextArea(textKey: IKey.BODY),
                    rateBar(),
                    AppButton(textKey: IKey.SEND, func: deneme),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Padding rateBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: RatingBar.builder(
        itemBuilder: (context, index) => const Icon(
          Icons.star,
          color: Colors.amber,
        ),
        itemCount: 5,
        glow: false,
        initialRating: 3,
        itemSize: 35.0,
        allowHalfRating: true,
        unratedColor: Colors.amber.withAlpha(50),
        direction: Axis.horizontal,
        onRatingUpdate: (double value) {
          _userRating = value;
        },
      ),
    );
  }
}
