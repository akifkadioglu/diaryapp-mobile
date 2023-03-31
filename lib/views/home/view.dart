import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/core/base/state.dart';
import 'package:mobile/core/base/view.dart';
import 'package:mobile/core/component/app_button.dart';
import 'package:mobile/core/constants/card_constants.dart';
import 'package:mobile/core/constants/text_field_constants.dart';
import 'package:mobile/core/localization/keys.dart';
import 'package:mobile/core/routes/go_route.dart';
import 'package:mobile/core/routes/route_names.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mobile/views/home/service.dart';
import 'package:mobile/views/home/view_controller.dart';

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

  HomeViewController c = Get.put(HomeViewController());
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
              shape: CardConstant().shape(context.theme.disabledColor),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextField(
                      maxLength: 255,
                      textCapitalization: TextCapitalization.sentences,
                      decoration: TextFieldConstant.decoration(textKey: IKey.HEADER),
                      controller: c.header.value,
                    ),
                    TextFormField(
                      maxLength: 2500,
                      maxLines: 6,
                      textCapitalization: TextCapitalization.sentences,
                      decoration: TextFieldConstant.decoration(textKey: IKey.BODY),
                      controller: c.body.value,
                    ),
                    rateBar(),
                    Obx(
                      () => AnimatedSwitcher(
                        duration: const Duration(milliseconds: 150),
                        child: !c.isLoading.value
                            ? const AppButton(textKey: IKey.CREATE, func: create)
                            : const AppButtonLoading(),
                      ),
                    )
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
        updateOnDrag: true,
        onRatingUpdate: (double value) {
          c.rate.value = value;
        },
      ),
    );
  }
}
