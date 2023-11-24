import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gita_mobile/apis/chapters_api.dart';
import 'package:gita_mobile/models/chapter_model.dart';

final chaptersControllerProvider =
    StateNotifierProvider<ChaptersController, bool>((ref) {
  return ChaptersController(
    chaptersAPI: ref.watch(chaptersAPIProvider),
  );
});

final getChaptersProvider = FutureProvider((ref) {
  final chaptersController = ref.watch(chaptersControllerProvider.notifier);
  return chaptersController.getChapters();
});

class ChaptersController extends StateNotifier<bool> {
  final ChaptersAPI _chaptersAPI;
  ChaptersController({
    required ChaptersAPI chaptersAPI,
  })  : _chaptersAPI = chaptersAPI,
        super(false);

  Future<List<ChapterModel>> getChapters() async {
    final chaptersList = await _chaptersAPI.fetchAllChapters();
    return chaptersList
        .map((chapters) => ChapterModel.fromMap(chapters.data))
        .toList();
  }
}
