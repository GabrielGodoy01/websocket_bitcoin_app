import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mvc_template/app/controllers/bitcoin_controller.dart';
import 'package:flutter_mvc_template/app/injector.dart';
import 'package:flutter_mvc_template/app/shared/helpers/functions/global_snackbar.dart';
import 'package:flutter_mvc_template/app/shared/themes/app_themes.dart';
import 'package:flutter_mvc_template/generated/l10n.dart';
import 'package:flutter_mvc_template/routes.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => injector.get<BitcoinController>(),
        )
      ],
      child: MaterialApp.router(
        scaffoldMessengerKey: rootScaffoldMessengerKey,
        title: 'MVC Template',
        debugShowCheckedModeBanner: false,
        routerConfig: router,
        theme: AppThemes.lightTheme,
        darkTheme: AppThemes.darkTheme,
        themeMode: ThemeMode.system,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
      ),
    );
  }
}
