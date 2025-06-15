import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'bn'];

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
    String? bnText = '',
  }) =>
      [enText, bnText][languageIndex] ?? '';

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

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

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

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // onboarding
  {
    'ibxztjnz': {
      'en': 'Discover Experienced Doctors',
      'bn': 'অভিজ্ঞ ডাক্তার আবিষ্কার করুন',
    },
    'zvo2j35u': {
      'en': 'SKIP',
      'bn': '',
    },
    'z4srarah': {
      'en': 'Effortless Appointment Booking',
      'bn': 'অনায়াসে অ্যাপয়েন্টমেন্ট বুকিং',
    },
    'qx9b402b': {
      'en': 'SKIP',
      'bn': '',
    },
    '8o6wu9xc': {
      'en': 'Learn About your Doctors!',
      'bn': 'আপনার ডাক্তারদের সম্পর্কে জানুন!',
    },
    '1wwwka5f': {
      'en': 'Your Dental Journey\n Begins Now!',
      'bn': 'আপনার ডেন্টাল যাত্রা\n এখন শুরু!',
    },
    'y2vwuizs': {
      'en': 'Sign up below in order to get started!',
      'bn': 'শুরু করার জন্য নিচে সাইন আপ করুন!',
    },
    '77dp7q3y': {
      'en': 'Get Started',
      'bn': 'এবার শুরু করা যাক',
    },
    'hb03bmzi': {
      'en': 'Home',
      'bn': 'বাড়ি',
    },
  },
  // createProfile
  {
    '4q65prpe': {
      'en': 'Amaar Dentist',
      'bn': 'অমর ডেন্টিস্ট',
    },
    'nb2nmd2q': {
      'en': ', lets create your profile',
      'bn': ', আপনার প্রোফাইল তৈরি করা যাক',
    },
    'v8brxjaw': {
      'en': 'Full Name',
      'bn': 'পুরো নাম',
    },
    'e3mypicu': {
      'en': 'Your full name...',
      'bn': 'আপনার পূর্ণ নাম...',
    },
    'lmgtq0yt': {
      'en': 'Email',
      'bn': 'বয়স',
    },
    'dllthlzp': {
      'en': 'Your email...',
      'bn': 'আপনার বয়স...',
    },
    'i4bqzqs6': {
      'en': 'Age',
      'bn': '',
    },
    'zlbwqd0v': {
      'en': 'Your age...',
      'bn': '',
    },
    'nrxfvebh': {
      'en': 'Location',
      'bn': 'অবস্থান',
    },
    '8fcv9du5': {
      'en': 'city/town/village...',
      'bn': 'শহর/শহর/গ্রাম...',
    },
    'h15rfu9g': {
      'en': 'Your gender:',
      'bn': 'আপনার লিঙ্গ:',
    },
    '9bya3k20': {
      'en': 'Male',
      'bn': 'পুরুষ',
    },
    'zxbxeztw': {
      'en': 'Female',
      'bn': 'মহিলা',
    },
    'ucp7n63z': {
      'en': 'Save',
      'bn': 'সংরক্ষণ',
    },
    'o9bzbf28': {
      'en': 'Field is required',
      'bn': '',
    },
    '22uffd2i': {
      'en': 'Please choose an option from the dropdown',
      'bn': '',
    },
    'x858ae3t': {
      'en': 'Field is required',
      'bn': '',
    },
    'f7v1qxsc': {
      'en': 'Please choose an option from the dropdown',
      'bn': '',
    },
    'zsp2e8j5': {
      'en': 'Field is required',
      'bn': '',
    },
    'yhvleexv': {
      'en': 'Please choose an option from the dropdown',
      'bn': '',
    },
    'r29ivbss': {
      'en': 'Field is required',
      'bn': '',
    },
    '9v979xqs': {
      'en': 'Please choose an option from the dropdown',
      'bn': '',
    },
    'szxsxltp': {
      'en': 'Home',
      'bn': 'বাড়ি',
    },
  },
  // EditProfile
  {
    'pcrhomen': {
      'en': 'Edit Profile',
      'bn': 'জীবন বৃত্তান্ত সম্পাদনা',
    },
    'ucww6vfi': {
      'en': 'Full Name',
      'bn': 'পুরো নাম',
    },
    'dtjv10yg': {
      'en': 'Your full name...',
      'bn': 'আপনার পূর্ণ নাম...',
    },
    'zaoj44qd': {
      'en': 'Age',
      'bn': 'বয়স',
    },
    'n7zlf03n': {
      'en': 'Your age...',
      'bn': 'আপনার বয়স...',
    },
    '387f9cwt': {
      'en': 'Phone Number',
      'bn': 'ফোন নম্বর',
    },
    'vkr51p0n': {
      'en': 'Your phone number...',
      'bn': 'আপনার ফোন নম্বর...',
    },
    '7knss8c2': {
      'en': 'Location',
      'bn': 'অবস্থান',
    },
    '0k74cxuc': {
      'en': 'city/town/village...',
      'bn': 'শহর/শহর/গ্রাম...',
    },
    'cxvbhavl': {
      'en': 'Your gender:',
      'bn': 'আপনার লিঙ্গ:',
    },
    'w1dxsqy0': {
      'en': 'Male',
      'bn': 'পুরুষ',
    },
    'w9xrj4iu': {
      'en': 'Female',
      'bn': 'মহিলা',
    },
    '5srs5o2a': {
      'en': 'Save changes',
      'bn': 'পরিবর্তনগুলোর সংরক্ষন',
    },
    '9123e7f0': {
      'en': 'Home',
      'bn': 'বাড়ি',
    },
  },
  // homepage
  {
    '4bsowoom': {
      'en': 'Services offered',
      'bn': 'প্রস্তাবিত সেবাসমূহ',
    },
    'k3pwtq9z': {
      'en': 'Inspection',
      'bn': 'পরিদর্শন',
    },
    'dzxyimnm': {
      'en': 'Treatment',
      'bn': 'চিকিৎসা',
    },
    'cd0q1axw': {
      'en': 'Removal',
      'bn': 'অপসারণ',
    },
    'xlbn9ll8': {
      'en': 'Braces',
      'bn': 'ধনুর্বন্ধনী',
    },
    'aq3drej0': {
      'en': 'Tooth X-Rays',
      'bn': 'দাঁতের এক্স-রে',
    },
    'ktzfm5s1': {
      'en': 'Implantation',
      'bn': 'ইমপ্লান্টেশন',
    },
    '54c915c0': {
      'en': 'Dental Tips',
      'bn': 'দাঁতের টিপস',
    },
    'nagjaaih': {
      'en': 'See all',
      'bn': '',
    },
    'd8tf7zdg': {
      'en': 'Upcoming Schedule',
      'bn': '',
    },
    '5mr0c00w': {
      'en': 'See all',
      'bn': '',
    },
    'u1n24iss': {
      'en': 'Dentist',
      'bn': '',
    },
    'p1nvk4or': {
      'en': 'Amaar Dentist',
      'bn': 'ঢাকা',
    },
    'u5ica25t': {
      'en': 'Home',
      'bn': 'বাড়ি',
    },
  },
  // locationPage1
  {
    'c07qq3p6': {
      'en': 'What is your location?',
      'bn': 'আপনার অবস্থান কি?',
    },
    'vfaywq08': {
      'en': 'We need to know your location in order to suggest nearby places',
      'bn':
          'আশেপাশের জায়গাগুলির পরামর্শ দেওয়ার জন্য আমাদের আপনার অবস্থান জানতে হবে৷',
    },
    'cf81j3zb': {
      'en': 'Allow location access',
      'bn': 'অবস্থান অ্যাক্সেসের অনুমতি দিন',
    },
    'x2pxd6fo': {
      'en': 'Home',
      'bn': 'বাড়ি',
    },
  },
  // explore
  {
    '24pq0smx': {
      'en': 'Explore by clinics',
      'bn': '',
    },
    'a5x3yjsj': {
      'en': 'Explore by doctors',
      'bn': '',
    },
    't09g6iy5': {
      'en': 'Explore',
      'bn': '',
    },
    '2wqpv92r': {
      'en': 'Explore',
      'bn': 'অন্বেষণ',
    },
  },
  // exploreDoctors
  {
    'uzke764b': {
      'en': 'Search doctors...',
      'bn': '',
    },
    '59gpg7x3': {
      'en': 'Dentist',
      'bn': 'ডেন্টিস্ট',
    },
    'btp7myfj': {
      'en': ' reviews',
      'bn': 'পর্যালোচনা',
    },
    'kynzkb7y': {
      'en': 'Make Appointment',
      'bn': 'অ্যাপয়েন্টমেন্ট করুন',
    },
    'hluc818z': {
      'en': 'Doctors',
      'bn': 'ডাক্তাররা',
    },
    'gaq7bv90': {
      'en': 'Appointments',
      'bn': 'অ্যাপয়েন্টমেন্ট',
    },
  },
  // doctorDetails
  {
    'ys51cwy1': {
      'en': 'Dentist',
      'bn': 'ডেন্টিস্ট',
    },
    '0xvkvnwr': {
      'en': 'Book Appointment',
      'bn': 'বুক অ্যাপয়েন্টমেন্ট',
    },
    'lkvrzenw': {
      'en': 'Patients',
      'bn': 'রোগীদের',
    },
    'cspx2r5i': {
      'en': 'Years exp.',
      'bn': 'বছর মেয়াদ।',
    },
    'xyayubap': {
      'en': 'Rating',
      'bn': 'রেটিং',
    },
    'j3s0eql1': {
      'en': 'Reviews',
      'bn': 'রিভিউ',
    },
    'fjzalitw': {
      'en': 'About',
      'bn': 'সম্পর্কিত',
    },
    '7xn99mc0': {
      'en': 'Working hours',
      'bn': 'কর্মঘন্টা',
    },
    'a3pyu0r6': {
      'en': 'Address',
      'bn': 'ঠিকানা',
    },
    '7ztpxkya': {
      'en': 'Reviews',
      'bn': 'রিভিউ',
    },
    'l1ctuf4g': {
      'en': ' reviews',
      'bn': 'পর্যালোচনা',
    },
    'xomz2jkl': {
      'en': 'Add review',
      'bn': 'পর্যালোচনা যোগ করুন',
    },
    'xbpoj3ju': {
      'en': 'Doctor Details',
      'bn': 'ডাক্তারের বিবরণ',
    },
    'pngg3ngp': {
      'en': 'Home',
      'bn': 'বাড়ি',
    },
  },
  // paymentSuccess
  {
    'q4ak69hw': {
      'en': 'Payment Successful!',
      'bn': 'পেমেন্ট সফল!',
    },
    'tl5o605m': {
      'en': 'You have successfully booked appointment with',
      'bn': 'আপনি সফলভাবে এর সাথে অ্যাপয়েন্টমেন্ট বুক করেছেন',
    },
    'mnag56qn': {
      'en': 'Hello World',
      'bn': 'ওহে বিশ্ব',
    },
    'qfh9uejc': {
      'en': 'Hello World',
      'bn': '',
    },
    'wec2lkk7': {
      'en': 'Hello World',
      'bn': 'ওহে বিশ্ব',
    },
    '0tcw2wjf': {
      'en': 'Hello World',
      'bn': 'ওহে বিশ্ব',
    },
    '9t3q1xtn': {
      'en': 'Hello World',
      'bn': 'ওহে বিশ্ব',
    },
    'inewgij7': {
      'en': 'Go to Home',
      'bn': 'বাড়িতে যেতে',
    },
    '7w92pkmz': {
      'en': 'Home',
      'bn': 'বাড়ি',
    },
  },
  // dentalTips
  {
    'b1rnvd18': {
      'en': 'Dental Tips',
      'bn': '',
    },
    '99850z9c': {
      'en': 'Home',
      'bn': 'বাড়ি',
    },
  },
  // myBookings
  {
    '6ibcjgpx': {
      'en': 'Upcoming',
      'bn': 'আসন্ন',
    },
    'bwd7fbhq': {
      'en': 'Booking ID: ',
      'bn': 'বুকিং আইডি:',
    },
    'pgaw0zvr': {
      'en': 'Cancel',
      'bn': 'বাতিল করুন',
    },
    'vwfjgj8f': {
      'en': 'Completed',
      'bn': 'সম্পন্ন',
    },
    'mfq9ee1k': {
      'en': 'Booking ID: ',
      'bn': 'বুকিং আইডি:',
    },
    '6lhgyc22': {
      'en': 'Re-book',
      'bn': 'রি-বুক',
    },
    'hq421prx': {
      'en': 'My Bookings',
      'bn': '',
    },
    'pc5m8kle': {
      'en': 'Bookings',
      'bn': 'বাড়ি',
    },
  },
  // cancelBooking
  {
    'z4sqtxyx': {
      'en': 'Please select the reason for cancellation:',
      'bn': 'বাতিল করার কারণ নির্বাচন করুন:',
    },
    'pixnxmkm': {
      'en': 'Schedule change',
      'bn': 'সময়সূচি পরিবর্তন',
    },
    'mpbp8p8k': {
      'en': 'Weather conditions',
      'bn': 'আবহাওয়ার অবস্থা',
    },
    '6m8yufhy': {
      'en': 'Unexpected work',
      'bn': 'অপ্রত্যাশিত কাজ',
    },
    '5c8eu20b': {
      'en': 'Childcare issues',
      'bn': 'শিশু যত্নের সমস্যা',
    },
    '95uoa8s3': {
      'en': 'Travel delays',
      'bn': 'ভ্রমণ বিলম্ব',
    },
    'g7w9ofnn': {
      'en': 'Other',
      'bn': 'অন্যান্য',
    },
    'nyry9hv5': {
      'en': 'Cancel Booking',
      'bn': 'বুকিং বাতিল করুন',
    },
    'p0diwt48': {
      'en': 'Cancel Booking',
      'bn': 'বুকিং বাতিল করুন',
    },
    'x3tu7tau': {
      'en': 'Home',
      'bn': 'বাড়ি',
    },
  },
  // successfulBooking
  {
    'nmjvl3hc': {
      'en': 'Booking successfull!',
      'bn': 'বুকিং সফল!',
    },
    'u30zcu8j': {
      'en': 'Thank you and have a great day!',
      'bn': 'ধন্যবাদ, আপনার দিনটি ভাল যাক!',
    },
    'f2lqaaiv': {
      'en': 'Return to home',
      'bn': 'বাড়িতে ফিরে',
    },
    'o4nlv9xq': {
      'en': 'Home',
      'bn': 'বাড়ি',
    },
  },
  // eShop
  {
    'jqtf04rv': {
      'en': 'Search here...',
      'bn': 'এখানে অনুসন্ধান করুন...',
    },
    'fydriilj': {
      'en': 'All Categories',
      'bn': 'সব ধরনের',
    },
    'fo8p0z3i': {
      'en': 'All Categories',
      'bn': 'সব ধরনের',
    },
    'crzonkha': {
      'en': 'All Categories',
      'bn': 'সব ধরনের',
    },
    'vwigqcy0': {
      'en': 'All Categories',
      'bn': 'সব ধরনের',
    },
    '2gsz1uru': {
      'en': 'All Categories',
      'bn': 'সব ধরনের',
    },
    'ykbwa7d9': {
      'en': 'Amaar Shop',
      'bn': 'আমার দোকান',
    },
    '1c033izq': {
      'en': 'E-Shop',
      'bn': 'ই-শপ',
    },
  },
  // login
  {
    '1taouxn2': {
      'en': 'Amaar Dentist',
      'bn': '',
    },
    'mjvx8ei8': {
      'en': 'Welcome Back!',
      'bn': '',
    },
    '58jwagqt': {
      'en': 'Input your email below in order to login.',
      'bn': '',
    },
    '0ae4pyc3': {
      'en': 'Your email...',
      'bn': '',
    },
    'ft0wwelb': {
      'en': 'Field is required',
      'bn': 'আপনি উত্তর দিবেন না',
    },
    'dlkysssn': {
      'en': 'invalid email',
      'bn': 'অবৈধ ইমেল',
    },
    'tl0oel9w': {
      'en': 'Please choose an option from the dropdown',
      'bn': 'ড্রপডাউন থেকে একটি বিকল্প চয়ন করুন',
    },
    'rt33r5du': {
      'en': 'Continue',
      'bn': '',
    },
    'd8wnbncj': {
      'en': 'New user?',
      'bn': '',
    },
    '5p90gzv7': {
      'en': ' Sign up',
      'bn': '',
    },
    'vhbtudyw': {
      'en': 'Have an account?',
      'bn': '',
    },
    '6ljq58dt': {
      'en': 'Home',
      'bn': 'বাড়ি',
    },
  },
  // createacc
  {
    'm8w0qbjt': {
      'en': 'Amaar Dentist',
      'bn': '',
    },
    'jtdodm18': {
      'en': 'Welcome!',
      'bn': '',
    },
    'z3jjryi0': {
      'en': 'Input your details below in order to Sign Up.',
      'bn': '',
    },
    'enbofsay': {
      'en': 'Your Full Name...',
      'bn': '',
    },
    '3ciwccc9': {
      'en': 'Your email...',
      'bn': '',
    },
    '0b9sd00k': {
      'en': 'Type your password...',
      'bn': '',
    },
    '99zes0zs': {
      'en': 'Re-type your password...',
      'bn': '',
    },
    'f5qwv4f3': {
      'en': 'Continue',
      'bn': '',
    },
    '6xjekgbc': {
      'en': 'Have an account?',
      'bn': '',
    },
    'iocu54r7': {
      'en': ' Login',
      'bn': '',
    },
    'rowd4clx': {
      'en': 'Have an account?',
      'bn': '',
    },
    'lycl2e8k': {
      'en': 'Field is required',
      'bn': 'আপনি উত্তর দিবেন না',
    },
    'c6cxdn9a': {
      'en': 'Please choose an option from the dropdown',
      'bn': 'ড্রপডাউন থেকে একটি বিকল্প চয়ন করুন',
    },
    'tvwfc3ya': {
      'en': 'Field is required',
      'bn': 'আপনি উত্তর দিবেন না',
    },
    'fkcqqzp5': {
      'en': 'invalid email',
      'bn': 'অবৈধ ইমেল',
    },
    'apb71ojl': {
      'en': 'Please choose an option from the dropdown',
      'bn': 'ড্রপডাউন থেকে একটি বিকল্প চয়ন করুন',
    },
    'akuerq6j': {
      'en': 'Field is required',
      'bn': 'আপনি উত্তর দিবেন না',
    },
    '81i3cpps': {
      'en': 'minimum 6 characters required',
      'bn': '',
    },
    'xevalg9r': {
      'en': 'maximum 12 characters allowed',
      'bn': '',
    },
    'jbezlutc': {
      'en': 'Please choose an option from the dropdown',
      'bn': 'ড্রপডাউন থেকে একটি বিকল্প চয়ন করুন',
    },
    'ev42arao': {
      'en': 'Field is required',
      'bn': '',
    },
    '7rncyq01': {
      'en': 'password doesn\'t match',
      'bn': '',
    },
    'pnbqh577': {
      'en': 'password doesn\'t match',
      'bn': '',
    },
    '5rssokk6': {
      'en': 'Please choose an option from the dropdown',
      'bn': '',
    },
    'g7rxn3k5': {
      'en': 'Home',
      'bn': 'বাড়ি',
    },
  },
  // Profile
  {
    'ap9a8075': {
      'en': 'Account Settings',
      'bn': '',
    },
    '1ixyy70s': {
      'en': 'Edit Profile',
      'bn': '',
    },
    '2lxr3oqj': {
      'en': 'System Theme',
      'bn': '',
    },
    '630zx1o0': {
      'en': 'Log Out',
      'bn': '',
    },
    '96bmcwev': {
      'en': 'Profile',
      'bn': '',
    },
    'x3f55kag': {
      'en': 'Profile',
      'bn': 'প্রোফাইল',
    },
  },
  // CreateBookAppointment
  {
    'h6bypqer': {
      'en': 'Please write your problem',
      'bn': '',
    },
    'x93obx49': {
      'en': 'Write here...',
      'bn': '',
    },
    'r0fbt0r2': {
      'en': 'Date',
      'bn': '',
    },
    '3jf586pr': {
      'en': 'Timeslot available',
      'bn': '',
    },
    'qsjqt4em': {
      'en': 'Field is required',
      'bn': '',
    },
    'tpz73d9b': {
      'en': 'Please choose an option from the dropdown',
      'bn': '',
    },
    'rni7wn2k': {
      'en': 'Book Appointment',
      'bn': '',
    },
    'clqb5qkj': {
      'en': 'Home',
      'bn': '',
    },
  },
  // mapSearch
  {
    'fix7k14h': {
      'en': 'Home',
      'bn': '',
    },
  },
  // tipsDetail
  {
    'qx3emgve': {
      'en': 'Home',
      'bn': '',
    },
  },
  // phone_createAccount
  {
    'owqontiw': {
      'en': 'Amaar Dentist',
      'bn': '',
    },
    'fsfbzxp6': {
      'en': 'Welcome!',
      'bn': '',
    },
    'fgne7bf7': {
      'en': 'Input your details below in order to Sign Up.',
      'bn': '',
    },
    'l1h2p2ez': {
      'en': 'Your Full Name...',
      'bn': '',
    },
    'h09buq2z': {
      'en': 'Your phone number...',
      'bn': '',
    },
    'r3qqptgk': {
      'en': 'eg. +8809876543210',
      'bn': '',
    },
    'm97erbhq': {
      'en': 'Type your password...',
      'bn': '',
    },
    '90h4t54y': {
      'en': 'Re-type your password...',
      'bn': '',
    },
    'jmnuujh4': {
      'en': 'Continue',
      'bn': '',
    },
    '60wbbrba': {
      'en': 'Have an account?',
      'bn': '',
    },
    '76tdtc7c': {
      'en': ' Login',
      'bn': '',
    },
    'm03vi1co': {
      'en': 'Have an account?',
      'bn': '',
    },
    'q73i3vxb': {
      'en': 'Field is required',
      'bn': '',
    },
    'a16hb8zs': {
      'en': 'Please choose an option from the dropdown',
      'bn': '',
    },
    'x1wbbg0d': {
      'en': 'Field is required',
      'bn': '',
    },
    'j8bdd6ps': {
      'en': 'invalid phone number',
      'bn': '',
    },
    'auxdaci6': {
      'en': 'Please choose an option from the dropdown',
      'bn': '',
    },
    '2ksfpt4p': {
      'en': 'Field is required',
      'bn': '',
    },
    'oqguessl': {
      'en': 'minimum 6 characters required',
      'bn': '',
    },
    't4vcw7ds': {
      'en': 'maximum 12 characters allowed',
      'bn': '',
    },
    '93lbubbo': {
      'en': 'Please choose an option from the dropdown',
      'bn': '',
    },
    '41q2fpru': {
      'en': 'Field is required',
      'bn': '',
    },
    'yr7mju3z': {
      'en': 'password doesn\'t match',
      'bn': '',
    },
    'olsgrexo': {
      'en': 'password doesn\'t match',
      'bn': '',
    },
    '9z3pu6ih': {
      'en': 'Please choose an option from the dropdown',
      'bn': '',
    },
    '5bqtr9qo': {
      'en': 'Home',
      'bn': '',
    },
  },
  // verifyOTPphone
  {
    'l9amiuk4': {
      'en': 'Verify your phone number',
      'bn': '',
    },
    'j844rcvr': {
      'en': 'Verify',
      'bn': '',
    },
    '04l8wxff': {
      'en': 'Resend OTP',
      'bn': '',
    },
    '81hnaxb3': {
      'en': 'Home',
      'bn': '',
    },
  },
  // phone_login
  {
    'z641b6xg': {
      'en': 'Login',
      'bn': '',
    },
    'c9d2aj1s': {
      'en': 'Your phone number...',
      'bn': '',
    },
    'vv2hq7ia': {
      'en': 'eg. +8809876543210',
      'bn': '',
    },
    'wnxi0wrb': {
      'en': 'Type your password...',
      'bn': '',
    },
    'ub7q68dn': {
      'en': 'Submit',
      'bn': '',
    },
    '6yrxzhhc': {
      'en': 'register',
      'bn': '',
    },
    'xzvoyb2n': {
      'en': 'Home',
      'bn': '',
    },
  },
  // Auth1
  {
    'wl2ajfjy': {
      'en': 'Amaar Dentist',
      'bn': '',
    },
    'sm63z0fe': {
      'en': 'Login',
      'bn': '',
    },
    'htnse51r': {
      'en': 'Let\'s get started by filling out the form below.',
      'bn': '',
    },
    '23secbdz': {
      'en': 'Email',
      'bn': '',
    },
    'mtw45ngt': {
      'en': 'Password',
      'bn': '',
    },
    'cpiz5p1w': {
      'en': 'Login',
      'bn': '',
    },
    'm65w8hjc': {
      'en': 'Register',
      'bn': '',
    },
    'rnb5xx7u': {
      'en': 'Let\'s get started by filling out the form below.',
      'bn': '',
    },
    'zi6ti1xv': {
      'en': 'Email',
      'bn': '',
    },
    'ok57la46': {
      'en': 'Password',
      'bn': '',
    },
    '3u6t9hj3': {
      'en': 'Confirm Password',
      'bn': '',
    },
    'un59ymrn': {
      'en': 'Create Account',
      'bn': '',
    },
    'k9fzfjkt': {
      'en': 'Home',
      'bn': '',
    },
  },
  // addReview2
  {
    'cezk79of': {
      'en': 'Enter your review here...',
      'bn': 'এখানে আপনার পর্যালোচনা লিখুন...',
    },
    'a7v76chp': {
      'en': 'Rate',
      'bn': 'হার',
    },
    '6d5fwtii': {
      'en': 'Cancel',
      'bn': 'বাতিল করুন',
    },
    '3vkt2c4t': {
      'en': 'Field is required',
      'bn': '',
    },
    'wjuocop9': {
      'en': 'Please choose an option from the dropdown',
      'bn': '',
    },
  },
  // bookingConfirm
  {
    'mea56yg9': {
      'en': 'Book Appointment',
      'bn': 'বুক অ্যাপয়েন্টমেন্ট',
    },
    'enxehbvc': {
      'en': 'Yes, Book',
      'bn': 'হ্যাঁ, বই',
    },
    'x40hmrgs': {
      'en': 'Cancel',
      'bn': 'বাতিল করুন',
    },
  },
  // cancelConfirm
  {
    'c6xf6lpx': {
      'en': 'Are you sure you want to cancel this booking?',
      'bn': 'আপনি কি নিশ্চিত আপনি এই বুকিং বাতিল করতে চান?',
    },
    '9xmvq1tn': {
      'en': 'Yes, Cancel',
      'bn': 'হ্যাঁ, বাতিল করুন',
    },
    '1bpvp0gn': {
      'en': 'No, Go Back',
      'bn': 'না, গো ব্যাক',
    },
  },
  // OTPforCreateEmail
  {
    'atjhisg0': {
      'en': 'Enter OTP below',
      'bn': '',
    },
    'j2hviq9n': {
      'en':
          'An OTP has been sent to your email. Please do not share with anyone',
      'bn': '',
    },
    '1cy2qxtd': {
      'en': 'Cancel',
      'bn': '',
    },
    'gw4c7z23': {
      'en': 'Verify OTP',
      'bn': '',
    },
  },
  // OTPforLoginEmail
  {
    '1jri73sb': {
      'en': 'Enter OTP below',
      'bn': '',
    },
    'db6iotsb': {
      'en':
          'An OTP has been sent to your email. Please do not share with anyone',
      'bn': '',
    },
    'ds1nwnmc': {
      'en': 'Cancel',
      'bn': '',
    },
    'i88lys07': {
      'en': 'Verify OTP',
      'bn': '',
    },
  },
  // seeClinic
  {
    'ue8z3n7x': {
      'en': 'Meet the doctor',
      'bn': '',
    },
  },
  // EmptyList_REVIEW
  {
    'gsbtjg43': {
      'en': 'No reviews yet!',
      'bn': '',
    },
  },
  // EmptyList_Upcoming_appints
  {
    'o4csr363': {
      'en': 'No appointments yet!',
      'bn': '',
    },
  },
  // Miscellaneous
  {
    '7yvcgb68': {
      'en': 'Make Appointment',
      'bn': 'অ্যাপয়েন্টমেন্ট করুন',
    },
    'npaifiqr': {
      'en': 'Book Appointment',
      'bn': 'বুক অ্যাপয়েন্টমেন্ট',
    },
    'voae8o9f': {
      'en': 'Next',
      'bn': 'পরবর্তী',
    },
    'n82bm1wm': {
      'en': '',
      'bn': '',
    },
    'mfuddcsq': {
      'en': '',
      'bn': '',
    },
    'hdlnv9zc': {
      'en': '',
      'bn': '',
    },
    'kvw04lc9': {
      'en':
          'In order to access location, this app requires permission to access the location',
      'bn':
          'অবস্থান অ্যাক্সেস করার জন্য, এই অ্যাপটির লোকেশন অ্যাক্সেস করার অনুমতি প্রয়োজন',
    },
    '9xp8rc0e': {
      'en': 'Allow notifications ',
      'bn': '',
    },
    'b4em83qd': {
      'en': '',
      'bn': '',
    },
    '6ziew53f': {
      'en': '',
      'bn': '',
    },
    'me1y9xd5': {
      'en': '',
      'bn': '',
    },
    'ewqjbpvs': {
      'en': '',
      'bn': '',
    },
    '0badqc6c': {
      'en': '',
      'bn': '',
    },
    'fzhdu41r': {
      'en': '',
      'bn': '',
    },
    '7396a5ka': {
      'en': '',
      'bn': '',
    },
    'e1z50zg3': {
      'en': '',
      'bn': '',
    },
    '70izsfjd': {
      'en': '',
      'bn': '',
    },
    '7ry4vg6e': {
      'en': '',
      'bn': '',
    },
    'ydtwo172': {
      'en': '',
      'bn': '',
    },
    'w087gia8': {
      'en': '',
      'bn': '',
    },
    'eycct5ss': {
      'en': '',
      'bn': '',
    },
    '2gc16jd1': {
      'en': '',
      'bn': '',
    },
    'nirlz1eo': {
      'en': '',
      'bn': '',
    },
    'eixmuqly': {
      'en': '',
      'bn': '',
    },
    '8nun8k8x': {
      'en': '',
      'bn': '',
    },
    '7ynv4sqj': {
      'en': '',
      'bn': '',
    },
    '2l64m7y0': {
      'en': '',
      'bn': '',
    },
    's4z9uo21': {
      'en': '',
      'bn': '',
    },
    'ha2su5yu': {
      'en': '',
      'bn': '',
    },
    'zknvd45o': {
      'en': '',
      'bn': '',
    },
    'pfvolnts': {
      'en': '',
      'bn': '',
    },
    '1vhy19k8': {
      'en': '',
      'bn': '',
    },
    'ucbuz23m': {
      'en': '',
      'bn': '',
    },
  },
].reduce((a, b) => a..addAll(b));
