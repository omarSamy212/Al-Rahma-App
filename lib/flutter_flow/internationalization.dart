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
      'ar': 'الرحمة',
    },
    'ujkri8ai': {
      'en': 'Warehouse management',
      'ar': 'إدارة المستودعات',
    },
    '6tisjf5c': {
      'en': 'Hello,',
      'ar': 'مرحبًا،',
    },
    'g83vp3ub': {
      'en': 'Reception',
      'ar': 'استلام عهدة',
    },
    'p86pjahx': {
      'en': 'Transmission',
      'ar': 'تسليم عهدة',
    },
    'k8dg7d3t': {
      'en': 'Powerd by Omar-s Team',
      'ar': 'بدعم من فريق عمر',
    },
    '86d8g48f': {
      'en': '__',
      'ar': '__',
    },
  },
  // Home01CompanyList
  {
    '0znieo35': {
      'en': 'All',
      'ar': 'الجميع',
    },
    'pbobhzoz': {
      'en': 'Inspector Name',
      'ar': 'اسم المراقب',
    },
    'hnixbxx0': {
      'en': 'Title',
      'ar': 'العنوان',
    },
    'npje2rwn': {
      'en': 'Inspector Name',
      'ar': 'اسم المراقب',
    },
    'crhq3l7r': {
      'en': 'Title',
      'ar': 'العنوان',
    },
    'bj3i2sqp': {
      'en': 'Inspector Name',
      'ar': 'اسم المراقب',
    },
    'fgni17ui': {
      'en': 'Title',
      'ar': 'العنوان',
    },
    '53fbhd07': {
      'en': 'Active',
      'ar': 'مفعل',
    },
    '38snh2lo': {
      'en': 'Inspector Name',
      'ar': 'اسم المراقب',
    },
    'cqbk6kgk': {
      'en': 'Title',
      'ar': 'العنوان',
    },
    'zohijwq0': {
      'en': 'Inactive',
      'ar': 'غير مفعل',
    },
    't3tpy482': {
      'en': 'Inspector Name',
      'ar': 'اسم المراقب',
    },
    '3ots6vy1': {
      'en': 'Title',
      'ar': 'العنوان',
    },
    'efduwfky': {
      'en': 'Inspectors',
      'ar': 'المراقبون',
    },
    'o5jtrxrq': {
      'en': '•',
      'ar': '•',
    },
  },
  // createUser
  {
    '0op3iuzf': {
      'en': 'First Name',
      'ar': 'الاسم الأول',
    },
    '2lx8j06h': {
      'en': 'Middle Name',
      'ar': 'الاسم الأوسط',
    },
    '39mb6bxa': {
      'en': 'Last Name',
      'ar': 'اسم العائلة',
    },
    'szk5dgx0': {
      'en': 'Nick Name',
      'ar': 'اسم الشهرة',
    },
    '2ebdxwev': {
      'en': 'Muslim',
      'ar': '220 : نقطة ثابتة',
    },
    '54ux0ntz': {
      'en': 'Muslim',
      'ar': 'مسلم',
    },
    'mtghlh6o': {
      'en': 'Christiran',
      'ar': 'مسيحي',
    },
    'at3ibgux': {
      'en': 'Religion',
      'ar': 'الديانة',
    },
    'uibfcidd': {
      'en': 'Male',
      'ar': '',
    },
    'wy58cwef': {
      'en': 'Male',
      'ar': 'ذكر',
    },
    'jeloo3gw': {
      'en': 'Female',
      'ar': 'أنثى',
    },
    '3erkkh88': {
      'en': 'Select Gender',
      'ar': 'حدد نوع الجنس',
    },
    'p6w3932p': {
      'en': 'Single',
      'ar': '',
    },
    'fbe13pyg': {
      'en': 'Married',
      'ar': 'متزوج',
    },
    'iifo51np': {
      'en': 'Single',
      'ar': 'أعزب',
    },
    '6bobo39d': {
      'en': 'Marital Status',
      'ar': 'الحالة الاجتماعية',
    },
    'bg2461k8': {
      'en': 'Egypt',
      'ar': '',
    },
    '5ie8xn1y': {
      'en': 'Egypt',
      'ar': 'مصر',
    },
    'qe35equk': {
      'en': 'Other',
      'ar': 'آخر',
    },
    'vlnx38us': {
      'en': 'Nationality',
      'ar': 'جنسية',
    },
    'ggodxj06': {
      'en': 'Field is required',
      'ar': '',
    },
    'dunjd1uo': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'vkrrbebk': {
      'en': 'Field is required',
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
    '5elr8x4g': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '4iue3yt2': {
      'en': 'Field is required',
      'ar': '',
    },
    '3bacjmia': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'u66kvll4': {
      'en': 'National ID',
      'ar': 'الهوية الوطنية',
    },
    'pnfcbe2e': {
      'en': 'Confirm Nat',
      'ar': 'تأكيد الرقم',
    },
    'cl4gcs8b': {
      'en': 'Birthdate',
      'ar': 'تاريخ الميلاد',
    },
    '99c4x4wi': {
      'en': 'Age',
      'ar': 'العُمر',
    },
    'c1df6dxa': {
      'en': 'Place of Issue',
      'ar': 'مكان الإصدار',
    },
    '5y8e8wab': {
      'en': 'Date of national id',
      'ar': 'تاريخ الأصدار',
    },
    '4tt4j78a': {
      'en': '',
      'ar': '',
    },
    'zjyc3m5i': {
      'en': 'Expiry date',
      'ar': 'تاريخ الانتهاء',
    },
    'jsxz6av1': {
      'en': '',
      'ar': '',
    },
    '3dsgsa6c': {
      'en': 'Field is required',
      'ar': '',
    },
    'upwyfvm2': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'xrl64zux': {
      'en': 'Field is required',
      'ar': '',
    },
    't3jei06a': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'xc4thabi': {
      'en': 'Field is required',
      'ar': '',
    },
    'tsskkm4o': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'o6zikw1h': {
      'en': 'Field is required',
      'ar': '',
    },
    'yj7frnbg': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'ep3xap2v': {
      'en': 'Field is required',
      'ar': '',
    },
    'twh137ci': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'cgj9gsqz': {
      'en': 'Field is required',
      'ar': '',
    },
    'rpkbzmmo': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'qsfdk174': {
      'en': 'Enter Nationality',
      'ar': 'أدخل الجنسية',
    },
    'kp17mgk1': {
      'en': 'Passport No.',
      'ar': 'رقم جواز السفر.',
    },
    '0ayj0ta2': {
      'en': 'Birthdate',
      'ar': 'تاريخ الإصدار',
    },
    'iogsuam7': {
      'en': '',
      'ar': '',
    },
    'hhl26fmt': {
      'en': 'Calc Age',
      'ar': 'احسب العمر',
    },
    '88okfcpf': {
      'en': 'Age',
      'ar': 'العُمر',
    },
    'diyt0xd7': {
      'en': 'Place of Issue',
      'ar': 'مكان الإصدار',
    },
    'm76bv32k': {
      'en': 'Date of civil ID',
      'ar': 'تاريخ الإصدار',
    },
    'exbhorqm': {
      'en': '',
      'ar': '',
    },
    '34z9gvv0': {
      'en': 'Expiry date',
      'ar': 'تاريخ الانتهاء',
    },
    'oyqf5gi2': {
      'en': '',
      'ar': '',
    },
    '1mn2cxty': {
      'en': 'Field is required',
      'ar': '',
    },
    'jmsjpsix': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '8vbjnb37': {
      'en': 'Field is required',
      'ar': '',
    },
    'u3srb58b': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'tr06y4hy': {
      'en': 'Field is required',
      'ar': '',
    },
    'ppl01db3': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '3zkdeqja': {
      'en': 'Field is required',
      'ar': '',
    },
    '54ugpsb0': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'moe1hv4e': {
      'en': 'Field is required',
      'ar': '',
    },
    'kedrfj69': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'agftcbph': {
      'en': 'Field is required',
      'ar': '',
    },
    'nbik4hor': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '82gx3o43': {
      'en': 'Field is required',
      'ar': '',
    },
    '2us7jgen': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'oghvu3y2': {
      'en': 'Government',
      'ar': 'محافظة',
    },
    '85wgumcw': {
      'en': 'city',
      'ar': 'مدينة',
    },
    '1tw6d9qp': {
      'en': 'Full Address',
      'ar': 'العنوان الكامل',
    },
    'nsaue4po': {
      'en': 'Phone Number',
      'ar': 'رقم التليفون',
    },
    'kdw10inl': {
      'en': 'Field is required',
      'ar': '',
    },
    'oukl7amw': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '9t4q9h1g': {
      'en': 'Field is required',
      'ar': '',
    },
    'yy129kby': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'a3gl1iij': {
      'en': 'Field is required',
      'ar': '',
    },
    '7sh7ckay': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '412nn2e1': {
      'en': 'Field is required',
      'ar': '',
    },
    '7016hcp1': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'wbewlluf': {
      'en': 'Education Data',
      'ar': 'بيانات التعليم',
    },
    '7253wm4k': {
      'en': 'No',
      'ar': 'لا',
    },
    'fo1s7rh2': {
      'en': 'Yes',
      'ar': 'نعم',
    },
    '18282v62': {
      'en': 'No',
      'ar': 'لا',
    },
    'd0xh78gg': {
      'en': 'Employed now?',
      'ar': 'موظف الآن؟',
    },
    '4qxp6c30': {
      'en': 'Field is required',
      'ar': '',
    },
    'bzkc56ee': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'gjf75qlj': {
      'en': 'Worker',
      'ar': '',
    },
    '6o5jnil3': {
      'en': 'Worker',
      'ar': 'عامل',
    },
    'xmjl1sfd': {
      'en': 'Supervisor',
      'ar': 'مشرف',
    },
    'dux1y2uu': {
      'en': 'Operation Manager',
      'ar': 'مدير العمليات',
    },
    'gdqxx29b': {
      'en': 'Deputy Operations Manager',
      'ar': 'نائب مدير العمليات',
    },
    'thbeoxgx': {
      'en': 'Operations Director',
      'ar': 'مدير العمليات',
    },
    'h64368fz': {
      'en': 'Deputy Operations Director',
      'ar': 'نائب مدير العمليات',
    },
    '6cjme3jq': {
      'en': 'Office Manager',
      'ar': 'مدير مكتب',
    },
    'wn6zoeds': {
      'en': 'Sector management officer',
      'ar': 'مسؤول إدارة القطاع',
    },
    'xcg2bfve': {
      'en': 'Operations management officer',
      'ar': 'موظف إدارة العمليات',
    },
    '3er8qkij': {
      'en': 'Vehicle movement manager',
      'ar': 'مدير حركة المركبات',
    },
    '9nfwwv7m': {
      'en': 'Storage Keeper (New Equipment)',
      'ar': 'أمين المتجر (معدات جديدة)',
    },
    'n3dxyore': {
      'en': 'Storage Keeper (Used Equipment)',
      'ar': 'أمين المتجر (المعدات المستعملة)',
    },
    'ci0yhvny': {
      'en': 'Sector official',
      'ar': 'مسئول القطاع',
    },
    'doajkyn3': {
      'en': 'Select Role',
      'ar': 'حدد الوظيفة',
    },
    'dk6n4wxb': {
      'en': 'Al Rahma',
      'ar': '',
    },
    'b1gya0sv': {
      'en': 'Select Contractor',
      'ar': 'أختر المورد',
    },
    'fffwf2hz': {
      'en': 'Contractor ID',
      'ar': 'كود المورد',
    },
    'srwt4w0l': {
      'en': 'Num Of Workers',
      'ar': 'عدد العمال',
    },
    '5emwe7zt': {
      'en': 'Morning',
      'ar': 'صباح',
    },
    'amyd44qt': {
      'en': 'Morning',
      'ar': 'صباح',
    },
    'jzsebavj': {
      'en': 'Evening',
      'ar': 'مساء',
    },
    'worv047g': {
      'en': 'Night',
      'ar': 'ليلة',
    },
    'z9ptj5z9': {
      'en': 'Select starting shift ',
      'ar': 'حدد بداية الوردية',
    },
    'p0dyomyl': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    '5le1ml99': {
      'en': '8 h',
      'ar': '8 ساعات',
    },
    'ucvggcuz': {
      'en': '8 h',
      'ar': '8 ساعات',
    },
    'guhkh4l1': {
      'en': '16 h',
      'ar': '16 ساعة',
    },
    'tr77kv9z': {
      'en': 'Time',
      'ar': 'وقت',
    },
    '0iu0hqff': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'web7eexb': {
      'en': 'Please Select Contractor',
      'ar': '',
    },
    'wu9k70s0': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'whid1iwc': {
      'en': 'Please Select Contractor',
      'ar': '',
    },
    '7cozg12h': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'x15k7nlh': {
      'en': 'Morning',
      'ar': '',
    },
    'vibkb11l': {
      'en': 'Morning',
      'ar': 'صباح',
    },
    '3a1t5wee': {
      'en': 'Evening',
      'ar': 'مساء',
    },
    'q7n5lwn3': {
      'en': 'Night',
      'ar': 'ليلة',
    },
    'fntl9krj': {
      'en': 'Select starting shift ',
      'ar': 'حدد بداية الوردية',
    },
    '6gz89b42': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'cq1cb353': {
      'en': '8 h',
      'ar': '',
    },
    'q2r4uge7': {
      'en': '8 h',
      'ar': '8 ساعات',
    },
    '9hlrwzk6': {
      'en': '12 h',
      'ar': '12 ساعة',
    },
    'nueh6d3a': {
      'en': '16 h',
      'ar': '16 ساعة',
    },
    'zeu3elfq': {
      'en': 'Time',
      'ar': 'وقت',
    },
    'uxmr3cq2': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'u026zsnb': {
      'en': '',
      'ar': '220 : نقطة ثابتة',
    },
    '58ojaab5': {
      'en': 'Yes',
      'ar': 'نعم',
    },
    '6112ll1d': {
      'en': 'No',
      'ar': 'لا',
    },
    'nrncha19': {
      'en': 'Do you have a driving license?',
      'ar': 'هل لديك رخصة قيادة؟',
    },
    'b6caxazp': {
      'en': '',
      'ar': '',
    },
    'gxmuto5x': {
      'en': 'Car',
      'ar': 'سيارة',
    },
    'ngl60qnc': {
      'en': 'Motorcycle',
      'ar': 'دراجة نارية',
    },
    '6xwtd4gp': {
      'en': 'Type of driving license?',
      'ar': 'نوع رخصة القيادة؟',
    },
    'uhrfep0r': {
      'en': 'Date of civil ID',
      'ar': '',
    },
    'sp6wv7qj': {
      'en': '',
      'ar': '',
    },
    'qju4v4iw': {
      'en': 'Date of civil ID',
      'ar': '',
    },
    'jdahn9ju': {
      'en': '',
      'ar': '',
    },
    'v3i7nzya': {
      'en': 'Place of Issue',
      'ar': 'مكان الإصدار',
    },
    '6x817z9l': {
      'en': '',
      'ar': '',
    },
    '5w6ym44s': {
      'en': 'Leader 1',
      'ar': 'القائد 1',
    },
    'eo1l6wu2': {
      'en': 'Leader 2',
      'ar': 'القائد 2',
    },
    'jnt45e2u': {
      'en': 'Select Work Area',
      'ar': 'حدد منطقة العمل',
    },
    'o4j24kc5': {
      'en': '',
      'ar': '',
    },
    'uetymcr3': {
      'en': '150: Superviser',
      'ar': '150 : المشرف',
    },
    'wvxq2hk6': {
      'en': '220: fixed point',
      'ar': '220: نقطة ثابتة',
    },
    'w8fw6g5f': {
      'en': '250: Garage worker (maintenance)',
      'ar': '250: عامل جراج (صيانة)',
    },
    'hkhv4hi2': {
      'en': '260: Authority workers',
      'ar': '260: عمال الهيئة',
    },
    '0gasou1f': {
      'en': '270: Workers’ driver',
      'ar': '270 : سائق العمال',
    },
    'a6fmozgx': {
      'en': '280: Authority car driver',
      'ar': '280 : سائق سيارة السلطة',
    },
    'adpbzhca': {
      'en': '150-',
      'ar': '150-',
    },
    'lr5gpn8h': {
      'en': 'Select code',
      'ar': 'حدد كود الوظيفة',
    },
    '9vjhddi3': {
      'en': 'employment date',
      'ar': 'تاريخ التوظيف',
    },
    'uhqbwxnp': {
      'en': '',
      'ar': '',
    },
    '8wj7totf': {
      'en': 'Number of Workers',
      'ar': 'عدد العمال',
    },
    '8qlq7929': {
      'en': 'Diflict %',
      'ar': 'العجز  ٪',
    },
    'p8tugqrx': {
      'en': 'Shift Price',
      'ar': 'سعر الوردية',
    },
    'db1nx0g4': {
      'en': 'Contract date',
      'ar': 'تاريخ العقد',
    },
    'dl8hsghd': {
      'en': '',
      'ar': '',
    },
    'tnens0ef': {
      'en': 'Field is required',
      'ar': '',
    },
    'azm7t8e0': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'mz8l2oaj': {
      'en': 'Field is required',
      'ar': '',
    },
    '0zsv5i5p': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'bcfrlk3f': {
      'en': 'Field is required',
      'ar': '',
    },
    '5sjmqwng': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'd9j235xq': {
      'en': 'Field is required',
      'ar': '',
    },
    'q436lgef': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'qk923r8j': {
      'en': 'Personal Photo',
      'ar': 'صورة شخصية',
    },
    'nsbp09d8': {
      'en': 'Add Photo',
      'ar': 'إضافة صورة',
    },
    'end9cxtz': {
      'en': 'Upload an image here...',
      'ar': 'ارفع صورة هنا...',
    },
    'ariuy6ku': {
      'en': 'Upload ID',
      'ar': '',
    },
    'ul5x5si2': {
      'en': 'Upload Photo',
      'ar': '1. ارفق صورة البطاقة الشخصية',
    },
    'd5fyxf95': {
      'en': 'National ID',
      'ar': 'البطاقة الشخصية',
    },
    'm668wexn': {
      'en': 'Please upload front ID.',
      'ar': 'يرجى تحميل الجهة  الأمامية.',
    },
    'dknzyvpb': {
      'en': 'Add Photo',
      'ar': 'إضافة صورة',
    },
    'v6qutznl': {
      'en': 'Upload an image here...',
      'ar': 'ارفع صورة هنا...',
    },
    '75tpe56i': {
      'en': 'National ID',
      'ar': 'البطاقة الشخصية',
    },
    'nlgq80r6': {
      'en': 'Please upload back ID.',
      'ar': 'يرجى تحميل الجهة الخلفية.',
    },
    'stvwbuqx': {
      'en': 'Add Photo',
      'ar': '',
    },
    'eofqawf9': {
      'en': 'Upload an image here...',
      'ar': '',
    },
    'ig3n93ko': {
      'en': 'Upload driving license',
      'ar': '',
    },
    'hzhb7hi3': {
      'en': 'Driving license',
      'ar': 'رخصة القيادة',
    },
    'rqkzmia7': {
      'en': 'Please upload front driving license.',
      'ar': 'يرجى تحميل الجهة  الأمامية.',
    },
    'rvu9vpqs': {
      'en': 'Add Photo',
      'ar': '',
    },
    'u7fqinzu': {
      'en': 'Upload an image here...',
      'ar': '',
    },
    'xusw3d0f': {
      'en': 'Driving license',
      'ar': 'رخصة القيادة',
    },
    'nlddt3w2': {
      'en': 'Please upload back ID.',
      'ar': 'يرجى تحميل الجهة  الخلفية.',
    },
    'txb2quhn': {
      'en': 'Add Photo',
      'ar': '',
    },
    'q1886fcl': {
      'en': 'Upload an image here...',
      'ar': '',
    },
    '7rakgrdr': {
      'en': '* Please verify the data, it cannot be changed later',
      'ar': '* برجاء التأكد من البيانات فلا يمكن تغييرها لاحقاً',
    },
    'drel3fy8': {
      'en': 'Upload drug test',
      'ar': 'تحميل نتيجة اختبار المخدرات',
    },
    'crnh5tvi': {
      'en': 'Please upload your drug test.',
      'ar': '',
    },
    'ufr9k2py': {
      'en': 'Add Photo',
      'ar': '',
    },
    'rs0xdy3j': {
      'en': 'Upload an image here...',
      'ar': '',
    },
    'aue2890w': {
      'en': 'Next',
      'ar': 'التالي',
    },
    '0nw9lsur': {
      'en': 'Create  Profile',
      'ar': 'إنشاء الملف الشخصي',
    },
  },
  // Missingtools_form
  {
    'gosp4rgv': {
      'en': 'Select Missing tools',
      'ar': 'حدد الأدوات المفقودة',
    },
    'qoptiqm7': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    '51swf6xg': {
      'en': 'Details',
      'ar': 'التفاصيل',
    },
    'z45ssy6j': {
      'en': 'Record Audio',
      'ar': 'تسجيل صوتي',
    },
    'mkdymwm1': {
      'en': 'Upload Screenshot',
      'ar': 'تحميل لقطة الشاشة',
    },
    '6s92kvhj': {
      'en': 'Maximum 3 img/jpg',
      'ar': 'الحد الأقصى 3img/jpg',
    },
    'wgufu7aa': {
      'en': 'Make Complain',
      'ar': 'تقديم شكوى',
    },
    'e4yol17p': {
      'en': 'PLeasr Fill in the detials of the complain',
      'ar': 'يرجى ملء تفاصيل الشكوى',
    },
    '47fnl9bd': {
      'en': 'Please fill in all the required Info',
      'ar': 'يرجى ملء جميع المعلومات المطلوبة',
    },
    '042y89ir': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '0vaddc65': {
      'en': 'Missing tools Form',
      'ar': 'قائمه الأدوات المفقودة',
    },
  },
  // day_Contract_List
  {
    'lsecgnf2': {
      'en': 'Al Rahma',
      'ar': 'الرحمة',
    },
    'bqg9b5py': {
      'en': '__',
      'ar': '__',
    },
  },
  // request_Details
  {
    'nbfdzngi': {
      'en': 'Chat',
      'ar': 'محادثة',
    },
    'zlt4m1n4': {
      'en': 'Call',
      'ar': 'اتصال',
    },
    'o5flpqtg': {
      'en': 'Today\'s Work Info',
      'ar': 'معلومات العمل اليوم',
    },
    '5ka766by': {
      'en': 'Address Work',
      'ar': 'عنوان العمل',
    },
    'd7bt3xdh': {
      'en': 'work Shift',
      'ar': 'ورديه عمل',
    },
    '9832dlkg': {
      'en': 'Expected Finsh time:  16:30',
      'ar': 'الوقت المتوقع لانهاء العمل',
    },
    'y6stwbac': {
      'en': 'Tools Checklist',
      'ar': 'قائمة مراجعة الأدوات',
    },
    'ivs6j9kb': {
      'en': 'Zion 1',
      'ar': '....',
    },
    'cnvgaa12': {
      'en': 'Quanity: 1',
      'ar': 'الكمية: 1',
    },
    'kzz3danx': {
      'en': 'Jumpsuit',
      'ar': 'بذلة',
    },
    'wtbmhfgv': {
      'en': 'Quanity: 1',
      'ar': 'الكمية: 1',
    },
    '3knkzm34': {
      'en': ' have a problem? ',
      'ar': 'لديك مشكلة؟',
    },
    'qv6cbowy': {
      'en': 'Make Complan',
      'ar': 'تقديم شكوه',
    },
    'vy3ggafz': {
      'en': 'End Request',
      'ar': 'إنهاء الطلب',
    },
    'dedxsmje': {
      'en': 'Request details',
      'ar': 'تفاصيل الطلب',
    },
    'yu7pucfd': {
      'en': 'Home',
      'ar': 'الصفحه الرئيسيه',
    },
  },
  // createUser_2
  {
    'yf8l2oet': {
      'en': 'ID',
      'ar': 'كود المستخدم',
    },
    'kv4tuiot': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
    },
    'oya55ado': {
      'en': 'Password',
      'ar': 'كلمة المرور',
    },
    'l29zl71c': {
      'en': 'Create User',
      'ar': 'إنشاء مستخدم',
    },
    '1801r09g': {
      'en': 'Create Profile',
      'ar': 'إنشاء الملف الشخصي',
    },
  },
  // supervisor_home
  {
    'xgfc5e9i': {
      'en': 'Hello,',
      'ar': 'مرحبًا،',
    },
    '630xn3m1': {
      'en': 'Team Overview',
      'ar': 'نظرة عامة على الفريق',
    },
    'xe61h196': {
      'en': 'Review the details below of your Team.',
      'ar': 'قم بمراجعة التفاصيل أدناه لمشاريعك الأخيرة.',
    },
    'lez1fc8z': {
      'en': 'Assign',
      'ar': 'تعيين',
    },
    'graxwi8p': {
      'en': 'Tasks Completed',
      'ar': 'مهام مكتمله ',
    },
    'okkyz5ed': {
      'en': '5',
      'ar': '5',
    },
    '42o0idu0': {
      'en': '32.2%',
      'ar': '32.2%',
    },
    'htfllq5p': {
      'en': 'Upcoming Tasks',
      'ar': 'المهام القادمة',
    },
    '7ijp8xlm': {
      'en': '17',
      'ar': '17',
    },
    'zdhhzivr': {
      'en': '45.5%',
      'ar': '45.5%',
    },
    'umli55v9': {
      'en': 'Work Area',
      'ar': 'منطقة العمل',
    },
    'zh8me3su': {
      'en': 'General information about the area.',
      'ar': 'معلومات عامة عن المنطقة.',
    },
    'q0e28txe': {
      'en': 'Tasks',
      'ar': 'مهام',
    },
    '7j6932h9': {
      'en': 'Start Point',
      'ar': 'نقطة البداية',
    },
    '7jm18jz7': {
      'en': 'End Point',
      'ar': 'نقطة النهاية',
    },
    'obexelts': {
      'en': 'Daily Goal',
      'ar': 'الهدف اليومي',
    },
    'o1c5id0f': {
      'en': '62.2% /',
      'ar': '62.2% /',
    },
    '1d6bmoyl': {
      'en': ' 12',
      'ar': '12',
    },
    'djoytxsn': {
      'en': '',
      'ar': '',
    },
    '9hh3fpfk': {
      'en': 'Achieved goals: ',
      'ar': 'الأهداف المحققة:',
    },
    'rrr954w0': {
      'en': '3',
      'ar': '3',
    },
    '0p5vgnl1': {
      'en': 'All',
      'ar': 'الجميع',
    },
    'xkzhtc42': {
      'en': 'Current Task',
      'ar': 'المهمة الحالية',
    },
    'ds5mx3rh': {
      'en': 'View',
      'ar': '',
    },
    '6yi526a1': {
      'en': '{Upcoming Milestones}',
      'ar': 'المعالم القادمة',
    },
    'wgl7rxoo': {
      'en': '{Below are some of the upcoming tasks for.}',
      'ar': 'فيما يلي بعض المهام القادمة لـ.',
    },
    '54e0hq4m': {
      'en': 'Due',
      'ar': 'حق',
    },
    '8sbyba6w': {
      'en': 'Tuesday, 10:00am',
      'ar': 'الثلاثاء، الساعة 10:00 صباحاً',
    },
    'zjmyz459': {
      'en': 'In Progress',
      'ar': 'قيد التشغيل',
    },
    '8owg0i1j': {
      'en': 'Today\'s Workers List',
      'ar': 'قائمة أدوات اليوم',
    },
    'njhiko4d': {
      'en': 'Logout',
      'ar': '',
    },
    '1862lwih': {
      'en': 'Logout For Worker',
      'ar': '',
    },
    'a3vwl85o': {
      'en': 'Add New',
      'ar': 'اضف جديد',
    },
    'h9gtcp9k': {
      'en': 'Assigned Users',
      'ar': 'المستخدم المعين',
    },
    '11n5lq64': {
      'en': 'Due Date',
      'ar': 'تاريخ الاستحقاق',
    },
    'l4a9wgy5': {
      'en': 'Actions',
      'ar': 'أجراءات',
    },
    'va26dvad': {
      'en': 'Randy Peterson',
      'ar': 'راندي بيترسون',
    },
    'gcmqt5o3': {
      'en': '#2008',
      'ar': 'الاسم التجاري',
    },
    '3f74boic': {
      'en': 'Fri. Aug 11th',
      'ar': 'الجمعة. 11 أغسطس',
    },
    '47048m9r': {
      'en': 'worker',
      'ar': '',
    },
    '3x6tvpvc': {
      'en': 'Search for an item...',
      'ar': '',
    },
    '414yl3i7': {
      'en': 'Randy Peterson',
      'ar': '',
    },
    'vcyful00': {
      'en': '#2008',
      'ar': '',
    },
    'iwbh6b3f': {
      'en': 'Fri. Aug 11th',
      'ar': '',
    },
    'tg5h08pj': {
      'en': 'worker',
      'ar': '',
    },
    'hrkxko6u': {
      'en': 'Search for an item...',
      'ar': '',
    },
    's0n40ssb': {
      'en': 'Randy Peterson',
      'ar': '',
    },
    '662mv32r': {
      'en': '#2008',
      'ar': '',
    },
    '3con0z70': {
      'en': 'Fri. Aug 11th',
      'ar': '',
    },
    'xlvn8mpc': {
      'en': 'worker',
      'ar': '',
    },
    'lsllu42u': {
      'en': 'Search for an item...',
      'ar': '',
    },
    '3gmvs7mg': {
      'en': 'Randy Peterson',
      'ar': '',
    },
    'wd63uniz': {
      'en': '#2008',
      'ar': '',
    },
    '6jc1684x': {
      'en': 'Fri. Aug 11th',
      'ar': '',
    },
    '35o6mpj8': {
      'en': 'worker',
      'ar': '',
    },
    '76psl0al': {
      'en': 'Search for an item...',
      'ar': '',
    },
    'wbmzcdgw': {
      'en': 'End Shift For Superviser',
      'ar': '',
    },
    '64rv3zkn': {
      'en': 'Activity',
      'ar': 'نشاط',
    },
    '6206idkd': {
      'en': 'Recent completed tasks from your team.',
      'ar': 'المهام المكتملة الأخيرة من فريقك.',
    },
    '8cslybyh': {
      'en': 'Rudy Fernandez',
      'ar': 'رودي فرنانديز',
    },
    'ev574rcl': {
      'en': '4m ago',
      'ar': 'منذ 4 م',
    },
    'j8wuget6': {
      'en': 'Completed ',
      'ar': 'مكتمل',
    },
    '3pbi7njr': {
      'en': 'Marketing Plan',
      'ar': 'خطة التسويق',
    },
    'j9dc5l1a': {
      'en': 'Rudy Fernandez',
      'ar': 'رودي فرنانديز',
    },
    'ywv8t15a': {
      'en': '4m ago',
      'ar': 'منذ 4 م',
    },
    'rj9ygn3n': {
      'en': 'Started ',
      'ar': 'بدأت',
    },
    'relhmr19': {
      'en': 'Marketing Plan',
      'ar': 'خطة التسويق',
    },
    '0t7dcaj0': {
      'en': 'Abigail Rojas',
      'ar': 'أبيجيل روخاس',
    },
    'r8m7rvgf': {
      'en': '4m ago',
      'ar': 'منذ 4 م',
    },
    'be3aog6l': {
      'en': 'Assigned  ',
      'ar': 'مُكَلَّف',
    },
    'rpjmld9f': {
      'en': 'Rudy Fernandez ',
      'ar': 'رودي فرنانديز',
    },
    '2mup0dbr': {
      'en': 'to ',
      'ar': 'ل',
    },
    'uaja5btr': {
      'en': 'Marketing Plan',
      'ar': 'خطة التسويق',
    },
    '9xoyr3gg': {
      'en': 'Abigail Rojas',
      'ar': 'أبيجيل روخاس',
    },
    'yvbtudop': {
      'en': '4m ago',
      'ar': 'منذ 4 م',
    },
    '0rl4k3iy': {
      'en': 'Created a project: ',
      'ar': 'تم إنشاء مشروع:',
    },
    'gfqq83cn': {
      'en': 'Marketing Plan',
      'ar': 'خطة التسويق',
    },
    'djsf1v54': {
      'en': 'Liz Ambridge',
      'ar': 'ليز أمبريدج',
    },
    'yi461uj9': {
      'en': '4m ago',
      'ar': 'منذ 4 م',
    },
    'xifzw6x5': {
      'en': 'Sent a plan update for ',
      'ar': 'تم إرسال تحديث الخطة لـ',
    },
    '9arub4ry': {
      'en': 'Marketing Plan',
      'ar': 'خطة التسويق',
    },
    '8gejg5yd': {
      'en': 'Project Started',
      'ar': 'بدأ المشروع',
    },
    'xvc798fd': {
      'en': '12d ago',
      'ar': 'منذ 12 يومًا',
    },
    'ydryhxhx': {
      'en': 'Al Rahma',
      'ar': 'الرحمة',
    },
    'dg0ia1l0': {
      'en': 'Fieldwork management',
      'ar': 'إدارة العمل الميداني',
    },
    '6kdrdold': {
      'en': 'Home',
      'ar': 'الصفحه الرئيسيه',
    },
  },
  // Admin_Home
  {
    'ma81g7z0': {
      'en': 'check.io',
      'ar': 'فحص الio',
    },
    'ngem33q1': {
      'en': 'Andrew D.',
      'ar': 'أندرو د.',
    },
    '4c03tlqc': {
      'en': 'admin@gmail.com',
      'ar': 'admin@gmail.com',
    },
    '4uguly9m': {
      'en': 'Dashboard',
      'ar': '....',
    },
    'cvanvzh1': {
      'en': 'Transactions',
      'ar': 'المعاملات',
    },
    'bnf9w436': {
      'en': 'Add Employee',
      'ar': 'المستخدمين',
    },
    '13mexr2b': {
      'en': 'Managing employees',
      'ar': 'المشاريع',
    },
    'dyywl81k': {
      'en': 'Job applications',
      'ar': '',
    },
    '493aaam0': {
      'en': 'Add Area',
      'ar': '',
    },
    'kzios87q': {
      'en': '1',
      'ar': '',
    },
    'cbqou6qw': {
      'en': '1',
      'ar': '',
    },
    '6iepys7c': {
      'en': '1',
      'ar': '',
    },
    'h6lubag2': {
      'en': 'Income this Month',
      'ar': 'الدخل هذا الشهر',
    },
    'ipay0ohi': {
      'en': '\$567,402',
      'ar': '567,402 دولار',
    },
    'fe1d5if3': {
      'en': 'Total Orders',
      'ar': 'إجمالي الطلبات',
    },
    'opu7ws1y': {
      'en': '2,208',
      'ar': '2,208',
    },
    '2ldlz6zm': {
      'en': 'Total Orders',
      'ar': 'إجمالي الطلبات',
    },
    'qjgkkkou': {
      'en': '2,208',
      'ar': '2,208',
    },
    'lid4ecci': {
      'en': 'Total Orders',
      'ar': 'إجمالي الطلبات',
    },
    'buyrtvws': {
      'en': '2,208',
      'ar': '2,208',
    },
    's0u03c8x': {
      'en': 'Account Overview',
      'ar': 'نظرة عامة على الحساب',
    },
    '6wraxmyb': {
      'en': 'Monthly Goal',
      'ar': 'الهدف الشهري',
    },
    'wzqyw8jd': {
      'en': '62.2% /',
      'ar': '62.2% /',
    },
    'hmdhszwt': {
      'en': '16,650 👷🏼',
      'ar': '12000 دولار',
    },
    'q77onnil': {
      'en': 'Forecasted income is: ',
      'ar': 'الدخل المتوقع هو:',
    },
    'vgebqpsf': {
      'en': '3,502 👷🏼',
      'ar': '3,502 دولار',
    },
    'txkaz1tj': {
      'en': 'Edit',
      'ar': 'يحرر',
    },
    'u8zxjh56': {
      'en': 'Top Employees',
      'ar': 'أفضل الموظفين',
    },
    '4jyha2wc': {
      'en': 'Rudy Fernandez',
      'ar': 'رودي فرنانديز',
    },
    'ij2pfczv': {
      'en': 'Manager',
      'ar': 'مدير',
    },
    'kte849of': {
      'en': 'Abigail Herrara',
      'ar': 'أبيجيل هيرارا',
    },
    '2ogdziqh': {
      'en': 'Designer',
      'ar': 'مصمم',
    },
    '554gt8te': {
      'en': 'Liz Ambridge',
      'ar': 'ليز أمبريدج',
    },
    'zfne34ik': {
      'en': 'Manager',
      'ar': 'مدير',
    },
    'zixopa8m': {
      'en': 'Liz Rogers',
      'ar': 'ليز روجرز',
    },
    'bllq1xmc': {
      'en': 'Front End Dev',
      'ar': 'تطوير الواجهة الأمامية',
    },
    '673o8b82': {
      'en': '25%',
      'ar': '25%',
    },
    '65jh4ywz': {
      'en': 'Manager',
      'ar': '',
    },
    '9puk607r': {
      'en': '55%',
      'ar': '',
    },
    'h6j9s8w2': {
      'en': 'Manager',
      'ar': '',
    },
    '6s6nv828': {
      'en': '55%',
      'ar': '55%',
    },
    'm6pmwf2x': {
      'en': 'Manager',
      'ar': '',
    },
    'u8ow0qct': {
      'en': 'Work Area',
      'ar': '',
    },
    'pspi9k94': {
      'en': 'View',
      'ar': '',
    },
    '7v2t2s51': {
      'en': 'General information about the area.',
      'ar': '',
    },
    'bx7bqyhu': {
      'en': 'Tasks',
      'ar': '',
    },
    '1ijdpn9m': {
      'en': 'Start Point',
      'ar': '',
    },
    'k16siumh': {
      'en': 'End Point',
      'ar': '',
    },
    'fd85d20z': {
      'en': 'Outstanding Invoices',
      'ar': 'الفواتير المستحقة',
    },
    'fwmg7o2c': {
      'en': 'Below are some of the outstanding invoices for your clients.',
      'ar': 'فيما يلي بعض الفواتير المستحقة لعملائك.',
    },
    '2ys5qi3b': {
      'en': 'Add New',
      'ar': 'اضف جديد',
    },
    'wpzngsxs': {
      'en': 'Work Type',
      'ar': 'نوع العمل',
    },
    'xyp8qh0l': {
      'en': 'Sent To:',
      'ar': 'تم الإرسال إلى:',
    },
    'ww19tm8q': {
      'en': 'Contract Amount',
      'ar': 'قيمة العقد',
    },
    'nuxab2wx': {
      'en': 'Status',
      'ar': 'حالة',
    },
    'ybuomvlf': {
      'en': 'Actions',
      'ar': 'أجراءات',
    },
    'kjf3y3lz': {
      'en': 'Design Work',
      'ar': 'عمل التصميم',
    },
    'cmgwd85w': {
      'en': 'Randy Peterson',
      'ar': 'راندي بيترسون',
    },
    '0mig7c2l': {
      'en': 'Business Name',
      'ar': 'الاسم التجاري',
    },
    'c0wc9j8g': {
      'en': '\$2,100',
      'ar': '2100 دولار',
    },
    '03n9itb8': {
      'en': 'Paid',
      'ar': 'مدفوع',
    },
    '7nlwxcgf': {
      'en': 'Design Work',
      'ar': 'عمل التصميم',
    },
    'ktspw507': {
      'en': 'Randy Peterson',
      'ar': 'راندي بيترسون',
    },
    'cx5kvk8d': {
      'en': 'Business Name',
      'ar': 'الاسم التجاري',
    },
    'veo67pev': {
      'en': '\$2,100',
      'ar': '2100 دولار',
    },
    'j5rq2fqa': {
      'en': 'Paid',
      'ar': 'مدفوع',
    },
    'g3xtxpoa': {
      'en': 'Design Work',
      'ar': 'عمل التصميم',
    },
    'qpjhmo4z': {
      'en': 'Randy Peterson',
      'ar': 'راندي بيترسون',
    },
    'ni3t1mou': {
      'en': 'Business Name',
      'ar': 'الاسم التجاري',
    },
    'kmypl6xh': {
      'en': '\$2,100',
      'ar': '2100 دولار',
    },
    'ntntfnil': {
      'en': 'Paid',
      'ar': 'مدفوع',
    },
    '9g7yhz41': {
      'en': 'Design Work',
      'ar': 'عمل التصميم',
    },
    '72u9f00i': {
      'en': 'Randy Peterson',
      'ar': 'راندي بيترسون',
    },
    'rgdymm2u': {
      'en': 'Business Name',
      'ar': 'الاسم التجاري',
    },
    '96fzg896': {
      'en': '\$2,100',
      'ar': '2100 دولار',
    },
    '1wxycpqh': {
      'en': 'Paid',
      'ar': 'مدفوع',
    },
    '3la1ygpd': {
      'en': 'Design Work',
      'ar': 'عمل التصميم',
    },
    'z0rndkfe': {
      'en': 'Randy Peterson',
      'ar': 'راندي بيترسون',
    },
    '9hfvusjv': {
      'en': 'Business Name',
      'ar': 'الاسم التجاري',
    },
    'w49t4p2a': {
      'en': '\$2,100',
      'ar': '2100 دولار',
    },
    'dshc0l4k': {
      'en': 'Pending',
      'ar': 'قيد الانتظار',
    },
    'p9t4angv': {
      'en': 'Design Work',
      'ar': 'عمل التصميم',
    },
    'qsdih09t': {
      'en': 'Randy Peterson',
      'ar': 'راندي بيترسون',
    },
    'tx50xlfx': {
      'en': 'Business Name',
      'ar': 'الاسم التجاري',
    },
    'ihdlot10': {
      'en': '\$2,100',
      'ar': '2100 دولار',
    },
    'h490gzjc': {
      'en': 'Pending',
      'ar': 'قيد الانتظار',
    },
    'gowpb5tt': {
      'en': 'Design Work',
      'ar': 'عمل التصميم',
    },
    'yzmjh5o9': {
      'en': 'Randy Peterson',
      'ar': 'راندي بيترسون',
    },
    'b168p06m': {
      'en': 'Business Name',
      'ar': 'الاسم التجاري',
    },
    'uh8dg8uq': {
      'en': '\$2,100',
      'ar': '2100 دولار',
    },
    'np3v5tqb': {
      'en': 'Pending',
      'ar': 'قيد الانتظار',
    },
    'ggo2pgd1': {
      'en': 'New Employees',
      'ar': 'المستخدمين',
    },
    'iy0g49up': {
      'en': 'The new employees hired today',
      'ar': 'الموظفين الجدد الذين تم تعيينهم اليوم',
    },
    'wsa27jvn': {
      'en': 'View All',
      'ar': '',
    },
    'p8d84ios': {
      'en': 'Work Type',
      'ar': 'نوع العمل',
    },
    'c0wzsjlo': {
      'en': 'User',
      'ar': 'مستخدم',
    },
    'cq3c7hyv': {
      'en': 'Contract Amount',
      'ar': 'قيمة العقد',
    },
    'k5cdtv6e': {
      'en': 'Role',
      'ar': 'دور',
    },
    '5arvu593': {
      'en': 'Actions',
      'ar': 'أجراءات',
    },
    'kfam4rcv': {
      'en': 'Design Work',
      'ar': 'عمل التصميم',
    },
    'tzj8dodo': {
      'en': '\$2,100',
      'ar': '2100 دولار',
    },
    'sjuai7hp': {
      'en': 'Design Work',
      'ar': 'عمل التصميم',
    },
    'kwiqhi15': {
      'en': 'Randy Peterson',
      'ar': 'راندي بيترسون',
    },
    'n3ixzdzq': {
      'en': 'Business Name',
      'ar': 'الاسم التجاري',
    },
    'rhiajdjz': {
      'en': '\$2,100',
      'ar': '2100 دولار',
    },
    'yp64ro8b': {
      'en': 'Paid',
      'ar': 'مدفوع',
    },
    'dhmqme4i': {
      'en': 'Design Work',
      'ar': 'عمل التصميم',
    },
    'kx16x4zp': {
      'en': 'Randy Peterson',
      'ar': 'راندي بيترسون',
    },
    'uq02x3pi': {
      'en': 'Business Name',
      'ar': 'الاسم التجاري',
    },
    '5t8lt2q1': {
      'en': '\$2,100',
      'ar': '2100 دولار',
    },
    'ouh1vgre': {
      'en': 'Paid',
      'ar': 'مدفوع',
    },
    '7r3y5qqp': {
      'en': 'Design Work',
      'ar': 'عمل التصميم',
    },
    'xbmbx8ck': {
      'en': 'Randy Peterson',
      'ar': 'راندي بيترسون',
    },
    'ucqf07oz': {
      'en': 'Business Name',
      'ar': 'الاسم التجاري',
    },
    'k8eldufd': {
      'en': '\$2,100',
      'ar': '2100 دولار',
    },
    'ncz3flit': {
      'en': 'Paid',
      'ar': 'مدفوع',
    },
    'adzbocl3': {
      'en': 'Design Work',
      'ar': 'عمل التصميم',
    },
    '1hb6tzm7': {
      'en': 'Randy Peterson',
      'ar': 'راندي بيترسون',
    },
    'zoumzrdr': {
      'en': 'Business Name',
      'ar': 'الاسم التجاري',
    },
    'ietmnga0': {
      'en': '\$2,100',
      'ar': '2100 دولار',
    },
    'bz0ke8cv': {
      'en': 'Pending',
      'ar': 'قيد الانتظار',
    },
    'y88c0qor': {
      'en': 'Design Work',
      'ar': 'عمل التصميم',
    },
    '8zjeqyqp': {
      'en': 'Randy Peterson',
      'ar': 'راندي بيترسون',
    },
    'a840phnm': {
      'en': 'Business Name',
      'ar': 'الاسم التجاري',
    },
    'z5ebful0': {
      'en': '\$2,100',
      'ar': '2100 دولار',
    },
    '2pgzoem4': {
      'en': 'Pending',
      'ar': 'قيد الانتظار',
    },
    'pfb5jyg5': {
      'en': 'Design Work',
      'ar': 'عمل التصميم',
    },
    '0ty770vk': {
      'en': 'Randy Peterson',
      'ar': 'راندي بيترسون',
    },
    'kiuck95s': {
      'en': 'Business Name',
      'ar': 'الاسم التجاري',
    },
    '8h3t2zhs': {
      'en': '\$2,100',
      'ar': '2100 دولار',
    },
    'y7g6mxh5': {
      'en': 'Pending',
      'ar': 'قيد الانتظار',
    },
    '5ufuneg8': {
      'en': 'New Employees',
      'ar': '',
    },
    'c11q8ks0': {
      'en': 'The new employees hired today',
      'ar': '',
    },
    '2ejd32f1': {
      'en': 'View',
      'ar': '',
    },
    'ody9jugs': {
      'en': 'Work Type',
      'ar': '',
    },
    'e93b01cg': {
      'en': 'User',
      'ar': '',
    },
    '2368k4e8': {
      'en': 'Contract Amount',
      'ar': '',
    },
    'xhrgrxaw': {
      'en': 'Role',
      'ar': '',
    },
    'l4l7fkd1': {
      'en': 'Actions',
      'ar': '',
    },
    'oohrwt1i': {
      'en': 'Home',
      'ar': 'الصفحه الرئيسيه',
    },
  },
  // my_profile
  {
    'qku85ltt': {
      'en': 'Chat',
      'ar': 'محادثة',
    },
    'rq4iy7sx': {
      'en': 'Call',
      'ar': 'اتصال',
    },
    '0fsn5k35': {
      'en': 'Today\'s Work Info',
      'ar': 'معلومات العمل اليوم',
    },
    'j2an1vje': {
      'en': 'Address Work',
      'ar': 'عنوان العمل',
    },
    'n5q2xs7v': {
      'en': 'work Shift',
      'ar': 'ورديه العمل',
    },
    's8wbz6jo': {
      'en': 'Expected Finsh time:  16:30',
      'ar': 'الوقت المتوقع لانهاء العمل ',
    },
    'ksug87ea': {
      'en': ' have a problem? ',
      'ar': 'لديك مشكلة؟',
    },
    'oolqrsym': {
      'en': 'Make Complan',
      'ar': 'تقديم شكوى',
    },
    'wolbij8x': {
      'en': 'Profile',
      'ar': 'الصفحه الشخصيه',
    },
    'lmmalkqy': {
      'en': 'Home',
      'ar': 'الصفحه الرئيسيه',
    },
  },
  // worker_Home
  {
    'rkn0ia7z': {
      'en': 'Al Rahma',
      'ar': 'الرحمة',
    },
    'znr7sbjm': {
      'en': 'Warehouse management',
      'ar': 'إدارة المستودعات',
    },
    '03yhokqf': {
      'en': 'Hello,',
      'ar': 'مرحبًا،',
    },
    'vps37kqx': {
      'en': 'Maverick',
      'ar': 'الخارج عن المجموعه',
    },
    'qv7ye95g': {
      'en': 'Hello,',
      'ar': 'مرحبًا،',
    },
    '2jvgm34o': {
      'en': 'Until now you can see your Profile',
      'ar': 'حتى الآن يمكنك رؤية ملفك الشخصي',
    },
    'ognl9m6t': {
      'en': 'Wait for development',
      'ar': 'انتظر التطوير',
    },
    '4k9xyw5h': {
      'en': 'Powerd by Omar-s Team',
      'ar': 'بدعم من فريق عمر',
    },
    'zjnpmtdg': {
      'en': '__',
      'ar': '__',
    },
  },
  // transmission_Select_1
  {
    '4sncigdx': {
      'en': 'Select tools',
      'ar': 'حدد الأدوات',
    },
    '9558gmur': {
      'en': 'Search tools...',
      'ar': 'ادوات البحث...',
    },
    'mbktaru4': {
      'en': ' have a problem? ',
      'ar': 'لديك مشكلة؟',
    },
    'stwvqa84': {
      'en': 'Make Complan',
      'ar': 'تقديم شكوى',
    },
    '1sg1un3k': {
      'en': 'Next',
      'ar': 'التالي',
    },
    'y1ammpq6': {
      'en': 'Transmission',
      'ar': 'الانتقال',
    },
    '5zuyi53j': {
      'en': 'Home',
      'ar': 'الصفحه الرئيسيه',
    },
  },
  // transmission_Scan_2
  {
    '7ahfc4uq': {
      'en': 'Check out',
      'ar': 'الخروج',
    },
    '7cx3537s': {
      'en': 'Check out & Scan QR',
      'ar': 'الخروج ومسح الQR',
    },
    '4e5ye6w7': {
      'en': 'Scan  QR Code',
      'ar': 'مسح رمز الQR',
    },
    'yut59geh': {
      'en': 'Cancel',
      'ar': 'الغاء',
    },
    'disfmria': {
      'en': 'Qr code is available on (Details page) \non supervisor phone. ',
      'ar': 'رمز الاستجابة السريعة متاح على (صفحة التفاصيل)\nعلى هاتف المشرف',
    },
    '0xxi6efd': {
      'en': 'Need Help?',
      'ar': 'تحتاج مساعدة؟',
    },
    'wv6k41hs': {
      'en': 'Home',
      'ar': 'الصفحه الرئيسيه',
    },
  },
  // HowToUseApp
  {
    'yinsllsg': {
      'en': 'About app',
      'ar': 'عن  التطبيق',
    },
    '8xed3obm': {
      'en': 'Overview',
      'ar': 'ملخص',
    },
    'b2zjs171': {
      'en':
          'Here is an intro and description of what this toolkit entails. We hope you enjoy it as much as we do!',
      'ar':
          'فيما يلي مقدمة ووصف لما تتضمنه مجموعة الأدوات هذه. نأمل أن تستمتع به بقدر ما نفعل!',
    },
    '07aj0hpq': {
      'en': 'Introduction',
      'ar': 'مقدمة',
    },
    'h0hvz1yn': {
      'en': 'Intro',
      'ar': 'مقدمة',
    },
    'we4gr0pj': {
      'en': 'Disclaimer',
      'ar': 'تنصل',
    },
    'oed4ky7p': {
      'en': 'Main Content',
      'ar': 'المحتوى الرئيسي',
    },
    'k6n25ii0': {
      'en': 'How To Use App',
      'ar': 'كيفية استخدام التطبيق',
    },
    'bnkpaxw4': {
      'en': 'Excercise',
      'ar': 'تمرين',
    },
    'fyqpxoiw': {
      'en': 'Home',
      'ar': 'الصفحه الرئيسيه',
    },
  },
  // supplierDashboard
  {
    'or3f5dic': {
      'en': 'check.io',
      'ar': 'فحص.io',
    },
    'qkgba7p7': {
      'en': 'Andrew D.',
      'ar': 'أندرو د.',
    },
    '27jsy43c': {
      'en': 'admin@gmail.com',
      'ar': 'admin@gmail.com',
    },
    '21d4m5im': {
      'en': 'Dashboard',
      'ar': 'لوحة القيادة',
    },
    'k9yobhwd': {
      'en': 'Transactions',
      'ar': 'المعاملات',
    },
    't76sausu': {
      'en': 'Projects',
      'ar': 'المشاريع',
    },
    'vfo9e1ju': {
      'en': 'Users',
      'ar': 'المستخدمين',
    },
    '3xzqhvs9': {
      'en': 'Overview',
      'ar': 'الملخص',
    },
    'it4ad0gb': {
      'en': 'Below is a company overview',
      'ar': 'فيما يلي نظرة عامة على الشركة',
    },
    'tpo0z7t4': {
      'en': 'Andrew D.',
      'ar': 'أندرو د.',
    },
    'akcmti6e': {
      'en': 'admin@gmail.com',
      'ar': 'admin@gmail.com',
    },
    'jfhfpcnn': {
      'en': 'Income this Month',
      'ar': 'الدخل هذا الشهر',
    },
    'baf17xnd': {
      'en': '\$567,402',
      'ar': '567,402 دولار',
    },
    'm2k15drk': {
      'en': 'Total Workers',
      'ar': 'إجمالي العمال',
    },
    '0smktuu6': {
      'en': '2,208',
      'ar': '2,208',
    },
    'pkuvnik2': {
      'en': 'Total Orders',
      'ar': 'إجمالي الطلبات',
    },
    'a20p4rlc': {
      'en': '2,208',
      'ar': '2,208',
    },
    'zvt0crjh': {
      'en': 'Total Orders',
      'ar': 'إجمالي الطلبات',
    },
    'uznhgpgj': {
      'en': '2,208',
      'ar': '2,208',
    },
    'hnoscs3q': {
      'en': 'Account Overview',
      'ar': 'نظرة عامة على الحساب',
    },
    '7n2facfw': {
      'en': 'Your Balance',
      'ar': 'رصيد الحساب',
    },
    'z8dt4wf7': {
      'en': '\$6,424.20',
      'ar': '6,424.20 دولارًا',
    },
    'o5ab09dj': {
      'en': 'View',
      'ar': 'منظر',
    },
    '83n5781v': {
      'en': 'Top Worker',
      'ar': 'العامل الأعلى',
    },
    'chk70agq': {
      'en': 'Rudy Fernandez',
      'ar': 'رودي فرنانديز',
    },
    '3vxd7ex5': {
      'en': 'Manager',
      'ar': 'مدير',
    },
    '062qlr0f': {
      'en': 'Abigail Herrara',
      'ar': 'أبيجيل هيرارا',
    },
    '9v379fl4': {
      'en': 'Designer',
      'ar': 'مصمم',
    },
    '5k32woun': {
      'en': 'Liz Ambridge',
      'ar': 'ليز أمبريدج',
    },
    '9bzk5ouq': {
      'en': 'Manager',
      'ar': 'مدير',
    },
    'eka02ytx': {
      'en': 'Outstanding Balance',
      'ar': 'اتزان رائع',
    },
    '4dr786ij': {
      'en': '\$529,204',
      'ar': '529,204 دولار',
    },
    'rf23wje8': {
      'en': '55%',
      'ar': '55%',
    },
    'lp8k66y9': {
      'en': '55%',
      'ar': '55%',
    },
    '7nayhlr3': {
      'en': 'Outstanding Balance',
      'ar': 'اتزان رائع',
    },
    'u3607jr8': {
      'en': '55%',
      'ar': '55%',
    },
    'q29yylf8': {
      'en': 'Outstanding Balance',
      'ar': 'اتزان رائع',
    },
    'kzd0zi53': {
      'en': '55%',
      'ar': '55%',
    },
    'voyv9at4': {
      'en': 'Outstanding Balance',
      'ar': 'اتزان رائع',
    },
    'y24xl13m': {
      'en': 'Outstanding Invoices',
      'ar': 'الفواتير المستحقة',
    },
    'rok9baet': {
      'en': 'Below are some of the outstanding invoices for your clients.',
      'ar': 'فيما يلي بعض الفواتير المستحقة لعملائك.',
    },
    'lilsgmp8': {
      'en': 'Add New',
      'ar': 'اضف جديد',
    },
    'u22zmfec': {
      'en': 'Work Type',
      'ar': 'نوع العمل',
    },
    '446936gf': {
      'en': 'Send To:',
      'ar': ' الإرسال إلى:',
    },
    'pr3b9dzj': {
      'en': 'Contract Amount',
      'ar': 'قيمة العقد',
    },
    'itcy82vz': {
      'en': 'Status',
      'ar': 'الحالة',
    },
    '79vv3rvx': {
      'en': 'Actions',
      'ar': 'أجراءات',
    },
    'hhbap5zb': {
      'en': 'Design Work',
      'ar': 'عمل التصميم',
    },
    '344x0041': {
      'en': 'Randy Peterson',
      'ar': 'راندي بيترسون',
    },
    'usuz26aw': {
      'en': 'Business Name',
      'ar': 'الاسم التجاري',
    },
    'hco9b10l': {
      'en': '\$2,100',
      'ar': '2100 دولار',
    },
    'egktkv9s': {
      'en': 'Paid',
      'ar': 'مدفوع',
    },
    'g2apt9zd': {
      'en': 'Design Work',
      'ar': 'عمل التصميم',
    },
    'qfoe7qbk': {
      'en': 'Randy Peterson',
      'ar': 'راندي بيترسون',
    },
    'w5wjx3kg': {
      'en': 'Business Name',
      'ar': 'الاسم التجاري',
    },
    'sxr7pl6r': {
      'en': '\$2,100',
      'ar': '2100 دولار',
    },
    '1eujrt2m': {
      'en': 'Paid',
      'ar': 'مدفوع',
    },
    'styshqom': {
      'en': 'Design Work',
      'ar': 'عمل التصميم',
    },
    'hilnoxsz': {
      'en': 'Randy Peterson',
      'ar': 'راندي بيترسون',
    },
    '2vcjau4a': {
      'en': 'Business Name',
      'ar': 'الاسم التجاري',
    },
    'vzc13mkv': {
      'en': '\$2,100',
      'ar': '2100 دولار',
    },
    'v48wukw4': {
      'en': 'Paid',
      'ar': 'مدفوع',
    },
    '0au3osgh': {
      'en': 'Design Work',
      'ar': 'عمل التصميم',
    },
    'ime1dmp0': {
      'en': 'Randy Peterson',
      'ar': 'راندي بيترسون',
    },
    '4ab8dzy3': {
      'en': 'Business Name',
      'ar': 'الاسم التجاري',
    },
    'w7ic8r3h': {
      'en': '\$2,100',
      'ar': '2100 دولار',
    },
    'idinvnf5': {
      'en': 'Paid',
      'ar': 'مدفوع',
    },
    '6elk7i5t': {
      'en': 'Design Work',
      'ar': 'عمل التصميم',
    },
    'vamfqx3v': {
      'en': 'Randy Peterson',
      'ar': 'راندي بيترسون',
    },
    '4rqhci7z': {
      'en': 'Business Name',
      'ar': 'الاسم التجاري',
    },
    'ebhy3h6b': {
      'en': '\$2,100',
      'ar': '2100 دولار',
    },
    '2p8axsoo': {
      'en': 'Pending',
      'ar': 'قيد الانتظار',
    },
    '1rrza5kn': {
      'en': 'Design Work',
      'ar': 'عمل التصميم',
    },
    'nntiqjn7': {
      'en': 'Randy Peterson',
      'ar': 'راندي بيترسون',
    },
    'j0vre1qm': {
      'en': 'Business Name',
      'ar': 'الاسم التجاري',
    },
    'as2w1h9f': {
      'en': '\$2,100',
      'ar': '2100 دولار',
    },
    'ft0gnjm7': {
      'en': 'Pending',
      'ar': 'قيد الانتظار',
    },
    '5uvxx5z3': {
      'en': 'Design Work',
      'ar': 'عمل التصميم',
    },
    'b78ypr0a': {
      'en': 'Randy Peterson',
      'ar': 'راندي بيترسون',
    },
    'pwq7wtnv': {
      'en': 'Business Name',
      'ar': 'الاسم التجاري',
    },
    'a7xu58yq': {
      'en': '\$2,100',
      'ar': '2100 دولار',
    },
    '099erb3u': {
      'en': 'Pending',
      'ar': 'قيد الانتظار',
    },
    '36b90ft7': {
      'en': 'Home',
      'ar': 'الصفحه الرئيسيه',
    },
  },
  // applyforjob
  {
    'c2adapdg': {
      'en': 'Join us & work with confidence',
      'ar': 'انضم إلينا واعمل بثقة',
    },
    'ltn6oh38': {
      'en': 'We are excited to welcome you to our team.\n',
      'ar': 'نحن متحمسون للترحيب بكم في فريقنا.',
    },
    'vg9e9uql': {
      'en': 'Name',
      'ar': 'اسم',
    },
    'h1njdjui': {
      'en': 'Email Address',
      'ar': 'عنوان البريد الإلكتروني',
    },
    '27c5sdpp': {
      'en': 'Phone number',
      'ar': 'رقم التليفون',
    },
    'pu23bm9o': {
      'en': 'Worker',
      'ar': 'عامل',
    },
    '1tzon4xd': {
      'en': 'Supplier',
      'ar': 'المورد',
    },
    '8x4sysl0': {
      'en': 'Supervisor',
      'ar': 'مشرف',
    },
    'oh6skhv0': {
      'en': 'Select  job',
      'ar': 'اختر الوظيفة',
    },
    'z2gsehf6': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'xe4dsejp': {
      'en': 'I would like to receive inspriation emails.',
      'ar': 'أرغب في تلقي رسائل البريد الإلكتروني الخاصة بالإلهام.',
    },
    'i9x1onxn': {
      'en': 'Done',
      'ar': 'الانهاء',
    },
    '8z896xqs': {
      'en': 'Home',
      'ar': 'الصفحه الرئيسيه',
    },
  },
  // Onboarding04
  {
    'o6umyaw6': {
      'en': 'Spring Specials 2022',
      'ar': 'عروض ربيع 2022',
    },
    'wv2eogcc': {
      'en':
          'Pay attention to our new athlesiure line, it is located in our main section and we have sales!',
      'ar':
          'انتبه إلى خطنا الرياضي الجديد، فهو موجود في قسمنا الرئيسي ولدينا مبيعات!',
    },
    'jj9nmoih': {
      'en': 'Puuuurfect Running Gear',
      'ar': 'معدات الجري المثالية',
    },
    'n7804qxf': {
      'en':
          'Pay attention to our new athlesiure line, it is located in our main section and we have sales!',
      'ar':
          'انتبه إلى خطنا الرياضي الجديد، فهو موجود في قسمنا الرئيسي ولدينا مبيعات!',
    },
    'qou3byn2': {
      'en': 'The right pair of shoes',
      'ar': 'الزوج المناسب من الأحذية',
    },
    'ae11rfsq': {
      'en':
          'The pursuit of speed continues with the Nike Quest 4 Premium. Take on the streets with higher foam heights and cushioned comfort that combine with a lightweight upper to offer secure support.',
      'ar':
          'يستمر السعي وراء السرعة مع حذاء Nike Quest 4 Premium. انطلق في الشوارع بارتفاعات إسفنجية أعلى وراحة مبطنة تتحد مع جزء علوي خفيف الوزن لتوفير دعم آمن.',
    },
    'wdrz0nka': {
      'en': 'Your Journey Begins',
      'ar': 'رحلتك تبدأ',
    },
    'v39qltgo': {
      'en': 'Sign up below in order to get started!',
      'ar': 'قم بالتسجيل أدناه للبدء!',
    },
    'blwhglhn': {
      'en': 'Get Started',
      'ar': 'البدء',
    },
    'ph42plfy': {
      'en': 'Home',
      'ar': 'الصفحه الرئيسيه',
    },
  },
  // hintBeforeapplyjob
  {
    'fmmci96o': {
      'en': 'Header One',
      'ar': 'المدير الاول',
    },
    'ct6dtfab': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
      'ar':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut Labore et dolore magna aliqua.',
    },
    'p4bp0i26': {
      'en': 'Header Two',
      'ar': 'المدير الثاني',
    },
    '54f3qnfs': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
      'ar':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut Labore et dolore magna aliqua.',
    },
    'qh5bjrno': {
      'en': 'Header Three',
      'ar': 'المدير الثالث',
    },
    'uxzk0xfn': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
      'ar':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut Labore et dolore magna aliqua.',
    },
    'vz37g0xf': {
      'en': 'Next',
      'ar': 'التالي',
    },
    'pbyo6dju': {
      'en': 'Home',
      'ar': 'الصفحه الرئيسيه',
    },
  },
  // Home13Productivity
  {
    'p08mkwx2': {
      'en': 'Hello,',
      'ar': 'مرحبًا،',
    },
    'o3iz44ij': {
      'en': 'Maverick',
      'ar': 'الخارج عن المجموعه',
    },
    's7bmv5ag': {
      'en': 'Favorites',
      'ar': 'المفضلة',
    },
    'ycdqsol8': {
      'en': '3 Projects | 45 Files',
      'ar': '3 مشاريع | 45 ملفا',
    },
    '25r6uh1s': {
      'en': 'Favorites',
      'ar': 'المفضلة',
    },
    '52b4ypv3': {
      'en': '3 Projects | 45 Files',
      'ar': '3 مشاريع | 45 ملفا',
    },
    'e74qxxid': {
      'en': 'Important',
      'ar': 'مهم',
    },
    '26vmxqjn': {
      'en': '3 Projects | 45 Files',
      'ar': '3 مشاريع | 45 ملفا',
    },
    'tban3b14': {
      'en': 'To Do',
      'ar': '..... ',
    },
    'zry30har': {
      'en': 'This is great item.',
      'ar': '....',
    },
    '4jrypz3n': {
      'en': 'Due Now',
      'ar': 'مستحق الآن',
    },
    '31uscmqe': {
      'en': 'This is great item.',
      'ar': '....',
    },
    '0wtkygtj': {
      'en': 'Due Now',
      'ar': 'مستحق الآن',
    },
    'x589rnqv': {
      'en': 'This is great item.',
      'ar': '....',
    },
    'gmjl61rh': {
      'en': 'Due Now',
      'ar': 'مستحق الآن',
    },
    'g4qc88ez': {
      'en': 'Latest Projects',
      'ar': 'أحدث المشاريع',
    },
    '1vtzo2dg': {
      'en': 'Project Name',
      'ar': 'اسم المشروع',
    },
    '0gb1os2f': {
      'en': '4 Folders',
      'ar': '4 مجلدات',
    },
    'kz9sagad': {
      'en': '3 upcoming due dates',
      'ar': '3 مواعيد استحقاق قادمة',
    },
    'eqrhhlss': {
      'en': 'Project Name',
      'ar': 'اسم المشروع',
    },
    'fj4c6wv6': {
      'en': '4 Folders',
      'ar': '4 مجلدات',
    },
    'wp4mhw8u': {
      'en': '3 upcoming due dates',
      'ar': '3 مواعيد الاستحقاق القادمة',
    },
    'rwt3uqnf': {
      'en': 'Project Name',
      'ar': 'اسم المشروع',
    },
    'regfjrkc': {
      'en': '4 Folders',
      'ar': '4 مجلدات',
    },
    'jtxeoeg2': {
      'en': '3 upcoming due dates',
      'ar': '3 مواعيد الاستحقاق القادمة',
    },
    'ahjfi2ks': {
      'en': 'Home',
      'ar': 'الصفحه الرئيسيه',
    },
  },
  // tasksTracker
  {
    '0zjot582': {
      'en': '{Working Area}',
      'ar': '',
    },
    'wjz3jdpt': {
      'en': '{Working Area discription}',
      'ar': '',
    },
    'nz4enkka': {
      'en': '{12} Tasks',
      'ar': '',
    },
    '8olvp832': {
      'en': 'Pending',
      'ar': 'قيد الانتظار',
    },
    'x6xtkr31': {
      'en': '{Task Name}',
      'ar': '',
    },
    '7yoz6vwu': {
      'en': 'View',
      'ar': '',
    },
    'zwrqwk2r': {
      'en': '{Discription}',
      'ar': '',
    },
    'mmnfxuta': {
      'en': 'Due',
      'ar': '',
    },
    'gqck59l9': {
      'en': 'Tuesday, 10:00am',
      'ar': '',
    },
    '0oxhwfw1': {
      'en': 'In Progress',
      'ar': '',
    },
    '3z2ps0vh': {
      'en': '{Task Name}',
      'ar': '',
    },
    'u7ivogvc': {
      'en': 'View',
      'ar': '',
    },
    '7u30f94s': {
      'en': '{Discription}',
      'ar': '',
    },
    'i7n5uma8': {
      'en': 'Due',
      'ar': '',
    },
    'qs3yu1qw': {
      'en': 'Tuesday, 10:00am',
      'ar': '',
    },
    'msz8qrb0': {
      'en': 'In Progress',
      'ar': '',
    },
    'ctycx5m2': {
      'en': 'Completed',
      'ar': 'مكتمل',
    },
    'rhewwzy4': {
      'en': 'Design Template Screens',
      'ar': 'شاشات قالب التصميم',
    },
    '6fda2r6b': {
      'en': 'Create template screen for task todo app.',
      'ar': 'إنشاء شاشة قالب لتطبيق المهام الواجبة.',
    },
    'ea246r3k': {
      'en': 'Tuesday, 10:00am',
      'ar': 'الثلاثاء، الساعة 10:00 صباحاً',
    },
    'hbpbm9mb': {
      'en': 'Completed',
      'ar': 'مكتمل',
    },
    '9fvbm9hy': {
      'en': 'Design Template Screens',
      'ar': '',
    },
    '4xe382y1': {
      'en': 'Create template screen for task todo app.',
      'ar': '',
    },
    'lj8l8c29': {
      'en': 'Tuesday, 10:00am',
      'ar': '',
    },
    'jerg319h': {
      'en': 'Completed',
      'ar': '',
    },
    'crra11hj': {
      'en': 'Daily Report',
      'ar': '',
    },
    's9e9ngqz': {
      'en': 'The daily report is delivered at the end of the shift',
      'ar': '',
    },
    'zuy2topf': {
      'en': 'late',
      'ar': 'متأخر',
    },
    'v3gunpi9': {
      'en': '{Task Name}',
      'ar': '',
    },
    'ovn0iahu': {
      'en': 'Provide reason',
      'ar': '',
    },
    'a42jbf5u': {
      'en': '{Discription}',
      'ar': '',
    },
    '0tmvzxjl': {
      'en': 'Tuesday, 10:00am',
      'ar': 'الثلاثاء، الساعة 10:00 صباحاً',
    },
    '7y0a7ht6': {
      'en': 'Lated',
      'ar': '',
    },
    'a6u6ex2k': {
      'en': 'Task Tracker',
      'ar': '',
    },
    'dsy0bd7i': {
      'en': 'Tasks',
      'ar': 'الصفحه الرئيسيه',
    },
  },
  // complain_formCopy
  {
    '3d52bx69': {
      'en': 'block',
      'ar': 'اعتراض',
    },
    'dks7jayp': {
      'en': 'Missing Tool',
      'ar': 'أداة مفقودة',
    },
    'br6s6bo1': {
      'en': 'Block',
      'ar': 'اعتراض',
    },
    'r6radux2': {
      'en': 'Another',
      'ar': 'آخر',
    },
    '0tgihp0g': {
      'en': 'Complain Type',
      'ar': 'نوع الشكوى',
    },
    '4j08k91v': {
      'en': 'Select Missing tools',
      'ar': 'حدد الطرق  المفقودة',
    },
    '0yyzs64x': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    '7v4k0ejk': {
      'en': 'Number',
      'ar': 'الرقم',
    },
    '8l50mr6l': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'goaf7b6x': {
      'en': 'Details',
      'ar': 'التفاصيل',
    },
    'g3bd1fxr': {
      'en': 'Record Audio',
      'ar': 'التسجيل الصوتي',
    },
    'rysgu4nk': {
      'en': 'Make Complain',
      'ar': 'تقديم شكوى',
    },
    'lcjzc2zr': {
      'en': 'PLeasr Fill in the detials of the complain',
      'ar': 'يرجى ملء تفاصيل الشكوى',
    },
    'etpdr6cb': {
      'en': 'Please fill in all the required Info',
      'ar': 'يرجى ملء جميع المعلومات المطلوبة',
    },
    'kigh7789': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'snw8e9kt': {
      'en': 'Complin Form',
      'ar': 'نموذج الشكوى',
    },
  },
  // usersList
  {
    'yx27j223': {
      'en': 'Search...',
      'ar': '',
    },
    'iyudgnjx': {
      'en': 'All',
      'ar': 'الجميع',
    },
    'qhpdwdqu': {
      'en': 'Pending',
      'ar': '',
    },
    'mp2a8rxq': {
      'en': 'In Progress',
      'ar': '',
    },
    'w89kyjul': {
      'en': 'Completed',
      'ar': '',
    },
    'pjcc4zh5': {
      'en': 'All',
      'ar': '',
    },
    '42cyl7iz': {
      'en': 'All',
      'ar': '',
    },
    'vyf9o7jr': {
      'en': 'Pending',
      'ar': '',
    },
    'xyj0yeoa': {
      'en': 'In Progress',
      'ar': '',
    },
    'sf3wos36': {
      'en': 'Completed',
      'ar': '',
    },
    '6q16sq71': {
      'en': '',
      'ar': '',
    },
    '1lnv0fff': {
      'en': 'All',
      'ar': '',
    },
    'lg0bwmgt': {
      'en': 'All',
      'ar': 'الجميع',
    },
    'vvmuvaj3': {
      'en': 'Inspector Name',
      'ar': 'اسم المراقب',
    },
    'wv0whpym': {
      'en': 'Title',
      'ar': 'العنوان',
    },
    'almbqo68': {
      'en': 'Inspector Name',
      'ar': 'اسم المراقب',
    },
    'z5n2kgeh': {
      'en': 'Title',
      'ar': 'العنوان',
    },
    'lpxwepbr': {
      'en': 'Active',
      'ar': 'مفعل',
    },
    'nw9t2ill': {
      'en': 'Inactive',
      'ar': 'غير مفعل',
    },
    'digpcxk2': {
      'en': 'Users',
      'ar': 'المستخدمين',
    },
    'pgj4n7re': {
      'en': '•',
      'ar': '•',
    },
  },
  // user_profile
  {
    'gfxmkct1': {
      'en': 'Chat',
      'ar': 'محادثة',
    },
    '0ixnykb3': {
      'en': 'Call',
      'ar': 'اتصال',
    },
    'jb14h6j8': {
      'en': 'Work Info',
      'ar': 'معلومات العمل اليوم',
    },
    'gpmls6w4': {
      'en': 'Address Work',
      'ar': 'عنوان العمل',
    },
    '41hpc387': {
      'en': 'work Shift',
      'ar': 'ورديه العمل ',
    },
    '87n7gxv1': {
      'en': 'Expected Finsh time:  16:30',
      'ar': 'الوقت المتوقع لانهاء العمل  ',
    },
    'rrf5kyl6': {
      'en': ' have a problem? ',
      'ar': 'هل لديك مشكلة؟',
    },
    'q4m0td1x': {
      'en': 'Make Complan',
      'ar': 'تقديم شكوى',
    },
    '64br0lip': {
      'en': 'Deactivate User',
      'ar': '',
    },
    'ytcjbodz': {
      'en': 'Profile',
      'ar': 'الصفحه الشخصيه',
    },
    'e8v3icth': {
      'en': 'Home',
      'ar': 'الصفحه الرئيسيه',
    },
  },
  // list
  {
    '1tsbqb35': {
      'en': 'check.io',
      'ar': '',
    },
    'ip7ms6fo': {
      'en': 'Platform Navigation',
      'ar': '',
    },
    'i8blv94z': {
      'en': 'Dashboard',
      'ar': '',
    },
    'iken7o5x': {
      'en': 'Chats',
      'ar': '',
    },
    '5kjw9mhj': {
      'en': 'All Tasks',
      'ar': '',
    },
    '3v1v22k8': {
      'en': '12',
      'ar': '',
    },
    'la6dzsgy': {
      'en': 'Projects',
      'ar': '',
    },
    'pqzruc4o': {
      'en': 'Settings',
      'ar': '',
    },
    'ljji9xkh': {
      'en': 'Billing',
      'ar': '',
    },
    'muapu37v': {
      'en': 'Explore',
      'ar': '',
    },
    '6ay5dtqq': {
      'en': 'Light Mode',
      'ar': '',
    },
    'vq9ccebk': {
      'en': 'Dark Mode',
      'ar': '',
    },
    'laitjgrt': {
      'en': 'Andrew D.',
      'ar': '',
    },
    'jz0y1x0s': {
      'en': 'admin@gmail.com',
      'ar': '',
    },
    'x7wpsj6g': {
      'en': 'All Tasks',
      'ar': '',
    },
    'lqngw22t': {
      'en': 'Below is a summary of tasks.',
      'ar': '',
    },
    'dgn5gxtg': {
      'en': 'All',
      'ar': 'الجميع',
    },
    'e46p36b7': {
      'en': 'Pending',
      'ar': '',
    },
    'w0m4c3zq': {
      'en': 'In Progress',
      'ar': '',
    },
    'f7z4he2k': {
      'en': 'Completed',
      'ar': '',
    },
    'i6z5ejnj': {
      'en': 'All',
      'ar': '',
    },
    'uoxz41rw': {
      'en': 'All',
      'ar': '',
    },
    '20yca2mf': {
      'en': 'Search all tasks...',
      'ar': '',
    },
    '6ss79uh8': {
      'en': 'Task Name',
      'ar': '',
    },
    '1ku30p92': {
      'en': 'Assigned To',
      'ar': '',
    },
    'dd1zbs55': {
      'en': 'Due Date',
      'ar': '',
    },
    'vi6exnph': {
      'en': 'Status',
      'ar': '',
    },
    'mspz9q8p': {
      'en': 'Product Testing',
      'ar': '',
    },
    'vz6mpr3h': {
      'en': 'Randy Rodriguez',
      'ar': '',
    },
    'y342urcb': {
      'en': 'randy@domainname.com',
      'ar': '',
    },
    '0tmh0mpx': {
      'en': 'June 5th',
      'ar': '',
    },
    '45i7is0w': {
      'en': 'In Progress',
      'ar': '',
    },
    'jo8fkst8': {
      'en': 'Product Testing',
      'ar': '',
    },
    'zx5gscg7': {
      'en': 'Emily Rambo',
      'ar': '',
    },
    '1o2l7dhh': {
      'en': 'emily@domain.com',
      'ar': '',
    },
    'j96alc0u': {
      'en': 'June 5th',
      'ar': '',
    },
    'uaxo3knq': {
      'en': 'Pending',
      'ar': '',
    },
    'pva9fwuf': {
      'en': 'Product Testing',
      'ar': '',
    },
    'j7eda3ts': {
      'en': 'Emily Rambo',
      'ar': '',
    },
    '8mj1q3gy': {
      'en': 'emily@domain.com',
      'ar': '',
    },
    'xyvgkbfm': {
      'en': 'June 5th',
      'ar': '',
    },
    'adz50v5m': {
      'en': 'Pending',
      'ar': '',
    },
    'fy7uxe94': {
      'en': 'Product Testing',
      'ar': '',
    },
    '8mgx6kn2': {
      'en': 'Emily Rambo',
      'ar': '',
    },
    'l4o5eb0o': {
      'en': 'emily@domain.com',
      'ar': '',
    },
    'gainbymb': {
      'en': 'June 5th',
      'ar': '',
    },
    'vkrzst19': {
      'en': 'In Progress',
      'ar': '',
    },
    'qyqrcz25': {
      'en': 'Product Testing',
      'ar': '',
    },
    '8e469wo7': {
      'en': 'Emily Rambo',
      'ar': '',
    },
    'w12k6bex': {
      'en': 'emily@domain.com',
      'ar': '',
    },
    '0yvyzqye': {
      'en': 'June 5th',
      'ar': '',
    },
    'mpxye5ds': {
      'en': 'Pending',
      'ar': '',
    },
    'e4jwrq7f': {
      'en': 'All Tasks',
      'ar': '',
    },
    '322psmmy': {
      'en': 'Home',
      'ar': 'الصفحه الرئيسيه',
    },
  },
  // Settings1Notifications
  {
    'rb6mq28f': {
      'en': 'Settings Page',
      'ar': '',
    },
    '1pmo85is': {
      'en':
          'Choose what notifcations you want to recieve below and we will update the settings.',
      'ar': '',
    },
    '1oq1d34d': {
      'en': 'Push Notifications',
      'ar': '',
    },
    'xqcv8q1g': {
      'en':
          'Receive Push notifications from our application on a semi regular basis.',
      'ar': '',
    },
    'm6lmhlpk': {
      'en': 'Email Notifications',
      'ar': '',
    },
    'c6io0tz6': {
      'en':
          'Receive email notifications from our marketing team about new features.',
      'ar': '',
    },
    'gt3z2vwn': {
      'en': 'Location Services',
      'ar': '',
    },
    '06670cfr': {
      'en':
          'Allow us to track your location, this helps keep track of spending and keeps you safe.',
      'ar': '',
    },
    'l84dqgwz': {
      'en': 'Change Changes',
      'ar': '',
    },
    '44f0cjfy': {
      'en': 'Home',
      'ar': '',
    },
  },
  // updateUser
  {
    'j42wrsnu': {
      'en': 'First Name',
      'ar': '',
    },
    'g6p8et53': {
      'en': 'Middle Name',
      'ar': '',
    },
    'vp9m3683': {
      'en': 'Last Name',
      'ar': '',
    },
    '5u1ew8ep': {
      'en': 'Nick Name',
      'ar': '',
    },
    '9uh7vdup': {
      'en': '',
      'ar': '',
    },
    's333humu': {
      'en': 'Muslim',
      'ar': '',
    },
    'b7v2yy3n': {
      'en': 'Christiran',
      'ar': '',
    },
    'quevxoty': {
      'en': 'Religion',
      'ar': '',
    },
    'j1wzvytj': {
      'en': '',
      'ar': '',
    },
    'fwoft7ri': {
      'en': 'Male',
      'ar': '',
    },
    'h7k2nbpz': {
      'en': 'Female',
      'ar': '',
    },
    '3e9mudts': {
      'en': 'Select Gender',
      'ar': '',
    },
    '5puqj453': {
      'en': '',
      'ar': '',
    },
    'dwsj46o9': {
      'en': 'Married',
      'ar': '',
    },
    'ja58k7lg': {
      'en': 'Single',
      'ar': '',
    },
    '0goibmud': {
      'en': 'Marital Status',
      'ar': '',
    },
    'ipynbttm': {
      'en': '',
      'ar': '',
    },
    'll9mgea8': {
      'en': 'Egypt',
      'ar': '',
    },
    'dgjmz0np': {
      'en': 'Other',
      'ar': '',
    },
    'nx9mxld8': {
      'en': 'Nationality',
      'ar': '',
    },
    'h6oxh7iv': {
      'en': 'National ID',
      'ar': '',
    },
    'ekhsgn66': {
      'en': 'Confirm Nat',
      'ar': '',
    },
    '9uh78vj8': {
      'en': 'Birthdate',
      'ar': '',
    },
    'safc8sxt': {
      'en': 'Age',
      'ar': 'العُمر',
    },
    'oy079ral': {
      'en': 'Place of Issue',
      'ar': 'مكان الإصدار',
    },
    'ydefoxs9': {
      'en': 'Date of national id',
      'ar': '',
    },
    'w4rae9du': {
      'en': '',
      'ar': '',
    },
    '5fnfyr2h': {
      'en': 'Expiry date',
      'ar': 'تاريخ الانتهاء',
    },
    'cnemdlsh': {
      'en': '',
      'ar': '',
    },
    'w3jkmrge': {
      'en': 'Enter Nationality',
      'ar': '',
    },
    '8tve2c3r': {
      'en': 'Passport No.',
      'ar': '',
    },
    'zl1off7v': {
      'en': 'Birthdate',
      'ar': '',
    },
    '2gbcv1u5': {
      'en': '',
      'ar': '',
    },
    '5nqnaiah': {
      'en': 'Calc Age',
      'ar': '',
    },
    'd0p2ihtu': {
      'en': 'Age',
      'ar': '',
    },
    'i1nj2j7z': {
      'en': 'Place of Issue',
      'ar': '',
    },
    'oj6dt71v': {
      'en': 'Date of civil ID',
      'ar': '',
    },
    '8fa5peq4': {
      'en': '',
      'ar': '',
    },
    'x5q44nvx': {
      'en': 'Expiry date',
      'ar': '',
    },
    'fil7lbry': {
      'en': '',
      'ar': '',
    },
    '48ckvhzt': {
      'en': 'Government',
      'ar': '',
    },
    'o1457cb7': {
      'en': 'city',
      'ar': '',
    },
    'o82vyrnc': {
      'en': 'Full Address',
      'ar': '',
    },
    'btf7lpz1': {
      'en': 'Phone Number',
      'ar': 'رقم التليفون',
    },
    'jznpwu33': {
      'en': 'Education Data',
      'ar': '',
    },
    'udichc1k': {
      'en': '',
      'ar': '',
    },
    '9kf7nwsm': {
      'en': 'Yes',
      'ar': 'نعم',
    },
    '2x19u4uw': {
      'en': 'No',
      'ar': 'لا',
    },
    'br5px6zz': {
      'en': 'Employed now?',
      'ar': '',
    },
    '9fiau5hx': {
      'en': '',
      'ar': '',
    },
    '4dhk4lt6': {
      'en': 'Worker',
      'ar': '',
    },
    'f2sl5wrt': {
      'en': 'Supervisor',
      'ar': '',
    },
    'c9j6hkhl': {
      'en': 'Operation Manager',
      'ar': '',
    },
    '1oghq3qt': {
      'en': 'Deputy Operations Manager',
      'ar': '',
    },
    'kpsz0mu3': {
      'en': 'Operations Director',
      'ar': '',
    },
    'hmxshjjs': {
      'en': 'Deputy Operations Director',
      'ar': '',
    },
    '6lsrvwzn': {
      'en': 'Office Manager',
      'ar': '',
    },
    '2182x9qr': {
      'en': 'Sector management officer',
      'ar': '',
    },
    'qbfhyehv': {
      'en': 'Operations management officer',
      'ar': '',
    },
    'zijek2zt': {
      'en': 'Vehicle movement manager',
      'ar': '',
    },
    'dbevj61t': {
      'en': 'Storage Keeper (New Equipment)',
      'ar': '',
    },
    'orfjtbvs': {
      'en': 'Storage Keeper (Used Equipment)',
      'ar': '',
    },
    'j0emlmxd': {
      'en': 'Sector official',
      'ar': '',
    },
    '6owdnczm': {
      'en': 'Select Role',
      'ar': 'حدد الوظيفة',
    },
    'sm4slr91': {
      'en': '',
      'ar': '',
    },
    '9xhr0kd9': {
      'en': 'Select Contractor',
      'ar': '',
    },
    '61mqukpg': {
      'en': '',
      'ar': '',
    },
    '47na0fhm': {
      'en': 'Yes',
      'ar': '',
    },
    'xo5b8xle': {
      'en': 'No',
      'ar': '',
    },
    '1je7x7uf': {
      'en': 'Do you have a driving license?',
      'ar': '',
    },
    'h1w4aieh': {
      'en': '',
      'ar': '',
    },
    'n0ksiuqi': {
      'en': 'Car',
      'ar': '',
    },
    '78aa54ac': {
      'en': 'Motorcycle',
      'ar': '',
    },
    '0f388j7n': {
      'en': 'Type of driving license?',
      'ar': '',
    },
    '4lubca5h': {
      'en': 'Date of national id',
      'ar': '',
    },
    'jhr7yw54': {
      'en': '',
      'ar': '',
    },
    '7nx7uugs': {
      'en': 'Date of national id',
      'ar': '',
    },
    'k3k0dzhx': {
      'en': '',
      'ar': '',
    },
    'w2fcwb77': {
      'en': '',
      'ar': '',
    },
    'etjl256f': {
      'en': 'Leader 1',
      'ar': '',
    },
    's7ehmq5h': {
      'en': 'Leader 2',
      'ar': '',
    },
    '7qj9o0lb': {
      'en': 'Select Work Area',
      'ar': '',
    },
    'vynt2d12': {
      'en': '',
      'ar': '',
    },
    'zf8moe1l': {
      'en': '150: Superviser',
      'ar': '',
    },
    'gtxgph0h': {
      'en': '220: fixed point',
      'ar': '',
    },
    'u69slq5f': {
      'en': '250: Garage worker (maintenance)',
      'ar': '',
    },
    'cicp64t9': {
      'en': '260: Authority workers',
      'ar': '',
    },
    't3qov7me': {
      'en': '270: Workers’ driver',
      'ar': '',
    },
    'q8g6i8dm': {
      'en': '280: Authority car driver',
      'ar': '',
    },
    'penv3ew7': {
      'en': '150-',
      'ar': '',
    },
    '3cmeucm2': {
      'en': 'Select code',
      'ar': '',
    },
    'mdcpqf5s': {
      'en': 'Morning',
      'ar': 'صباح',
    },
    '8d6jrnn5': {
      'en': 'Evening',
      'ar': 'مساء',
    },
    'p22wav2f': {
      'en': 'Night',
      'ar': 'ليلة',
    },
    'tq47fjpu': {
      'en': 'Select starting shift ',
      'ar': 'حدد بداية الوردية',
    },
    'hb1kdvar': {
      'en': 'Search for an item...',
      'ar': '',
    },
    'g6c7vyit': {
      'en': '8 h',
      'ar': '8 ساعات',
    },
    'yryswbww': {
      'en': '12 h',
      'ar': '',
    },
    '356irprz': {
      'en': '16 h',
      'ar': '16 ساعة',
    },
    'xsaik1m7': {
      'en': 'Time',
      'ar': 'وقت',
    },
    '28z0oqd4': {
      'en': 'Search for an item...',
      'ar': '',
    },
    'tv1d1ehp': {
      'en': 'Morning',
      'ar': '',
    },
    '0lkfbpqg': {
      'en': 'Evening',
      'ar': '',
    },
    '6c006rg0': {
      'en': 'Night',
      'ar': '',
    },
    '5nfp9yu5': {
      'en': 'Select starting shift ',
      'ar': '',
    },
    'h8dk62gk': {
      'en': 'Search for an item...',
      'ar': '',
    },
    '26tugr4c': {
      'en': '8 h',
      'ar': '',
    },
    'a38sm19q': {
      'en': '16 h',
      'ar': '',
    },
    'gm87tqrf': {
      'en': 'Time',
      'ar': '',
    },
    'upcele1s': {
      'en': 'Search for an item...',
      'ar': '',
    },
    'icakhx9r': {
      'en': 'employment date',
      'ar': '',
    },
    'ynh9s706': {
      'en': '',
      'ar': '',
    },
    'h10l9uqf': {
      'en': 'Number of Workers',
      'ar': '',
    },
    '653qhz0k': {
      'en': 'Diflict %',
      'ar': '',
    },
    'pf27xi3y': {
      'en': 'Shift Price',
      'ar': '',
    },
    'd0hx7d7z': {
      'en': 'Contract date',
      'ar': '',
    },
    'gk5iv54u': {
      'en': '',
      'ar': '',
    },
    '15rfkf7j': {
      'en': '1.Upload ID',
      'ar': '',
    },
    'fz7ke8wg': {
      'en': 'Personal ID',
      'ar': 'البطاقة الشخصية',
    },
    '8e1l95al': {
      'en': 'Please upload front ID.',
      'ar': 'يرجي تحميل الجهة الأمامية.',
    },
    'ni755dhl': {
      'en': 'Add Photo',
      'ar': '',
    },
    'fcg4tkc8': {
      'en': 'Upload an image here...',
      'ar': '',
    },
    '9xr8khaa': {
      'en': 'Personal ID',
      'ar': '',
    },
    'tq7uqg7d': {
      'en': 'Please upload back ID.',
      'ar': '',
    },
    'ntk6jfou': {
      'en': 'Add Photo',
      'ar': '',
    },
    'cpnk0be9': {
      'en': 'Upload an image here...',
      'ar': '',
    },
    '49g9y4yl': {
      'en': '2. Upload driving license',
      'ar': '',
    },
    '4id83t8a': {
      'en': 'Driving license',
      'ar': '',
    },
    'kzdc15bf': {
      'en': 'Please upload front driving license.',
      'ar': '',
    },
    'bf56g7n9': {
      'en': 'Add Photo',
      'ar': '',
    },
    'p885ebxf': {
      'en': 'Upload an image here...',
      'ar': '',
    },
    'dg7e4ldf': {
      'en': 'Driving license',
      'ar': '',
    },
    '3p9mf3kz': {
      'en': 'Please upload back ID.',
      'ar': '',
    },
    '42ao6djv': {
      'en': 'Add Photo',
      'ar': '',
    },
    '62w9dw9p': {
      'en': 'Upload an image here...',
      'ar': '',
    },
    't28djs4p': {
      'en': '3. Upload drug test',
      'ar': '',
    },
    'dk1pis3m': {
      'en': 'Upload drug test',
      'ar': '',
    },
    '5lr20a70': {
      'en': 'Please upload your drug test.',
      'ar': '',
    },
    'a5tifyza': {
      'en': 'Add Photo',
      'ar': '',
    },
    '8mphk6k7': {
      'en': 'Upload an image here...',
      'ar': '',
    },
    'uwm6bydh': {
      'en': 'Update',
      'ar': '',
    },
    'h02dy9m3': {
      'en': 'Field is required',
      'ar': ' مطلوب الملء',
    },
    '1o479qkz': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'emgbqhzq': {
      'en': 'Field is required',
      'ar': ' مطلوب الملء',
    },
    'm9hde46z': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '6quszuut': {
      'en': 'Field is required',
      'ar': '',
    },
    '6jmgnqqz': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'xs113aiw': {
      'en': 'Field is required',
      'ar': ' مطلوب الملء',
    },
    'mk7vinbk': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'ycwc7s5w': {
      'en': 'Field is required',
      'ar': '',
    },
    'tz8hguxz': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'yofs1kcr': {
      'en': 'Field is required',
      'ar': '',
    },
    'b9d58iu1': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'uqp1cu71': {
      'en': 'Field is required',
      'ar': ' مطلوب الملء',
    },
    'g36uzy67': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'qg9i8cyf': {
      'en': 'Field is required',
      'ar': '',
    },
    'jybvddsq': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'ppgpzmcp': {
      'en': 'Field is required',
      'ar': ' مطلوب الملء',
    },
    'vzn9h8jy': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'jtk10equ': {
      'en': 'Field is required',
      'ar': '',
    },
    '6jmcc71z': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '607thgj8': {
      'en': 'Field is required',
      'ar': '',
    },
    '4juznio2': {
      'en': 'Wrong Number',
      'ar': '',
    },
    '6yo311zh': {
      'en': 'Wrong Number',
      'ar': '',
    },
    '0tzma4qa': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'cswlnhig': {
      'en': 'Field is required',
      'ar': '',
    },
    'kehoco0y': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '5tcqb9s4': {
      'en': 'Field is required',
      'ar': '',
    },
    'w4zkvob5': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'kglqpxlo': {
      'en': 'Field is required',
      'ar': '',
    },
    '881aasz9': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'd7dhwjcz': {
      'en': 'Field is required',
      'ar': '',
    },
    'rfaza3dv': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'hg7l4b7n': {
      'en': 'Field is required',
      'ar': '',
    },
    '8841suwc': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '1fw2utw0': {
      'en': 'Field is required',
      'ar': '',
    },
    'wgs6a99w': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'b2cu114e': {
      'en': 'Field is required',
      'ar': '',
    },
    'chd65nto': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '9x88nppo': {
      'en': 'Field is required',
      'ar': '',
    },
    'cru62lok': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '3b5htmd4': {
      'en': 'Field is required',
      'ar': '',
    },
    'jjlftoy1': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '61lzqnwf': {
      'en': 'Field is required',
      'ar': '',
    },
    '7v6f0xx1': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'lhpe7emp': {
      'en': 'Field is required',
      'ar': '',
    },
    'txeos5rq': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'b4cjw1qc': {
      'en': 'Field is required',
      'ar': ' مطلوب الملء',
    },
    'cipj5xau': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'ulqrenzc': {
      'en': 'Field is required',
      'ar': ' مطلوب الملء',
    },
    '5nhhdvad': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'jk6uisfo': {
      'en': 'Field is required',
      'ar': '',
    },
    'o7nyxvhv': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '1fskjhm1': {
      'en': 'Field is required',
      'ar': '',
    },
    'li131cp9': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'n2803hmf': {
      'en': 'Field is required',
      'ar': '',
    },
    'zwcedy2z': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '9qjzortr': {
      'en': 'Create  Profile',
      'ar': '',
    },
  },
  // WorkingArea
  {
    'umfzxk8i': {
      'en': 'Page Title',
      'ar': '',
    },
    'foek0c6i': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Sv_Requests
  {
    'alqruwac': {
      'en': '*Please fill out the form below to continue.',
      'ar': '',
    },
    '3rg258qg': {
      'en': 'Car',
      'ar': '',
    },
    'gykzklj5': {
      'en': 'TRICYCLE',
      'ar': '',
    },
    'yh112kjz': {
      'en': 'Extra workers',
      'ar': '',
    },
    'niyjo530': {
      'en': 'Select one...',
      'ar': '',
    },
    'tspnp1l0': {
      'en': 'Search for an item...',
      'ar': '',
    },
    'iza4trm2': {
      'en': 'bock',
      'ar': '',
    },
    '8z435pkc': {
      'en': '2 ton',
      'ar': '',
    },
    'ge6uqk95': {
      'en': '4 ton',
      'ar': '',
    },
    'wg92uwv7': {
      'en': '44 rescue transfers',
      'ar': '',
    },
    'ikr8z14a': {
      'en': 'Number*',
      'ar': '',
    },
    '8ovemxd1': {
      'en': 'exact location',
      'ar': '',
    },
    'ct2ndo2d': {
      'en': '*For example, the name of the street or square,\n not the area',
      'ar': '',
    },
    '6fi4d1en': {
      'en': 'Description....',
      'ar': '',
    },
    '38b34et5': {
      'en': 'Submit Form',
      'ar': '',
    },
    'gfb5dhwl': {
      'en': 'Please enter the patients full name.',
      'ar': '',
    },
    '50mvtgt0': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'klg1bd61': {
      'en': 'Please enter an age for the patient.',
      'ar': '',
    },
    '7eye35yj': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '5ecz0d1b': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'sjc3pb33': {
      'en': 'Please enter the date of birth of the patient.',
      'ar': '',
    },
    'p4v9rldb': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '59sadv3d': {
      'en': 'Field is required',
      'ar': ' مطلوب الملء',
    },
    '2c99dtx9': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'i9s80vgl': {
      'en': 'Requests form',
      'ar': '',
    },
    'oz8xu6fs': {
      'en': 'Requests',
      'ar': '',
    },
  },
  // Attendanceofworkers
  {
    's45p1sl7': {
      'en': 'Attendance of workers',
      'ar': '',
    },
    'bhxaaoe1': {
      'en': 'camera scan',
      'ar': '',
    },
    'x80198tf': {
      'en': 'Please scan the code to enter the system',
      'ar': '',
    },
    '49t33a9o': {
      'en': 'Attendance workers',
      'ar': '',
    },
  },
  // Sv_map
  {
    'ez4iftq6': {
      'en': '{Work Area}',
      'ar': '',
    },
    'ftibaqq1': {
      'en': '{General information about the area.}',
      'ar': '',
    },
    'oyb27d5f': {
      'en': 'Tasks',
      'ar': '',
    },
    'fs4l7b0d': {
      'en': 'Start Point',
      'ar': '',
    },
    'w8akfsaj': {
      'en': 'End Point',
      'ar': '',
    },
    '4j1b6o6u': {
      'en': 'Description',
      'ar': '',
    },
    'sx3v4cna': {
      'en':
          '{A beach is a narrow, gently sloping strip of land that lies along the edge of an ocean, lake, or river. Materials such as sand, pebbles, rocks, and seashell fragments cover beaches.}',
      'ar': '',
    },
    'wepzwju4': {
      'en': 'Areas',
      'ar': '',
    },
    'rhza0dpp': {
      'en': '{Streets}',
      'ar': '',
    },
    'ylmj5b75': {
      'en': 'Need',
      'ar': '',
    },
    '3tu7tp4e': {
      'en': '{8}',
      'ar': '',
    },
    '2eomuxjy': {
      'en': '{Streets}',
      'ar': '',
    },
    'nvtyqde2': {
      'en': 'Need',
      'ar': '',
    },
    'vqi1agce': {
      'en': '{8}',
      'ar': '',
    },
    'vgvz2ko8': {
      'en': 'Today\'s Workers List',
      'ar': '',
    },
    'z2ythfe5': {
      'en': 'PDF',
      'ar': '',
    },
    'gmj5aubd': {
      'en': 'You can distribute workers like you want ',
      'ar': '',
    },
    '5mufhngh': {
      'en': '{Street Name}',
      'ar': '',
    },
    'b2im9x3r': {
      'en': 'Due Date',
      'ar': '',
    },
    'uxemoir7': {
      'en': 'Actions',
      'ar': '',
    },
    '68mfjvxi': {
      'en': 'Need : {5}',
      'ar': '',
    },
    'ochnb0cj': {
      'en': 'worker name',
      'ar': '',
    },
    'sd4331bz': {
      'en': 'Search for an item...',
      'ar': '',
    },
    '9j6p7t6e': {
      'en': 'Randy Peterson',
      'ar': '',
    },
    'vj8i9xkx': {
      'en': '#2008',
      'ar': '',
    },
    'x9r3js2a': {
      'en': 'Fri. Aug 11th',
      'ar': '',
    },
    'j72fmf3l': {
      'en': 'Car',
      'ar': '',
    },
    'ex3s6xvs': {
      'en': 'worker',
      'ar': '',
    },
    '5r3fdcq2': {
      'en': 'Search for an item...',
      'ar': '',
    },
    'y8nwm4ox': {
      'en': 'worker',
      'ar': '',
    },
    'givs8cpr': {
      'en': 'Search for an item...',
      'ar': '',
    },
    'ibq61164': {
      'en': 'Al Rahma',
      'ar': '',
    },
    'wn4dmqi8': {
      'en': 'Working Area',
      'ar': '',
    },
    '3odgey11': {
      'en': 'Working Area',
      'ar': '',
    },
  },
  // AttendenceofSupervisor
  {
    'un5c2em0': {
      'en': 'camera scan',
      'ar': '',
    },
    '1mncq6a6': {
      'en': 'Please scan the code to enter the system',
      'ar': '',
    },
    'd1io63q4': {
      'en': 'Attendence of supervisor',
      'ar': '',
    },
    '8uw3qbjb': {
      'en': 'Home',
      'ar': '',
    },
  },
  // loggingout_for_supervisor
  {
    '0qe72sby': {
      'en': 'camera scan',
      'ar': '',
    },
    '98y2lu2a': {
      'en': 'Please scan the code to logout from the system',
      'ar': '',
    },
    '0jzyuw1b': {
      'en': 'Loggingout For Supervisor',
      'ar': '',
    },
    'dqki1ron': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Submitting_complaints
  {
    'zr0c63b9': {
      'en': 'Inspector Name',
      'ar': '',
    },
    'iyqb6m0k': {
      'en': 'superviser',
      'ar': '',
    },
    'f80uyqpf': {
      'en': 'ID: #1520',
      'ar': '',
    },
    'cw5lt8ov': {
      'en': '8h',
      'ar': '',
    },
    'sbn6rj2y': {
      'en': 'Leaving Work',
      'ar': '',
    },
    'lr60dler': {
      'en': 'Negligence at Work',
      'ar': '',
    },
    'ykblzrmg': {
      'en': 'Insult and Slander',
      'ar': '',
    },
    'l8benbiz': {
      'en': 'Assault by beating',
      'ar': '',
    },
    'bn3k4bym': {
      'en': 'Negligence in the tools',
      'ar': '',
    },
    'j01hmmfv': {
      'en': 'Unclean uniform',
      'ar': '',
    },
    'di1h86r1': {
      'en': 'Reason..',
      'ar': '',
    },
    'yu0wzol0': {
      'en': 'Search for an item...',
      'ar': '',
    },
    'dkdcu4hu': {
      'en': 'Details',
      'ar': '',
    },
    'f7ikp5m1': {
      'en': 'Upload Screenshot',
      'ar': '',
    },
    '3lr7t518': {
      'en': 'Maximum 3 img/jpg',
      'ar': '',
    },
    '2xu9ygjm': {
      'en': 'Make Complain',
      'ar': '',
    },
    'uqcv56iy': {
      'en': 'Submitting complaints',
      'ar': '',
    },
    'y7jsl6me': {
      'en': 'Home',
      'ar': '',
    },
  },
  // DailyReport
  {
    'mqzuik7c': {
      'en': 'Daily report on the state of general cleanliness of the area',
      'ar': 'تقرير يومي عن حالة النظافة العامة بالمنطقة',
    },
    '7r8sy0rv': {
      'en': 'Sweep Condition',
      'ar': 'حالة الكنس العامة',
    },
    'uo9spag1': {
      'en':
          'When writing the general condition of manual street sweeping, it means the main and internal streets of the sector',
      'ar':
          'عند كتابة الحالة العامة للكنس اليدوية للشوارع يقصد بها الشوارع الرئيسية والداخلية للقطاع',
    },
    'wlsslet6': {
      'en': 'Sweep Condition',
      'ar': 'حالة الكنس',
    },
    'ple75jy6': {
      'en': 'Dust Stripping Condition',
      'ar': 'حالة تجريد الأتربة',
    },
    '98n4czvg': {
      'en':
          'When writing the general status of the abstraction, it includes what has been done and what has not been done, with a periodic plan to get rid of dust in the sector.',
      'ar':
          'عند كتابة الوضع العام للتجريد يتضمن ما تم وما لم يتم مع وجود خطة دورية للتخلص من الأتربة الموجوده بالقطاع.',
    },
    'm5iukeo5': {
      'en': 'Dust Stripping Condition',
      'ar': 'حالة تجريد الأتربة',
    },
    'b0urv28f': {
      'en': 'Waste Removal Condition',
      'ar': 'حالة إزالة النفايات',
    },
    'wjz5ncsi': {
      'en':
          'When writing the general status of waste removal, what has been removed, what has been transferred to the next shift, and what has not been removed yet are written.',
      'ar':
          'عند كتابة الوضع العام لإزالة النفايات يتم كتابة ما تم إزالته وما تم نقله إلى الوردية التالية وما لم تتم إزالته بعد.',
    },
    '272wrwts': {
      'en': 'Waste Removal Condition',
      'ar': 'حالة إزالة النفايات',
    },
    'xh1dh0ip': {
      'en': 'Section Needs',
      'ar': 'احتياجات القطاع',
    },
    'yrsi5idt': {
      'en':
          'When writing the general situation of the sector’s needs, the necessary measures are taken from several needs specific to the worker, uniform, etc',
      'ar':
          'عند كتابة الوضع العام لاحتياجات القطاع يتم اتخاذ الإجراءات اللازمة من عدة احتياجات خاصة بالعامل والزي وغيره',
    },
    'gztyiubk': {
      'en': 'Section Needs',
      'ar': 'احتياجات القطاع',
    },
    'jpk5beho': {
      'en': 'A State of increased hostility of al kinds',
      'ar': 'حالة زيادة المعدات بجميع انواعها',
    },
    '6k03qci9': {
      'en':
          'When writing the general condition for increasing equipment, all types of equipment are included (Buck - car: 4 tons - 2 tons, car 44 rescue transport',
      'ar':
          'عند كتابة الحالة العامة لزيادة المعدات يتم إدراج جميع أنواع المعدات (بوك - سيارة 4 طن - سيارة 2 طن - سيارة 44 نقل الإنقاذ)',
    },
    'x3muxegg': {
      'en': 'A State of increased hostility of al kinds',
      'ar': 'حالة زيادة المعدات بجميع انواعها',
    },
    'kzbcmh4u': {
      'en': 'Submit Report',
      'ar': 'إرسال التقرير',
    },
    'aefx3rd8': {
      'en': ' Would you like to leave? ',
      'ar': 'هل ترغب في الذهاب؟',
    },
    'w9025lb9': {
      'en': 'logout',
      'ar': 'تسجيل خروج',
    },
    'ojc39eec': {
      'en': 'Daily Report',
      'ar': '',
    },
    'afp5v6h1': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Submitting_personal_requests
  {
    'wxrl1381': {
      'en': '0',
      'ar': '',
    },
    'p4uuen8w': {
      'en': 'select personal request',
      'ar': '',
    },
    'hf1k8c3e': {
      'en': 'Search for an item...',
      'ar': '',
    },
    'ycsft9se': {
      'en': 'Details',
      'ar': '',
    },
    '4ap4cl3y': {
      'en': 'Upload Screenshot',
      'ar': '',
    },
    '6tk2f14z': {
      'en': 'Maximum 3 img/jpg',
      'ar': '',
    },
    'ruu94by6': {
      'en': 'Make request',
      'ar': '',
    },
    'uwzv9pi7': {
      'en': 'PLeasr Fill in the detials of the complain',
      'ar': '',
    },
    'f5llausz': {
      'en': 'Please fill in all the required Info',
      'ar': '',
    },
    'a76r88ew': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    's68mwluq': {
      'en': 'Submitting personal requests',
      'ar': '',
    },
  },
  // Taskdetails
  {
    'zg9ylgih': {
      'en': '{Task Area}',
      'ar': '',
    },
    'ebatp1zh': {
      'en': '{General information about the area.}',
      'ar': '',
    },
    '7jwop0dm': {
      'en': 'Tasks',
      'ar': '',
    },
    '8eayl07z': {
      'en': 'Start Point',
      'ar': '',
    },
    'cr8055qh': {
      'en': 'End Point',
      'ar': '',
    },
    'nrty5alo': {
      'en': 'Description',
      'ar': '',
    },
    '4mx9l0rp': {
      'en':
          '{A beach is a narrow, gently sloping strip of land that lies along the edge of an ocean, lake, or river. Materials such as sand, pebbles, rocks, and seashell fragments cover beaches.}',
      'ar': '',
    },
    'xanuoi83': {
      'en': 'Today\'s Workers',
      'ar': '',
    },
    '9v5apylh': {
      'en': 'Due Date',
      'ar': '',
    },
    '22eb2j9h': {
      'en': 'Actions',
      'ar': '',
    },
    'ry7v71pc': {
      'en': 'Randy Peterson',
      'ar': '',
    },
    'v29dvb1c': {
      'en': '#2008',
      'ar': '',
    },
    '6b5jb40e': {
      'en': 'Fri. Aug 11th',
      'ar': '',
    },
    's88ljdn3': {
      'en': 'Car',
      'ar': '',
    },
    'r5za8r6v': {
      'en': 'worker',
      'ar': '',
    },
    'o39cebb2': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'rhkhgjxv': {
      'en': 'Randy Peterson',
      'ar': '',
    },
    'sctpdhof': {
      'en': '#2008',
      'ar': '',
    },
    'bsw3e89i': {
      'en': 'Fri. Aug 11th',
      'ar': '',
    },
    '2b6vf2py': {
      'en': 'Car',
      'ar': '',
    },
    'srfnbxfp': {
      'en': 'worker',
      'ar': '',
    },
    '47jvouug': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'ga09kej3': {
      'en': 'Randy Peterson',
      'ar': '',
    },
    '19zk9zuq': {
      'en': '#2008',
      'ar': '',
    },
    'gqi1f22x': {
      'en': 'Fri. Aug 11th',
      'ar': '',
    },
    'mhdpv53u': {
      'en': 'Car',
      'ar': '',
    },
    '1svdwnky': {
      'en': 'worker',
      'ar': '',
    },
    'nij3nbsr': {
      'en': 'Search for an item...',
      'ar': '',
    },
    '04ee2bqs': {
      'en': 'Upload Screenshot',
      'ar': '',
    },
    'fa6nvb27': {
      'en': 'Maximum 3 img/jpg',
      'ar': '',
    },
    'pk9qzrbg': {
      'en': 'submit',
      'ar': '',
    },
    'tr4gjg97': {
      'en': 'Task Details',
      'ar': '',
    },
    '7vkdg2mk': {
      'en': 'Home',
      'ar': '',
    },
  },
  // loggingout_for_Workers
  {
    '6yo7yalg': {
      'en': 'camera scan',
      'ar': '',
    },
    'tbgfks6y': {
      'en': 'Please scan the code to logout from the system',
      'ar': '',
    },
    '6s7gy0ot': {
      'en': 'Loggingout For Workers',
      'ar': '',
    },
    'n60z609v': {
      'en': 'Home',
      'ar': '',
    },
  },
  // workers_review
  {
    'zu360fbx': {
      'en': 'Inspector Name',
      'ar': '',
    },
    '1hy8col7': {
      'en': 'superviser',
      'ar': '',
    },
    'jenthgkx': {
      'en': 'ID: #1520',
      'ar': '',
    },
    'vt96rrvg': {
      'en': '8h',
      'ar': '',
    },
    '5915fyrp': {
      'en': 'Answer the call',
      'ar': '',
    },
    'dq04wzzt': {
      'en': 'Street cleanliness',
      'ar': '',
    },
    '19e4sfl3': {
      'en': 'manner with supervisor',
      'ar': '',
    },
    'prci80vl': {
      'en': 'Removing ',
      'ar': '',
    },
    '4i48ykt5': {
      'en': 'to lift',
      'ar': '',
    },
    '2vzwbehr': {
      'en': 'wash',
      'ar': '',
    },
    'fh2487yn': {
      'en': 'make a complaint?',
      'ar': '',
    },
    'konxwuux': {
      'en': 'submit',
      'ar': '',
    },
    'e34iw7co': {
      'en': 'Worker Review',
      'ar': '',
    },
    '84ldmo4n': {
      'en': 'Home',
      'ar': '',
    },
  },
  // DetailsArea
  {
    'zb9gzumn': {
      'en': 'Feb 8th',
      'ar': '',
    },
    'ndxgxzwk': {
      'en': 'Wednesday',
      'ar': '',
    },
    'yzw3otr5': {
      'en': 'FlutterFlow Design Basics',
      'ar': '',
    },
    '86u9zq2v': {
      'en': 'Class Details',
      'ar': '',
    },
    'x04kuyle': {
      'en':
          'Experience the power of Supabase\'s real-time database and authentication services combined with intuitive visual design using FlutterFlow, significantly simplifying the app development process while delivering feature-rich, high-performance applications. This integration makes it possible to create visually stunning, data-driven apps with ease and speed.',
      'ar': '',
    },
    'blftl4d7': {
      'en': 'Class Content',
      'ar': '',
    },
    'e1hust3b': {
      'en': 'Intro to UX Design',
      'ar': '',
    },
    '9v78p4dh': {
      'en': 'A short history into what UX design is and the history of it.',
      'ar': '',
    },
    'r51alx42': {
      'en': '8 mins',
      'ar': '',
    },
    'ap79nlir': {
      'en': 'Intro to UX Design',
      'ar': '',
    },
    '06edzwak': {
      'en': 'A short history into what UX design is and the history of it.',
      'ar': '',
    },
    'v6hr1fq4': {
      'en': '8 mins',
      'ar': '',
    },
    '862w1bfq': {
      'en': 'Intro to UX Design',
      'ar': '',
    },
    'tmxknggk': {
      'en': 'A short history into what UX design is and the history of it.',
      'ar': '',
    },
    'nky279c7': {
      'en': '8 mins',
      'ar': '',
    },
    'dw52drdj': {
      'en': 'Intro to UX Design',
      'ar': '',
    },
    '2gv1jwm3': {
      'en': 'A short history into what UX design is and the history of it.',
      'ar': '',
    },
    '1pluzgq8': {
      'en': '8 mins',
      'ar': '',
    },
    '911rb2xf': {
      'en': 'Enroll in Class',
      'ar': '',
    },
    'sdkfg2gc': {
      'en': 'Favorite Class',
      'ar': '',
    },
    'qve8sti1': {
      'en': 'Home',
      'ar': 'الصفحه الرئيسيه',
    },
  },
  // Tm_Home
  {
    'ttjcsrzi': {
      'en': 'Al Rahma',
      'ar': '',
    },
    'mhy2yg3f': {
      'en': 'Traffic management',
      'ar': '',
    },
    '5ramxson': {
      'en': 'Hello,',
      'ar': '',
    },
    '2jv2y9vp': {
      'en': 'servicing report',
      'ar': '',
    },
    '7iiblxym': {
      'en': 'Add movement',
      'ar': '',
    },
    'j8cmh55u': {
      'en': ' Requests\n',
      'ar': '',
    },
    'clz7l79f': {
      'en': 'Powerd by Omar-s Team',
      'ar': '',
    },
    'oo4equt8': {
      'en': '__',
      'ar': '',
    },
  },
  // Create04Task
  {
    'mu64sntu': {
      'en': 'Task...',
      'ar': '',
    },
    'e30fd8du': {
      'en': 'Description...',
      'ar': '',
    },
    's6io14mx': {
      'en': 'Add tags',
      'ar': '',
    },
    'oi935hqc': {
      'en': 'Product Design',
      'ar': '',
    },
    'ur0862y5': {
      'en': 'FlutterFlow',
      'ar': '',
    },
    'i32cf96v': {
      'en': 'UI Design',
      'ar': '',
    },
    'bhdu6akd': {
      'en': 'Web Design',
      'ar': '',
    },
    'gwu2kh8g': {
      'en': 'Product Design',
      'ar': '',
    },
    't1waumtm': {
      'en': 'Due Date',
      'ar': '',
    },
    'd2yt0omw': {
      'en': 'Get Started',
      'ar': '',
    },
    '8qe6isgb': {
      'en': 'Create Task',
      'ar': '',
    },
    'mnz2jhha': {
      'en': 'Please fill out the form below to continue.',
      'ar': '',
    },
    'do2jph4l': {
      'en': 'Home',
      'ar': '',
    },
  },
  // movment
  {
    'x9vapwtu': {
      'en': 'motocycle',
      'ar': '',
    },
    'zia5wmfv': {
      'en': 'true cycle',
      'ar': '',
    },
    'smd9d7b9': {
      'en': 'The Truck',
      'ar': '',
    },
    'svx1zzyt': {
      'en': 'Search for an item...',
      'ar': '',
    },
    '0wybuh87': {
      'en': 'driver1',
      'ar': '',
    },
    '5pabmors': {
      'en': 'driver2',
      'ar': '',
    },
    'kfr4bwp5': {
      'en': 'driver3',
      'ar': '',
    },
    'aalfmvcg': {
      'en': 'The Driver',
      'ar': '',
    },
    'ag69gso8': {
      'en': 'Search for an item...',
      'ar': '',
    },
    'yu0x4g3k': {
      'en': '123 | م ن ص ',
      'ar': '',
    },
    '7m4y6379': {
      'en': '127 | م ن ص ',
      'ar': '',
    },
    'ora15h7c': {
      'en': '134 | م ن ص ',
      'ar': '',
    },
    'ezhqnpk5': {
      'en': '143 | م ن ص ',
      'ar': '',
    },
    'afzp9966': {
      'en': '936 | ل ن ص ',
      'ar': '',
    },
    '7h85una5': {
      'en': '938 | ل ن ص ',
      'ar': '',
    },
    'nuiz1nft': {
      'en': '942 | ل ن ص ',
      'ar': '',
    },
    'dxw5ffpm': {
      'en': '943 | ل ن ص ',
      'ar': '',
    },
    '685xvyjx': {
      'en': '964 | ل ن ص ',
      'ar': '',
    },
    'c8q4pf0w': {
      'en': '987 | ل ن ص ',
      'ar': '',
    },
    'u9fb727w': {
      'en': 'Tricycle',
      'ar': '',
    },
    'hz7xeawl': {
      'en': 'Search for an item...',
      'ar': '',
    },
    'dym09nuy': {
      'en': '936 | ل ن ص ',
      'ar': '',
    },
    'kjw16xyi': {
      'en': '..',
      'ar': '',
    },
    '0iqxia66': {
      'en': 'Motocycle',
      'ar': '',
    },
    'ira6s34r': {
      'en': 'Search for an item...',
      'ar': '',
    },
    'pe7viyok': {
      'en': 'Details',
      'ar': '',
    },
    '3xgek4pu': {
      'en': 'Done',
      'ar': '',
    },
    'n2pwke1e': {
      'en': 'Adding Movement !',
      'ar': '',
    },
    'z5xo7c6b': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Add_servicingreport
  {
    '7a13kl4g': {
      'en': 'motocycle',
      'ar': '',
    },
    'frjmbwmk': {
      'en': 'true cycle',
      'ar': '',
    },
    'ioyfj7od': {
      'en': 'The Truck',
      'ar': '',
    },
    'f0ks9a3r': {
      'en': 'Search for an item...',
      'ar': '',
    },
    '3tkugylh': {
      'en': 'driver1',
      'ar': '',
    },
    '24dubdc8': {
      'en': 'driver2',
      'ar': '',
    },
    'htbhljiu': {
      'en': 'driver3',
      'ar': '',
    },
    'ogo4tyx6': {
      'en': 'Mechanical',
      'ar': '',
    },
    'a257llc2': {
      'en': 'Search for an item...',
      'ar': '',
    },
    'oh6ocqr5': {
      'en': '123 | م ن ص ',
      'ar': '',
    },
    'umj4dnz2': {
      'en': '127 | م ن ص ',
      'ar': '',
    },
    '0lgh9jn2': {
      'en': '134 | م ن ص ',
      'ar': '',
    },
    'org8s2dl': {
      'en': '143 | م ن ص ',
      'ar': '',
    },
    'v6xvv5pp': {
      'en': '936 | ل ن ص ',
      'ar': '',
    },
    'rw6j9s3n': {
      'en': '938 | ل ن ص ',
      'ar': '',
    },
    'zl3oyy3f': {
      'en': '942 | ل ن ص ',
      'ar': '',
    },
    's9ez23pe': {
      'en': '943 | ل ن ص ',
      'ar': '',
    },
    'tkq5fhgs': {
      'en': '964 | ل ن ص ',
      'ar': '',
    },
    'pvad9ayd': {
      'en': '987 | ل ن ص ',
      'ar': '',
    },
    'fpsk3lfx': {
      'en': 'Tricycle',
      'ar': '',
    },
    'yi0mupst': {
      'en': 'Search for an item...',
      'ar': '',
    },
    'fikhx5ie': {
      'en': 'Total price :',
      'ar': '',
    },
    'i7l74eky': {
      'en': '...........',
      'ar': '',
    },
    'n40p0sl5': {
      'en': 'Details',
      'ar': '',
    },
    'vm7iv8uh': {
      'en': 'Done',
      'ar': '',
    },
    'qra1mrrw': {
      'en': 'servicing report !',
      'ar': '',
    },
    'mhn69er9': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Tm_List_Requests
  {
    '5jwjbaz7': {
      'en': 'Active Requests : {12} ',
      'ar': '',
    },
    '1ge5y561': {
      'en': 'Pending',
      'ar': '',
    },
    '98akjcqy': {
      'en': '{Sv Name}',
      'ar': '',
    },
    '8o2snr1w': {
      'en': 'View',
      'ar': '',
    },
    '0jg2k6yl': {
      'en': '{Leader 5} | {Maadi}',
      'ar': '',
    },
    '1ygzw5rp': {
      'en': '{Details}',
      'ar': '',
    },
    'xc9pfwev': {
      'en': 'Truesicly',
      'ar': '',
    },
    '6zucelhn': {
      'en': 'Due',
      'ar': '',
    },
    '4mkmu4fp': {
      'en': 'Tuesday, 10:00am',
      'ar': '',
    },
    'cegnnv7t': {
      'en': 'In Progress',
      'ar': '',
    },
    'xk1chcp4': {
      'en': '{Sv Name}',
      'ar': '',
    },
    'ume75mu0': {
      'en': 'View',
      'ar': '',
    },
    '7brc8mrr': {
      'en': '{Leader 5} | {Maadi}',
      'ar': '',
    },
    'rn328ijr': {
      'en': '{Details}',
      'ar': '',
    },
    '6tyydwpj': {
      'en': 'Truesicly',
      'ar': '',
    },
    'q90p1knc': {
      'en': 'Due',
      'ar': '',
    },
    'nxzf6nho': {
      'en': 'Tuesday, 10:00am',
      'ar': '',
    },
    'tedllljo': {
      'en': 'In Progress',
      'ar': '',
    },
    's5gzruzl': {
      'en': 'Completed',
      'ar': '',
    },
    'vwxaucc9': {
      'en': '{Sv Name}',
      'ar': '',
    },
    '4x9t2r3h': {
      'en': '{Leader 5} | {Maadi}',
      'ar': '',
    },
    'zba47is3': {
      'en': 'Create template screen for task todo app.',
      'ar': '',
    },
    'mb7feii0': {
      'en': 'Truesicly',
      'ar': '',
    },
    '9w3xnifp': {
      'en': 'Driver name',
      'ar': '',
    },
    'gzzzmjc8': {
      'en': 'Tuesday, 10:00am',
      'ar': '',
    },
    '1mh327c9': {
      'en': 'Completed',
      'ar': '',
    },
    '9gjw61m7': {
      'en': '{Sv Name}',
      'ar': '',
    },
    'zenjy83w': {
      'en': 'Traffic Manager | Errands',
      'ar': '',
    },
    'fpjskrvs': {
      'en': 'Create template screen for task todo app.',
      'ar': '',
    },
    'plyh38hw': {
      'en': 'Truesicly',
      'ar': '',
    },
    'fm97i9uy': {
      'en': 'Driver name',
      'ar': '',
    },
    '4w0ftt3g': {
      'en': 'Tuesday, 10:00am',
      'ar': '',
    },
    'kmmlhg1u': {
      'en': 'Completed',
      'ar': '',
    },
    'ltsbyy48': {
      'en': 'Export PDF',
      'ar': '',
    },
    'btxf0k44': {
      'en': 'Report on errands and motorcycle movement',
      'ar': '',
    },
    'g17fmf21': {
      'en': 'All Requests',
      'ar': '',
    },
    '7r9wb1u4': {
      'en': 'Tasks',
      'ar': '',
    },
  },
  // Tm_Task_Discription
  {
    'utbn2jvm': {
      'en': '{Sv Name}',
      'ar': '',
    },
    '3g0cfbml': {
      'en': '{Leader 5} | {Maadi}',
      'ar': '',
    },
    'i16xuzen': {
      'en': 'Due',
      'ar': '',
    },
    'b68fnzl7': {
      'en': 'In Progress',
      'ar': 'في مرحله التشغيل',
    },
    'a600nrfk': {
      'en': 'Tuesday, 10:00am',
      'ar': '',
    },
    'rzroif9e': {
      'en': 'Discription',
      'ar': '',
    },
    'yiqe28er': {
      'en': 'ST',
      'ar': '',
    },
    'bgqgriii': {
      'en': '15',
      'ar': '',
    },
    'xa2nozcq': {
      'en': 'KIND OF CAR',
      'ar': '',
    },
    'snalz0mi': {
      'en': 'Truci',
      'ar': '',
    },
    'v4v2o423': {
      'en': 'Discription',
      'ar': '',
    },
    '80uy1gjc': {
      'en':
          'hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhcompanyname.co',
      'ar': '',
    },
    'ap9dn0r8': {
      'en': 'Asghin Driver & Area',
      'ar': '',
    },
    'bpmv1nkh': {
      'en': 'motocycle',
      'ar': '',
    },
    'k8pynclf': {
      'en': 'true cycle',
      'ar': '',
    },
    'dj4fv7ye': {
      'en': 'The Truck',
      'ar': '',
    },
    'tjvovdn2': {
      'en': 'Search for an item...',
      'ar': '',
    },
    'zj9mdihv': {
      'en': 'driver1',
      'ar': '',
    },
    'oibggz4a': {
      'en': 'driver2',
      'ar': '',
    },
    'jxomncy2': {
      'en': 'driver3',
      'ar': '',
    },
    'h4p61aih': {
      'en': 'The Driver',
      'ar': '',
    },
    'pnme5x46': {
      'en': 'Search for an item...',
      'ar': '',
    },
    'bdqkvrqi': {
      'en': '123 | م ن ص ',
      'ar': '',
    },
    'aj672dy3': {
      'en': '127 | م ن ص ',
      'ar': '',
    },
    'hbd3g4ro': {
      'en': '134 | م ن ص ',
      'ar': '',
    },
    'l6os2yt9': {
      'en': '143 | م ن ص ',
      'ar': '',
    },
    'n3ulb91y': {
      'en': '936 | ل ن ص ',
      'ar': '',
    },
    'uhih9rb3': {
      'en': '938 | ل ن ص ',
      'ar': '',
    },
    'kw1xzqoo': {
      'en': '942 | ل ن ص ',
      'ar': '',
    },
    'zy07rhtq': {
      'en': '943 | ل ن ص ',
      'ar': '',
    },
    '8b717lgx': {
      'en': '964 | ل ن ص ',
      'ar': '',
    },
    '9tontz6w': {
      'en': '987 | ل ن ص ',
      'ar': '',
    },
    'isvi0gkv': {
      'en': 'Tricycle',
      'ar': '',
    },
    'wasdiuiz': {
      'en': 'Search for an item...',
      'ar': '',
    },
    'aynxxi43': {
      'en': 'Mark as Complete',
      'ar': '',
    },
    '4eqbjzu4': {
      'en': 'Home',
      'ar': '',
    },
  },
  // ServicingDiscription
  {
    'xi7lfxbs': {
      'en': 'The Truck',
      'ar': '',
    },
    'yuw4cnwn': {
      'en': 'Mechanical',
      'ar': '',
    },
    '3zmj57zv': {
      'en': 'tricycle',
      'ar': '',
    },
    'u885ljfw': {
      'en': 'Total price :',
      'ar': '',
    },
    '4okytpln': {
      'en': 'L.E',
      'ar': '',
    },
    'al9ftujl': {
      'en': 'Details',
      'ar': '',
    },
    's0yk1dgb': {
      'en': 'Export PDF',
      'ar': '',
    },
    '1981rbb3': {
      'en': 'Servicing Discription',
      'ar': '',
    },
    'xbbj12zh': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Tm_List_Fixing
  {
    'r138awnv': {
      'en': 'Total Fixing Reports : {12} ',
      'ar': '',
    },
    'j1iyh2qi': {
      'en': 'Truesicly',
      'ar': '',
    },
    'rd3gvxtw': {
      'en': 'View',
      'ar': '',
    },
    'nascr4hr': {
      'en': ' م ن ص | 127',
      'ar': '',
    },
    'cqdp8lhd': {
      'en': '{Details}',
      'ar': '',
    },
    'dqr1b7ea': {
      'en': 'mechanical name',
      'ar': '',
    },
    'mvjeo69g': {
      'en': 'Tuesday, 10:00am',
      'ar': '',
    },
    'q0k5k7xp': {
      'en': '500 L.E',
      'ar': '',
    },
    'ln27oahb': {
      'en': 'Export PDF',
      'ar': '',
    },
    'yq2uhgp7': {
      'en': 'List of Fixing Reports',
      'ar': '',
    },
    '0btmtwv4': {
      'en': 'Tasks',
      'ar': '',
    },
  },
  // Form_for_LatedTask
  {
    'jg7032jt': {
      'en': 'Leaving Work',
      'ar': '',
    },
    '5vawmn2q': {
      'en': 'Negligence at Work',
      'ar': '',
    },
    'k2y0nuz9': {
      'en': 'Insult and Slander',
      'ar': '',
    },
    'l85xivlk': {
      'en': 'Assault by beating',
      'ar': '',
    },
    'y48zb23i': {
      'en': 'Negligence in the tools',
      'ar': '',
    },
    'kyeksdx3': {
      'en': 'Unclean uniform',
      'ar': '',
    },
    'v77lyi3o': {
      'en': 'Reason..',
      'ar': '',
    },
    'br841o1f': {
      'en': 'Search for an item...',
      'ar': '',
    },
    '83kgyw5v': {
      'en': 'Details',
      'ar': '',
    },
    'cijgbzk6': {
      'en': 'Upload Screenshot',
      'ar': '',
    },
    'o8y5zdb7': {
      'en': 'Maximum 3 img/jpg',
      'ar': '',
    },
    'ua4vmg0l': {
      'en': 'Make Complain',
      'ar': '',
    },
    'cjgwmno4': {
      'en': 'Submitting complaints',
      'ar': '',
    },
    'oq3skcry': {
      'en': 'Home',
      'ar': '',
    },
  },
  // TaskdetailsCopy
  {
    'n1tlb0gp': {
      'en': '{Task Area}',
      'ar': '',
    },
    'hwjnaan8': {
      'en': '{General information about the area.}',
      'ar': '',
    },
    '5w7be2nm': {
      'en': 'Tasks',
      'ar': '',
    },
    'tnb65x9m': {
      'en': 'Start Point',
      'ar': '',
    },
    '01tw8lkz': {
      'en': 'End Point',
      'ar': '',
    },
    'ptcgp792': {
      'en': 'Description',
      'ar': '',
    },
    'lnjpxv5a': {
      'en':
          '{A beach is a narrow, gently sloping strip of land that lies along the edge of an ocean, lake, or river. Materials such as sand, pebbles, rocks, and seashell fragments cover beaches.}',
      'ar': '',
    },
    '3dy7kavg': {
      'en': 'Today\'s Workers',
      'ar': '',
    },
    'x7xgz9oh': {
      'en': 'Due Date',
      'ar': '',
    },
    'cp9humra': {
      'en': 'Actions',
      'ar': '',
    },
    'gh3z1e6u': {
      'en': 'Randy Peterson',
      'ar': '',
    },
    'fyg9qbie': {
      'en': '#2008',
      'ar': '',
    },
    'a2a77mea': {
      'en': 'Fri. Aug 11th',
      'ar': '',
    },
    'g8yjr6su': {
      'en': 'Car',
      'ar': '',
    },
    'xd5kmrp2': {
      'en': 'worker',
      'ar': '',
    },
    'ni2rb8pu': {
      'en': 'Search for an item...',
      'ar': '',
    },
    '70w869uu': {
      'en': 'Randy Peterson',
      'ar': '',
    },
    '2i5s47pw': {
      'en': '#2008',
      'ar': '',
    },
    '0x6ee3pf': {
      'en': 'Fri. Aug 11th',
      'ar': '',
    },
    'fv1tda3d': {
      'en': 'Car',
      'ar': '',
    },
    '3s03rpek': {
      'en': 'worker',
      'ar': '',
    },
    '33h2dh1m': {
      'en': 'Search for an item...',
      'ar': '',
    },
    'xs6e3wvn': {
      'en': 'Randy Peterson',
      'ar': '',
    },
    'sdyryprt': {
      'en': '#2008',
      'ar': '',
    },
    'waobqm81': {
      'en': 'Fri. Aug 11th',
      'ar': '',
    },
    'nctq4an9': {
      'en': 'Car',
      'ar': '',
    },
    'lgmztent': {
      'en': 'worker',
      'ar': '',
    },
    '1z59pjzc': {
      'en': 'Search for an item...',
      'ar': '',
    },
    'pbg3g1vi': {
      'en': 'Upload Screenshot',
      'ar': '',
    },
    'sj073f9z': {
      'en': 'Maximum 3 img/jpg',
      'ar': '',
    },
    '2s2lg07w': {
      'en': 'submit',
      'ar': '',
    },
    '1oyt1p3m': {
      'en': 'Task Details',
      'ar': '',
    },
    '2xwzh6tb': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Sv_RequestsCopy
  {
    'u3glddcb': {
      'en': '{Sv Name}',
      'ar': '',
    },
    '431h54gy': {
      'en': 'View',
      'ar': '',
    },
    'nyqdi7a0': {
      'en': '{Leader 5}  | {Maadi}',
      'ar': '',
    },
    '2a1tr5rp': {
      'en': '{Details}',
      'ar': '',
    },
    'c120pjv2': {
      'en': 'Truesicly',
      'ar': '',
    },
    'g7vvr5qc': {
      'en': 'Due',
      'ar': '',
    },
    '8mrn7yp7': {
      'en': 'Tuesday, 10:00am',
      'ar': '',
    },
    'm6btcpn6': {
      'en': 'In Progress',
      'ar': '',
    },
    'qgbxpf4q': {
      'en': '*Please fill out the form below to continue.',
      'ar': '',
    },
    '7ie23c8a': {
      'en': 'Car',
      'ar': '',
    },
    'tutad2af': {
      'en': 'TRICYCLE',
      'ar': '',
    },
    'utc8oa3d': {
      'en': 'Extra workers',
      'ar': '',
    },
    '53ktuigb': {
      'en': 'Select one...',
      'ar': '',
    },
    'sxss7eo9': {
      'en': 'Search for an item...',
      'ar': '',
    },
    'w67lwykm': {
      'en': 'bock',
      'ar': '',
    },
    'sme1oosc': {
      'en': '2 ton',
      'ar': '',
    },
    '19uu17i8': {
      'en': '4 ton',
      'ar': '',
    },
    'osv05ojg': {
      'en': '44 rescue transfers',
      'ar': '',
    },
    '5dtxblee': {
      'en': 'Number*',
      'ar': '',
    },
    '3q91vp9e': {
      'en': 'exact location',
      'ar': '',
    },
    'f7flxhs0': {
      'en': '*For example, the name of the street or square,\n not the area',
      'ar': '',
    },
    't3wgozyw': {
      'en': 'Description....',
      'ar': '',
    },
    'ibzwy3eg': {
      'en': 'Submit Form',
      'ar': '',
    },
    'vfh710oc': {
      'en': 'Please enter the patients full name.',
      'ar': '',
    },
    'g0t5b82n': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'cbwncork': {
      'en': 'Please enter an age for the patient.',
      'ar': '',
    },
    't0bh1zlv': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'uatogsc0': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '2z99u79b': {
      'en': 'Please enter the date of birth of the patient.',
      'ar': '',
    },
    'hzhpxc26': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'jr6dlo1x': {
      'en': 'Field is required',
      'ar': '',
    },
    'pjtzalo9': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '2cq9e1rv': {
      'en': 'Requests form',
      'ar': '',
    },
    'swvnkt03': {
      'en': 'Requests',
      'ar': '',
    },
  },
  // Header03TaskSummary
  {
    'xmcgc7jp': {
      'en': 'Al Rahma',
      'ar': 'الرحمة',
    },
    'ro6b7btx': {
      'en': 'Warehouse management',
      'ar': 'إدارة المستودعات',
    },
    'ck38isne': {
      'en': 'Hello,',
      'ar': 'مرحبًا،',
    },
    'g65qy9e8': {
      'en': 'حاتم',
      'ar': 'حاتم',
    },
    '6in2m23z': {
      'en': 'Goals',
      'ar': 'الأهداف',
    },
    'w53ruq50': {
      'en': 'Daily tracker',
      'ar': 'تعقب يومي',
    },
    'a4vpvhyt': {
      'en': '5',
      'ar': '5',
    },
    '43pj9wyu': {
      'en': 'Update Task',
      'ar': 'مهمة التحديث',
    },
    '887ah2ed': {
      'en': 'Incomplete',
      'ar': 'غير مكتمل',
    },
    'r22a4fxl': {
      'en': 'Complete',
      'ar': 'مكتمل',
    },
    'f11txnma': {
      'en': 'In Progress',
      'ar': 'في تَقَدم',
    },
    'qszk8oe8': {
      'en': 'Other',
      'ar': 'آخر',
    },
    'z0qcll1a': {
      'en': 'Update',
      'ar': 'تحديث',
    },
    'm5at118t': {
      'en': 'Type here to respond...',
      'ar': 'اكتب هنا للرد...',
    },
    'qmp6e3ui': {
      'en': 'Post',
      'ar': 'بريد',
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
      'ar': 'الشاتات',
    },
    '5mg1we84': {
      'en': 'Working Area',
      'ar': '',
    },
    '6tbl288i': {
      'en': 'Requests',
      'ar': '',
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
    's2qfbnvm': {
      'en': 'Chats',
      'ar': '',
    },
    'k25ioo4n': {
      'en': 'Chats',
      'ar': '',
    },
    'i663n5fu': {
      'en': 'Log Out',
      'ar': 'الخروج',
    },
  },
  // Table01
  {
    'ho36o3ya': {
      'en': 'Card Header',
      'ar': 'رائيس البطاقة',
    },
    'ry6wngat': {
      'en': 'Create tables and ui elements that work below.',
      'ar': 'قم بإنشاء الجداول وعناصر واجهة المستخدم التي تعمل أدناه.',
    },
    'i2li15ei': {
      'en': 'ID',
      'ar': 'بطاقة تعريف',
    },
    'oqjbkei8': {
      'en': 'Type',
      'ar': 'النوع',
    },
    'tz533vwc': {
      'en': 'Quantity',
      'ar': 'الكمية',
    },
    '64fc0iz7': {
      'en': 'Actions',
      'ar': 'الأجراءات',
    },
    '94kaentn': {
      'en': '#2424',
      'ar': '#2424',
    },
    '8gc1ilnl': {
      'en': 'Randy',
      'ar': 'راندي',
    },
    '9vj6qd1i': {
      'en': '2',
      'ar': '2',
    },
    'f2h2k5ze': {
      'en': '#2424',
      'ar': '#2424',
    },
    'cdbf38rf': {
      'en': 'Randy ',
      'ar': 'راندي',
    },
    'fj95e703': {
      'en': '5',
      'ar': '5',
    },
    'o31xdyq4': {
      'en': '#2427',
      'ar': '#2427',
    },
    'cav59ga8': {
      'en': 'Randy',
      'ar': 'راندي',
    },
    'w87f6odu': {
      'en': '6',
      'ar': '6',
    },
  },
  // table
  {
    '0jlo5pn9': {
      'en': 'Card Header',
      'ar': 'رائيس  البطاقة',
    },
    'sz4dnk6w': {
      'en': 'Create tables and ui elements that work below.',
      'ar': 'قم بإنشاء الجداول وعناصر واجهة المستخدم التي تعمل أدناه.',
    },
    'qe8gbzfw': {
      'en': 'Download',
      'ar': 'تحميل',
    },
    'yzxlf4z8': {
      'en': 'Asset Name',
      'ar': 'اسم الأصل',
    },
    '3rku2o3u': {
      'en': 'Type',
      'ar': 'النوع',
    },
    'ibw28e5k': {
      'en': 'Category',
      'ar': 'الفئة',
    },
    'xcxqryvm': {
      'en': 'Created At',
      'ar': 'أنشئت في',
    },
    'cggn7c7t': {
      'en': 'Status',
      'ar': 'الحالة',
    },
    '9nq2lprg': {
      'en': 'Dimensions',
      'ar': 'الأبعاد',
    },
    'wm958fmx': {
      'en': 'Name',
      'ar': 'الاسم',
    },
    '4lubtbt0': {
      'en': 'Category',
      'ar': 'الفئة',
    },
    'ufuuogru': {
      'en': 'Type',
      'ar': 'النوع',
    },
    '5uawk32o': {
      'en': 'Category',
      'ar': 'الفئة',
    },
    'kr0472r7': {
      'en': 'Jan. 30th, 2023',
      'ar': '30 يناير 2023',
    },
    'en6djszi': {
      'en': 'Enabled',
      'ar': 'متاح',
    },
    'ak83flwb': {
      'en': 'Dimensions',
      'ar': 'الأبعاد',
    },
    'xkwfrmn9': {
      'en': 'Name',
      'ar': 'الاسم',
    },
    '7rwpsr8n': {
      'en': 'Category',
      'ar': 'الفئة',
    },
    'hob3i6r8': {
      'en': 'Type',
      'ar': 'النوع',
    },
    '8307beow': {
      'en': 'Category',
      'ar': 'الفئة',
    },
    'yykebyn2': {
      'en': 'Jan. 30th, 2023',
      'ar': '30 يناير 2023',
    },
    'nnba7up8': {
      'en': 'Enabled',
      'ar': 'متاح',
    },
    'wpv0ywk7': {
      'en': 'Dimensions',
      'ar': 'الأبعاد',
    },
  },
  // today
  {
    's851yo5g': {
      'en': 'Today\'s Requests',
      'ar': 'طلبات اليوم',
    },
  },
  // DAILY_ORDAR
  {
    'bjbteacw': {
      'en': 'Today\'s Requests',
      'ar': 'طلبات اليوم',
    },
    'acyyu8fc': {
      'en': 'Inspector Name',
      'ar': 'اسم المراقب',
    },
    'mucskqek': {
      'en': 'ID : #1502',
      'ar': 'رقم التعريف : #1502',
    },
    'siuoivke': {
      'en': 'Inspector Name',
      'ar': 'اسم المراقب',
    },
    '5nh1vlna': {
      'en': 'ID : #1502',
      'ar': 'رقم التعريف : #1502',
    },
    'nj910cgd': {
      'en': 'Inspector Name',
      'ar': 'اسم المراقب',
    },
    'hcy0plwb': {
      'en': 'ID : #1502',
      'ar': 'رقم التعريف : #1502',
    },
    'uusjr0gm': {
      'en': 'Inspector Name',
      'ar': 'اسم المراقب',
    },
    '8681cckx': {
      'en': 'ID : #1502',
      'ar': 'رقم التعريف : #1502',
    },
    'addvomws': {
      'en': 'Inspector Name',
      'ar': 'اسم المراقب',
    },
    'tw1lkwfm': {
      'en': 'ID : #1502',
      'ar': 'رقم التعريف : #1502',
    },
    'nuwzur0y': {
      'en': 'Inspector Name',
      'ar': 'اسم المراقب',
    },
    'a4jhhx0w': {
      'en': 'ID : #1502',
      'ar': 'رقم التعريف : #1502',
    },
    'fyuu21cb': {
      'en': 'Inspector Name',
      'ar': 'اسم المراقب',
    },
    'z92lmj51': {
      'en': 'ID : #1502',
      'ar': 'رقم التعريف : #1502',
    },
    '60jq0rfy': {
      'en': 'Inspector Name',
      'ar': 'اسم المراقب',
    },
    '1445oi9b': {
      'en': 'ID : #1502',
      'ar': 'رقم التعريف : #1502',
    },
    'wvg7pi20': {
      'en': 'Inspector Name',
      'ar': 'اسم المراقب',
    },
    '2hvvsul7': {
      'en': 'ID : #1502',
      'ar': 'رقم التعريف : #1502',
    },
    '25wyqp8h': {
      'en': 'Inspector Name',
      'ar': 'اسم المراقب',
    },
    'zbdzqm3a': {
      'en': 'ID : #1502',
      'ar': 'رقم التعريف : #1502',
    },
    'az6ucfdl': {
      'en': 'Inspector Name',
      'ar': 'اسم المراقب',
    },
    'r8wdqsqr': {
      'en': 'ID : #1502',
      'ar': 'رقم التعريف : #1502',
    },
  },
  // search
  {
    '7u7gu1zx': {
      'en': 'Search platform...',
      'ar': 'منصة البحث...',
    },
    'xrpvu90o': {
      'en': 'Search',
      'ar': 'البحق\\ث',
    },
    '1ncrlv5f': {
      'en': 'Templates',
      'ar': 'القوالب',
    },
    '40129415': {
      'en': 'Name',
      'ar': 'الاسم',
    },
    '3w6h8rcp': {
      'en': 'Category',
      'ar': 'الفئة',
    },
    '1gtt9f7p': {
      'en': 'Status',
      'ar': 'الحالة',
    },
    'kdpww44s': {
      'en': '[Template Name]',
      'ar': '[اسم القالب]',
    },
    'cm6qec3e': {
      'en': 'cateogry',
      'ar': 'الفئة',
    },
    'umuytxgr': {
      'en': 'Enabled',
      'ar': 'متاح',
    },
    '87jylq4t': {
      'en': '[Template Name]',
      'ar': '[اسم القالب]',
    },
    'dxz1cry6': {
      'en': 'cateogry',
      'ar': 'الفئة',
    },
    'mmapphmp': {
      'en': 'Enabled',
      'ar': 'متاح',
    },
    'b8w67py1': {
      'en': '[Template Name]',
      'ar': '[اسم القالب]',
    },
    'w5xancd5': {
      'en': 'cateogry',
      'ar': 'الفئة',
    },
    'kpwxlgfb': {
      'en': 'Disabled',
      'ar': 'غير متاح',
    },
    'ijex3wib': {
      'en': 'Components',
      'ar': 'العناصر',
    },
    'p23vx9y6': {
      'en': 'Name',
      'ar': 'الاسم',
    },
    '62bcz12b': {
      'en': 'Category',
      'ar': 'الفئة',
    },
    '3mwennbn': {
      'en': 'Status',
      'ar': 'الحالة',
    },
    '7rgd20r4': {
      'en': '[Template Name]',
      'ar': '[اسم القالب]',
    },
    'fbw915bt': {
      'en': 'cateogry',
      'ar': 'الفئة',
    },
    'jvtz8nys': {
      'en': 'Enabled',
      'ar': 'متاح',
    },
    'ch90pu83': {
      'en': '[Template Name]',
      'ar': '[اسم القالب]',
    },
    '8sayqt3x': {
      'en': 'cateogry',
      'ar': 'الفئة',
    },
    'h6gose1m': {
      'en': 'Enabled',
      'ar': 'متاح',
    },
    '5u4kxaqd': {
      'en': '[Template Name]',
      'ar': '[اسم القالب]',
    },
    's652auxo': {
      'en': 'cateogry',
      'ar': 'الفئة',
    },
    'm7bneash': {
      'en': 'Disabled',
      'ar': 'غير متاح',
    },
    '3x0r2a68': {
      'en': 'Tutorials',
      'ar': 'الدروس',
    },
    '5gkjqu8u': {
      'en': 'Tutorials are here...',
      'ar': 'الدروس موجودة هنا...',
    },
    'snug5fbw': {
      'en': 'FlutterFlow x AI',
      'ar': 'FlutterFlow x AI',
    },
    '1t7wf5ht': {
      'en':
          'Customize your app design with FlutterFlow\'s vast library of components and responsive layout tools.',
      'ar':
          'قم بتخصيص تصميم تطبيقك باستخدام مكتبة FlutterFlow الواسعة من المكونات وأدوات التخطيط سريعة الاستجابة.',
    },
    'nzyw40hp': {
      'en': '4 Minutes',
      'ar': '4 دقائق',
    },
    '3dd823lu': {
      'en': 'Active',
      'ar': 'نشيط',
    },
    '4x9ueh2v': {
      'en': 'FlutterFlow Basics',
      'ar': 'أساسيات FlutterFlow',
    },
    'cydzc143': {
      'en':
          'In this tutorial, we\'ll dive into the essentials of using FlutterFlow to build amazing apps.',
      'ar':
          'في هذا البرنامج التعليمي، سنتعمق في أساسيات استخدام FlutterFlow لإنشاء تطبيقات مذهلة.',
    },
    'u9bjz0pb': {
      'en': '4 Minutes',
      'ar': '4 دقائق',
    },
    'hvsqfxza': {
      'en': 'Active',
      'ar': 'نشط/مفعل',
    },
    'uk2u0fn2': {
      'en': 'FlutterFlow 101',
      'ar': 'فلاتر فلو 101',
    },
    'h9vlkphh': {
      'en':
          'Save time and effort with FlutterFlow\'s built-in integration for popular third-party services.',
      'ar':
          'يمكنك توفير الوقت والجهد من خلال التكامل المدمج في FlutterFlow مع خدمات الجهات الخارجية الشهيرة.',
    },
    'frdfmzck': {
      'en': '4 Minutes',
      'ar': '4 دقائق',
    },
    'jxsnidj0': {
      'en': 'Active',
      'ar': 'نشط/مفعل',
    },
    '93jwpe9i': {
      'en': 'FlutterFlow Command Palette',
      'ar': 'لوحة أوامر FlutterFlow',
    },
    '1g1sjykp': {
      'en':
          'Learn how to create interactive components and navigate smoothly between screens in FlutterFlow.',
      'ar':
          'تعرف على كيفية إنشاء مكونات تفاعلية والتنقل بسلاسة بين الشاشات في FlutterFlow.',
    },
    'nsnzdiza': {
      'en': '4 Minutes',
      'ar': '4 دقائق',
    },
    'p3tiqrsu': {
      'en': 'Active',
      'ar': 'نشط/مفعل',
    },
  },
  // End_Request
  {
    'z31pp6ag': {
      'en': 'Request Details',
      'ar': 'تفاصيل الطلب',
    },
    '75t364bd': {
      'en': 'Review the request details before confirmation',
      'ar': 'قم بمراجعة تفاصيل الطلب قبل التأكيد',
    },
    'o7045bj6': {
      'en': 'Item Name',
      'ar': 'اسم العنصر',
    },
    '8o6szy5l': {
      'en': 'Secondary text',
      'ar': 'النص الثانوي',
    },
    'gskfvjgi': {
      'en': '\$1.50',
      'ar': '1.50 دولار',
    },
    '2pth0s13': {
      'en': 'Report Missing Tools',
      'ar': 'الإبلاغ عن الأدوات المفقودة',
    },
    'fflehmsd': {
      'en': 'End Request',
      'ar': 'إنهاء الطلب',
    },
    'dmi8fgb2': {
      'en': 'Cancel',
      'ar': 'الغاء',
    },
  },
  // TodaysRequests_Dashboard
  {
    'fplbb8lh': {
      'en': 'Today\'s Requests',
      'ar': 'طلبات اليوم',
    },
    '6ngoonw0': {
      'en': 'Active Requests',
      'ar': 'الطلبات النشطة',
    },
    'b9coa6u8': {
      'en': 'Total Requests',
      'ar': 'إجمالي الطلبات',
    },
  },
  // counter
  {
    'aw92cqqg': {
      'en': '56.4k',
      'ar': '56.4 ألف',
    },
    'n3t8f6vf': {
      'en': 'Customers',
      'ar': 'العملاء',
    },
  },
  // Dashboard04CircleGraphCopy
  {
    '2pkhkzru': {
      'en': 'Tody\'s Requests',
      'ar': 'طلبات تودي',
    },
    'ed44p1ni': {
      'en': '56.4k',
      'ar': '56.4 ألف',
    },
    'prhfuhx0': {
      'en': 'Active Requests',
      'ar': 'الطلبات النشطة',
    },
    's5szkqdw': {
      'en': '56.4k',
      'ar': '56.4 ألف',
    },
    's2t3mj6f': {
      'en': 'Total Requests',
      'ar': 'إجمالي الطلبات',
    },
  },
  // Modal16CreateCompany
  {
    'z4dxy792': {
      'en': 'Create Company Profile',
      'ar': 'إنشاء ملف تعريف الشركة',
    },
    'nfid9m8t': {
      'en':
          'Upload images about your company and fill out the information below.',
      'ar': 'قم بتحميل صور عن شركتك واملأ المعلومات أدناه.',
    },
    'vnmmzldd': {
      'en': 'Company Name',
      'ar': 'اسم الشركة',
    },
    'rkleutjk': {
      'en': 'Company City',
      'ar': 'مدينة الشركة',
    },
    'bt9kfooa': {
      'en': 'Website',
      'ar': 'الموقع إلاكتروني',
    },
    'nmlsi8he': {
      'en': 'Enter in your website without \"https://\"...',
      'ar': 'أدخل إلى موقع الويب الخاص بك بدون \"https://\"...',
    },
    'da6g837y': {
      'en': 'Cancel',
      'ar': 'الغاء',
    },
    'g0jp2egl': {
      'en': 'Create Company',
      'ar': 'إنشاء شركة',
    },
  },
  // Modal05CreateProject
  {
    'nyfi6bcm': {
      'en': 'Create Project',
      'ar': '',
    },
    'e0tw1mea': {
      'en': 'Please enter the information below to add a project.',
      'ar': '',
    },
    'dhh3u6qy': {
      'en': 'Add Photo',
      'ar': '',
    },
    'qkuvg2nr': {
      'en': 'Upload an image here...',
      'ar': '',
    },
    '6my67h73': {
      'en': 'Showcase Project Name',
      'ar': '',
    },
    'enqveg5r': {
      'en': 'Description here...',
      'ar': '',
    },
    'zw66xybq': {
      'en': 'URL of the project',
      'ar': '',
    },
    'sahvbiie': {
      'en': 'Clonable Link URL...',
      'ar': '',
    },
    'pa8keyhp': {
      'en': 'Create Showcase',
      'ar': '',
    },
    'vja0kaso': {
      'en': 'Field is required',
      'ar': '',
    },
    '0s717jkg': {
      'en': 'Please enter a real name',
      'ar': '',
    },
    'jfvt4kaa': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'm0yeyuoe': {
      'en': 'Please enter a short desription',
      'ar': '',
    },
    'm61eczdd': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'q3819rc2': {
      'en': 'We have to have a URL for the project.',
      'ar': '',
    },
    'hhgdwshf': {
      'en': 'Please enter a valid URL...',
      'ar': '',
    },
    'kjsw5qfr': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'midtkrrt': {
      'en': 'Field is required',
      'ar': ' مطلوب الملء',
    },
    '2rpuhnd1': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
  },
  // Modal05CreateProjectCopy
  {
    '9ovqw42l': {
      'en': 'Create Project',
      'ar': '',
    },
    'o09ysna3': {
      'en': 'Please enter the information below to add a project.',
      'ar': '',
    },
    '6bum7t6t': {
      'en': 'Add Photo',
      'ar': '',
    },
    '89jedara': {
      'en': 'Upload an image here...',
      'ar': '',
    },
    '7eezxmam': {
      'en': 'Delete',
      'ar': '',
    },
    'i0dmwok3': {
      'en': 'Field is required',
      'ar': ' مطلوب الملء',
    },
    'np2u47u2': {
      'en': 'Please enter a real name',
      'ar': '',
    },
    'x9jdz0yp': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'qdn29hyf': {
      'en': 'Please enter a short desription',
      'ar': '',
    },
    '96t8rkx2': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'bw8r8n2a': {
      'en': 'We have to have a URL for the project.',
      'ar': '',
    },
    'ukeubgmg': {
      'en': 'Please enter a valid URL...',
      'ar': '',
    },
    'oha16c76': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'umk0aw3c': {
      'en': 'Field is required',
      'ar': ' مطلوب الملء',
    },
    'iud15a49': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
  },
  // tablee
  {
    '0j0kw8sb': {
      'en': 'Card Header',
      'ar': '',
    },
    'o0pi4iwh': {
      'en': 'Create tables and ui elements that work below.',
      'ar': '',
    },
    'sarysha1': {
      'en': 'Search users...',
      'ar': '',
    },
    'll7tgmu7': {
      'en': 'Create User',
      'ar': '',
    },
    'mrxazj43': {
      'en': 'ID',
      'ar': '',
    },
    'hagy7hy2': {
      'en': 'User Information',
      'ar': '',
    },
    '5k1xhmr4': {
      'en': 'Next Task Due',
      'ar': '',
    },
    'cfq2sqnh': {
      'en': 'Status',
      'ar': '',
    },
    'i5chrdwv': {
      'en': 'Actions',
      'ar': 'أجراءات',
    },
    'dqm4hj6w': {
      'en': '#2424552',
      'ar': '',
    },
    '4mv99hc1': {
      'en': 'Randy Peterson',
      'ar': '',
    },
    'mvbwedmk': {
      'en': 'randy.p@domainname.com',
      'ar': '',
    },
    'cmhfus69': {
      'en': 'Jan. 30th, 2023',
      'ar': '',
    },
    'grh9k5vo': {
      'en': 'Active',
      'ar': 'مفعل',
    },
    'wy1ez7zx': {
      'en': '#2424552',
      'ar': '',
    },
    'wvbgebjk': {
      'en': 'Randy Peterson',
      'ar': '',
    },
    'ym6tkzne': {
      'en': 'randy.p@domainname.com',
      'ar': '',
    },
    '3x4zj1po': {
      'en': 'Jan. 30th, 2023',
      'ar': '',
    },
    'z4jdrnwc': {
      'en': 'Active',
      'ar': '',
    },
    'au8ybpgp': {
      'en': '#2424552',
      'ar': '',
    },
    'sxlhteg8': {
      'en': 'Randy Peterson',
      'ar': '',
    },
    'nfqtgz2r': {
      'en': 'randy.p@domainname.com',
      'ar': '',
    },
    '475izkmq': {
      'en': 'Jan. 30th, 2023',
      'ar': '',
    },
    'r7bhgkr4': {
      'en': 'Active',
      'ar': '',
    },
  },
  // Useraddedsuccessfully
  {
    '5t0s6h0i': {
      'en': 'User added successfully!',
      'ar': '',
    },
    'vb3djp9l': {
      'en': 'Here is the login information for the new user',
      'ar': '',
    },
    '2d6rteh9': {
      'en': 'Name',
      'ar': '',
    },
    'kek8hvp1': {
      'en': 'ID',
      'ar': '',
    },
    'oo6c6yqb': {
      'en': 'Email',
      'ar': '',
    },
    'n99t9dfx': {
      'en': 'Password',
      'ar': '',
    },
    'elbqyng2': {
      'en': 'Done',
      'ar': '',
    },
  },
  // EmptyListsimple
  {
    '5a8crhfe': {
      'en': 'No Activity',
      'ar': '',
    },
    'kpiw9w0t': {
      'en': 'It seems that you don\'t have any recent activity.',
      'ar': '',
    },
  },
  // user_created
  {
    '1x4vfeio': {
      'en': 'User Created Successfully',
      'ar': 'تم إنشاء المستخدم بنجاح',
    },
    '8jjr3g8w': {
      'en': 'View Profile',
      'ar': 'غلق',
    },
    'kakzwltv': {
      'en': 'Back To Home',
      'ar': '',
    },
  },
  // serch
  {
    'w0clerx5': {
      'en': 'Search platform...',
      'ar': '',
    },
    'z7akv505': {
      'en': 'Search',
      'ar': '',
    },
    'yui44yf6': {
      'en': 'Templates',
      'ar': '',
    },
    'tlzz6rqj': {
      'en': 'Quickly find templates',
      'ar': '',
    },
    'zqvn8qj3': {
      'en': '[Template Name]',
      'ar': '',
    },
    's7sjs0ni': {
      'en': 'cateogry',
      'ar': '',
    },
    '6vhzxdh5': {
      'en': 'Enabled',
      'ar': '',
    },
    'uw03yfhu': {
      'en': '[Template Name]',
      'ar': '',
    },
    '1kpmitzd': {
      'en': 'cateogry',
      'ar': '',
    },
    'p25h1afx': {
      'en': 'Enabled',
      'ar': '',
    },
    '4j8m6yq1': {
      'en': '[Template Name]',
      'ar': '',
    },
    'xe418l6p': {
      'en': 'cateogry',
      'ar': '',
    },
    'xwg5088l': {
      'en': 'Disabled',
      'ar': '',
    },
    'a6uc141c': {
      'en': '[Template Name]',
      'ar': '',
    },
    'oktqk054': {
      'en': 'cateogry',
      'ar': '',
    },
    'sxaet95r': {
      'en': 'Enabled',
      'ar': '',
    },
    'zdmh6rim': {
      'en': '[Template Name]',
      'ar': '',
    },
    'w2b2h9df': {
      'en': 'cateogry',
      'ar': '',
    },
    'extqpspw': {
      'en': 'Enabled',
      'ar': '',
    },
    'x1xifn57': {
      'en': 'Components',
      'ar': '',
    },
    'zr7nsni6': {
      'en': 'Find your components',
      'ar': '',
    },
    '0lm7atcw': {
      'en': '[Template Name]',
      'ar': '',
    },
    'i1qcqwui': {
      'en': 'cateogry',
      'ar': '',
    },
    'e67ec6j5': {
      'en': 'Enabled',
      'ar': '',
    },
    'mdczuoad': {
      'en': '[Template Name]',
      'ar': '',
    },
    'clwibx7e': {
      'en': 'cateogry',
      'ar': '',
    },
    'q8kz9p3l': {
      'en': 'Disabled',
      'ar': '',
    },
  },
  // today_requests_tm
  {
    'nm9wyubo': {
      'en': 'Today\'s Requests',
      'ar': '',
    },
    'ndp6f2qu': {
      'en': 'Active Requests',
      'ar': '',
    },
    '3i4qhxzj': {
      'en': 'Total Requests',
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
