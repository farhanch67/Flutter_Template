import 'dart:ui';
import 'package:get/get.dart';
import 'package:template/app/config/locale/lang/en_us.dart';
import 'lang/dn_dk.dart';

//Getx Local Class to change Language of Application
class LocalizationService extends Translations {
  // Default locale
  static final locale = Get.deviceLocale.toString().contains('da')?const Locale('dn','DN'):const Locale('en','US');

  // fallbackLocale saves the day when the locale gets in trouble
  static const fallbackLocale = Locale('en','US');

  // Supported languages
  // Needs to be same order with locales
  static final langs = [
    'en',
    'dn',
  ];

  // Supported locales
  // Needs to be same order with langs
  static final locales = [
    const Locale('en', 'US'),
    const Locale('dn','DN'),
  ];

  // Keys and their translations
  // Translations are separated maps in `lang` file
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': enUS, // lang/en_us.dart
    'dn_DN': daDK, // lang/dn_DN.dart
  };

  // Gets locale from language, and updates the locale
  void changeLocale(String lang) {
    final locale = _getLocaleFromLanguage(lang);
    Get.updateLocale(locale!);
  }

  // Finds language in `langs` list and returns it as Locale
  Locale? _getLocaleFromLanguage(String lang) {
    for (int i = 0; i < langs.length; i++) {
      if (lang == langs[i]) return locales[i];
    }
    return Get.locale;
  }
}