import 'package:flutter/material.dart';

import 'app_localizations.dart';


class AppLocalizationsSetup {
  static const Iterable<Locale> supportedLocales = [Locale('en'), Locale('bn')];

  static const Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates = [
    AppLocalizations.delegate,
    DefaultMaterialLocalizations.delegate,
    DefaultWidgetsLocalizations.delegate
  ];

  static Locale? localeResolutionCallback(Locale? locale, Iterable<Locale> supportedLocales) {
    for(Locale supportedLocale in supportedLocales) {
      if(supportedLocale.languageCode == locale!.languageCode && supportedLocale.countryCode == locale.countryCode) {
        return supportedLocale;
      }
    }
    return supportedLocales.first;
  }

}