import 'package:flutter/material.dart';

import 'localized.dart';
class MyLocalizationsDelegate extends LocalizationsDelegate<Localized> {
  const MyLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'ja'].contains(locale.languageCode);

  @override
  Future<Localized> load(Locale locale) async => Localized(locale);


  @override
  bool shouldReload(MyLocalizationsDelegate old) => false;
}