import 'dart:ui';
import 'package:get/get.dart';
import '../main.dart';
import 'en.dart';
import 'hi.dart';
import 'ta.dart';

class TranslationService extends Translations {
  // Default locale
  static final locale = Locale("en");
  // fallbackLocale saves the day when the locale gets in trouble
  static final fallbackLocale = Locale('ta');

  // Supported languages
  // Needs to be same order with locales
  static final langs = [
    'English',
    'Hindi(हिन्दी)',
    'Tamil(தமிழ்)',
  ];

  // Supported locales
  // Needs to be same order with langs
  static final locales = [
    Locale('en'),
    Locale('hi'),
    Locale('ta'),
  ];

  // Keys and their translations
  // Translations are separated maps in `lang` file
  @override
  Map<String, Map<String, String>> get keys => {
        'en': en,
        'hi': hi,
        'ta': ta,
      };

  // Gets locale from language, and updates the locale
  void changeLocale(String lang) {
    print(lang);
    final locale = getLocaleFromLanguage(lang);
    print(locale);
    Get.updateLocale(locale!);
  }

  // Finds language in `langs` list and returns it as Locale
  Locale? getLocaleFromLanguage(String lang) {
    for (int i = 0; i < langs.length; i++) {
      if (lang == langs[i]) return locales[i];
    }
    return Get.locale;
  }

  // ignore: missing_return
  getLanguageFromLocal(String local) {
    for (int i = 0; i < locales.length; i++) {
      if (Locale(local) == locales[i]) return langs[i];
    }
  }
}
