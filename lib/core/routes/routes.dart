import 'package:bgm/features/about/views/about.view.dart';
import 'package:bgm/features/home/views/home.view.dart';
import 'package:bgm/features/search/views/search.view.dart';
import 'package:bgm/features/splash/views/splash.view.dart';
import 'package:get/get.dart';

appRoutes() => [
      GetPage(
        name: '/splash',
        page: () => const SplashView(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 250),
      ),
      GetPage(
        name: '/',
        page: () => const HomeView(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 250),
      ),
      GetPage(
        name: '/about',
        page: () => const AboutView(),
        transition: Transition.cupertino,
        transitionDuration: const Duration(milliseconds: 250),
        showCupertinoParallax: true,
      ),
      GetPage(
        name: '/search',
        page: () => const SearchView(),
        transition: Transition.cupertino,
        transitionDuration: const Duration(milliseconds: 250),
        showCupertinoParallax: true,
      ),
    ];
