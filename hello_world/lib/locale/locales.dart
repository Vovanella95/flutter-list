import 'package:hello_world/l10n/messages_all.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class ImdbLocalizations {
  ImdbLocalizations(this.localeName);

  static Future<ImdbLocalizations> load(Locale locale) {
    final String name =
        locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      return ImdbLocalizations(localeName);
    });
  }

  static ImdbLocalizations of(BuildContext context) {
    return Localizations.of<ImdbLocalizations>(context, ImdbLocalizations);
  }

  final String localeName;

  String get title {
    return Intl.message(
      'Hello World',
      name: 'title',
      desc: 'Title for the Demo application',
      locale: localeName,
    );
  }

  String get description {
    return Intl.message(
      'Checkout for best imdb movies and series',
      name: 'description',
      desc: 'Description on main page',
      locale: localeName,
    );
  }

  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: 'Text for searching movie',
      locale: localeName,
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<ImdbLocalizations> {
  const AppLocalizationDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'ru'].contains(locale.languageCode);
  }

  @override
  Future<ImdbLocalizations> load(Locale locale) {
    return ImdbLocalizations.load(locale);
  }

  @override
  bool shouldReload(AppLocalizationDelegate old) {
    return false;
  }
}
