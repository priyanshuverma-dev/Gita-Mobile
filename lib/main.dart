import 'package:bgm/core/routes/routes.dart';
import 'package:bgm/theme/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Gita Mobile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSwatch(),
        useMaterial3: true,
        textTheme: textThemeLight,
      ),
      initialRoute: '/splash',
      getPages: appRoutes(),
    );
  }
}
