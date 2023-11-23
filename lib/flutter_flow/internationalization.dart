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

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

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
  // HomePage
  {
    'k0deejkp': {
      'en': 'Home',
      'hu': 'Főoldal',
    },
    'h3sr1n8x': {
      'en': 'Locations',
      'hu': 'Telephelyek',
    },
    '5x7tej1g': {
      'en': 'Vehicles',
      'hu': 'Járművek',
    },
    'kscesao7': {
      'en': 'Shops',
      'hu': 'Boltok',
    },
    '84jcapfj': {
      'en': 'Goods',
      'hu': '',
    },
    'q0nvi86i': {
      'en': 'Orders',
      'hu': '',
    },
    'usnqp34g': {
      'en': 'Transports',
      'hu': '',
    },
    'b95aybek': {
      'en': 'Home',
      'hu': '',
    },
  },
  // LocationsListPage
  {
    '9z4pndiu': {
      'en': 'Locations',
      'hu': 'Telephelyek',
    },
    '9ttt5kh6': {
      'en': 'Address',
      'hu': 'Cím',
    },
    'gr56nwev': {
      'en': 'Home',
      'hu': '',
    },
  },
  // VehiclesListPage
  {
    '5sqto8jw': {
      'en': 'Vehicles',
      'hu': '',
    },
    'oj0k2b31': {
      'en': 'License Plate',
      'hu': 'Cím',
    },
    'ka0ypk0o': {
      'en': 'Size',
      'hu': 'Cím',
    },
    'i2pzntbt': {
      'en': 'Max weight',
      'hu': '',
    },
    '0tmu1biv': {
      'en': 'Home',
      'hu': '',
    },
  },
  // ShopsListPage
  {
    'vmxf0sn6': {
      'en': 'Shops',
      'hu': '',
    },
    'i03mri4k': {
      'en': 'Address',
      'hu': '',
    },
    '8380o8p2': {
      'en': 'Home',
      'hu': '',
    },
  },
  // GoodsListPage
  {
    'ca6e60m4': {
      'en': 'Goods',
      'hu': '',
    },
    'lps7u20d': {
      'en': 'Description',
      'hu': 'Cím',
    },
    'va7bnt9b': {
      'en': 'Size',
      'hu': '',
    },
    '4l8ry766': {
      'en': 'Weight',
      'hu': '',
    },
    'pa793lkm': {
      'en': 'Quantity',
      'hu': '',
    },
    'ht4xtuzr': {
      'en': 'Home',
      'hu': '',
    },
  },
  // SettingsPage
  {
    'qazgnn0b': {
      'en': 'Switch to Dark Mode',
      'hu': 'Váltás sötét módra',
    },
    'avbvj58g': {
      'en': 'Switch to Light Mode',
      'hu': 'Váltás világos módra',
    },
    'e0q9cs80': {
      'en': 'Language',
      'hu': 'Nyelv',
    },
    'dlmxdzb8': {
      'en': 'Settings',
      'hu': 'Beállítások',
    },
    'ftcfjbvd': {
      'en': 'Home',
      'hu': '',
    },
  },
  // GoodForm
  {
    'jkfsatci': {
      'en': 'Name',
      'hu': '',
    },
    'ydiaobyf': {
      'en': 'Description',
      'hu': '',
    },
    'i2zn0py0': {
      'en': 'Size',
      'hu': '',
    },
    '6fy2jq52': {
      'en': 'Weight',
      'hu': '',
    },
    'm96emfn2': {
      'en': 'Quantity',
      'hu': '',
    },
    'g4a3gj69': {
      'en': 'Cancel',
      'hu': '',
    },
    's9qf5sui': {
      'en': 'Confirm',
      'hu': '',
    },
    '74f3sbir': {
      'en': 'Field is required',
      'hu': '',
    },
    '5h2n9wz4': {
      'en': 'Please choose an option from the dropdown',
      'hu': '',
    },
    '52fqlu5p': {
      'en': 'Field is required',
      'hu': '',
    },
    'cd4fm147': {
      'en': 'Please choose an option from the dropdown',
      'hu': '',
    },
    '6u1b29sa': {
      'en': 'Field is required',
      'hu': '',
    },
    '9z2w3dqc': {
      'en': 'Please choose an option from the dropdown',
      'hu': '',
    },
    'vx478z69': {
      'en': 'Field is required',
      'hu': '',
    },
    'dsm4ngzw': {
      'en': 'Please choose an option from the dropdown',
      'hu': '',
    },
    'fpxqez73': {
      'en': 'Field is required',
      'hu': '',
    },
    '8njr0hd9': {
      'en': 'Please choose an option from the dropdown',
      'hu': '',
    },
    '2p8584s0': {
      'en': 'Home',
      'hu': '',
    },
  },
  // LocationForm
  {
    '4a3lwtgv': {
      'en': 'Name',
      'hu': '',
    },
    'fwid9dfb': {
      'en': 'Address',
      'hu': '',
    },
    '4kz9a0m4': {
      'en': 'Cancel',
      'hu': '',
    },
    '3mmqzp9d': {
      'en': 'Confirm',
      'hu': '',
    },
    'dmikg5n0': {
      'en': 'Field is required',
      'hu': '',
    },
    'uuvx00yw': {
      'en': 'Please choose an option from the dropdown',
      'hu': '',
    },
    'h1p54kcu': {
      'en': 'Field is required',
      'hu': '',
    },
    'wksfi1vl': {
      'en': 'Please choose an option from the dropdown',
      'hu': '',
    },
    'soqai18p': {
      'en': 'Home',
      'hu': '',
    },
  },
  // ShopForm
  {
    'iv8udkd2': {
      'en': 'Name',
      'hu': '',
    },
    '8t2guohp': {
      'en': 'Contact',
      'hu': '',
    },
    'rm84sigc': {
      'en': 'Cancel',
      'hu': '',
    },
    '2rfpf045': {
      'en': 'Confirm',
      'hu': '',
    },
    'kjz33d80': {
      'en': 'Field is required',
      'hu': '',
    },
    'teqiyzne': {
      'en': 'Please choose an option from the dropdown',
      'hu': '',
    },
    'lia2uahk': {
      'en': 'Field is required',
      'hu': '',
    },
    '0zttssb2': {
      'en': 'Has to be a valid email address',
      'hu': '',
    },
    'san1x24z': {
      'en': 'Please choose an option from the dropdown',
      'hu': '',
    },
    'zscp7c49': {
      'en': 'Home',
      'hu': '',
    },
  },
  // VehicleForm
  {
    'b5ep3o1d': {
      'en': 'Liceense plate',
      'hu': '',
    },
    '1hvpc6hc': {
      'en': 'Brand name',
      'hu': '',
    },
    'dv3cqh30': {
      'en': 'Type',
      'hu': '',
    },
    'wdh12arj': {
      'en': 'Cancel',
      'hu': '',
    },
    '244g6y53': {
      'en': 'Confirm',
      'hu': '',
    },
    'zs5szbt9': {
      'en': 'Field is required',
      'hu': '',
    },
    'afa8ipn3': {
      'en': 'Please choose an option from the dropdown',
      'hu': '',
    },
    'glssoky6': {
      'en': 'Field is required',
      'hu': '',
    },
    'r2bn4mbh': {
      'en': 'Please choose an option from the dropdown',
      'hu': '',
    },
    'puxlvlgy': {
      'en': 'Field is required',
      'hu': '',
    },
    '4ys8xo2h': {
      'en': 'Please choose an option from the dropdown',
      'hu': '',
    },
    'alzxbud2': {
      'en': 'Home',
      'hu': '',
    },
  },
  // LocationDetails
  {
    '532l404n': {
      'en': 'Vehicles',
      'hu': '',
    },
    'i2j9a9p5': {
      'en': 'Size',
      'hu': 'Cím',
    },
    'zhemtemq': {
      'en': 'Max weight',
      'hu': '',
    },
    '6okyo9mm': {
      'en': 'Goods',
      'hu': '',
    },
    '1d2hpj62': {
      'en': 'Description',
      'hu': 'Cím',
    },
    'yhvofjt3': {
      'en': 'Size',
      'hu': '',
    },
    'xtwc8hqd': {
      'en': 'Weight',
      'hu': '',
    },
    'f476pkes': {
      'en': 'Quantity',
      'hu': '',
    },
    'op6kyskd': {
      'en': 'Home',
      'hu': '',
    },
  },
  // OrdersListPage
  {
    'zsao3dgx': {
      'en': 'Orders',
      'hu': '',
    },
    'cofgmggp': {
      'en': 'Shop',
      'hu': 'Cím',
    },
    'cr2wid7g': {
      'en': 'Goods',
      'hu': '',
    },
    '9uiyoxqe': {
      'en': 'Home',
      'hu': '',
    },
  },
  // OrderForm
  {
    'p98ryqw2': {
      'en': 'Name',
      'hu': '',
    },
    'qn7xaojp': {
      'en': 'Contact',
      'hu': '',
    },
    'w80oozv0': {
      'en': 'Cancel',
      'hu': '',
    },
    'r3zwqkn4': {
      'en': 'Confirm',
      'hu': '',
    },
    '97fos1qt': {
      'en': 'Field is required',
      'hu': '',
    },
    '1m1h8zst': {
      'en': 'Please choose an option from the dropdown',
      'hu': '',
    },
    'fldtsabx': {
      'en': 'Field is required',
      'hu': '',
    },
    'mbcy93nm': {
      'en': 'Has to be a valid email address',
      'hu': '',
    },
    'x8adxxda': {
      'en': 'Please choose an option from the dropdown',
      'hu': '',
    },
    '5c9ktj5j': {
      'en': 'Home',
      'hu': '',
    },
  },
  // TransportForm
  {
    'fc8hnrq7': {
      'en': 'Name',
      'hu': '',
    },
    'twjfukty': {
      'en': 'Contact',
      'hu': '',
    },
    '1kjmf0s9': {
      'en': 'Cancel',
      'hu': '',
    },
    '6vah3i9r': {
      'en': 'Confirm',
      'hu': '',
    },
    '7zutg41b': {
      'en': 'Field is required',
      'hu': '',
    },
    '2np0q8t9': {
      'en': 'Please choose an option from the dropdown',
      'hu': '',
    },
    'vlpbw9pt': {
      'en': 'Field is required',
      'hu': '',
    },
    'vm5lnjtw': {
      'en': 'Has to be a valid email address',
      'hu': '',
    },
    'qobmjj59': {
      'en': 'Please choose an option from the dropdown',
      'hu': '',
    },
    'sp4eq230': {
      'en': 'Home',
      'hu': '',
    },
  },
  // TransportsListPage
  {
    '2gn12uuw': {
      'en': 'Transports',
      'hu': '',
    },
    '0xavmslk': {
      'en': 'Date',
      'hu': 'Cím',
    },
    '64v251nc': {
      'en': 'Order ID',
      'hu': 'Cím',
    },
    'v1czhin2': {
      'en': 'Home',
      'hu': '',
    },
  },
  // login
  {
    'rpjhe0mk': {
      'en': 'Haulage Company',
      'hu': '',
    },
    'err0vg6r': {
      'en': 'Welcome Back',
      'hu': '',
    },
    '0cuh8ea3': {
      'en': 'Fill out the information below in order to access your account.',
      'hu': '',
    },
    'vl44ev4x': {
      'en': 'Email',
      'hu': '',
    },
    'us5q2fxx': {
      'en': 'Password',
      'hu': '',
    },
    'stea767j': {
      'en': 'Sign In',
      'hu': '',
    },
    'fqb4f957': {
      'en': 'Home',
      'hu': '',
    },
  },
  // Miscellaneous
  {
    'nzebh124': {
      'en': 'Button',
      'hu': '',
    },
    'ba07gtbz': {
      'en': 'Hello World',
      'hu': '',
    },
    'za5cy2jr': {
      'en': 'Hello World',
      'hu': '',
    },
    '89ulcgcv': {
      'en': 'Hello World',
      'hu': '',
    },
    '17cb47d3': {
      'en': 'Label here...',
      'hu': '',
    },
    'wn8cy8og': {
      'en': '',
      'hu': '',
    },
    'c6rfg6yw': {
      'en': '',
      'hu': '',
    },
    'iptbootj': {
      'en': '',
      'hu': '',
    },
    'ea212318': {
      'en': '',
      'hu': '',
    },
    '043r43c1': {
      'en': '',
      'hu': '',
    },
    'gysaw5it': {
      'en': '',
      'hu': '',
    },
    'g7d2up8o': {
      'en': '',
      'hu': '',
    },
    'q9lgcjdi': {
      'en': '',
      'hu': '',
    },
    '52a54reb': {
      'en': '',
      'hu': '',
    },
    'k012zxak': {
      'en': '',
      'hu': '',
    },
    'tv50ion3': {
      'en': '',
      'hu': '',
    },
    '9l9qn2r8': {
      'en': '',
      'hu': '',
    },
    'd4b683d4': {
      'en': '',
      'hu': '',
    },
    'm7myd7g4': {
      'en': '',
      'hu': '',
    },
    'rif7m9hf': {
      'en': '',
      'hu': '',
    },
    'a9dh4j7n': {
      'en': '',
      'hu': '',
    },
    'bsvh7z4c': {
      'en': '',
      'hu': '',
    },
    'sbhio1df': {
      'en': '',
      'hu': '',
    },
    'x8d6h5jx': {
      'en': '',
      'hu': '',
    },
    'lgolmhlq': {
      'en': '',
      'hu': '',
    },
    'cb969dwp': {
      'en': '',
      'hu': '',
    },
    '0tjr04ag': {
      'en': '',
      'hu': '',
    },
    'y5qv6v1x': {
      'en': '',
      'hu': '',
    },
  },
].reduce((a, b) => a..addAll(b));
