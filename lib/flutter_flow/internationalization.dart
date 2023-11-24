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
    'jftkvkoj': {
      'en': 'Weight',
      'hu': '',
    },
    'zri4zv3q': {
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
    'yf7bbmgl': {
      'en': 'Field is required',
      'hu': '',
    },
    '1g6eopvw': {
      'en': 'Please choose an option from the dropdown',
      'hu': '',
    },
    'd2gnrgle': {
      'en': 'Field is required',
      'hu': '',
    },
    'gapkddm4': {
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
      'en': 'Address',
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
      'en': 'License plate',
      'hu': '',
    },
    '1hvpc6hc': {
      'en': 'Size',
      'hu': '',
    },
    'dv3cqh30': {
      'en': 'Maximum weight',
      'hu': '',
    },
    'n8t25tw0': {
      'en': 'Option 1',
      'hu': '',
    },
    '0tznzxwg': {
      'en': 'Select location...',
      'hu': '',
    },
    'np481smo': {
      'en': 'Search for an item...',
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
    'n2tuz4j5': {
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
    'cxs7dmpz': {
      'en': 'Option 1',
      'hu': '',
    },
    'k2oormpx': {
      'en': 'Select shop...',
      'hu': '',
    },
    'wyus128o': {
      'en': 'Search for an item...',
      'hu': '',
    },
    'joiwknvl': {
      'en': 'Goods',
      'hu': '',
    },
    'a9mt3ddz': {
      'en': 'Add good',
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
  // AddQuantityDialog
  {
    'vh0vbnw4': {
      'en': 'Add quantity to good',
      'hu': '',
    },
    'igis03u3': {
      'en': 'Quantity',
      'hu': '',
    },
    'pzmh44tk': {
      'en': '0',
      'hu': '',
    },
    'ge0jne1u': {
      'en': 'Cancel',
      'hu': '',
    },
    '2vyzkjln': {
      'en': 'Confirm',
      'hu': '',
    },
    'w4btgtad': {
      'en': 'Field is required',
      'hu': '',
    },
    'obc48ygb': {
      'en': 'Please choose an option from the dropdown',
      'hu': '',
    },
  },
  // AddGoodDialog
  {
    'r2ezbsqf': {
      'en': 'Add good to order',
      'hu': '',
    },
    'unys1hu4': {
      'en': 'Option 1',
      'hu': '',
    },
    '05j19i20': {
      'en': 'Select good...',
      'hu': '',
    },
    'pf0u60q8': {
      'en': 'Search for an item...',
      'hu': '',
    },
    '3ag5k3x5': {
      'en': 'Cancel',
      'hu': '',
    },
    'p63uwl8j': {
      'en': 'Confirm',
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
    'fgv4v3vq': {
      'en': 'Option 1',
      'hu': '',
    },
    'blz1kdh8': {
      'en': 'Please select...',
      'hu': '',
    },
    'gume1ltt': {
      'en': 'Search for an item...',
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
