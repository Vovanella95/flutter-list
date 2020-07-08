import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hello_world/locale/locales.dart';
import 'package:hello_world/pages/startPage/startPage.dart';
import 'package:hello_world/services/navigation/router.dart';

import 'dependencies.dart';

void main() {
  setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: getNavigationService().navigatorKey,
      onGenerateRoute: Router.generateRoute,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: StartPage(title: 'Flutter Demo Home Page'),
      localizationsDelegates: [
        AppLocalizationDelegate(),
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''),
        const Locale('ru', ''),
      ],
      onGenerateTitle: (BuildContext context) =>
          ImdbLocalizations.of(context).title,
      localeResolutionCallback:
          (Locale locale, Iterable<Locale> supportedLocales) {
        return locale;
      },
    );
  }
}
