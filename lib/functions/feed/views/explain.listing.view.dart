import 'dart:developer';

import 'package:GitaMobile/models/verse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../core/imports/index.dart';
import '../../../theme/pallet.dart';

class ExplainListingView extends StatefulWidget {
  const ExplainListingView({super.key});

  @override
  State<ExplainListingView> createState() => _ExplainListingViewState();
}

class _ExplainListingViewState extends State<ExplainListingView> {
  bool isFilterVisible = false;

  List<Commentary> translations = Get.arguments;
  List<String> languages = ['All', Language.HINDI.name, Language.SANSKRIT.name, Language.ENGLISH.name];
  List<String> type = ['All', "translation", "commentary"];
  String selectedLanguage = 'All';
  String selectedType = 'All';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Pallet.primaryColor,
        appBar: AppBar(
          title: const Text(
            'Translations & Commentaries',
            style: TextStyle(fontSize: 14, color: Pallet.darkColor),
          ),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
              height: 40,
              child: Flexible(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total items: ${translations.length}'),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextButton.icon(
                        style: TextButton.styleFrom(
                          iconColor: Pallet.blueColor,
                          foregroundColor: Pallet.darkColor,
                          backgroundColor: selectedLanguage != "All" ? Pallet.blueColor : Pallet.greyColor,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                        onPressed: () => setState(() {
                          isFilterVisible = !isFilterVisible;
                        }),
                        icon: Icon(
                          Icons.filter_alt,
                          color: selectedLanguage != "All" ? Pallet.whiteColor : Pallet.darkColor,
                        ),
                        label: const Text('Filter'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: isFilterVisible,
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  // SingleChildScrollView(
                  //   physics: const BouncingScrollPhysics(),
                  //   scrollDirection: Axis.horizontal,
                  //   child: Row(
                  //     mainAxisSize: MainAxisSize.min,
                  //     children: type.map((type) {
                  //       return Container(
                  //         margin: const EdgeInsets.all(8),
                  //         child: FilterChip(
                  //           visualDensity: VisualDensity.comfortable,
                  //           label: Text(type),
                  //           selectedColor: Pallet.blueColor,
                  //           backgroundColor: Pallet.greyColor,
                  //           selected: selectedType == type,
                  //           showCheckmark: false,
                  //           onSelected: (isSelected) {
                  //             setState(() {
                  //               selectedType = isSelected ? type : 'All';
                  //               log(selectedType);
                  //             });
                  //           },
                  //         ),
                  //       );
                  //     }).toList(),
                  //   ),
                  // ),
                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: languages.map((language) {
                        return Container(
                          margin: const EdgeInsets.all(8),
                          child: FilterChip(
                            visualDensity: VisualDensity.comfortable,
                            label: Text(language),
                            selected: selectedLanguage == language,
                            selectedColor: Pallet.blueColor,
                            backgroundColor: Pallet.greyColor,
                            showCheckmark: false,
                            onSelected: (isSelected) {
                              setState(() {
                                selectedLanguage = isSelected ? language : 'All';
                                log(selectedLanguage);
                              });
                            },
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: translations.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  if (selectedType == translations[index].type || selectedType == "All" && selectedLanguage == "All" || selectedLanguage == translations[index].language.name) {
                    return ListTile(
                      leading: translations[index].language.name == 'ENGLISH' ? Image.asset(PIcons.english) : Image.asset(translations[index].language.name == 'HINDI' ? PIcons.hindi : PIcons.sanskrit),
                      title: Text(
                        "${translations[index].type}: ${translations[index].language.name}",
                        style: TextStyle(color: translations[index].type == "translation" ? Pallet.redColor.withOpacity(.7) : Pallet.blueColor),
                      ),
                      subtitle: Text(translations[index].authorName),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(PIcons.angleRight),
                      ),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            )
          ],
        ));
  }
}
