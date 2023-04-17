import 'package:bgm/features/feed/views/feed.view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const HomeView(),
      );
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: FeedView(),
    );
  }
}
