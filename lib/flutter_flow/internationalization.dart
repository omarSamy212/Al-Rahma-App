import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'ar'];

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
    String? arText = '',
  }) =>
      [enText, arText][languageIndex] ?? '';

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
  // welcome
  {
    'sf1bjn8w': {
      'en': 'Welcome!',
      'ar': 'مرحباً!',
    },
    '0y2l0bwn': {
      'en':
          'Thank you for joining us! Please log in to your account or apply for a job to start your journey.',
      'ar':
          'شكرا لانضمامك إلينا! يرجى تسجيل الدخول إلى حسابك أو التقدم بطلب للحصول على وظيفة لبدء رحلتك.',
    },
    'y4vz81u8': {
      'en': 'Get Job',
      'ar': 'احصل على وظيفة',
    },
    'fqvuxmjh': {
      'en': 'My Account',
      'ar': 'حسابي',
    },
    'z2hi69w4': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
    },
  },
  // Login
  {
    '95rdmci4': {
      'en': 'Welcome!',
      'ar': 'مرحباً!',
    },
    'dmk5pmhx': {
      'en': 'Login to Al Rahma Service Group System',
      'ar': 'قم بالدخول إلى نظام الرحمة لإدارة العمل الميداني  ',
    },
    '736voji3': {
      'en': 'Email',
      'ar': 'البريد الإلكتروني',
    },
    'h3u5bi64': {
      'en': 'Password',
      'ar': 'كلمة المرور',
    },
    'yvl6r8lw': {
      'en': 'Sign In',
      'ar': 'تسجيل الدخول',
    },
    'eugvkn2f': {
      'en': ' have a problem? ',
      'ar': 'لديك مشكلة؟',
    },
    'tqp05les': {
      'en': 'Contact Support',
      'ar': 'اتصل بالدعم',
    },
    'brj5yap0': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
    },
  },
  // storekeeperHome
  {
    '07wo9ga6': {
      'en': 'Al Rahma',
      'ar': '',
    },
    'ujkri8ai': {
      'en': 'Warehouse management',
      'ar': '',
    },
    '6tisjf5c': {
      'en': 'Hello,',
      'ar': '',
    },
    'g83vp3ub': {
      'en': 'Reception',
      'ar': '',
    },
    'p86pjahx': {
      'en': 'Transmission',
      'ar': '',
    },
    'k8dg7d3t': {
      'en': 'Powerd by Omar-s Team',
      'ar': '',
    },
    '86d8g48f': {
      'en': '__',
      'ar': '',
    },
  },
  // Home01CompanyList
  {
    '0znieo35': {
      'en': 'All',
      'ar': '',
    },
    'pbobhzoz': {
      'en': 'Inspector Name',
      'ar': '',
    },
    'hnixbxx0': {
      'en': 'Title',
      'ar': '',
    },
    'npje2rwn': {
      'en': 'Inspector Name',
      'ar': '',
    },
    'crhq3l7r': {
      'en': 'Title',
      'ar': '',
    },
    'bj3i2sqp': {
      'en': 'Inspector Name',
      'ar': '',
    },
    'fgni17ui': {
      'en': 'Title',
      'ar': '',
    },
    '53fbhd07': {
      'en': 'Active',
      'ar': '',
    },
    '38snh2lo': {
      'en': 'Inspector Name',
      'ar': '',
    },
    'cqbk6kgk': {
      'en': 'Title',
      'ar': '',
    },
    'zohijwq0': {
      'en': 'Inactive',
      'ar': '',
    },
    't3tpy482': {
      'en': 'Inspector Name',
      'ar': '',
    },
    '3ots6vy1': {
      'en': 'Title',
      'ar': '',
    },
    'efduwfky': {
      'en': 'Inspectors',
      'ar': '',
    },
    'o5jtrxrq': {
      'en': '•',
      'ar': '',
    },
  },
  // createUser
  {
    '2d6rteh9': {
      'en': 'First Name',
      'ar': '',
    },
    'n58knsyq': {
      'en': 'Middle Name',
      'ar': '',
    },
    'mdy1qx8z': {
      'en': 'Last Name',
      'ar': '',
    },
    'dk4dovjp': {
      'en': 'Nick Name',
      'ar': '',
    },
    'u66kvll4': {
      'en': 'National ID',
      'ar': '',
    },
    'uou90kkw': {
      'en': 'Hello World',
      'ar': '',
    },
    'qsfdk174': {
      'en': 'Phone Number',
      'ar': '',
    },
    '2ebdxwev': {
      'en': '',
      'ar': '',
    },
    '65jh4ywz': {
      'en': 'Worker',
      'ar': '',
    },
    'xmjl1sfd': {
      'en': 'Supervisor',
      'ar': '',
    },
    '6o5jnil3': {
      'en': 'Operation Manager',
      'ar': '',
    },
    '5krj58h8': {
      'en': 'Storage Keeper',
      'ar': '',
    },
    'nrncha19': {
      'en': 'Select Role',
      'ar': '',
    },
    'xnv01l3d': {
      'en': '',
      'ar': '',
    },
    'z4mmm7cc': {
      'en': 'Male',
      'ar': '',
    },
    '8tfs7d48': {
      'en': 'Female',
      'ar': '',
    },
    'rxzrjtbv': {
      'en': 'Select Gender',
      'ar': '',
    },
    'vdrhxkdw': {
      'en': 'Birthdate',
      'ar': '',
    },
    'dl8hsghd': {
      'en': 'Birthdate',
      'ar': '',
    },
    'bg2461k8': {
      'en': '',
      'ar': '',
    },
    '5ie8xn1y': {
      'en': 'Egypt',
      'ar': '',
    },
    'qe35equk': {
      'en': 'Senegal',
      'ar': '',
    },
    'vlnx38us': {
      'en': 'Select Country',
      'ar': '',
    },
    'ds29rt2n': {
      'en': '',
      'ar': '',
    },
    'qfqpnpcu': {
      'en': 'Married',
      'ar': '',
    },
    'con4pmhq': {
      'en': 'Single',
      'ar': '',
    },
    'aqylwqqh': {
      'en': 'Social Status',
      'ar': '',
    },
    'db1nx0g4': {
      'en': 'Government',
      'ar': '',
    },
    '85wgumcw': {
      'en': 'city',
      'ar': '',
    },
    '1tw6d9qp': {
      'en': 'Full Address',
      'ar': '',
    },
    'gjf75qlj': {
      'en': '',
      'ar': '',
    },
    'g4ciozpr': {
      'en': '8h',
      'ar': '',
    },
    'jrwjwr7e': {
      'en': '12h',
      'ar': '',
    },
    'bt1o6yx1': {
      'en': '16h',
      'ar': '',
    },
    'pt2z6fs0': {
      'en': 'Select shift Time',
      'ar': '',
    },
    'yrc5m89b': {
      'en': 'Upload Image',
      'ar': '',
    },
    'aue2890w': {
      'en': 'Next',
      'ar': '',
    },
    'uqp1cu71': {
      'en': 'Field is required',
      'ar': '',
    },
    'bprukhag': {
      'en': 'Name Error',
      'ar': '',
    },
    'dunjd1uo': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'vkrrbebk': {
      'en': 'Field is required',
      'ar': '',
    },
    'xsc23mr6': {
      'en': 'Wrong NatID',
      'ar': '',
    },
    'db1rwex8': {
      'en': 'Wrong NatID',
      'ar': '',
    },
    'bxq5z3ib': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '87jbrjhh': {
      'en': 'Field is required',
      'ar': '',
    },
    'u7tjd6ab': {
      'en': 'Wrong Number',
      'ar': '',
    },
    'pcug1wnh': {
      'en': 'Wrong Number',
      'ar': '',
    },
    '5elr8x4g': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '0nw9lsur': {
      'en': 'Create  Profile',
      'ar': '',
    },
  },
  // Missingtools_form
  {
    'gosp4rgv': {
      'en': 'Select Missing tools',
      'ar': '',
    },
    'qoptiqm7': {
      'en': 'Search for an item...',
      'ar': '',
    },
    '51swf6xg': {
      'en': 'Details',
      'ar': '',
    },
    'z45ssy6j': {
      'en': 'Record Audio',
      'ar': '',
    },
    'mkdymwm1': {
      'en': 'Upload Screenshot',
      'ar': '',
    },
    '6s92kvhj': {
      'en': 'Maximum 3 img/jpg',
      'ar': '',
    },
    'wgufu7aa': {
      'en': 'Make Complain',
      'ar': '',
    },
    'e4yol17p': {
      'en': 'PLeasr Fill in the detials of the complain',
      'ar': '',
    },
    '47fnl9bd': {
      'en': 'Please fill in all the required Info',
      'ar': '',
    },
    '042y89ir': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '0vaddc65': {
      'en': 'Missing tools Form',
      'ar': '',
    },
  },
  // day_Contract_List
  {
    'lsecgnf2': {
      'en': 'Al Rahma',
      'ar': '',
    },
    'bqg9b5py': {
      'en': '__',
      'ar': '',
    },
  },
  // request_Details
  {
    'nbfdzngi': {
      'en': 'Chat',
      'ar': '',
    },
    'zlt4m1n4': {
      'en': 'Call',
      'ar': '',
    },
    'o5flpqtg': {
      'en': 'Today\'s Work Info',
      'ar': '',
    },
    '5ka766by': {
      'en': 'Address Work',
      'ar': '',
    },
    'd7bt3xdh': {
      'en': 'Shift',
      'ar': '',
    },
    '9832dlkg': {
      'en': 'Expected Finsh time:  16:30',
      'ar': '',
    },
    'y6stwbac': {
      'en': 'Tools Checklist',
      'ar': '',
    },
    'ivs6j9kb': {
      'en': 'Zion 1',
      'ar': '',
    },
    'cnvgaa12': {
      'en': 'Quanity: 1',
      'ar': '',
    },
    'kzz3danx': {
      'en': 'Jumpsuit',
      'ar': '',
    },
    'wtbmhfgv': {
      'en': 'Quanity: 1',
      'ar': '',
    },
    '3knkzm34': {
      'en': ' have a problem? ',
      'ar': '',
    },
    'qv6cbowy': {
      'en': 'Make Complan',
      'ar': '',
    },
    'vy3ggafz': {
      'en': 'End Request',
      'ar': '',
    },
    'dedxsmje': {
      'en': 'Request details',
      'ar': '',
    },
    'yu7pucfd': {
      'en': 'Home',
      'ar': '',
    },
  },
  // createUser_2
  {
    'yf8l2oet': {
      'en': 'ID',
      'ar': '',
    },
    'kv4tuiot': {
      'en': 'Email',
      'ar': '',
    },
    'oya55ado': {
      'en': 'Password',
      'ar': '',
    },
    'l29zl71c': {
      'en': 'Create User',
      'ar': '',
    },
    '1801r09g': {
      'en': 'CreateProfile',
      'ar': '',
    },
  },
  // supervisor_home
  {
    'xgfc5e9i': {
      'en': 'Hello,',
      'ar': '',
    },
    '630xn3m1': {
      'en': 'Team Overview',
      'ar': '',
    },
    'xe61h196': {
      'en': 'Review the details below of your recent projects.',
      'ar': '',
    },
    'lez1fc8z': {
      'en': 'Assign',
      'ar': '',
    },
    'graxwi8p': {
      'en': 'Tasks Completed',
      'ar': '',
    },
    'okkyz5ed': {
      'en': '5',
      'ar': '',
    },
    '42o0idu0': {
      'en': '32.2%',
      'ar': '',
    },
    'htfllq5p': {
      'en': 'Upcoming Tasks',
      'ar': '',
    },
    '7ijp8xlm': {
      'en': '17',
      'ar': '',
    },
    'zdhhzivr': {
      'en': '45.5%',
      'ar': '',
    },
    'umli55v9': {
      'en': 'Work Area',
      'ar': '',
    },
    'zh8me3su': {
      'en': 'General information about the area.',
      'ar': '',
    },
    'q0e28txe': {
      'en': 'Tasks',
      'ar': '',
    },
    '7j6932h9': {
      'en': 'Start Point',
      'ar': '',
    },
    '7jm18jz7': {
      'en': 'End Point',
      'ar': '',
    },
    'obexelts': {
      'en': 'Daily Goal',
      'ar': '',
    },
    'o1c5id0f': {
      'en': '62.2% /',
      'ar': '',
    },
    '1d6bmoyl': {
      'en': ' 12',
      'ar': '',
    },
    'u026zsnb': {
      'en': '',
      'ar': '',
    },
    '9hh3fpfk': {
      'en': 'Achieved goals: ',
      'ar': '',
    },
    'rrr954w0': {
      'en': '3',
      'ar': '',
    },
    '0p5vgnl1': {
      'en': 'All',
      'ar': '',
    },
    'xkzhtc42': {
      'en': 'Current Task',
      'ar': '',
    },
    '285s9vkm': {
      'en': 'View',
      'ar': '',
    },
    '6yi526a1': {
      'en': 'Upcoming Milestones',
      'ar': '',
    },
    'wgl7rxoo': {
      'en': 'Below are some of the upcoming tasks for.',
      'ar': '',
    },
    '54e0hq4m': {
      'en': 'Due',
      'ar': '',
    },
    '8sbyba6w': {
      'en': 'Tuesday, 10:00am',
      'ar': '',
    },
    'zjmyz459': {
      'en': 'In Progress',
      'ar': '',
    },
    'urcdrovl': {
      'en': 'Team Overview',
      'ar': '',
    },
    's3nrmpnj': {
      'en': 'Review the details below of your recent projects.',
      'ar': '',
    },
    'datik9u0': {
      'en': 'Assign',
      'ar': '',
    },
    'cr0fd8j3': {
      'en': 'Today\'s Workers List',
      'ar': '',
    },
    'ardzpi1h': {
      'en': 'View',
      'ar': '',
    },
    'fy4nqf0n': {
      'en': 'You can distribute workers like you want ',
      'ar': '',
    },
    'awdkcyxo': {
      'en': 'Add New',
      'ar': '',
    },
    'labxp8ej': {
      'en': 'Assigned User',
      'ar': '',
    },
    'b2im9x3r': {
      'en': 'Due Date',
      'ar': '',
    },
    'ioqei7fi': {
      'en': 'Status',
      'ar': '',
    },
    'i5chrdwv': {
      'en': 'Actions',
      'ar': '',
    },
    '4mv99hc1': {
      'en': 'Randy Peterson',
      'ar': '',
    },
    'm11feh5e': {
      'en': 'Business Name',
      'ar': '',
    },
    'x9r3js2a': {
      'en': 'Fri. Aug 11th',
      'ar': '',
    },
    '561mho95': {
      'en': 'High',
      'ar': '',
    },
    's0n40ssb': {
      'en': 'Randy Peterson',
      'ar': '',
    },
    'rys9sr05': {
      'en': 'Business Name',
      'ar': '',
    },
    '3con0z70': {
      'en': 'Fri. Aug 11th',
      'ar': '',
    },
    'wnkxus7c': {
      'en': 'High',
      'ar': '',
    },
    '3gmvs7mg': {
      'en': 'Randy Peterson',
      'ar': '',
    },
    '1vyq7s8g': {
      'en': 'Business Name',
      'ar': '',
    },
    '6jc1684x': {
      'en': 'Fri. Aug 11th',
      'ar': '',
    },
    'ojcmb8c6': {
      'en': 'High',
      'ar': '',
    },
    'aafd1awp': {
      'en': 'Randy Peterson',
      'ar': '',
    },
    'obloxmop': {
      'en': 'Business Name',
      'ar': '',
    },
    '8wd932sp': {
      'en': 'Fri. Aug 11th',
      'ar': '',
    },
    'gaye1lao': {
      'en': 'High',
      'ar': '',
    },
    '8owg0i1j': {
      'en': 'Today\'s Tools List',
      'ar': '',
    },
    '0rrxwe9y': {
      'en': 'View',
      'ar': '',
    },
    'sb0ck54l': {
      'en': 'You can distribute tools like you want ',
      'ar': '',
    },
    'a3vwl85o': {
      'en': 'Add New',
      'ar': '',
    },
    'h9gtcp9k': {
      'en': 'Assigned User',
      'ar': '',
    },
    '11n5lq64': {
      'en': 'Due Date',
      'ar': '',
    },
    'l4a9wgy5': {
      'en': 'Actions',
      'ar': '',
    },
    'va26dvad': {
      'en': 'Randy Peterson',
      'ar': '',
    },
    'gcmqt5o3': {
      'en': 'Business Name',
      'ar': '',
    },
    '3f74boic': {
      'en': 'Fri. Aug 11th',
      'ar': '',
    },
    'orna9bre': {
      'en': 'High',
      'ar': '',
    },
    'i23lhw3n': {
      'en': 'Randy Peterson',
      'ar': '',
    },
    'c26o3jsx': {
      'en': 'Business Name',
      'ar': '',
    },
    'ieaam6nv': {
      'en': 'Fri. Aug 11th',
      'ar': '',
    },
    'bfs9dsiw': {
      'en': 'High',
      'ar': '',
    },
    'qzk1glnn': {
      'en': 'Randy Peterson',
      'ar': '',
    },
    'fmtv4f9a': {
      'en': 'Business Name',
      'ar': '',
    },
    'sajbrz9e': {
      'en': 'Fri. Aug 11th',
      'ar': '',
    },
    'rag58zof': {
      'en': 'High',
      'ar': '',
    },
    '4rbi2n2g': {
      'en': 'Randy Peterson',
      'ar': '',
    },
    'lu3209ey': {
      'en': 'Business Name',
      'ar': '',
    },
    'cyvm5pqx': {
      'en': 'Fri. Aug 11th',
      'ar': '',
    },
    '2vs1y3z7': {
      'en': 'High',
      'ar': '',
    },
    '64rv3zkn': {
      'en': 'Activity',
      'ar': '',
    },
    '6206idkd': {
      'en': 'Recent completed tasks from your team.',
      'ar': '',
    },
    '8cslybyh': {
      'en': 'Rudy Fernandez',
      'ar': '',
    },
    'ev574rcl': {
      'en': '4m ago',
      'ar': '',
    },
    'j8wuget6': {
      'en': 'Completed ',
      'ar': '',
    },
    '3pbi7njr': {
      'en': 'Marketing Plan',
      'ar': '',
    },
    'j9dc5l1a': {
      'en': 'Rudy Fernandez',
      'ar': '',
    },
    'ywv8t15a': {
      'en': '4m ago',
      'ar': '',
    },
    'rj9ygn3n': {
      'en': 'Started ',
      'ar': '',
    },
    'relhmr19': {
      'en': 'Marketing Plan',
      'ar': '',
    },
    '0t7dcaj0': {
      'en': 'Abigail Rojas',
      'ar': '',
    },
    'r8m7rvgf': {
      'en': '4m ago',
      'ar': '',
    },
    'be3aog6l': {
      'en': 'Assigned  ',
      'ar': '',
    },
    'rpjmld9f': {
      'en': 'Rudy Fernandez ',
      'ar': '',
    },
    '2mup0dbr': {
      'en': 'to ',
      'ar': '',
    },
    'uaja5btr': {
      'en': 'Marketing Plan',
      'ar': '',
    },
    '9xoyr3gg': {
      'en': 'Abigail Rojas',
      'ar': '',
    },
    'yvbtudop': {
      'en': '4m ago',
      'ar': '',
    },
    '0rl4k3iy': {
      'en': 'Created a project: ',
      'ar': '',
    },
    'gfqq83cn': {
      'en': 'Marketing Plan',
      'ar': '',
    },
    'djsf1v54': {
      'en': 'Liz Ambridge',
      'ar': '',
    },
    'yi461uj9': {
      'en': '4m ago',
      'ar': '',
    },
    'xifzw6x5': {
      'en': 'Sent a plan update for ',
      'ar': '',
    },
    '9arub4ry': {
      'en': 'Marketing Plan',
      'ar': '',
    },
    '8gejg5yd': {
      'en': 'Project Started',
      'ar': '',
    },
    'xvc798fd': {
      'en': '12d ago',
      'ar': '',
    },
    'ydryhxhx': {
      'en': 'Al Rahma',
      'ar': 'الرحمة',
    },
    'dg0ia1l0': {
      'en': 'Warehouse management',
      'ar': '',
    },
    '6kdrdold': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Admin_Home
  {
    'ma81g7z0': {
      'en': 'check.io',
      'ar': '',
    },
    'ngem33q1': {
      'en': 'Andrew D.',
      'ar': '',
    },
    '4c03tlqc': {
      'en': 'admin@gmail.com',
      'ar': '',
    },
    '4uguly9m': {
      'en': 'Dashboard',
      'ar': '',
    },
    'cvanvzh1': {
      'en': 'Transactions',
      'ar': '',
    },
    '13mexr2b': {
      'en': 'Projects',
      'ar': '',
    },
    'bnf9w436': {
      'en': 'Users',
      'ar': '',
    },
    'ntxn4moq': {
      'en': 'Overview',
      'ar': '',
    },
    '3pl6svwl': {
      'en': 'Below is a company overview',
      'ar': '',
    },
    'ny8i5jy0': {
      'en': 'Andrew D.',
      'ar': '',
    },
    'bsng50ie': {
      'en': 'admin@gmail.com',
      'ar': '',
    },
    'h6lubag2': {
      'en': 'Income this Month',
      'ar': '',
    },
    'ipay0ohi': {
      'en': '\$567,402',
      'ar': '',
    },
    'fe1d5if3': {
      'en': 'Total Orders',
      'ar': '',
    },
    'opu7ws1y': {
      'en': '2,208',
      'ar': '',
    },
    '2ldlz6zm': {
      'en': 'Total Orders',
      'ar': '',
    },
    'qjgkkkou': {
      'en': '2,208',
      'ar': '',
    },
    'lid4ecci': {
      'en': 'Total Orders',
      'ar': '',
    },
    'buyrtvws': {
      'en': '2,208',
      'ar': '',
    },
    's0u03c8x': {
      'en': 'Account Overview',
      'ar': '',
    },
    '9yv3wiz6': {
      'en': 'Your Balance',
      'ar': '',
    },
    '6abu6tbk': {
      'en': '\$6,424.20',
      'ar': '',
    },
    '5bahxskw': {
      'en': 'Transfer Balance',
      'ar': '',
    },
    '6wraxmyb': {
      'en': 'Monthly Goal',
      'ar': '',
    },
    'wzqyw8jd': {
      'en': '62.2% /',
      'ar': '',
    },
    'hmdhszwt': {
      'en': ' \$12,000',
      'ar': '',
    },
    'q77onnil': {
      'en': 'Forecasted income is: ',
      'ar': '',
    },
    'vgebqpsf': {
      'en': '\$3,502',
      'ar': '',
    },
    'txkaz1tj': {
      'en': 'Edit',
      'ar': '',
    },
    'u8zxjh56': {
      'en': 'Top Friends',
      'ar': '',
    },
    '4jyha2wc': {
      'en': 'Rudy Fernandez',
      'ar': '',
    },
    'ij2pfczv': {
      'en': 'Manager',
      'ar': '',
    },
    'kte849of': {
      'en': 'Abigail Herrara',
      'ar': '',
    },
    '2ogdziqh': {
      'en': 'Designer',
      'ar': '',
    },
    '554gt8te': {
      'en': 'Liz Ambridge',
      'ar': '',
    },
    'zfne34ik': {
      'en': 'Manager',
      'ar': '',
    },
    'zixopa8m': {
      'en': 'Liz Rogers',
      'ar': '',
    },
    'bllq1xmc': {
      'en': 'Front End Dev',
      'ar': '',
    },
    'jgleqnl4': {
      'en': 'Outstanding Balance',
      'ar': '',
    },
    '35l32vcq': {
      'en': '\$529,204',
      'ar': '',
    },
    '6s6nv828': {
      'en': '55%',
      'ar': '',
    },
    'urrx5low': {
      'en': 'Budget Overview',
      'ar': '',
    },
    'qcx7fous': {
      'en': '\$242,102',
      'ar': '',
    },
    '673o8b82': {
      'en': '25%',
      'ar': '',
    },
    'fd85d20z': {
      'en': 'Outstanding Invoices',
      'ar': '',
    },
    'fwmg7o2c': {
      'en': 'Below are some of the outstanding invoices for your clients.',
      'ar': '',
    },
    '2ys5qi3b': {
      'en': 'Add New',
      'ar': '',
    },
    'wpzngsxs': {
      'en': 'Work Type',
      'ar': '',
    },
    'xyp8qh0l': {
      'en': 'Sent To:',
      'ar': '',
    },
    'ww19tm8q': {
      'en': 'Contract Amount',
      'ar': '',
    },
    'nuxab2wx': {
      'en': 'Status',
      'ar': '',
    },
    'ybuomvlf': {
      'en': 'Actions',
      'ar': '',
    },
    'kjf3y3lz': {
      'en': 'Design Work',
      'ar': '',
    },
    'cmgwd85w': {
      'en': 'Randy Peterson',
      'ar': '',
    },
    '0mig7c2l': {
      'en': 'Business Name',
      'ar': '',
    },
    'c0wc9j8g': {
      'en': '\$2,100',
      'ar': '',
    },
    '03n9itb8': {
      'en': 'Paid',
      'ar': '',
    },
    '7nlwxcgf': {
      'en': 'Design Work',
      'ar': '',
    },
    'ktspw507': {
      'en': 'Randy Peterson',
      'ar': '',
    },
    'cx5kvk8d': {
      'en': 'Business Name',
      'ar': '',
    },
    'veo67pev': {
      'en': '\$2,100',
      'ar': '',
    },
    'j5rq2fqa': {
      'en': 'Paid',
      'ar': '',
    },
    'g3xtxpoa': {
      'en': 'Design Work',
      'ar': '',
    },
    'qpjhmo4z': {
      'en': 'Randy Peterson',
      'ar': '',
    },
    'ni3t1mou': {
      'en': 'Business Name',
      'ar': '',
    },
    'kmypl6xh': {
      'en': '\$2,100',
      'ar': '',
    },
    'ntntfnil': {
      'en': 'Paid',
      'ar': '',
    },
    '9g7yhz41': {
      'en': 'Design Work',
      'ar': '',
    },
    '72u9f00i': {
      'en': 'Randy Peterson',
      'ar': '',
    },
    'rgdymm2u': {
      'en': 'Business Name',
      'ar': '',
    },
    '96fzg896': {
      'en': '\$2,100',
      'ar': '',
    },
    '1wxycpqh': {
      'en': 'Paid',
      'ar': '',
    },
    '3la1ygpd': {
      'en': 'Design Work',
      'ar': '',
    },
    'z0rndkfe': {
      'en': 'Randy Peterson',
      'ar': '',
    },
    '9hfvusjv': {
      'en': 'Business Name',
      'ar': '',
    },
    'w49t4p2a': {
      'en': '\$2,100',
      'ar': '',
    },
    'dshc0l4k': {
      'en': 'Pending',
      'ar': '',
    },
    'p9t4angv': {
      'en': 'Design Work',
      'ar': '',
    },
    'qsdih09t': {
      'en': 'Randy Peterson',
      'ar': '',
    },
    'tx50xlfx': {
      'en': 'Business Name',
      'ar': '',
    },
    'ihdlot10': {
      'en': '\$2,100',
      'ar': '',
    },
    'h490gzjc': {
      'en': 'Pending',
      'ar': '',
    },
    'gowpb5tt': {
      'en': 'Design Work',
      'ar': '',
    },
    'yzmjh5o9': {
      'en': 'Randy Peterson',
      'ar': '',
    },
    'b168p06m': {
      'en': 'Business Name',
      'ar': '',
    },
    'uh8dg8uq': {
      'en': '\$2,100',
      'ar': '',
    },
    'np3v5tqb': {
      'en': 'Pending',
      'ar': '',
    },
    'ggo2pgd1': {
      'en': 'Card Header',
      'ar': '',
    },
    'iy0g49up': {
      'en': 'Create tables and ui elements that work below.',
      'ar': '',
    },
    'efpqv56k': {
      'en': 'Add New',
      'ar': '',
    },
    'p8d84ios': {
      'en': 'Work Type',
      'ar': '',
    },
    'c0wzsjlo': {
      'en': 'Assigned User',
      'ar': '',
    },
    'cq3c7hyv': {
      'en': 'Contract Amount',
      'ar': '',
    },
    'k5cdtv6e': {
      'en': 'Status',
      'ar': '',
    },
    '5arvu593': {
      'en': 'Actions',
      'ar': '',
    },
    'kfam4rcv': {
      'en': 'Design Work',
      'ar': '',
    },
    '9kh6t27l': {
      'en': 'Randy Peterson',
      'ar': '',
    },
    'nt51024q': {
      'en': 'Business Name',
      'ar': '',
    },
    'tzj8dodo': {
      'en': '\$2,100',
      'ar': '',
    },
    'q1ru0ieb': {
      'en': 'Paid',
      'ar': '',
    },
    'sjuai7hp': {
      'en': 'Design Work',
      'ar': '',
    },
    'kwiqhi15': {
      'en': 'Randy Peterson',
      'ar': '',
    },
    'n3ixzdzq': {
      'en': 'Business Name',
      'ar': '',
    },
    'rhiajdjz': {
      'en': '\$2,100',
      'ar': '',
    },
    'yp64ro8b': {
      'en': 'Paid',
      'ar': '',
    },
    'dhmqme4i': {
      'en': 'Design Work',
      'ar': '',
    },
    'kx16x4zp': {
      'en': 'Randy Peterson',
      'ar': '',
    },
    'uq02x3pi': {
      'en': 'Business Name',
      'ar': '',
    },
    '5t8lt2q1': {
      'en': '\$2,100',
      'ar': '',
    },
    'ouh1vgre': {
      'en': 'Paid',
      'ar': '',
    },
    '7r3y5qqp': {
      'en': 'Design Work',
      'ar': '',
    },
    'xbmbx8ck': {
      'en': 'Randy Peterson',
      'ar': '',
    },
    'ucqf07oz': {
      'en': 'Business Name',
      'ar': '',
    },
    'k8eldufd': {
      'en': '\$2,100',
      'ar': '',
    },
    'ncz3flit': {
      'en': 'Paid',
      'ar': '',
    },
    'adzbocl3': {
      'en': 'Design Work',
      'ar': '',
    },
    '1hb6tzm7': {
      'en': 'Randy Peterson',
      'ar': '',
    },
    'zoumzrdr': {
      'en': 'Business Name',
      'ar': '',
    },
    'ietmnga0': {
      'en': '\$2,100',
      'ar': '',
    },
    'bz0ke8cv': {
      'en': 'Pending',
      'ar': '',
    },
    'y88c0qor': {
      'en': 'Design Work',
      'ar': '',
    },
    '8zjeqyqp': {
      'en': 'Randy Peterson',
      'ar': '',
    },
    'a840phnm': {
      'en': 'Business Name',
      'ar': '',
    },
    'z5ebful0': {
      'en': '\$2,100',
      'ar': '',
    },
    '2pgzoem4': {
      'en': 'Pending',
      'ar': '',
    },
    'pfb5jyg5': {
      'en': 'Design Work',
      'ar': '',
    },
    '0ty770vk': {
      'en': 'Randy Peterson',
      'ar': '',
    },
    'kiuck95s': {
      'en': 'Business Name',
      'ar': '',
    },
    '8h3t2zhs': {
      'en': '\$2,100',
      'ar': '',
    },
    'y7g6mxh5': {
      'en': 'Pending',
      'ar': '',
    },
    'oohrwt1i': {
      'en': 'Home',
      'ar': '',
    },
  },
  // profile_Detals_WIth_QR
  {
    'qku85ltt': {
      'en': 'Chat',
      'ar': '',
    },
    'rq4iy7sx': {
      'en': 'Call',
      'ar': '',
    },
    '0fsn5k35': {
      'en': 'Today\'s Work Info',
      'ar': '',
    },
    'j2an1vje': {
      'en': 'Address Work',
      'ar': '',
    },
    'n5q2xs7v': {
      'en': 'Shift',
      'ar': '',
    },
    's8wbz6jo': {
      'en': 'Expected Finsh time:  16:30',
      'ar': '',
    },
    'ksug87ea': {
      'en': ' have a problem? ',
      'ar': '',
    },
    'oolqrsym': {
      'en': 'Make Complan',
      'ar': '',
    },
    'wolbij8x': {
      'en': 'Profile',
      'ar': '',
    },
    'lmmalkqy': {
      'en': 'Home',
      'ar': '',
    },
  },
  // worker_Home
  {
    'rkn0ia7z': {
      'en': 'Al Rahma',
      'ar': '',
    },
    'znr7sbjm': {
      'en': 'Warehouse management',
      'ar': '',
    },
    '03yhokqf': {
      'en': 'Hello,',
      'ar': '',
    },
    'vps37kqx': {
      'en': 'Maverick',
      'ar': '',
    },
    'qv7ye95g': {
      'en': 'Hello,',
      'ar': '',
    },
    '2jvgm34o': {
      'en': 'Until now you can see your Profile',
      'ar': '',
    },
    'ognl9m6t': {
      'en': 'Wait for development',
      'ar': '',
    },
    '4k9xyw5h': {
      'en': 'Powerd by Omar-s Team',
      'ar': '',
    },
    'zjnpmtdg': {
      'en': '__',
      'ar': '',
    },
  },
  // transmission_Select_1
  {
    '4sncigdx': {
      'en': 'Select tools',
      'ar': '',
    },
    '9558gmur': {
      'en': 'Search tools...',
      'ar': '',
    },
    'mbktaru4': {
      'en': ' have a problem? ',
      'ar': '',
    },
    'stwvqa84': {
      'en': 'Make Complan',
      'ar': '',
    },
    '1sg1un3k': {
      'en': 'Next',
      'ar': '',
    },
    'y1ammpq6': {
      'en': 'Transmission',
      'ar': '',
    },
    '5zuyi53j': {
      'en': 'Home',
      'ar': '',
    },
  },
  // transmission_Scan_2
  {
    '7ahfc4uq': {
      'en': 'Cheack out',
      'ar': '',
    },
    '7cx3537s': {
      'en': 'Check out & Scan QR',
      'ar': '',
    },
    '4e5ye6w7': {
      'en': 'Scan  QR Code',
      'ar': '',
    },
    'yut59geh': {
      'en': 'Cancel',
      'ar': '',
    },
    'disfmria': {
      'en': 'Qr code is available on (Details page) \non supervisor phone. ',
      'ar': '',
    },
    '0xxi6efd': {
      'en': 'Need Help?',
      'ar': '',
    },
    'wv6k41hs': {
      'en': 'Home',
      'ar': '',
    },
  },
  // HowToUseApp
  {
    'yinsllsg': {
      'en': 'About app',
      'ar': '',
    },
    '8xed3obm': {
      'en': 'Overview',
      'ar': '',
    },
    'b2zjs171': {
      'en':
          'Here is an intro and description of what this toolkit entails. We hope you enjoy it as much as we do!',
      'ar': '',
    },
    '07aj0hpq': {
      'en': 'Introduction',
      'ar': '',
    },
    'h0hvz1yn': {
      'en': 'Intro',
      'ar': '',
    },
    'we4gr0pj': {
      'en': 'Disclaimer',
      'ar': '',
    },
    'oed4ky7p': {
      'en': 'Main Content',
      'ar': '',
    },
    'k6n25ii0': {
      'en': 'How To Use App',
      'ar': '',
    },
    'bnkpaxw4': {
      'en': 'Excercise',
      'ar': '',
    },
    'fyqpxoiw': {
      'en': 'Home',
      'ar': '',
    },
  },
  // checkup
  {
    'rb4faenc': {
      'en': 'Loading...',
      'ar': '',
    },
  },
  // supplierDashboard
  {
    'or3f5dic': {
      'en': 'check.io',
      'ar': '',
    },
    'qkgba7p7': {
      'en': 'Andrew D.',
      'ar': '',
    },
    '27jsy43c': {
      'en': 'admin@gmail.com',
      'ar': '',
    },
    '21d4m5im': {
      'en': 'Dashboard',
      'ar': '',
    },
    'k9yobhwd': {
      'en': 'Transactions',
      'ar': '',
    },
    't76sausu': {
      'en': 'Projects',
      'ar': '',
    },
    'vfo9e1ju': {
      'en': 'Users',
      'ar': '',
    },
    '3xzqhvs9': {
      'en': 'Overview',
      'ar': '',
    },
    'it4ad0gb': {
      'en': 'Below is a company overview',
      'ar': '',
    },
    'tpo0z7t4': {
      'en': 'Andrew D.',
      'ar': '',
    },
    'akcmti6e': {
      'en': 'admin@gmail.com',
      'ar': '',
    },
    'jfhfpcnn': {
      'en': 'Income this Month',
      'ar': '',
    },
    'baf17xnd': {
      'en': '\$567,402',
      'ar': '',
    },
    'm2k15drk': {
      'en': 'Total Workers',
      'ar': '',
    },
    '0smktuu6': {
      'en': '2,208',
      'ar': '',
    },
    'pkuvnik2': {
      'en': 'Total Orders',
      'ar': '',
    },
    'a20p4rlc': {
      'en': '2,208',
      'ar': '',
    },
    'zvt0crjh': {
      'en': 'Total Orders',
      'ar': '',
    },
    'uznhgpgj': {
      'en': '2,208',
      'ar': '',
    },
    'hnoscs3q': {
      'en': 'Account Overview',
      'ar': '',
    },
    '7n2facfw': {
      'en': 'Your Balance',
      'ar': '',
    },
    'z8dt4wf7': {
      'en': '\$6,424.20',
      'ar': '',
    },
    'o5ab09dj': {
      'en': 'View',
      'ar': '',
    },
    '83n5781v': {
      'en': 'Top Worker',
      'ar': '',
    },
    'chk70agq': {
      'en': 'Rudy Fernandez',
      'ar': '',
    },
    '3vxd7ex5': {
      'en': 'Manager',
      'ar': '',
    },
    '062qlr0f': {
      'en': 'Abigail Herrara',
      'ar': '',
    },
    '9v379fl4': {
      'en': 'Designer',
      'ar': '',
    },
    '5k32woun': {
      'en': 'Liz Ambridge',
      'ar': '',
    },
    '9bzk5ouq': {
      'en': 'Manager',
      'ar': '',
    },
    'eka02ytx': {
      'en': 'Outstanding Balance',
      'ar': '',
    },
    '4dr786ij': {
      'en': '\$529,204',
      'ar': '',
    },
    'rf23wje8': {
      'en': '55%',
      'ar': '',
    },
    'lp8k66y9': {
      'en': '55%',
      'ar': '',
    },
    '7nayhlr3': {
      'en': 'Outstanding Balance',
      'ar': '',
    },
    'u3607jr8': {
      'en': '55%',
      'ar': '',
    },
    'q29yylf8': {
      'en': 'Outstanding Balance',
      'ar': '',
    },
    'kzd0zi53': {
      'en': '55%',
      'ar': '',
    },
    'voyv9at4': {
      'en': 'Outstanding Balance',
      'ar': '',
    },
    'y24xl13m': {
      'en': 'Outstanding Invoices',
      'ar': '',
    },
    'rok9baet': {
      'en': 'Below are some of the outstanding invoices for your clients.',
      'ar': '',
    },
    'lilsgmp8': {
      'en': 'Add New',
      'ar': '',
    },
    'u22zmfec': {
      'en': 'Work Type',
      'ar': '',
    },
    '446936gf': {
      'en': 'Sent To:',
      'ar': '',
    },
    'pr3b9dzj': {
      'en': 'Contract Amount',
      'ar': '',
    },
    'itcy82vz': {
      'en': 'Status',
      'ar': '',
    },
    '79vv3rvx': {
      'en': 'Actions',
      'ar': '',
    },
    'hhbap5zb': {
      'en': 'Design Work',
      'ar': '',
    },
    '344x0041': {
      'en': 'Randy Peterson',
      'ar': '',
    },
    'usuz26aw': {
      'en': 'Business Name',
      'ar': '',
    },
    'hco9b10l': {
      'en': '\$2,100',
      'ar': '',
    },
    'egktkv9s': {
      'en': 'Paid',
      'ar': '',
    },
    'g2apt9zd': {
      'en': 'Design Work',
      'ar': '',
    },
    'qfoe7qbk': {
      'en': 'Randy Peterson',
      'ar': '',
    },
    'w5wjx3kg': {
      'en': 'Business Name',
      'ar': '',
    },
    'sxr7pl6r': {
      'en': '\$2,100',
      'ar': '',
    },
    '1eujrt2m': {
      'en': 'Paid',
      'ar': '',
    },
    'styshqom': {
      'en': 'Design Work',
      'ar': '',
    },
    'hilnoxsz': {
      'en': 'Randy Peterson',
      'ar': '',
    },
    '2vcjau4a': {
      'en': 'Business Name',
      'ar': '',
    },
    'vzc13mkv': {
      'en': '\$2,100',
      'ar': '',
    },
    'v48wukw4': {
      'en': 'Paid',
      'ar': '',
    },
    '0au3osgh': {
      'en': 'Design Work',
      'ar': '',
    },
    'ime1dmp0': {
      'en': 'Randy Peterson',
      'ar': '',
    },
    '4ab8dzy3': {
      'en': 'Business Name',
      'ar': '',
    },
    'w7ic8r3h': {
      'en': '\$2,100',
      'ar': '',
    },
    'idinvnf5': {
      'en': 'Paid',
      'ar': '',
    },
    '6elk7i5t': {
      'en': 'Design Work',
      'ar': '',
    },
    'vamfqx3v': {
      'en': 'Randy Peterson',
      'ar': '',
    },
    '4rqhci7z': {
      'en': 'Business Name',
      'ar': '',
    },
    'ebhy3h6b': {
      'en': '\$2,100',
      'ar': '',
    },
    '2p8axsoo': {
      'en': 'Pending',
      'ar': '',
    },
    '1rrza5kn': {
      'en': 'Design Work',
      'ar': '',
    },
    'nntiqjn7': {
      'en': 'Randy Peterson',
      'ar': '',
    },
    'j0vre1qm': {
      'en': 'Business Name',
      'ar': '',
    },
    'as2w1h9f': {
      'en': '\$2,100',
      'ar': '',
    },
    'ft0gnjm7': {
      'en': 'Pending',
      'ar': '',
    },
    '5uvxx5z3': {
      'en': 'Design Work',
      'ar': '',
    },
    'b78ypr0a': {
      'en': 'Randy Peterson',
      'ar': '',
    },
    'pwq7wtnv': {
      'en': 'Business Name',
      'ar': '',
    },
    'a7xu58yq': {
      'en': '\$2,100',
      'ar': '',
    },
    '099erb3u': {
      'en': 'Pending',
      'ar': '',
    },
    '36b90ft7': {
      'en': 'Home',
      'ar': '',
    },
  },
  // applyforjob
  {
    'c2adapdg': {
      'en': 'Join us & work with confidence',
      'ar': '',
    },
    'ltn6oh38': {
      'en': 'We are excited to welcome you to our team.\n',
      'ar': '',
    },
    'vg9e9uql': {
      'en': 'Name',
      'ar': '',
    },
    'h1njdjui': {
      'en': 'Email Address',
      'ar': '',
    },
    '27c5sdpp': {
      'en': 'Phone number',
      'ar': '',
    },
    'pu23bm9o': {
      'en': 'Worker',
      'ar': '',
    },
    '1tzon4xd': {
      'en': 'Supplier',
      'ar': '',
    },
    '8x4sysl0': {
      'en': 'Supervisor',
      'ar': '',
    },
    'oh6skhv0': {
      'en': 'Select  job',
      'ar': '',
    },
    'z2gsehf6': {
      'en': 'Search for an item...',
      'ar': '',
    },
    'xe4dsejp': {
      'en': 'I would like to receive inspriation emails.',
      'ar': '',
    },
    'i9x1onxn': {
      'en': 'Done',
      'ar': '',
    },
    '8z896xqs': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Onboarding04
  {
    'o6umyaw6': {
      'en': 'Spring Specials 2022',
      'ar': '',
    },
    'wv2eogcc': {
      'en':
          'Pay attention to our new athlesiure line, it is located in our main section and we have sales!',
      'ar': '',
    },
    'jj9nmoih': {
      'en': 'Puuuurfect Running Gear',
      'ar': '',
    },
    'n7804qxf': {
      'en':
          'Pay attention to our new athlesiure line, it is located in our main section and we have sales!',
      'ar': '',
    },
    'qou3byn2': {
      'en': 'The right pair of shoes',
      'ar': '',
    },
    'ae11rfsq': {
      'en':
          'The pursuit of speed continues with the Nike Quest 4 Premium. Take on the streets with higher foam heights and cushioned comfort that combine with a lightweight upper to offer secure support.',
      'ar': '',
    },
    'wdrz0nka': {
      'en': 'Your Journey Begins',
      'ar': '',
    },
    'v39qltgo': {
      'en': 'Sign up below in order to get started!',
      'ar': '',
    },
    'blwhglhn': {
      'en': 'Get Started',
      'ar': '',
    },
    'ph42plfy': {
      'en': 'Home',
      'ar': '',
    },
  },
  // hintBeforeapplyjob
  {
    'fmmci96o': {
      'en': 'Header One',
      'ar': '',
    },
    'ct6dtfab': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
      'ar': '',
    },
    'p4bp0i26': {
      'en': 'Header Two',
      'ar': '',
    },
    '54f3qnfs': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
      'ar': '',
    },
    'qh5bjrno': {
      'en': 'Header Three',
      'ar': '',
    },
    'uxzk0xfn': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
      'ar': '',
    },
    'vz37g0xf': {
      'en': 'Next',
      'ar': '',
    },
    'pbyo6dju': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Home13Productivity
  {
    'p08mkwx2': {
      'en': 'Hello,',
      'ar': '',
    },
    'o3iz44ij': {
      'en': 'Maverick',
      'ar': '',
    },
    's7bmv5ag': {
      'en': 'Favorites',
      'ar': '',
    },
    'ycdqsol8': {
      'en': '3 Projects | 45 Files',
      'ar': '',
    },
    '25r6uh1s': {
      'en': 'Favorites',
      'ar': '',
    },
    '52b4ypv3': {
      'en': '3 Projects | 45 Files',
      'ar': '',
    },
    'e74qxxid': {
      'en': 'Important',
      'ar': '',
    },
    '26vmxqjn': {
      'en': '3 Projects | 45 Files',
      'ar': '',
    },
    'tban3b14': {
      'en': 'To Do',
      'ar': '',
    },
    'zry30har': {
      'en': 'This is great item.',
      'ar': '',
    },
    '4jrypz3n': {
      'en': 'Due Now',
      'ar': '',
    },
    '31uscmqe': {
      'en': 'This is great item.',
      'ar': '',
    },
    '0wtkygtj': {
      'en': 'Due Now',
      'ar': '',
    },
    'x589rnqv': {
      'en': 'This is great item.',
      'ar': '',
    },
    'gmjl61rh': {
      'en': 'Due Now',
      'ar': '',
    },
    'g4qc88ez': {
      'en': 'Latest Projects',
      'ar': '',
    },
    '1vtzo2dg': {
      'en': 'Project Name',
      'ar': '',
    },
    '0gb1os2f': {
      'en': '4 Folders',
      'ar': '',
    },
    'kz9sagad': {
      'en': '3 upcoming due dates',
      'ar': '',
    },
    'eqrhhlss': {
      'en': 'Project Name',
      'ar': '',
    },
    'fj4c6wv6': {
      'en': '4 Folders',
      'ar': '',
    },
    'wp4mhw8u': {
      'en': '3 upcoming due dates',
      'ar': '',
    },
    'rwt3uqnf': {
      'en': 'Project Name',
      'ar': '',
    },
    'regfjrkc': {
      'en': '4 Folders',
      'ar': '',
    },
    'jtxeoeg2': {
      'en': '3 upcoming due dates',
      'ar': '',
    },
    'ahjfi2ks': {
      'en': 'Home',
      'ar': '',
    },
  },
  // tasksTracker
  {
    'kvbbsmcp': {
      'en': '12 Projects',
      'ar': '',
    },
    'evp4in0x': {
      'en': 'View All',
      'ar': '',
    },
    '8olvp832': {
      'en': 'Pending',
      'ar': '',
    },
    '0oxhwfw1': {
      'en': 'In Progress',
      'ar': '',
    },
    '9fvbm9hy': {
      'en': 'Design Template Screens',
      'ar': '',
    },
    '4xe382y1': {
      'en': 'Create template screen for task todo app.',
      'ar': '',
    },
    'mmnfxuta': {
      'en': 'Due',
      'ar': '',
    },
    'lx4nrtc2': {
      'en': 'Tuesday, 10:00am',
      'ar': '',
    },
    'q483fogx': {
      'en': 'Theme Collection',
      'ar': '',
    },
    'kp355nf7': {
      'en': 'Create themes for use by our users.',
      'ar': '',
    },
    'i7n5uma8': {
      'en': 'Due',
      'ar': '',
    },
    'on7uy32m': {
      'en': 'Tuesday, 10:00am',
      'ar': '',
    },
    'b68fnzl7': {
      'en': 'In Progress',
      'ar': '',
    },
    'ctycx5m2': {
      'en': 'Completed',
      'ar': '',
    },
    'rhewwzy4': {
      'en': 'Design Template Screens',
      'ar': '',
    },
    '6fda2r6b': {
      'en': 'Create template screen for task todo app.',
      'ar': '',
    },
    'ea246r3k': {
      'en': 'Tuesday, 10:00am',
      'ar': '',
    },
    'hbpbm9mb': {
      'en': 'Completed',
      'ar': '',
    },
    '924bi57i': {
      'en': 'Theme Collection',
      'ar': '',
    },
    'ivybmynv': {
      'en': 'Create themes for use by our users.',
      'ar': '',
    },
    'szwswidk': {
      'en': 'Tuesday, 10:00am',
      'ar': '',
    },
    'tbvkocmg': {
      'en': 'Completed',
      'ar': '',
    },
    'zuy2topf': {
      'en': 'late',
      'ar': '',
    },
    'gxr3fm5t': {
      'en': 'Design Template Screens',
      'ar': '',
    },
    'ybzktkp4': {
      'en': 'Create template screen for task todo app.',
      'ar': '',
    },
    '0tmvzxjl': {
      'en': 'Tuesday, 10:00am',
      'ar': '',
    },
    'pkqqxbcq': {
      'en': 'Completed',
      'ar': '',
    },
    'wg267ajb': {
      'en': 'Theme Collection',
      'ar': '',
    },
    'r5kw0i6m': {
      'en': 'Create themes for use by our users.',
      'ar': '',
    },
    '2c2d7buo': {
      'en': 'Tuesday, 10:00am',
      'ar': '',
    },
    'wd1mvwng': {
      'en': 'Completed',
      'ar': '',
    },
    'v5j8e0uc': {
      'en': 'No-Code Platform Design',
      'ar': '',
    },
    'dsy0bd7i': {
      'en': 'Home',
      'ar': '',
    },
  },
  // complain_formCopy
  {
    '3d52bx69': {
      'en': 'block',
      'ar': '',
    },
    'dks7jayp': {
      'en': 'Missing Tool',
      'ar': '',
    },
    'br6s6bo1': {
      'en': 'Block',
      'ar': '',
    },
    'r6radux2': {
      'en': 'Another',
      'ar': '',
    },
    '0tgihp0g': {
      'en': 'Complain Type',
      'ar': '',
    },
    '4j08k91v': {
      'en': 'Select Missing tools',
      'ar': '',
    },
    '0yyzs64x': {
      'en': 'Search for an item...',
      'ar': '',
    },
    '7v4k0ejk': {
      'en': 'Number',
      'ar': '',
    },
    'p0dyomyl': {
      'en': 'Search for an item...',
      'ar': '',
    },
    'goaf7b6x': {
      'en': 'Details',
      'ar': '',
    },
    'g3bd1fxr': {
      'en': 'Record Audio',
      'ar': '',
    },
    'rysgu4nk': {
      'en': 'Make Complain',
      'ar': '',
    },
    'lcjzc2zr': {
      'en': 'PLeasr Fill in the detials of the complain',
      'ar': '',
    },
    'etpdr6cb': {
      'en': 'Please fill in all the required Info',
      'ar': '',
    },
    'kigh7789': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'snw8e9kt': {
      'en': 'Complin Form',
      'ar': '',
    },
  },
  // Header03TaskSummary
  {
    'xmcgc7jp': {
      'en': 'Al Rahma',
      'ar': '',
    },
    'ro6b7btx': {
      'en': 'Warehouse management',
      'ar': '',
    },
    'ck38isne': {
      'en': 'Hello,',
      'ar': '',
    },
    'g65qy9e8': {
      'en': 'حاتم',
      'ar': '',
    },
    '6in2m23z': {
      'en': 'Goals',
      'ar': '',
    },
    'w53ruq50': {
      'en': 'Daily tracker',
      'ar': '',
    },
    'a4vpvhyt': {
      'en': '5',
      'ar': '',
    },
  },
  // our_SideNav
  {
    '5aowtbz2': {
      'en': 'Al Rahma',
      'ar': 'الرحمة',
    },
    '9xp6o3sh': {
      'en': 'Platform Navigation',
      'ar': 'التنقل في المنصة',
    },
    'spyqa9j1': {
      'en': 'Dashboard',
      'ar': 'لوحة المراقبة',
    },
    '2iynbb4t': {
      'en': 'Chats',
      'ar': 'شات',
    },
    '8wbcyqhp': {
      'en': 'Complaints & suggestions',
      'ar': 'الشكاوي والمقترحات',
    },
    'bweqr6uk': {
      'en': 'Settings',
      'ar': 'الإعدادات',
    },
    'qg5d6iez': {
      'en': 'Notifications',
      'ar': 'الإشعارات',
    },
    'ul4rfbti': {
      'en': '12',
      'ar': '',
    },
    'imygjta2': {
      'en': 'Explore',
      'ar': 'استكشف',
    },
    'f48hvv56': {
      'en': 'العربية',
      'ar': 'English',
    },
    'i663n5fu': {
      'en': 'Log Out',
      'ar': '',
    },
  },
  // Table01
  {
    'ho36o3ya': {
      'en': 'Card Header',
      'ar': '',
    },
    'ry6wngat': {
      'en': 'Create tables and ui elements that work below.',
      'ar': '',
    },
    'i2li15ei': {
      'en': 'ID',
      'ar': '',
    },
    'oqjbkei8': {
      'en': 'Type',
      'ar': '',
    },
    'tz533vwc': {
      'en': 'Quantity',
      'ar': '',
    },
    '64fc0iz7': {
      'en': 'Actions',
      'ar': '',
    },
    '94kaentn': {
      'en': '#2424',
      'ar': '',
    },
    '8gc1ilnl': {
      'en': 'Randy',
      'ar': '',
    },
    '9vj6qd1i': {
      'en': '2',
      'ar': '',
    },
    'f2h2k5ze': {
      'en': '#2424',
      'ar': '',
    },
    'cdbf38rf': {
      'en': 'Randy ',
      'ar': '',
    },
    'fj95e703': {
      'en': '5',
      'ar': '',
    },
    'o31xdyq4': {
      'en': '#2427',
      'ar': '',
    },
    'cav59ga8': {
      'en': 'Randy',
      'ar': '',
    },
    'w87f6odu': {
      'en': '6',
      'ar': '',
    },
  },
  // table
  {
    '0jlo5pn9': {
      'en': 'Card Header',
      'ar': '',
    },
    'sz4dnk6w': {
      'en': 'Create tables and ui elements that work below.',
      'ar': '',
    },
    'qe8gbzfw': {
      'en': 'Download',
      'ar': '',
    },
    'yzxlf4z8': {
      'en': 'Asset Name',
      'ar': '',
    },
    '3rku2o3u': {
      'en': 'Type',
      'ar': '',
    },
    'ibw28e5k': {
      'en': 'Category',
      'ar': '',
    },
    'xcxqryvm': {
      'en': 'Created At',
      'ar': '',
    },
    'cggn7c7t': {
      'en': 'Status',
      'ar': '',
    },
    '9nq2lprg': {
      'en': 'Dimensions',
      'ar': '',
    },
    'wm958fmx': {
      'en': 'Name',
      'ar': '',
    },
    '4lubtbt0': {
      'en': 'Category',
      'ar': '',
    },
    'ufuuogru': {
      'en': 'Type',
      'ar': '',
    },
    '5uawk32o': {
      'en': 'Category',
      'ar': '',
    },
    'kr0472r7': {
      'en': 'Jan. 30th, 2023',
      'ar': '',
    },
    'en6djszi': {
      'en': 'Enabled',
      'ar': '',
    },
    'ak83flwb': {
      'en': 'Dimensions',
      'ar': '',
    },
    'xkwfrmn9': {
      'en': 'Name',
      'ar': '',
    },
    '7rwpsr8n': {
      'en': 'Category',
      'ar': '',
    },
    'hob3i6r8': {
      'en': 'Type',
      'ar': '',
    },
    '8307beow': {
      'en': 'Category',
      'ar': '',
    },
    'yykebyn2': {
      'en': 'Jan. 30th, 2023',
      'ar': '',
    },
    'nnba7up8': {
      'en': 'Enabled',
      'ar': '',
    },
    'wpv0ywk7': {
      'en': 'Dimensions',
      'ar': '',
    },
  },
  // today
  {
    's851yo5g': {
      'en': 'Today\'s Requests',
      'ar': '',
    },
  },
  // DAILY_ORDAR
  {
    'bjbteacw': {
      'en': 'Today\'s Requests',
      'ar': '',
    },
    'acyyu8fc': {
      'en': 'Inspector Name',
      'ar': '',
    },
    'mucskqek': {
      'en': 'ID : #1502',
      'ar': '',
    },
    'siuoivke': {
      'en': 'Inspector Name',
      'ar': '',
    },
    '5nh1vlna': {
      'en': 'ID : #1502',
      'ar': '',
    },
    'nj910cgd': {
      'en': 'Inspector Name',
      'ar': '',
    },
    'hcy0plwb': {
      'en': 'ID : #1502',
      'ar': '',
    },
    'uusjr0gm': {
      'en': 'Inspector Name',
      'ar': '',
    },
    '8681cckx': {
      'en': 'ID : #1502',
      'ar': '',
    },
    'addvomws': {
      'en': 'Inspector Name',
      'ar': '',
    },
    'tw1lkwfm': {
      'en': 'ID : #1502',
      'ar': '',
    },
    'nuwzur0y': {
      'en': 'Inspector Name',
      'ar': '',
    },
    'a4jhhx0w': {
      'en': 'ID : #1502',
      'ar': '',
    },
    'fyuu21cb': {
      'en': 'Inspector Name',
      'ar': '',
    },
    'z92lmj51': {
      'en': 'ID : #1502',
      'ar': '',
    },
    '60jq0rfy': {
      'en': 'Inspector Name',
      'ar': '',
    },
    '1445oi9b': {
      'en': 'ID : #1502',
      'ar': '',
    },
    'wvg7pi20': {
      'en': 'Inspector Name',
      'ar': '',
    },
    '2hvvsul7': {
      'en': 'ID : #1502',
      'ar': '',
    },
    '25wyqp8h': {
      'en': 'Inspector Name',
      'ar': '',
    },
    'zbdzqm3a': {
      'en': 'ID : #1502',
      'ar': '',
    },
    'az6ucfdl': {
      'en': 'Inspector Name',
      'ar': '',
    },
    'r8wdqsqr': {
      'en': 'ID : #1502',
      'ar': '',
    },
  },
  // search
  {
    '7u7gu1zx': {
      'en': 'Search platform...',
      'ar': '',
    },
    'xrpvu90o': {
      'en': 'Search',
      'ar': '',
    },
    '1ncrlv5f': {
      'en': 'Templates',
      'ar': '',
    },
    '40129415': {
      'en': 'Name',
      'ar': '',
    },
    '3w6h8rcp': {
      'en': 'Category',
      'ar': '',
    },
    '1gtt9f7p': {
      'en': 'Status',
      'ar': '',
    },
    'kdpww44s': {
      'en': '[Template Name]',
      'ar': '',
    },
    'cm6qec3e': {
      'en': 'cateogry',
      'ar': '',
    },
    'umuytxgr': {
      'en': 'Enabled',
      'ar': '',
    },
    '87jylq4t': {
      'en': '[Template Name]',
      'ar': '',
    },
    'dxz1cry6': {
      'en': 'cateogry',
      'ar': '',
    },
    'mmapphmp': {
      'en': 'Enabled',
      'ar': '',
    },
    'b8w67py1': {
      'en': '[Template Name]',
      'ar': '',
    },
    'w5xancd5': {
      'en': 'cateogry',
      'ar': '',
    },
    'kpwxlgfb': {
      'en': 'Disabled',
      'ar': '',
    },
    'ijex3wib': {
      'en': 'Components',
      'ar': '',
    },
    'p23vx9y6': {
      'en': 'Name',
      'ar': '',
    },
    '62bcz12b': {
      'en': 'Category',
      'ar': '',
    },
    '3mwennbn': {
      'en': 'Status',
      'ar': '',
    },
    '7rgd20r4': {
      'en': '[Template Name]',
      'ar': '',
    },
    'fbw915bt': {
      'en': 'cateogry',
      'ar': '',
    },
    'jvtz8nys': {
      'en': 'Enabled',
      'ar': '',
    },
    'ch90pu83': {
      'en': '[Template Name]',
      'ar': '',
    },
    '8sayqt3x': {
      'en': 'cateogry',
      'ar': '',
    },
    'h6gose1m': {
      'en': 'Enabled',
      'ar': '',
    },
    '5u4kxaqd': {
      'en': '[Template Name]',
      'ar': '',
    },
    's652auxo': {
      'en': 'cateogry',
      'ar': '',
    },
    'm7bneash': {
      'en': 'Disabled',
      'ar': '',
    },
    '3x0r2a68': {
      'en': 'Tutorials',
      'ar': '',
    },
    '5gkjqu8u': {
      'en': 'Tutorials are here...',
      'ar': '',
    },
    'snug5fbw': {
      'en': 'FlutterFlow x AI',
      'ar': '',
    },
    '1t7wf5ht': {
      'en':
          'Customize your app design with FlutterFlow\'s vast library of components and responsive layout tools.',
      'ar': '',
    },
    'nzyw40hp': {
      'en': '4 Minutes',
      'ar': '',
    },
    '3dd823lu': {
      'en': 'Active',
      'ar': '',
    },
    '4x9ueh2v': {
      'en': 'FlutterFlow Basics',
      'ar': '',
    },
    'cydzc143': {
      'en':
          'In this tutorial, we\'ll dive into the essentials of using FlutterFlow to build amazing apps.',
      'ar': '',
    },
    'u9bjz0pb': {
      'en': '4 Minutes',
      'ar': '',
    },
    'hvsqfxza': {
      'en': 'Active',
      'ar': '',
    },
    'uk2u0fn2': {
      'en': 'FlutterFlow 101',
      'ar': '',
    },
    'h9vlkphh': {
      'en':
          'Save time and effort with FlutterFlow\'s built-in integration for popular third-party services.',
      'ar': '',
    },
    'frdfmzck': {
      'en': '4 Minutes',
      'ar': '',
    },
    'jxsnidj0': {
      'en': 'Active',
      'ar': '',
    },
    '93jwpe9i': {
      'en': 'FlutterFlow Command Palette',
      'ar': '',
    },
    '1g1sjykp': {
      'en':
          'Learn how to create interactive components and navigate smoothly between screens in FlutterFlow.',
      'ar': '',
    },
    'nsnzdiza': {
      'en': '4 Minutes',
      'ar': '',
    },
    'p3tiqrsu': {
      'en': 'Active',
      'ar': '',
    },
  },
  // End_Request
  {
    'z31pp6ag': {
      'en': 'Request Details',
      'ar': '',
    },
    '75t364bd': {
      'en': 'Review the request details before confirmation',
      'ar': '',
    },
    'o7045bj6': {
      'en': 'Item Name',
      'ar': '',
    },
    '8o6szy5l': {
      'en': 'Secondary text',
      'ar': '',
    },
    'gskfvjgi': {
      'en': '\$1.50',
      'ar': '',
    },
    '2pth0s13': {
      'en': 'Report Missing Tools',
      'ar': '',
    },
    'fflehmsd': {
      'en': 'End Request',
      'ar': '',
    },
    'dmi8fgb2': {
      'en': 'Cancel',
      'ar': '',
    },
  },
  // TodaysRequests_Dashboard
  {
    'fplbb8lh': {
      'en': 'Today\'s Requests',
      'ar': '',
    },
    '6ngoonw0': {
      'en': 'Active Requests',
      'ar': '',
    },
    'b9coa6u8': {
      'en': 'Total Requests',
      'ar': '',
    },
  },
  // counter
  {
    'aw92cqqg': {
      'en': '56.4k',
      'ar': '',
    },
    'n3t8f6vf': {
      'en': 'Customers',
      'ar': '',
    },
  },
  // Dashboard04CircleGraphCopy
  {
    '2pkhkzru': {
      'en': 'Tody\'s Requests',
      'ar': '',
    },
    'ed44p1ni': {
      'en': '56.4k',
      'ar': '',
    },
    'prhfuhx0': {
      'en': 'Active Requests',
      'ar': '',
    },
    's5szkqdw': {
      'en': '56.4k',
      'ar': '',
    },
    's2t3mj6f': {
      'en': 'Total Requests',
      'ar': '',
    },
  },
  // Modal16CreateCompany
  {
    'z4dxy792': {
      'en': 'Create Company Profile',
      'ar': '',
    },
    'nfid9m8t': {
      'en':
          'Upload images about your company and fill out the information below.',
      'ar': '',
    },
    'vnmmzldd': {
      'en': 'Company Name',
      'ar': '',
    },
    'rkleutjk': {
      'en': 'Company City',
      'ar': '',
    },
    'bt9kfooa': {
      'en': 'Website',
      'ar': '',
    },
    'nmlsi8he': {
      'en': 'Enter in your website without "https://"...',
      'ar': '',
    },
    'da6g837y': {
      'en': 'Cancel',
      'ar': '',
    },
    'g0jp2egl': {
      'en': 'Create Company',
      'ar': '',
    },
  },
  // Miscellaneous
  {
    'd99ylq1p': {
      'en': '',
      'ar': '',
    },
    'l9c527ji': {
      'en': '',
      'ar': '',
    },
    '4qsor06n': {
      'en': '',
      'ar': '',
    },
    'bwj1dvzt': {
      'en':
          'In order to record an audio, this app requires permission to acces the microphone',
      'ar': '',
    },
    'y1q152kf': {
      'en':
          'In order to recieve notifications, this app requires permission to acces notificatons',
      'ar': '',
    },
    'e2mgewtz': {
      'en': '',
      'ar': '',
    },
    'ewxbsweb': {
      'en': '',
      'ar': '',
    },
    '80kinubl': {
      'en': '',
      'ar': '',
    },
    'cggkqsvp': {
      'en': '',
      'ar': '',
    },
    'bt4ps80g': {
      'en': '',
      'ar': '',
    },
    'wk72xdag': {
      'en': '',
      'ar': '',
    },
    'clao0s52': {
      'en': '',
      'ar': '',
    },
    'g7mswfzp': {
      'en': '',
      'ar': '',
    },
    'p0vwkhnj': {
      'en': '',
      'ar': '',
    },
    '6zdumlmb': {
      'en': '',
      'ar': '',
    },
    'ycefqdn4': {
      'en': '',
      'ar': '',
    },
    '2wflgu7h': {
      'en': '',
      'ar': '',
    },
    'e9uhdjdm': {
      'en': '',
      'ar': '',
    },
    'p3svlyni': {
      'en': '',
      'ar': '',
    },
    'vwq3zjrm': {
      'en': '',
      'ar': '',
    },
    '1x8hrk4g': {
      'en': '',
      'ar': '',
    },
    'ioi9mqgx': {
      'en': '',
      'ar': '',
    },
    'gi7dyoji': {
      'en': '',
      'ar': '',
    },
    'e4rkwivh': {
      'en': '',
      'ar': '',
    },
    'xz45t6ce': {
      'en': '',
      'ar': '',
    },
    'mp55wbvr': {
      'en': '',
      'ar': '',
    },
    'wfcceem7': {
      'en': '',
      'ar': '',
    },
    'n6ieuo6c': {
      'en': '',
      'ar': '',
    },
    '8vlo14u3': {
      'en': '',
      'ar': '',
    },
    'oi2gppub': {
      'en': '',
      'ar': '',
    },
  },
].reduce((a, b) => a..addAll(b));
