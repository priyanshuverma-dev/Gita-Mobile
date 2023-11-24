class AppwriteConstants {
  static const String projectId = '653a36656716bab46c43';
  static const String endPoint = 'https://cloud.appwrite.io/v1';

  static const String databaseId = '653a3819bc55ca50deda';

  static const String explainsCollection = '6546572cc79d77946ec2';
  static const String versesCollection = '65465568179d395424f9';
  static const String chaptersCollection = '653a3847d2cdde6e7942';

  static const String chaptersAudiosBucket = '654623169ca74edbd2c9';

  static String audioId(String audiosId) =>
      '$endPoint/storage/buckets/$chaptersAudiosBucket/files/$audiosId/view?project=$projectId&mode=admin';
}
