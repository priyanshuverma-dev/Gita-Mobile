import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:bgm/core/constants.dart';
import 'package:bgm/core/utils.dart';
import 'package:bgm/features/feed/wigets/index.dart';
import 'package:bgm/features/feed/wigets/networkError.card.dart';
import 'package:bgm/features/home/controllers/verse.controller.dart';
import 'package:bgm/models/verse.dart';
import 'package:bgm/theme/index.dart';
import 'package:screenshot/screenshot.dart';

class FeedView extends StatefulWidget {
  const FeedView({super.key});

  @override
  State<FeedView> createState() => _FeedViewState();
}

class _FeedViewState extends State<FeedView> {
  void showBottomModal({required List<Commentary> translations}) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 500,
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                ListView.builder(
                  itemCount: translations.length,
                  // shrinkWrap: true,
                  keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(translations[index].authorName),
                      subtitle: Text(translations[index].language.name),
                    );
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void getPermissionDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: const BeveledRectangleBorder(),
          actionsAlignment: MainAxisAlignment.center,
          backgroundColor: Pallet.primaryColor,
          title: const Text(
            "Permission Denied!",
            style: TextStyle(fontSize: 20, color: Pallet.darkColor),
          ),
          content: const Text(
            "Please allow us storage permission to save screenshot and share.",
            style: TextStyle(color: Pallet.darkColor, fontStyle: FontStyle.normal, fontWeight: FontWeight.normal, fontFamily: 'Roboto'),
          ),
          buttonPadding: const EdgeInsets.all(4),
          actionsPadding: const EdgeInsets.all(4),
          actionsOverflowButtonSpacing: 5,
          actionsOverflowAlignment: OverflowBarAlignment.center,
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text(
                'Back',
                style: TextStyle(color: Pallet.darkColor),
              ),
            ),
            const TextButton(
              onPressed: openAppSettings,
              child: Text(
                'Settings',
                style: TextStyle(color: Pallet.darkColor),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final ScreenshotController screenshotController = ScreenshotController();
    final VerseController controller = Get.put(VerseController(context: context));

    return Scaffold(
      backgroundColor: Pallet.primaryColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Obx(
          () => Column(
            children: [
              FeedAppbar(
                name: 'Priyanshu',
                profileUrl: Constants.photourl,
                ontapProfile: () => Get.toNamed('/about'),
                onPressSearch: () => Get.toNamed('/search'),
              ),
              if (controller.isloading.value)
                const CircularProgressIndicator()
              else
                controller.dailyVerse.value.text.isNotEmpty
                    ? ShlokaCard(
                        onPressRight: controller.increaseVerseNo,
                        onPressLeft: () {
                          if (controller.verseNo.value == 0) {
                            return;
                          } else {
                            controller.descreseVerseNo();
                          }
                        },
                        onPressLike: () => showSnackBar(context, 'Testing snackbar!'),
                        onPressExplain: () => showBottomModal(
                          translations: controller.dailyVerse.value.translations,
                        ),
                        onPressShare: () => controller.shareVerse(
                          shotController: screenshotController,
                          context: context,
                          slug: controller.dailyVerse.value.slug,
                          getPermissionDialog: getPermissionDialog,
                        ),
                        titleText: controller.dailyVerse.value.slug,
                        child: Screenshot(
                          controller: screenshotController,
                          child: MainContent(
                            shlokaText: controller.dailyVerse.value.text,
                            shlokaEngText: controller.dailyVerse.value.transliteration,
                            translation: controller.dailyVerse.value.translations[0].description,
                          ),
                        ),
                      )
                    : NetworkErrorCard(onReload: controller.getVerse),
            ],
          ),
        ),
      ),
    );
  }
}
