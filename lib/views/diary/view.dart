import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:mobile/core/base/state.dart';
import 'package:mobile/core/component/expandable_text.dart';
import 'package:mobile/core/localization/keys.dart';
import 'package:mobile/core/localization/translate.dart';
import 'package:mobile/core/models/diary_model.dart';
import 'package:mobile/views/diary/service.dart';
import 'package:mobile/views/diary/view_controller.dart';
import 'package:intl/intl.dart';

class DiariesView extends StatefulWidget {
  const DiariesView({super.key});

  @override
  State<DiariesView> createState() => _DiariesViewState();
}

class _DiariesViewState extends BaseState<DiariesView> {
  @override
  void initState() {
    loadBannerAd();
    diaries();
    super.initState();
  }

  DiaryViewController c = Get.put(DiaryViewController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(translate(IKey.APP_NAME)),
        elevation: 0,
        actions: [
          Obx(
            () => IconButton(
              onPressed: c.isLoading.value ? null : share,
              icon: const Icon(Icons.ios_share),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () {
                var diaries = c.diary.value;
                return c.isLoading.value
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.separated(
                        separatorBuilder: (BuildContext context, int index) {
                          return const Divider();
                        },
                        physics: const BouncingScrollPhysics(),
                        itemCount: diaries.length,
                        itemBuilder: (context, index) {
                          return Obx(
                            () => Container(
                              color: index % 2 == 0 ? themeData.hoverColor : null,
                              child: ListTile(
                                onLongPress: () {
                                  askAndDelete(context, diaries, index);
                                },
                                enabled: !(c.currIndex.value == index),
                                title: Padding(
                                  padding: const EdgeInsets.only(top: 20.0),
                                  child: Text(diaries[index].header),
                                ),
                                subtitle: dayContent(diaries, index),
                              ),
                            ),
                          );
                        },
                      );
              },
            ),
          ),
          SizedBox(
            height: (bannerAd?.size.height ?? 0) * 1,
          ),
        ],
      ),
      bottomSheet: bannerAdWidget(),
    );
  }

  Padding dayContent(List<Datum> diaries, int index) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              rateBar(diaries[index].rate),
            ],
          ),
          ExpandableText(
            diaries[index].body,
            trimLines: 2,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(DateFormat('yyyy MMMM dd EEEE HH:mm', Get.locale?.languageCode).format(
                  DateTime.parse(
                    diaries[index].createdAt.toString(),
                  ),
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> askAndDelete(BuildContext context, List<Datum> diaries, int index) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            translate(IKey.ARE_YOU_SURE),
          ),
          content: Text(
            translate(IKey.ARE_YOU_SURE_LONG),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                translate(IKey.CANCEL),
                style: TextStyle(
                  color: context.theme.colorScheme.onSurface,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(translate(IKey.DELETE),
                  style: TextStyle(
                    color: context.theme.colorScheme.onSurface,
                  )),
              onPressed: () {
                delete(diaries[index].id, index);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Padding rateBar(double rate) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: RatingBar.builder(
        itemBuilder: (context, index) => const Icon(
          Icons.star,
          color: Colors.amber,
        ),
        itemCount: 5,
        glow: false,
        initialRating: rate,
        itemSize: 25.0,
        ignoreGestures: true,
        allowHalfRating: true,
        unratedColor: Colors.amber.withAlpha(50),
        direction: Axis.horizontal,
        updateOnDrag: true,
        onRatingUpdate: (double value) {},
      ),
    );
  }
}
