import 'package:flutter_mvc_template/app/controllers/bitcoin_controller.dart';
import 'package:flutter_mvc_template/app/injector.dart';
import 'package:flutter_mvc_template/app/views/pages/home_page.dart';
import 'package:flutter_mvc_template/app/views/pages/splash_page.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: routePaths.home,
      builder: (context, state) => MultiProvider(providers: [
        ChangeNotifierProvider<BitcoinController>.value(
          value: injector.get<BitcoinController>(),
        )
      ], child: const HomePage()),
    ),
  ],
);

const routePaths = (home: '/home',);
