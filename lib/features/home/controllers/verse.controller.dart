import 'dart:io';

import 'package:bgm/core/constants.dart';
import 'package:bgm/core/error.handler.dart';
import 'package:bgm/models/verse.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class VerseController extends GetxController {
  final baseUrl = Constants.serverUrl;
  var isloading = false.obs;
  var verseNo = 1.obs;

  Rx<Verse> dailyVerse = Verse(
    id: '',
    verseId: 0,
    verseNumber: -1,
    chapterNumber: -1,
    slug: '',
    text: '',
    transliteration: '',
    wordMeanings: '',
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
    print("getVerse() called ✔");
    try {
      isloading.value = true;
      var res = await http.get(Uri.parse('$baseUrl/daily?prev=$verseNo'));
      httpErrorHandle(
        response: res,
        onSuccess: () {
          var verse = Verse.fromRawJson(res.body);
          var spilted = verse.slug.replaceAll('-', ' ');
          dailyVerse.value = verse;
          dailyVerse.value.slug = spilted;
          print(spilted);
          isloading.value = false;
        },
      );
    } on SocketException catch (e) {
      Get.snackbar('Connection Error', e.toString());
    } on PlatformException catch (e) {
      Get.snackbar('Connection Error', e.toString());
    } catch (e) {
      print(e);
      Get.snackbar('Connection Error', e.toString());
      isloading.value = false;
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
}
