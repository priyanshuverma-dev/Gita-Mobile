import 'dart:developer';
import 'dart:io';

import 'package:GitaMobile/core/constants.dart';
import 'package:GitaMobile/core/handlers/error.handler.dart';
import 'package:GitaMobile/core/utils.dart';
import 'package:GitaMobile/models/verse.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VerseController extends GetxController {
  final baseUrl = Constants.serverUrl;
  var isloading = false.obs;
  var verseNo = 1.obs;

  final BuildContext context;

  VerseController({required this.context});

  Rx<Verse> dailyVerse = Verse(
    id: '',
    verseId: 0,
    verseNumber: -1,
    chapterNumber: -1,
    slug: '',
    text: '',
    transliteration: '',
    wordMeanings: '',
    commentaries: [],
    translations: [],
  ).obs;

  @override
  void onInit() async {
    final prefs = await SharedPreferences.getInstance();
    int? verseId = prefs.getInt("verseNo");
    if (verseId == null) {
      verseNo.value = 1;
    } else {
      verseNo.value = verseId;
    }
    getVerse();
    super.onInit();
  }

  Future getVerse() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt("verseNo", verseNo.value);
    try {
      isloading.value = true;
      var res = await http.get(Uri.parse('$baseUrl/daily?prev=$verseNo'));
      if (context.mounted) {
        httpErrorHandle(
          context: context,
          response: res,
          onSuccess: () {
            var verse = Verse.fromRawJson(res.body);
            var spilted = verse.slug.replaceAll('-', ' ');
            dailyVerse.value = verse;
            dailyVerse.value.slug = spilted;
            isloading.value = false;
          },
        );
      }
    } on FormatException catch (e) {
      if (context.mounted) showSnackBar(context, e.message);
    } on SocketException catch (e) {
      if (context.mounted) showSnackBar(context, e.message);
      log(e.message, error: e);
    } on PlatformException catch (e) {
      if (context.mounted) showSnackBar(context, e.details);
      log(e.details, error: e);
    } catch (e) {
      if (context.mounted) showSnackBar(context, e.toString());
      log(e.toString(), error: e);
    } finally {
      isloading.value = false;
    }
  }

  void increaseVerseNo() async {
    verseNo.value = dailyVerse.value.verseId + 1;
    await getVerse();
  }

  void descreseVerseNo() async {
    verseNo.value = dailyVerse.value.verseId - 1;
    await getVerse();
  }

  Future shareVerse({
    required ScreenshotController shotController,
    required BuildContext context,
    required String slug,
    required VoidCallback getPermissionDialog,
  }) async {
    // Checking Storage Permission having or not
    bool isStorageDenied = await Permission.storage.isDenied;
    if (isStorageDenied) {
      return getPermissionDialog();
    }

    try {
      isloading.value == true;

      /// getting path from path_provide package
      final directory = (await getExternalStorageDirectory())!.path;

      // making fileName
      final fileName = '$slug - GitaMobile';

      // Checking if file with same name already exist than delete

      // taking screenshot with controller....
      final image = await shotController.capture(delay: const Duration(microseconds: 10));
      // Checking if screenshot is taken [image] = screenshot is null
      if (image != null) {
        /// image is not null than save that to storage
        /// saving in [File] type in [Png] format in
        /// "/storage/emulated/0/Android/data/com.soms.gitaMobile/files"
        final imagePath = await File('$directory/$fileName.png').create();
        await imagePath.writeAsBytes(image);

        /// Share Plugin
        await Share.shareXFiles(
          [XFile(imagePath.path)],
          subject: "Bhagvad Gita $slug",
          text: "Download Gita Mobile. https://bit.ly/3nqrW51",
        );
        isloading.value = false;
      } else {
        if (context.mounted) showSnackBar(context, "Unable to get Image 😥");
      }
    } catch (e) {
      if (context.mounted) showSnackBar(context, e.toString());
      log(e.toString(), error: e);
    } finally {
      isloading.value = false;
    }
  }
}
