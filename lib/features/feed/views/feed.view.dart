import 'package:bgm/core/constants.dart';
import 'package:bgm/features/feed/wigets/index.dart';
import 'package:bgm/features/home/controllers/verse.controller.dart';
import 'package:bgm/models/verse.dart';
import 'package:bgm/theme/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallet.primaryColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Obx(
          () => Column(
            children: [
              Text(widget.controller.verseNo.value.toString()),
              FeedAppbar(
                name: 'Priyanshu',
                profileUrl: Constants.photourl,
                ontapProfile: () => Get.toNamed('/about'),
                onPressSearch: () => Get.toNamed('/search'),
              ),
              widget.controller.isloading.value
                  ? const CircularProgressIndicator()
                  : ShlokaCard(
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
                      onPressShare: () {},
                      shlokaText: widget.controller.dailyVerse.value.text,
                      shlokaEngText: widget.controller.dailyVerse.value.transliteration,
                      titleText: widget.controller.dailyVerse.value.slug,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
