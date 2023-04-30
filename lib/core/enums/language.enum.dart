enum Language {
  sanskrit('sanskrit'),
  english('enlish'),
  hindi('hindi');

  final String type;
  const Language(this.type);
}

extension ConvertLanguage on String {
  Language toLanguageEnum() {
    switch (this) {
      case 'sanskrit':
        return Language.sanskrit;
      case 'enlish':
        return Language.english;
      default:
        return Language.hindi;
    }
  }
}
