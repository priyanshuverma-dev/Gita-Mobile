import 'package:bgm/features/splash/views/splash.view.dart';
import 'package:bgm/theme/index.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gita Mobile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSwatch(),
        useMaterial3: true,
        textTheme: textThemeLight,
      ),
      home: const SplashView(),
    );
  }
}
