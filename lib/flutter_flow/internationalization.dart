import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'hu'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) {
      var translated = (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';
      return translated.isEmpty ? key : translated;
  }

  String getVariableText({
    String? enText = '',
    String? huText = '',
  }) =>
      [enText, huText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Entities
  {
    'entities.location': {
      'en': 'location',
      'hu': 'telephely',
    },
    'entities.location.plural': {
      'en': 'locations',
      'hu': 'telephelyek',
    },
    'entities.vehicle': {
      'en': 'vehicle',
      'hu': 'jármű',
    },
    'entities.vehicle.plural': {
      'en': 'vehicles',
      'hu': 'járművek',
    },
    'entities.shop': {
      'en': 'shop',
      'hu': 'bolt',
    },
    'entities.shop.plural': {
      'en': 'shops',
      'hu': 'boltok',
    },
    'entities.good': {
      'en': 'good',
      'hu': 'termék',
    },
    'entities.good.plural': {
      'en': 'goods',
      'hu': 'termékek',
    },
    'entities.order': {
      'en': 'order',
      'hu': 'rendelés',
    },
    'entities.order.plural': {
      'en': 'orders',
      'hu': 'rendelések',
    },
    'entities.transport': {
      'en': 'transport',
      'hu': 'fuvar',
    },
    'entities.transport.plural': {
      'en': 'transports',
      'hu': 'fuvarok',
    },
  },
  // Attributes
  {
    'attributes.common.name': {
      'en': 'name',
      'hu': 'név',
    },
    'attributes.common.address': {
      'en': 'address',
      'hu': 'cím',
    },
    'attributes.common.size': {
      'en': 'size',
      'hu': 'méret',
    },
    'attributes.good.description': {
      'en': 'description',
      'hu': 'leírás',
    },
    'attributes.good.weight': {
      'en': 'weight',
      'hu': 'súly',
    },
    'attributes.good.quantity': {
      'en': 'quantity',
      'hu': 'mennyiség',
    },
    'attributes.vehicle.licensePlate': {
      'en': 'license plate',
      'hu': 'rendszám',
    },
    'attributes.vehicle.maxWeight': {
      'en': 'maximum weight',
      'hu': 'teherbírás',
    },
    'attributes.transport.date': {
      'en': 'date',
      'hu': 'dátum',
    },
  },
  // Common errors
  {
    'errors.failure.create': {
      'en': 'failed to create {}',
      'hu': '{} létrehozása sikertelen',
    },
    'errors.failure.update': {
      'en': 'failed to update {}',
      'hu': '{} módosítása sikertelen',
    },
    'errors.failure.delete': {
      'en': 'failed to delete {}',
      'hu': '{} törlése sikertelen',
    },
    'errors.validation.dropdown.empty': {
      'en': 'no {} selected',
      'hu': 'nincs {} kiválasztva',
    },
    'errors.validation.list.empty': {
      'en': 'no {} added',
      'hu': 'nincsenek hozzáadott {}',
    },
  },
  // Common widgets
  {
    'widgets.common.cancel': {
      'en': 'cancel',
      'hu': 'mégse',
    },
    'widgets.common.confirm': {
      'en': 'confirm',
      'hu': 'rendben',
    },
    'widgets.common.dropdown.hint': {
      'en': 'select {}...',
      'hu': '{} kiválasztása...',
    },
    'widgets.common.textField.required': {
      'en': 'field is required',
      'hu': 'kötelező mező',
    },
    'widgets.common.emptyList': {
      'en': 'no entries found',
      'hu': 'nincs megjeleníthető elem',
    },
    'widgets.common.add': {
      'en': 'add {}',
      'hu': '{} hozzáadása',
    },
  },
  // Dialogs
  {
    'dialogs.addGoodToLocation.title': {
      'en': 'add good to location',
      'hu': 'termék beszerzése telephelyhez',
    },
    'dialogs.addGoodToOrder.title': {
      'en': 'add good to order',
      'hu': 'termék hozzáadása rendeléshez',
    },
    'dialogs.addGoodToOrder.errors.goodAlreadyAdded': {
      'en': 'selected good already added to order',
      'hu': 'a rendelés már tartalmazza a kiválasztott terméket',
    },
    'dialogs.addVehicleToTransport.title': {
      'en': 'add vehicle to transport',
      'hu': 'jármű hozzáadása fuvarhoz',
    },
    'dialogs.addVehicleToTransport.errors.vehicleAlreadyAdded': {
      'en': 'selected vehicle already added to transport',
      'hu': 'a fuvar már tartalmazza a kiválasztott járművet',
    },
  },
  // Forms common
  {
    'forms.add.title': {
      'en': 'add {}',
      'hu': 'új {}',
    },
    'forms.edit.title': {
      'en': 'edit {}',
      'hu': '{} szerkesztése',
    },
  },
  // TransportForm
  {
    'forms.transport.errors.noDatePicked': {
      'en': 'no date picked',
      'hu': 'nincs dátum kiválasztva',
    },
  },
  // HomePage
  {
    'pages.home.title': {
      'en': 'home',
      'hu': 'főoldal',
    },
  },
  // LoginPage
  {
    'pages.login.title': {
      'en': 'haulage company',
      'hu': 'fuvarozó vállalat',
    },
    'pages.login.welcome': {
      'en': 'welcome back',
      'hu': 'üdv újra',
    },
    'pages.login.instructions': {
      'en': 'fill out the information below...',
      'hu': 'töltsd ki az alábbi adatokat...',
    },
    'pages.login.username': {
      'en': 'username',
      'hu': 'felhasználónév',
    },
    'pages.login.password': {
      'en': 'password',
      'hu': 'jelszó',
    },
    'pages.login.signIn': {
      'en': 'sign in',
      'hu': 'bejelentkezés',
    },
    'pages.login.errors.common': {
      'en': 'login failed: {}',
      'hu': 'belépés sikertelen: {}',
    },
    'pages.login.errors.userNotExists': {
      'en': 'user does not exist',
      'hu': 'nem létező felhasználó',
    },
    'pages.login.errors.wrongPassword': {
      'en': 'wrong password',
      'hu': 'hibás jelszó',
    },
    'pages.login.errors.unknown': {
      'en': 'unknown error',
      'hu': 'ismeretlen hiba',
    },
  },
  // UserPage
  {
    'pages.user.title': {
      'en': 'user',
      'hu': 'felhasználó',
    },
    'pages.user.roles': {
      'en': 'roles',
      'hu': 'szerepkörök',
    },
    'pages.user.lastLogin': {
      'en': 'last login',
      'hu': 'utolsó bejelentkezés',
    },
    'pages.user.logout': {
      'en': 'sign out',
      'hu': 'kijelentkezés',
    },
  },
  // SettingsPage
  {
    'pages.settings.title': {
      'en': 'settings',
      'hu': 'beállítások',
    },
    'pages.settings.theme.common': {
      'en': 'switch to {} mode',
      'hu': 'váltás {} módra',
    },
    'pages.settings.theme.dark': {
      'en': 'dark',
      'hu': 'sötét',
    },
    'pages.settings.theme.light': {
      'en': 'light',
      'hu': 'világos',
    },
    'pages.settings.language': {
      'en': 'language',
      'hu': 'nyelv',
    },
  },
].reduce((a, b) => a..addAll(b));
