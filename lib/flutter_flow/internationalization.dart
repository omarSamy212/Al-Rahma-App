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
      'en': '',
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
    'u026zsnb': {
      'en': '',
      'ar': '220 : نقطة ثابتة',
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
      'en': '',
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
      'en': '',
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
    'wbewlluf': {
      'en': 'Education Data',
      'ar': 'بيانات التعليم',
    },
    'j1wzvytj': {
      'en': '',
      'ar': '',
    },
    'fo1s7rh2': {
      'en': 'Yes',
      'ar': 'نعم',
    },
    '7253wm4k': {
      'en': 'No',
      'ar': 'لا',
    },
    'd0xh78gg': {
      'en': 'Employed now?',
      'ar': 'موظف الآن؟',
    },
    'gjf75qlj': {
      'en': '',
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
      'en': '',
      'ar': '',
    },
    'b1gya0sv': {
      'en': 'Select Contractor',
      'ar': 'أختر المورد',
    },
    'e35e8h9c': {
      'en': '',
      'ar': '',
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
    'p0dyomyl': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
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
    '0iu0hqff': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    '5emwe7zt': {
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
    '6gz89b42': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    '5le1ml99': {
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
    'uxmr3cq2': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    '9vjhddi3': {
      'en': 'employment date',
      'ar': 'تاريخ التوظيف',
    },
    'sp6wv7qj': {
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
    'ul5x5si2': {
      'en': '1.Upload ID',
      'ar': '1. ارفق صورة البطاقة الشخصية',
    },
    'qk923r8j': {
      'en': 'Personal ID',
      'ar': 'البطاقة الشخصية',
    },
    '8e1l95al': {
      'en': 'Please upload front ID.',
      'ar': 'يرجي تحميل الجهة الأمامية.',
    },
    'nsbp09d8': {
      'en': 'Add Photo',
      'ar': 'إضافة صورة',
    },
    'end9cxtz': {
      'en': 'Upload an image here...',
      'ar': 'ارفع صورة هنا...',
    },
    '9xr8khaa': {
      'en': 'Personal ID',
      'ar': '',
    },
    'tq7uqg7d': {
      'en': 'Please upload back ID.',
      'ar': '',
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
      'en': '2. Upload driving license',
      'ar': '',
    },
    'hzhb7hi3': {
      'en': 'Driving license',
      'ar': '',
    },
    'rqkzmia7': {
      'en': 'Please upload front driving license.',
      'ar': '',
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
      'ar': '',
    },
    'nlddt3w2': {
      'en': 'Please upload back ID.',
      'ar': '',
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
      'en': '3. Upload drug test',
      'ar': '',
    },
    'drel3fy8': {
      'en': 'Upload drug test',
      'ar': '',
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
    'uqp1cu71': {
      'en': 'Field is required',
      'ar': ' مطلوب الملء',
    },
    'dunjd1uo': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'vkrrbebk': {
      'en': 'Field is required',
      'ar': ' مطلوب الملء',
    },
    'bxq5z3ib': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'ggodxj06': {
      'en': 'Field is required',
      'ar': ' مطلوب الملء',
    },
    '7cozg12h': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'h02dy9m3': {
      'en': 'Field is required',
      'ar': ' مطلوب الملء',
    },
    'm9hde46z': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'emgbqhzq': {
      'en': 'Field is required',
      'ar': ' مطلوب الملء',
    },
    '6jmgnqqz': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '6quszuut': {
      'en': 'Field is required',
      'ar': '',
    },
    'mk7vinbk': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'xs113aiw': {
      'en': 'Field is required',
      'ar': ' مطلوب الملء',
    },
    'tz8hguxz': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'o6zikw1h': {
      'en': 'Field is required',
      'ar': '',
    },
    'tsskkm4o': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'ycwc7s5w': {
      'en': 'Field is required',
      'ar': '',
    },
    'yj7frnbg': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'cgj9gsqz': {
      'en': 'Field is required',
      'ar': '',
    },
    'twh137ci': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '87jbrjhh': {
      'en': 'Field is required',
      'ar': 'مطلوب الملئ',
    },
    'u7tjd6ab': {
      'en': 'Wrong Number',
      'ar': 'رقم غير صحيح',
    },
    'pcug1wnh': {
      'en': 'Wrong Number',
      'ar': 'رقم غير صحيح',
    },
    '5elr8x4g': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '1mn2cxty': {
      'en': 'Field is required',
      'ar': '',
    },
    'rpkbzmmo': {
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
    'yofs1kcr': {
      'en': 'Field is required',
      'ar': ' مطلوب الملء',
    },
    'b9d58iu1': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
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
    '3dsgsa6c': {
      'en': 'Field is required',
      'ar': 'مطلوب الملئ',
    },
    'upwyfvm2': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'xrl64zux': {
      'en': 'Field is required',
      'ar': 'مطلوب الملئ',
    },
    't3jei06a': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
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
    '4qxp6c30': {
      'en': 'Field is required',
      'ar': '',
    },
    'bzkc56ee': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'ppgpzmcp': {
      'en': 'Field is required',
      'ar': '',
    },
    'g36uzy67': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '4iue3yt2': {
      'en': 'Field is required',
      'ar': 'مطلوب الملئ',
    },
    '3bacjmia': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
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
      'ar': 'بطاقة تعريف',
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
      'en': 'Review the details below of your recent projects.',
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
    '285s9vkm': {
      'en': 'View',
      'ar': 'منظر',
    },
    '6yi526a1': {
      'en': 'Upcoming Milestones',
      'ar': 'المعالم القادمة',
    },
    'wgl7rxoo': {
      'en': 'Below are some of the upcoming tasks for.',
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
    'urcdrovl': {
      'en': 'Team Overview',
      'ar': 'نظرة عامة على الفريق',
    },
    's3nrmpnj': {
      'en': 'Review the details below of your recent projects.',
      'ar': 'قم بمراجعة التفاصيل أدناه لمشاريعك الأخيرة.',
    },
    'datik9u0': {
      'en': 'Assign',
      'ar': 'تعيين',
    },
    'cr0fd8j3': {
      'en': 'Today\'s Workers List',
      'ar': 'قائمة العمال اليوم',
    },
    'ardzpi1h': {
      'en': 'View',
      'ar': 'منظر',
    },
    'fy4nqf0n': {
      'en': 'You can distribute workers like you want ',
      'ar': 'يمكنك توزيع العمال كما تريد',
    },
    'awdkcyxo': {
      'en': 'Add New',
      'ar': 'اضف جديد',
    },
    'labxp8ej': {
      'en': 'Assigned User',
      'ar': 'المستخدم المعين',
    },
    'b2im9x3r': {
      'en': 'Due Date',
      'ar': 'تاريخ الاستحقاق',
    },
    'ioqei7fi': {
      'en': 'Status',
      'ar': 'حالة',
    },
    'i5chrdwv': {
      'en': 'Actions',
      'ar': 'أجراءات',
    },
    '4mv99hc1': {
      'en': 'Randy Peterson',
      'ar': 'راندي بيترسون',
    },
    'm11feh5e': {
      'en': 'Business Name',
      'ar': 'الاسم التجاري',
    },
    'x9r3js2a': {
      'en': 'Fri. Aug 11th',
      'ar': 'الجمعة. 11 أغسطس',
    },
    '561mho95': {
      'en': 'High',
      'ar': 'عالي',
    },
    's0n40ssb': {
      'en': 'Randy Peterson',
      'ar': 'راندي بيترسون',
    },
    'rys9sr05': {
      'en': 'Business Name',
      'ar': 'الاسم التجاري',
    },
    '3con0z70': {
      'en': 'Fri. Aug 11th',
      'ar': 'الجمعة. 11 أغسطس',
    },
    'wnkxus7c': {
      'en': 'High',
      'ar': 'عالي',
    },
    '3gmvs7mg': {
      'en': 'Randy Peterson',
      'ar': 'راندي بيترسون',
    },
    '1vyq7s8g': {
      'en': 'Business Name',
      'ar': 'الاسم التجاري',
    },
    '6jc1684x': {
      'en': 'Fri. Aug 11th',
      'ar': 'الجمعة. 11 أغسطس',
    },
    'ojcmb8c6': {
      'en': 'High',
      'ar': 'عالي',
    },
    'aafd1awp': {
      'en': 'Randy Peterson',
      'ar': 'راندي بيترسون',
    },
    'obloxmop': {
      'en': 'Business Name',
      'ar': 'الاسم التجاري',
    },
    '8wd932sp': {
      'en': 'Fri. Aug 11th',
      'ar': 'الجمعة. 11 أغسطس',
    },
    'gaye1lao': {
      'en': 'High',
      'ar': 'عالي',
    },
    '8owg0i1j': {
      'en': 'Today\'s Tools List',
      'ar': 'قائمة أدوات اليوم',
    },
    '0rrxwe9y': {
      'en': 'View',
      'ar': 'منظر',
    },
    'sb0ck54l': {
      'en': 'You can distribute tools like you want ',
      'ar': 'يمكنك توزيع الأدوات كما تريد',
    },
    'a3vwl85o': {
      'en': 'Add New',
      'ar': 'اضف جديد',
    },
    'h9gtcp9k': {
      'en': 'Assigned User',
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
      'en': 'Business Name',
      'ar': 'الاسم التجاري',
    },
    '3f74boic': {
      'en': 'Fri. Aug 11th',
      'ar': 'الجمعة. 11 أغسطس',
    },
    'orna9bre': {
      'en': 'High',
      'ar': 'عالي',
    },
    'i23lhw3n': {
      'en': 'Randy Peterson',
      'ar': 'راندي بيترسون',
    },
    'c26o3jsx': {
      'en': 'Business Name',
      'ar': 'الاسم التجاري',
    },
    'ieaam6nv': {
      'en': 'Fri. Aug 11th',
      'ar': 'الجمعة. 11 أغسطس',
    },
    'bfs9dsiw': {
      'en': 'High',
      'ar': 'عالي',
    },
    'qzk1glnn': {
      'en': 'Randy Peterson',
      'ar': 'راندي بيترسون',
    },
    'fmtv4f9a': {
      'en': 'Business Name',
      'ar': 'الاسم التجاري',
    },
    'sajbrz9e': {
      'en': 'Fri. Aug 11th',
      'ar': 'الجمعة. 11 أغسطس',
    },
    'rag58zof': {
      'en': 'High',
      'ar': 'عالي',
    },
    '4rbi2n2g': {
      'en': 'Randy Peterson',
      'ar': 'راندي بيترسون',
    },
    'lu3209ey': {
      'en': 'Business Name',
      'ar': 'الاسم التجاري',
    },
    'cyvm5pqx': {
      'en': 'Fri. Aug 11th',
      'ar': 'الجمعة. 11 أغسطس',
    },
    '2vs1y3z7': {
      'en': 'High',
      'ar': 'عالي',
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
      'en': 'Warehouse management',
      'ar': 'إدارة المستودعات',
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
    'jupa7up6': {
      'en': '1',
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
      'en': 'View',
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
    'kvbbsmcp': {
      'en': '12 Projects',
      'ar': '12 مشروعا',
    },
    'evp4in0x': {
      'en': 'View All',
      'ar': 'عرض الكل',
    },
    '8olvp832': {
      'en': 'Pending',
      'ar': 'قيد الانتظار',
    },
    '0oxhwfw1': {
      'en': 'In Progress',
      'ar': 'في مرحله التشغيل',
    },
    '9fvbm9hy': {
      'en': 'Design Template Screens',
      'ar': 'شاشات قالب التصميم',
    },
    '4xe382y1': {
      'en': 'Create template screen for task todo app.',
      'ar': 'إنشاء شاشة قالب لتطبيق المهام الواجبة.',
    },
    'mmnfxuta': {
      'en': 'Due',
      'ar': 'حق',
    },
    'lx4nrtc2': {
      'en': 'Tuesday, 10:00am',
      'ar': 'الثلاثاء، الساعة 10:00 صباحاً',
    },
    'q483fogx': {
      'en': 'Theme Collection',
      'ar': 'مجموعة الموضوعات',
    },
    'kp355nf7': {
      'en': 'Create themes for use by our users.',
      'ar': 'إنشاء سمات للاستخدام من قبل مستخدمينا.',
    },
    'i7n5uma8': {
      'en': 'Due',
      'ar': 'حق',
    },
    'on7uy32m': {
      'en': 'Tuesday, 10:00am',
      'ar': 'الثلاثاء، الساعة 10:00 صباحاً',
    },
    'b68fnzl7': {
      'en': 'In Progress',
      'ar': 'في مرحله التشغيل',
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
    '924bi57i': {
      'en': 'Theme Collection',
      'ar': 'مجموعة الموضوعات',
    },
    'ivybmynv': {
      'en': 'Create themes for use by our users.',
      'ar': 'إنشاء سمات للاستخدام من قبل مستخدمينا.',
    },
    'szwswidk': {
      'en': 'Tuesday, 10:00am',
      'ar': 'الثلاثاء، الساعة 10:00 صباحاً',
    },
    'tbvkocmg': {
      'en': 'Completed',
      'ar': 'مكتمل',
    },
    'zuy2topf': {
      'en': 'late',
      'ar': 'متأخر',
    },
    'gxr3fm5t': {
      'en': 'Design Template Screens',
      'ar': 'شاشات قالب التصميم',
    },
    'ybzktkp4': {
      'en': 'Create template screen for task todo app.',
      'ar': 'إنشاء شاشة قالب لتطبيق المهام الواجبة.',
    },
    '0tmvzxjl': {
      'en': 'Tuesday, 10:00am',
      'ar': 'الثلاثاء، الساعة 10:00 صباحاً',
    },
    'pkqqxbcq': {
      'en': 'Completed',
      'ar': 'مكتمل',
    },
    'wg267ajb': {
      'en': 'Theme Collection',
      'ar': 'مجموعة الموضوعات',
    },
    'r5kw0i6m': {
      'en': 'Create themes for use by our users.',
      'ar': 'إنشاء سمات للاستخدام من قبل مستخدمينا.',
    },
    '2c2d7buo': {
      'en': 'Tuesday, 10:00am',
      'ar': 'الثلاثاء، الساعة 10:00 صباحاً',
    },
    'wd1mvwng': {
      'en': 'Completed',
      'ar': 'مكتمل',
    },
    'v5j8e0uc': {
      'en': 'No-Code Platform Design',
      'ar': 'تصميم منصة بدون كود',
    },
    'dsy0bd7i': {
      'en': 'Home',
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
    'iyudgnjx': {
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
    'lg0bwmgt': {
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
    'vyf9o7jr': {
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
    'nxrwi02a': {
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
    '9uh7vdup': {
      'en': '',
      'ar': '',
    },
    'uibfcidd': {
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
    'v3i7nzya': {
      'en': 'Place of Issue',
      'ar': 'مكان الإصدار',
    },
    '4lubca5h': {
      'en': 'Date of national id',
      'ar': '',
    },
    'jhr7yw54': {
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
    '8o63g4c2': {
      'en': 'Yes',
      'ar': 'نعم',
    },
    '18282v62': {
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
    '3x6tvpvc': {
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
    'd5fyxf95': {
      'en': 'Personal ID',
      'ar': '',
    },
    'm668wexn': {
      'en': 'Please upload front ID.',
      'ar': '',
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
      'en': 'Personal ID',
      'ar': '',
    },
    'nlgq80r6': {
      'en': 'Please upload back ID.',
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
    'ni755dhl': {
      'en': 'Add Photo',
      'ar': '',
    },
    'fcg4tkc8': {
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
    'ntk6jfou': {
      'en': 'Add Photo',
      'ar': '',
    },
    'cpnk0be9': {
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
      'en': 'Next',
      'ar': '',
    },
    'ulqrenzc': {
      'en': 'Field is required',
      'ar': ' مطلوب الملء',
    },
    '0tzma4qa': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '59sadv3d': {
      'en': 'Field is required',
      'ar': ' مطلوب الملء',
    },
    '50mvtgt0': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'tl1hsk73': {
      'en': 'Field is required',
      'ar': '',
    },
    '7eye35yj': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'v3rmz8xq': {
      'en': 'Field is required',
      'ar': ' مطلوب الملء',
    },
    '5ecz0d1b': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'vcqki3dz': {
      'en': 'Field is required',
      'ar': '',
    },
    'p4v9rldb': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'xc4thabi': {
      'en': 'Field is required',
      'ar': '',
    },
    '2c99dtx9': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '6h5ylbrm': {
      'en': 'Field is required',
      'ar': '',
    },
    'a76r88ew': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'qg9i8cyf': {
      'en': 'Field is required',
      'ar': '',
    },
    '92qdid5a': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'ep3xap2v': {
      'en': 'Field is required',
      'ar': '',
    },
    'nzqn0som': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'jtk10equ': {
      'en': 'Field is required',
      'ar': '',
    },
    'jmsjpsix': {
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
    'cf6h6b08': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'cswlnhig': {
      'en': 'Field is required',
      'ar': '',
    },
    'kehoco0y': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '5yusgnyb': {
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
    'jk6uisfo': {
      'en': 'Field is required',
      'ar': '',
    },
    '5sjmqwng': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '1fskjhm1': {
      'en': 'Field is required',
      'ar': '',
    },
    'q436lgef': {
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
    'uxemoir7': {
      'en': 'Actions',
      'ar': '',
    },
    'dqm4hj6w': {
      'en': '#2424552',
      'ar': '',
    },
    '414yl3i7': {
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
