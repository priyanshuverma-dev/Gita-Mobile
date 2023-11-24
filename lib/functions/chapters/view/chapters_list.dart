import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gita_mobile/core/ui/index.dart';
import 'package:gita_mobile/functions/chapters/controller/chapters.dart';
import 'package:gita_mobile/utils/utils.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ChaptersList extends ConsumerStatefulWidget {
  const ChaptersList({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChaptersListState();
}

class _ChaptersListState extends ConsumerState<ChaptersList> {
  @override
  Widget build(BuildContext context) {
    return ref.watch(getChaptersProvider).when(
        data: (chapters) {
          return ListView.builder(
            itemCount: chapters.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text("${index + 1} ${chapters[index].nameTranslated}"),
                subtitle: Text(chapters[index].nameMeaning),
                titleTextStyle: const TextStyle(fontWeight: FontWeight.w500),
                style: ListTileStyle.list,
                trailing: IconButton(
                    onPressed: () => funcNotImplemented(context),
                    icon: const Icon(Icons.arrow_right_rounded)),
                dense: true,
              );
            },
          );
        },
        error: (err, st) => ErrorText(error: err.toString()),
        loading: () {
          return Center(
            child: Skeletonizer(
              ignoreContainers: true,
              enabled: true,
              child: ListView.builder(
                itemCount: 8,
                padding: const EdgeInsets.all(16),
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text('Item number $index as title'),
                      subtitle: const Text('Subtitle here'),
                      trailing: const Icon(
                        Icons.ac_unit,
                        size: 32,
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        });
  }
}
