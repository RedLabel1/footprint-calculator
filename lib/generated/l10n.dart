// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

class S {
  S(this.localeName);
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final String name = locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      return S(localeName);
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  final String localeName;

  String get screen_name_footprint {
    return Intl.message(
      'Calculate your footprint',
      name: 'screen_name_footprint',
      desc: '',
      args: [],
    );
  }

  String get footprint_no_stats {
    return Intl.message(
      'Once you complete your footprint calculations, you will find your stats here.',
      name: 'footprint_no_stats',
      desc: '',
      args: [],
    );
  }

  String get screen_name_tips {
    return Intl.message(
      'Tips',
      name: 'screen_name_tips',
      desc: '',
      args: [],
    );
  }

  String get screen_name_game {
    return Intl.message(
      'Game',
      name: 'screen_name_game',
      desc: '',
      args: [],
    );
  }

  String get screen_name_shop {
    return Intl.message(
      'Shop',
      name: 'screen_name_shop',
      desc: '',
      args: [],
    );
  }

  String get screen_name_profile {
    return Intl.message(
      'My profile',
      name: 'screen_name_profile',
      desc: '',
      args: [],
    );
  }

  String get screen_name_about {
    return Intl.message(
      'Contact & FAQ',
      name: 'screen_name_about',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale('es', ''), Locale('en', ''),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (Locale supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}