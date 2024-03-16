import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'es', 'de', 'ar'];

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
    String? esText = '',
    String? deText = '',
    String? arText = '',
  }) =>
      [enText, esText, deText, arText][languageIndex] ?? '';

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
  // home
  {
    'o51azrfc': {
      'en': 'Good Morning,',
      'ar': '',
      'de': '',
      'es': '',
    },
    'de88bnay': {
      'en': 'Summary of your weekly brews',
      'ar': '',
      'de': '',
      'es': '',
    },
    'r8eh8k71': {
      'en': 'Daily Coffees',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ox1ns5rc': {
      'en': '1',
      'ar': '',
      'de': '',
      'es': '',
    },
    'krgz7u8y': {
      'en': 'Avg. Rating',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ljcmcl2r': {
      'en': '4.6',
      'ar': '',
      'de': '',
      'es': '',
    },
    '0i24yjvn': {
      'en': 'Latest News',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ztbva27q': {
      'en': 'How to pour Latte Art',
      'ar': '',
      'de': '',
      'es': '',
    },
    'kdjg7tn1': {
      'en': 'A wonderfully delicious 2 patty melt that melts into your...',
      'ar': '',
      'de': '',
      'es': '',
    },
    '7049l03h': {
      'en': '2m',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ay91laib': {
      'en': 'How to brew coffee',
      'ar': '',
      'de': '',
      'es': '',
    },
    'jjos580y': {
      'en': 'Learn how to brew a delicious pourover every morning.',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ah3zgomr': {
      'en': '2m',
      'ar': '',
      'de': '',
      'es': '',
    },
    'cn5jgi7a': {
      'en': 'Weather Information',
      'ar': '',
      'de': '',
      'es': '',
    },
    'axfuenoe': {
      'en': 'Ethiopian Natural',
      'ar': '',
      'de': '',
      'es': '',
    },
    't79imjht': {
      'en': 'Meters',
      'ar': '',
      'de': '',
      'es': '',
    },
    'jx58lhap': {
      'en': 'Process',
      'ar': '',
      'de': '',
      'es': '',
    },
    'w68603gv': {
      'en': 'Region',
      'ar': '',
      'de': '',
      'es': '',
    },
    'nvzmxq47': {
      'en': '1,850',
      'ar': '',
      'de': '',
      'es': '',
    },
    'nvhtuswi': {
      'en': 'Washed',
      'ar': '',
      'de': '',
      'es': '',
    },
    'rbga34z9': {
      'en': 'Guji',
      'ar': '',
      'de': '',
      'es': '',
    },
    'c0jz5dwj': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
    '6y0nhvz0': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // LastestNews
  {
    'q67e3y2k': {
      'en': 'Search',
      'ar': '',
      'de': '',
      'es': '',
    },
    'db59ytdc': {
      'en': 'Accidents',
      'ar': '',
      'de': '',
      'es': '',
    },
    'bctal1dr': {
      'en': 'Crime',
      'ar': '',
      'de': '',
      'es': '',
    },
    'x0dfha1o': {
      'en': 'Fires',
      'ar': '',
      'de': '',
      'es': '',
    },
    '6rruugc8': {
      'en': 'News',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // Weather
  {
    'gym662u5': {
      'en': 'Radar',
      'ar': '',
      'de': '',
      'es': '',
    },
    'bnncmdw5': {
      'en': 'Forecast',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ppadbwi3': {
      'en': 'Outlooks',
      'ar': '',
      'de': '',
      'es': '',
    },
    '4sabi7w3': {
      'en': 'Weather',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // Login3
  {
    '8kkmh4ie': {
      'en': 'Emergency Media',
      'ar': '',
      'de': '',
      'es': '',
    },
    '5o8uftwe': {
      'en': 'Welcome Back',
      'ar': '',
      'de': '',
      'es': '',
    },
    'laz1y4s4': {
      'en': 'Fill out the information below in order to access your account.',
      'ar': '',
      'de': '',
      'es': '',
    },
    '9sjrbo5s': {
      'en': 'Email',
      'ar': '',
      'de': '',
      'es': '',
    },
    'vhaqds1k': {
      'en': 'Password',
      'ar': '',
      'de': '',
      'es': '',
    },
    'fjaiba30': {
      'en': 'Sign In',
      'ar': '',
      'de': '',
      'es': '',
    },
    'dy4ea2vr': {
      'en': 'Or sign in with',
      'ar': '',
      'de': '',
      'es': '',
    },
    '87xi4vgq': {
      'en': 'Continue with Google',
      'ar': '',
      'de': '',
      'es': '',
    },
    'woe71ef2': {
      'en': 'Continue with Apple',
      'ar': '',
      'de': '',
      'es': '',
    },
    'fkpi1pg1': {
      'en': 'Don\'t have an account?  ',
      'ar': '',
      'de': '',
      'es': '',
    },
    'xo4449gn': {
      'en': 'Sign Up here',
      'ar': '',
      'de': '',
      'es': '',
    },
    'jt49n3nh': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // ForgotPassword01
  {
    'xrkyq3ew': {
      'en': 'Back',
      'ar': '',
      'de': '',
      'es': '',
    },
    'tzqrupck': {
      'en': 'Forgot Password',
      'ar': '',
      'de': '',
      'es': '',
    },
    '9pgecy7i': {
      'en':
          'We will send you an email with a link to reset your password, please enter the email associated with your account below.',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ha83jjq9': {
      'en': 'Your email address...',
      'ar': '',
      'de': '',
      'es': '',
    },
    'x7dwhjom': {
      'en': 'Enter your email...',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ky6jlo92': {
      'en': 'Send Link',
      'ar': '',
      'de': '',
      'es': '',
    },
    'xo84m95z': {
      'en': 'Back',
      'ar': '',
      'de': '',
      'es': '',
    },
    'fnhmsm0f': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // ProfileSettings
  {
    '0z2vvupb': {
      'en': 'Joy Augustin',
      'ar': '',
      'de': '',
      'es': '',
    },
    'xihtf7mh': {
      'en': 'joy@augustin.com',
      'ar': '',
      'de': '',
      'es': '',
    },
    'zuf2gfk6': {
      'en': 'Account',
      'ar': '',
      'de': '',
      'es': '',
    },
    '9shaidzc': {
      'en': 'Payment Options',
      'ar': '',
      'de': '',
      'es': '',
    },
    'xushd2xw': {
      'en': 'Country',
      'ar': '',
      'de': '',
      'es': '',
    },
    'jku39dxz': {
      'en': 'Notification Settings',
      'ar': '',
      'de': '',
      'es': '',
    },
    'u3cp6de8': {
      'en': 'Edit Profile',
      'ar': '',
      'de': '',
      'es': '',
    },
    'q50o4bko': {
      'en': 'General',
      'ar': '',
      'de': '',
      'es': '',
    },
    '9ekgak0u': {
      'en': 'Support',
      'ar': '',
      'de': '',
      'es': '',
    },
    'a5zun3sc': {
      'en': 'Terms of Service',
      'ar': '',
      'de': '',
      'es': '',
    },
    'bsoj4zll': {
      'en': 'Invite Friends',
      'ar': '',
      'de': '',
      'es': '',
    },
    'qyfnql6p': {
      'en': 'Settings',
      'ar': '',
      'de': '',
      'es': '',
    },
    '6u5l7vr9': {
      'en': 'Settings',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // Settings1Notifications
  {
    'b8vofo7z': {
      'en': 'Settings Page',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ph2n892c': {
      'en':
          'Choose what notifcations you want to recieve below and we will update the settings.',
      'ar': '',
      'de': '',
      'es': '',
    },
    '426xc6sm': {
      'en': 'Push Notifications',
      'ar': '',
      'de': '',
      'es': '',
    },
    '5r7dnimp': {
      'en': 'Receive Push notifications from this application.',
      'ar': '',
      'de': '',
      'es': '',
    },
    '5fpt28sw': {
      'en': 'Email Notifications',
      'ar': '',
      'de': '',
      'es': '',
    },
    '18eno8k9': {
      'en':
          'Receive email notifications from our marketing team about new features.',
      'ar': '',
      'de': '',
      'es': '',
    },
    'zw8x6yfc': {
      'en': 'Location Services',
      'ar': '',
      'de': '',
      'es': '',
    },
    'us0ro98g': {
      'en':
          'Allow us to track your location, this helps send you notifications for incidents and emergenies based on your location.',
      'ar': '',
      'de': '',
      'es': '',
    },
    'x9h67kkm': {
      'en': 'Change Changes',
      'ar': '',
      'de': '',
      'es': '',
    },
    'dmck7ug9': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // Miscellaneous
  {
    'lzyb73wy': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'kx9cdks4': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'efvtwj7k': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ec5hfa1e': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'q5ljwvfo': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'j4rmwb3h': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '6ah1b18f': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '2kos1hen': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'aox3s4fb': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'l8hv5a7z': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '4pjwb70a': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '0xlokf4y': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '8twlwiwt': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    't4xzlq9q': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '513nj4m0': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'a1jxfgju': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
].reduce((a, b) => a..addAll(b));
