import 'package:bgm/core/constants.dart';
import 'package:bgm/core/error.handller.dart';
import 'package:bgm/models/verse.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class VerseController extends GetxController {
  final baseUrl = Constants.serverUrl;
  var isloading = false.obs;

  Rx<Verse> dailyVerse = Verse(
    id: '',
    verseId: -1,
    verseNumber: -1,
    chapterNumber: -1,
    slug: '',
    text: '',
    transliteration: '',
    wordMeanings: '',
  ).obs;

  @override
  void onInit() {
    getVerse();
    super.onInit();
  }

  Future getVerse() async {
    print("getVerse() called ✔");
    try {
      isloading.value = true;
      var res = await http.get(Uri.parse('$baseUrl/random'));
      httpErrorHandle(
        response: res,
        onSuccess: () {
          dailyVerse.value = Verse.fromRawJson(res.body);
          isloading.value = false;
        },
      );
    } catch (e) {
      isloading.value = false;
      print(e);
    } finally {
      isloading.value = false;
    }
  }
}
