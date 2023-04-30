// To parse this JSON data, do
//
//     final verse = verseFromJson(jsonString);

import 'dart:convert';

class Verse {
  Verse({
    required this.id,
    required this.verseId,
    required this.verseNumber,
    required this.chapterNumber,
    required this.slug,
    required this.text,
    required this.transliteration,
    required this.wordMeanings,
    this.translations,
    this.commentaries,
  });

  String id;
  int verseId;
  int verseNumber;
  int chapterNumber;
  String slug;
  String text;
  String transliteration;
  String wordMeanings;
  List<Commentary>? translations;
  List<Commentary>? commentaries;

  // factory Verse.fromRawJson(String str) => Verse.fromJson(json.decode(str));

  // String toRawJson() => json.encode(toJson());

  // factory Verse.fromJson(Map<String, dynamic> json) => Verse(
  //       id: json["_id"],
  //       verseId: json["id"],
  //       verseNumber: json["verse_number"],
  //       chapterNumber: json["chapter_number"],
  //       slug: json["slug"],
  //       text: json["text"],
  //       transliteration: json["transliteration"],
  //       wordMeanings: json["word_meanings"],
  //       translations: List<Commentary>.from(json["translations"].map((x) => Commentary.fromJson(x))),
  //       commentaries: List<Commentary>.from(json["commentaries"].map((x) => Commentary.fromJson(x))),
  //     );

  // Map<String, dynamic> toJson() => {
  //       "_id": id,
  //       "id": verseId,
  //       "verse_number": verseNumber,
  //       "chapter_number": chapterNumber,
  //       "slug": slug,
  //       "text": text,
  //       "transliteration": transliteration,
  //       "word_meanings": wordMeanings,
  //       "translations": List<dynamic>.from(translations.map((x) => x.toJson())),
  //       "commentaries": List<dynamic>.from(commentaries.map((x) => x.toJson())),
  //     };
}

class Commentary {
  Commentary({
    required this.id,
    required this.description,
    required this.authorName,
    required this.language,
  });

  int id;
  String description;
  String authorName;
  Language language;

  factory Commentary.fromRawJson(String str) => Commentary.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Commentary.fromJson(Map<String, dynamic> json) => Commentary(
        id: json["id"],
        description: json["description"],
        authorName: json["author_name"],
        language: languageValues.map[json["language"]]!,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "author_name": authorName,
        "language": languageValues.reverse[language],
      };
}

enum Language { SANSKRIT, HINDI, ENGLISH }

final languageValues = EnumValues({"english": Language.ENGLISH, "hindi": Language.HINDI, "sanskrit": Language.SANSKRIT});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
