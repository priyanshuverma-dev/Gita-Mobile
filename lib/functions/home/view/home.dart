import 'package:flutter/material.dart';

import '../../chapters/view/chapters_list.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gita Mobile"),
      ),
      body: const Center(
        child: ChaptersList(),
      ),
    );
  }
}
