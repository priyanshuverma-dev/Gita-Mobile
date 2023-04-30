// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:bgm/core/enums/language.enum.dart';

class Commentary {
  Commentary({
    required this.id,
    required this.description,
    required this.authorName,
    required this.language,
  });

  final int id;
  final String description;
  final String authorName;
  final Language language;

  Commentary copyWith({
    int? id,
    String? description,
    String? authorName,
    Language? language,
  }) {
    return Commentary(
      id: id ?? this.id,
      description: description ?? this.description,
      authorName: authorName ?? this.authorName,
      language: language ?? this.language,
    );
  }

  @override
  String toString() {
    return 'Commentary(id: $id, description: $description, authorName: $authorName, language: $language)';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'description': description,
      'authorName': authorName,
      'language': language.type,
    };
  }

  factory Commentary.fromMap(Map<String, dynamic> map) {
    return Commentary(
      id: map['id'] as int,
      description: map['description'] as String,
      authorName: map['authorName'] as String,
      language: (map['language'] as String).toLanguageEnum(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Commentary.fromJson(String source) => Commentary.fromMap(json.decode(source) as Map<String, dynamic>);
}
