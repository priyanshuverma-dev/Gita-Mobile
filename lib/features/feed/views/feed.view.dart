import 'dart:io';
import 'dart:typed_data';

import 'package:bgm/core/constants.dart';
import 'package:bgm/features/feed/wigets/index.dart';
import 'package:bgm/features/feed/wigets/networkError.card.dart';
import 'package:bgm/features/home/controllers/verse.controller.dart';
import 'package:bgm/theme/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class FeedView extends StatefulWidget {
  final VerseController controller = Get.put(VerseController());
  FeedView({super.key});

  @override
  State<FeedView> createState() => _FeedViewState();
}

class _FeedViewState extends State<FeedView> {
  void showBottomModal() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container();
      },
    );
  }

  void getDialyVerse() async {
    await widget.controller.getVerse();
  }

  void nextVerse() {
    widget.controller.increaseVerseNo();
  }

  void previousVerse() {
    widget.controller.descreseVerseNo();
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

  void shareVerse(ScreenshotController controller, BuildContext context) async {
    /// Getting Snackbar
    final messager = ScaffoldMessenger.of(context);
    // Chexking Storage Permission having or not
    bool isStorageDenied = await Permission.storage.isDenied;
    if (isStorageDenied) {
      return getPermissionDialog();
    }

    /// getting path from path_provide package
    final directory = (await getExternalStorageDirectory())!.path;

    // making fileName
    final fileName = '${widget.controller.dailyVerse.value.slug} - GitaMobile';

    // Checking if file with same name already exist or not
    final getExistingImg = XFile('$directory/$fileName.png');

    // if file exist than share save file don't take screenshot again
    if (getExistingImg.path.isNotEmpty) {
      // sharing file
      Share.shareXFiles([getExistingImg]);
    }

    // if file does'nt exist then take screenshot and share
    else {
      // taking screenshot with controller....
      final image = await controller.capture(delay: const Duration(microseconds: 10));

      // Checking if screenshot is taken [image] = screenshot is null
      if (image != null) {
        /// image is not null than save that to storage
        /// saving in [File] type in [Png] format in
        /// "/storage/emulated/0/Android/data/com.soms.gitaMobile/files"
        final imagePath = await File('$directory/$fileName.png').create();
        await imagePath.writeAsBytes(image);

        /// Share Plugin
        final share = await Share.shareXFiles([XFile(imagePath.path)]);

        switch (share.status) {
          case ShareResultStatus.dismissed:
            messager.showSnackBar(
              const SnackBar(
                content: Text("Sharing dismissed! 😞"),
              ),
            );
            break;
          case ShareResultStatus.success:
            messager.showSnackBar(
              const SnackBar(
                content: Text("Shared success! 😊"),
              ),
            );
            break;
          case ShareResultStatus.unavailable:
            messager.showSnackBar(
              const SnackBar(
                content: Text("Sharing unavailable! 😥"),
              ),
            );
            break;
          default:
            break;
        }
      } else {
        messager.showSnackBar(const SnackBar(content: Text("Unable to get Image 😥")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final ScreenshotController screenshotController = ScreenshotController();

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
              if (widget.controller.isloading.value)
                const CircularProgressIndicator()
              else
                widget.controller.dailyVerse.value.text.isNotEmpty
                    ? ShlokaCard(
                        onPressRight: nextVerse,
                        onPressLeft: () {
                          if (widget.controller.verseNo.value == 0) {
                            return;
                          } else {
                            previousVerse();
                          }
                        },
                        onPressLike: () {},
                        onPressExplain: showBottomModal,
                        onPressShare: () => shareVerse(screenshotController, context),
                        titleText: widget.controller.dailyVerse.value.slug,
                        child: Screenshot(
                          controller: screenshotController,
                          child: MainContent(
                            shlokaText: widget.controller.dailyVerse.value.text,
                            shlokaEngText: widget.controller.dailyVerse.value.transliteration,
                          ),
                        ),
                      )
                    : NetworkErrorCard(onReload: getDialyVerse),
            ],
          ),
        ),
      ),
    );
  }
}
