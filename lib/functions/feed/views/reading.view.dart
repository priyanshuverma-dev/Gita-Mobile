import 'package:GitaMobile/models/verse.dart';
import 'package:GitaMobile/theme/pallet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ReadingView extends StatelessWidget {
  const ReadingView({super.key});

  @override
  Widget build(BuildContext context) {
    Commentary translation = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("${translation.authorName} ${translation.type}", style: const TextStyle(fontSize: 16, color: Pallet.darkColor)),
      ),
      backgroundColor: Pallet.primaryColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "${translation.language.name} ${translation.id}",
                style: GoogleFonts.tiroDevanagariHindi(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Pallet.darkColor,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const Divider(
              color: Pallet.darkColor,
              endIndent: 10,
              indent: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                translation.description,
                style: GoogleFonts.tiroDevanagariHindi(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Pallet.darkColor,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const Divider(
              color: Pallet.darkColor,
              endIndent: 10,
              indent: 10,
            ),
            const Text(
              "...",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Pallet.darkColor,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
