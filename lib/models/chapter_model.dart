// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ChapterModel {
  final String id;
  final String name;
  final String slug;
  final String nameTransliterated;
  final String nameTranslated;
  final int versesCount;
  final int chapterNumber;
  final String nameMeaning;
  final String chapterSummary;
  final String chapterSummaryHindi;
  final String chapterSummaryHindiAudio;
  final String chapterSummaryEnglishAudio;
  ChapterModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.nameTransliterated,
    required this.nameTranslated,
    required this.versesCount,
    required this.chapterNumber,
    required this.nameMeaning,
    required this.chapterSummary,
    required this.chapterSummaryHindi,
    required this.chapterSummaryHindiAudio,
    required this.chapterSummaryEnglishAudio,
  });

  ChapterModel copyWith({
    String? id,
    String? name,
    String? slug,
    String? nameTransliterated,
    String? nameTranslated,
    int? versesCount,
    int? chapterNumber,
    String? nameMeaning,
    String? chapterSummary,
    String? chapterSummaryHindi,
    String? chapterSummaryHindiAudio,
    String? chapterSummaryEnglishAudio,
  }) {
    return ChapterModel(
      id: id ?? this.id,
      name: name ?? this.name,
      slug: slug ?? this.slug,
      nameTransliterated: nameTransliterated ?? this.nameTransliterated,
      nameTranslated: nameTranslated ?? this.nameTranslated,
      versesCount: versesCount ?? this.versesCount,
      chapterNumber: chapterNumber ?? this.chapterNumber,
      nameMeaning: nameMeaning ?? this.nameMeaning,
      chapterSummary: chapterSummary ?? this.chapterSummary,
      chapterSummaryHindi: chapterSummaryHindi ?? this.chapterSummaryHindi,
      chapterSummaryHindiAudio:
          chapterSummaryHindiAudio ?? this.chapterSummaryHindiAudio,
      chapterSummaryEnglishAudio:
          chapterSummaryEnglishAudio ?? this.chapterSummaryEnglishAudio,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'slug': slug,
      'name_transliterated': nameTransliterated,
      'name_translated': nameTranslated,
      'verses_count': versesCount,
      'chapter_number': chapterNumber,
      'name_meaning': nameMeaning,
      'chapter_summary': chapterSummary,
      'chapter_summary_hindi': chapterSummaryHindi,
      'chapter_summary_hindi_audio': chapterSummaryHindiAudio,
      'chapter_summary_english_audio': chapterSummaryEnglishAudio,
    };
  }

  factory ChapterModel.fromMap(Map<String, dynamic> map) {
    return ChapterModel(
      id: map['\$id'] as String,
      name: map['name'] as String,
      slug: map['slug'] as String,
      nameTransliterated: map['name_transliterated'] as String,
      nameTranslated: map['name_translated'] as String,
      versesCount: map['verses_count'] as int,
      chapterNumber: map['chapter_number'] as int,
      nameMeaning: map['name_meaning'] as String,
      chapterSummary: map['chapter_summary'] as String,
      chapterSummaryHindi: map['chapter_summary_hindi'] as String,
      chapterSummaryHindiAudio: map['chapter_summary_hindi_audio'] as String,
      chapterSummaryEnglishAudio:
          map['chapter_summary_english_audio'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ChapterModel.fromJson(String source) =>
      ChapterModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ChapterModel(id: $id, name: $name, slug: $slug, nameTransliterated: $nameTransliterated, nameTranslated: $nameTranslated, versesCount: $versesCount, chapterNumber: $chapterNumber, nameMeaning: $nameMeaning, chapterSummary: $chapterSummary, chapterSummaryHindi: $chapterSummaryHindi, chapterSummaryHindiAudio: $chapterSummaryHindiAudio, chapterSummaryEnglishAudio: $chapterSummaryEnglishAudio)';
  }

  @override
  bool operator ==(covariant ChapterModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.slug == slug &&
        other.nameTransliterated == nameTransliterated &&
        other.nameTranslated == nameTranslated &&
        other.versesCount == versesCount &&
        other.chapterNumber == chapterNumber &&
        other.nameMeaning == nameMeaning &&
        other.chapterSummary == chapterSummary &&
        other.chapterSummaryHindi == chapterSummaryHindi &&
        other.chapterSummaryHindiAudio == chapterSummaryHindiAudio &&
        other.chapterSummaryEnglishAudio == chapterSummaryEnglishAudio;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        slug.hashCode ^
        nameTransliterated.hashCode ^
        nameTranslated.hashCode ^
        versesCount.hashCode ^
        chapterNumber.hashCode ^
        nameMeaning.hashCode ^
        chapterSummary.hashCode ^
        chapterSummaryHindi.hashCode ^
        chapterSummaryHindiAudio.hashCode ^
        chapterSummaryEnglishAudio.hashCode;
  }
}
