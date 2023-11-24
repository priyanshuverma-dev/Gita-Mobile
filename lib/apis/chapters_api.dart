import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gita_mobile/core/internals/index.dart';

final chaptersAPIProvider = Provider((ref) {
  return ChaptersAPI(
    db: ref.watch(appwriteDatabaseProvider),
  );
});

abstract class IChaptersAPI {
  Future<List<Document>> fetchAllChapters();
}

class ChaptersAPI extends IChaptersAPI {
  final Databases _db;
  ChaptersAPI({
    required Databases db,
  }) : _db = db;

  @override
  Future<List<Document>> fetchAllChapters() async {
    final documents = await _db.listDocuments(
      databaseId: AppwriteConstants.databaseId,
      collectionId: AppwriteConstants.chaptersCollection,
      queries: [
        Query.orderAsc('chapter_number'),
      ],
    );
    return documents.documents;
  }
}
