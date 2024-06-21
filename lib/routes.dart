import 'package:flutter_mvc_template/app/views/pages/home_page.dart';
import 'package:flutter_mvc_template/app/views/pages/splash_page.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: routePaths.home,
      builder: (context, state) => const HomePage(),
    ),
  ],
);

const routePaths = (home: '/home',);
