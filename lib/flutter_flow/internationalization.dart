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
    '2ebdxwev': {
      'en': '',
      'ar': '',
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
      'ar': 'إدارة المخازن',
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
    'hhelfo1k': {
      'en': 'Religion',
      'ar': 'الديانة',
    },
    's333humu': {
      'en': 'Muslim',
      'ar': 'مسلم',
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
    'aue6zb37': {
      'en': 'Gender',
      'ar': 'الجنس',
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
    '1130f4f6': {
      'en': 'Marital Status',
      'ar': 'الحالة الأجتماعية',
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
      'ar': 'الحالة الأجتماعية',
    },
    'xux78937': {
      'en': 'Nationality',
      'ar': 'الجنسية',
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
      'ar': 'الجنسية',
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
      'ar': 'الحقل مطلوب',
    },
    'tsskkm4o': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'o6zikw1h': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'yj7frnbg': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'ep3xap2v': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'twh137ci': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'cgj9gsqz': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'rpkbzmmo': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
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
      'ar': 'تاريخ الميلاد',
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
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '8vbjnb37': {
      'en': 'Field is required',
      'ar': '',
    },
    'u3srb58b': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'tr06y4hy': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'ppl01db3': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '3zkdeqja': {
      'en': 'Field is required',
      'ar': '',
    },
    '54ugpsb0': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'moe1hv4e': {
      'en': 'Field is required',
      'ar': '',
    },
    'kedrfj69': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'agftcbph': {
      'en': 'Field is required',
      'ar': '',
    },
    'nbik4hor': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
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
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '9t4q9h1g': {
      'en': 'Field is required',
      'ar': '',
    },
    'yy129kby': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'a3gl1iij': {
      'en': 'Field is required',
      'ar': '',
    },
    '7sh7ckay': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '412nn2e1': {
      'en': 'Field is required',
      'ar': '',
    },
    '7016hcp1': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'jznpwu33': {
      'en': 'Education Data',
      'ar': 'بيانات التعليم',
    },
    '8kbvijf3': {
      'en': 'Employed now?',
      'ar': 'موظف الآن؟',
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
    'br5px6zz': {
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
    'gwtw2lyc': {
      'en': 'Select Role',
      'ar': 'حدد الوظيفة',
    },
    'gjf75qlj': {
      'en': 'Worker',
      'ar': '',
    },
    'doajkyn3': {
      'en': 'Select Role',
      'ar': 'حدد الوظيفة',
    },
    '1p6lsamr': {
      'en': 'Select Contractor',
      'ar': 'حدد المورد',
    },
    'dk6n4wxb': {
      'en': 'Al Rahma',
      'ar': '',
    },
    'b1gya0sv': {
      'en': 'Select Contractor',
      'ar': 'حدد المورد',
    },
    'fffwf2hz': {
      'en': 'Contractor ID',
      'ar': 'كود المورد',
    },
    'srwt4w0l': {
      'en': 'Num Of Workers',
      'ar': 'عدد العمال',
    },
    '516nqxm8': {
      'en': 'Select Starting Shift',
      'ar': 'حدد بداية الوردية',
    },
    '5emwe7zt': {
      'en': 'Morning',
      'ar': 'صباحي',
    },
    'mdcpqf5s': {
      'en': 'Morning',
      'ar': 'صباحي',
    },
    'jzsebavj': {
      'en': 'Evening',
      'ar': 'مسائي',
    },
    'worv047g': {
      'en': 'Night',
      'ar': 'ليلي',
    },
    'z9ptj5z9': {
      'en': 'Select starting shift ',
      'ar': 'حدد بداية  الوردية',
    },
    'p0dyomyl': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    '5le1ml99': {
      'en': '8 h',
      'ar': '8 ساعات',
    },
    'g6c7vyit': {
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
    'fjn3dqxe': {
      'en': 'Select Starting Shift',
      'ar': 'حدد بداية الوردية',
    },
    'web7eexb': {
      'en': 'Please Select Contractor',
      'ar': '',
    },
    'b9d58iu1': {
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
      'ar': 'صباح',
    },
    'vibkb11l': {
      'en': 'Morning',
      'ar': 'صباحي',
    },
    '3a1t5wee': {
      'en': 'Evening',
      'ar': 'مسائي',
    },
    'q7n5lwn3': {
      'en': 'Night',
      'ar': 'ليلي',
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
      'ar': '8 ساعات',
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
    'z7kcg76h': {
      'en': 'Have a driving license?',
      'ar': 'هل لديك رخصة قيادة؟',
    },
    'u026zsnb': {
      'en': 'No',
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
    'ite9xhr3': {
      'en': 'Type of driving license?',
      'ar': 'نوع رخصة القيادة؟',
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
      'en': 'Motorcycle / Tricycle',
      'ar': 'موتوسكل / تروسكل',
    },
    'bwx2sj28': {
      'en': 'Van',
      'ar': 'نقل',
    },
    '6xwtd4gp': {
      'en': 'Type of driving license?',
      'ar': 'نوع رخصة القيادة؟',
    },
    'v3i7nzya': {
      'en': 'Place of Issue',
      'ar': 'مكان الإصدار',
    },
    'uhrfep0r': {
      'en': 'Driving Liccense Isuue Date',
      'ar': 'تاريخ إصدار رخصة القيادة',
    },
    '8zdm7n9y': {
      'en': '',
      'ar': '',
    },
    'j1wzvytj': {
      'en': '',
      'ar': '',
    },
    'sp6wv7qj': {
      'en': '',
      'ar': '',
    },
    'qju4v4iw': {
      'en': 'Driving Liccense Expiry Date',
      'ar': 'تاريخ انتهاء رخصة القيادة',
    },
    'e35e8h9c': {
      'en': '',
      'ar': '',
    },
    'jdahn9ju': {
      'en': '',
      'ar': '',
    },
    'bk1vlltt': {
      'en': 'Select Work Area',
      'ar': 'حدد منطقة العمل',
    },
    '6x817z9l': {
      'en': '--',
      'ar': '',
    },
    'sr4mrqai': {
      'en': 'Leader Area 1',
      'ar': 'منطقة ليدر  1',
    },
    'wl5f7igc': {
      'en': 'Leader Area 2',
      'ar': '',
    },
    '2zvqvqe4': {
      'en': 'Leader Area 3',
      'ar': '',
    },
    'l87kn4w2': {
      'en': 'Leader Area 4',
      'ar': '',
    },
    'tffwt50g': {
      'en': 'Leader Area 5',
      'ar': '',
    },
    'k2fdz70g': {
      'en': 'Leader Area 6',
      'ar': '',
    },
    'upb0xx7h': {
      'en': 'Leader Area 7',
      'ar': '',
    },
    'hcnnlera': {
      'en': 'Leader Area 8',
      'ar': '',
    },
    '2bul1mav': {
      'en': 'Leader Area 9',
      'ar': '',
    },
    'vtj9g7k5': {
      'en': 'Leader Area 10',
      'ar': '',
    },
    'g3qew8vn': {
      'en': 'Leader Area 11',
      'ar': '',
    },
    '7u9v4mu9': {
      'en': 'Leader Area 12',
      'ar': '',
    },
    '3ofvz45p': {
      'en': 'Leader Area 13',
      'ar': '',
    },
    '6ubker3o': {
      'en': 'Leader Area 14',
      'ar': '',
    },
    'j76y4san': {
      'en': 'Leader Area 15',
      'ar': '',
    },
    'yuuar5tk': {
      'en': 'Leader Area 16',
      'ar': '',
    },
    'lsb6sgsi': {
      'en': 'Leader Area 17',
      'ar': '',
    },
    'aqqtzdwl': {
      'en': 'Leader Area 18',
      'ar': '',
    },
    '9zm1kvam': {
      'en': 'Leader Area 19',
      'ar': '',
    },
    '7gjtukqp': {
      'en': '--',
      'ar': '',
    },
    'jnt45e2u': {
      'en': 'Select Work Area',
      'ar': 'حدد منطقة العمل',
    },
    'ghmjg2sx': {
      'en': 'Select Code (optional)',
      'ar': 'اختر الرمز (اختياري)',
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
      'en': '260: Authority worker',
      'ar': '260: عامل هيئة',
    },
    '0gasou1f': {
      'en': '270: Workers’ driver',
      'ar': '270 : سائق العمال',
    },
    'a6fmozgx': {
      'en': '280: Authority car driver',
      'ar': '280 : سائق سيارة الهيئة',
    },
    'adpbzhca': {
      'en': '150-',
      'ar': '-150',
    },
    'o44nq1e3': {
      'en': 'Street Worker',
      'ar': 'عامل الشارع',
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
    'p8tugqrx': {
      'en': 'Shift Price',
      'ar': 'سعر الوردية',
    },
    '8qlq7929': {
      'en': 'Permissible monthly deficit %',
      'ar': 'العجز الشهري المسموح به %',
    },
    'suq6exhk': {
      'en': 'contract date',
      'ar': 'تاريخ العقد',
    },
    'nxrwi02a': {
      'en': '',
      'ar': '',
    },
    'dl8hsghd': {
      'en': '',
      'ar': '',
    },
    'tnens0ef': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'azm7t8e0': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'mz8l2oaj': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '0zsv5i5p': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'bcfrlk3f': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '5sjmqwng': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'd9j235xq': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'q436lgef': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'ul5x5si2': {
      'en': 'Upload Photo',
      'ar': '1. ارفق صورة البطاقة الشخصية',
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
      'en': 'Upload National ID',
      'ar': 'ارفق البطاقة الشخصية ',
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
      'ar': 'إضافة صورة',
    },
    'eofqawf9': {
      'en': 'Upload an image here...',
      'ar': 'ارفع صورة هنا...',
    },
    'ig3n93ko': {
      'en': 'Upload driving license',
      'ar': 'أرفق رخصة القيادة',
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
      'ar': 'إضافة صورة',
    },
    'u7fqinzu': {
      'en': 'Upload an image here...',
      'ar': 'ارفع صورة هنا...',
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
      'ar': 'إضافة صورة',
    },
    'q1886fcl': {
      'en': 'Upload an image here...',
      'ar': 'ارفع صورة هنا...',
    },
    '4dc1y3ut': {
      'en': 'Upload drug test',
      'ar': '',
    },
    'drel3fy8': {
      'en': 'Drug test',
      'ar': ' نتيجة اختبار المخدرات',
    },
    'crnh5tvi': {
      'en': 'Please upload your drug test.',
      'ar': 'يرجى تحميل اختبار المخدرات الخاص بك.',
    },
    'ufr9k2py': {
      'en': 'Add Photo',
      'ar': 'إضافة صورة',
    },
    'rs0xdy3j': {
      'en': 'Upload an image here...',
      'ar': 'ارفع صورة هنا...',
    },
    '7rakgrdr': {
      'en': '* Please verify the data, it cannot be changed later*',
      'ar': '* برجاء التأكد من البيانات فلا يمكن تغييرها لاحقاً',
    },
    'aue2890w': {
      'en': 'Next',
      'ar': 'التالي',
    },
    '11h2fvhe': {
      'en': 'Create  User',
      'ar': 'اضافة مستخدم',
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
      'en': 'Upload photo',
      'ar': 'تحميل صورة',
    },
    '6s92kvhj': {
      'en': 'Maximum 3 img/jpg',
      'ar': 'الحد الأقصى 3 صور',
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
    'hwi8wfh4': {
      'en': 'Missing tools Form',
      'ar': 'نموذج فقد أدوات ',
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
      'ar': 'إنشاء ',
    },
    'uvudahlw': {
      'en': 'Create Profile',
      'ar': '',
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
      'ar': 'قم بمراجعة التفاصيل أدناه الخاصة بفريقك.',
    },
    'lez1fc8z': {
      'en': 'Assign',
      'ar': 'تعيين',
    },
    'graxwi8p': {
      'en': 'Tasks Completed',
      'ar': 'اكتملت المهام',
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
      'ar': 'منظر',
    },
    '6yi526a1': {
      'en': '{Upcoming Milestones}',
      'ar': '{المعالم القادمة}',
    },
    'wgl7rxoo': {
      'en': '{Below are some of the upcoming tasks for.}',
      'ar': '{في ما يلي بعض المهام القادمة لـ.}',
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
      'ar': 'في تَقَدم',
    },
    '8owg0i1j': {
      'en': 'Today\'s Workers List',
      'ar': 'قائمة العمال اليوم',
    },
    'njhiko4d': {
      'en': 'Logout',
      'ar': 'تسجيل خروج',
    },
    '1862lwih': {
      'en': 'Logout For Worker',
      'ar': 'تسجيل الخروج للعامل',
    },
    'a3vwl85o': {
      'en': 'Add New',
      'ar': 'اضف جديد',
    },
    'h9gtcp9k': {
      'en': 'Assigned Users',
      'ar': 'المستخدمون المعينون',
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
      'ar': '#2008',
    },
    '3f74boic': {
      'en': 'Fri. Aug 11th',
      'ar': 'الجمعة. 11 أغسطس',
    },
    '47048m9r': {
      'en': 'worker',
      'ar': 'عامل',
    },
    '3x6tvpvc': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    '414yl3i7': {
      'en': 'Randy Peterson',
      'ar': 'راندي بيترسون',
    },
    'vcyful00': {
      'en': '#2008',
      'ar': '#2008',
    },
    'iwbh6b3f': {
      'en': 'Fri. Aug 11th',
      'ar': 'الجمعة. 11 أغسطس',
    },
    'tg5h08pj': {
      'en': 'worker',
      'ar': 'عامل',
    },
    'hrkxko6u': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    's0n40ssb': {
      'en': 'Randy Peterson',
      'ar': 'راندي بيترسون',
    },
    '662mv32r': {
      'en': '#2008',
      'ar': '#2008',
    },
    '3con0z70': {
      'en': 'Fri. Aug 11th',
      'ar': 'الجمعة. 11 أغسطس',
    },
    'xlvn8mpc': {
      'en': 'worker',
      'ar': 'عامل',
    },
    'lsllu42u': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    '3gmvs7mg': {
      'en': 'Randy Peterson',
      'ar': 'راندي بيترسون',
    },
    'wd63uniz': {
      'en': '#2008',
      'ar': '#2008',
    },
    '6jc1684x': {
      'en': 'Fri. Aug 11th',
      'ar': 'الجمعة. 11 أغسطس',
    },
    '35o6mpj8': {
      'en': 'worker',
      'ar': 'عامل',
    },
    '76psl0al': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'wbmzcdgw': {
      'en': 'End Shift For Superviser',
      'ar': 'نهاية التحول للمشرف',
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
      'ar': 'بيت',
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
      'ar': '1',
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
      'ar': 'رشا متيسر',
    },
    'ij2pfczv': {
      'en': 'Manager',
      'ar': 'مدير',
    },
    'kte849of': {
      'en': 'Abigail Herrara',
      'ar': 'نهى',
    },
    '2ogdziqh': {
      'en': 'Designer',
      'ar': 'سكرتير',
    },
    '554gt8te': {
      'en': 'Liz Ambridge',
      'ar': 'ابراهيم',
    },
    'zfne34ik': {
      'en': 'Manager',
      'ar': 'مشرف',
    },
    'zixopa8m': {
      'en': 'Liz Rogers',
      'ar': 'سامح',
    },
    'bllq1xmc': {
      'en': 'Front End Dev',
      'ar': 'مدير تشغيل',
    },
    '673o8b82': {
      'en': '25%',
      'ar': '25%',
    },
    '65jh4ywz': {
      'en': 'Manager',
      'ar': 'مدير',
    },
    '9puk607r': {
      'en': '55%',
      'ar': '',
    },
    'h6j9s8w2': {
      'en': 'Manager',
      'ar': 'مدير',
    },
    '6s6nv828': {
      'en': '55%',
      'ar': '55%',
    },
    'm6pmwf2x': {
      'en': 'Manager',
      'ar': 'مدير',
    },
    'u8ow0qct': {
      'en': 'Work Area',
      'ar': 'منطقة العمل',
    },
    'pspi9k94': {
      'en': 'View',
      'ar': 'عرض',
    },
    '7v2t2s51': {
      'en': 'General information about the area.',
      'ar': 'معلومات عامة عن المنطقة.',
    },
    'bx7bqyhu': {
      'en': 'Tasks',
      'ar': 'المهام',
    },
    '1ijdpn9m': {
      'en': 'Start Point',
      'ar': 'نقطة البداية',
    },
    'k16siumh': {
      'en': 'End Point',
      'ar': 'نقطة النهاية',
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
      'ar': 'الكل',
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
      'ar': 'البحث بالأدوات...',
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
      'ar': 'التأكيد',
    },
    '7cx3537s': {
      'en': 'Check out & Scan QR',
      'ar': 'تأكيد و سكان الكود',
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
      'en': 'Hello there!',
      'ar': 'المدير الاول',
    },
    'ct6dtfab': {
      'en':
          'This video shows how to fill out the form,\nIf you can read skip the video',
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
      'ar': '{منطقة العمل}',
    },
    'wjz3jdpt': {
      'en': '{Working Area discription}',
      'ar': '{وصف منطقة العمل}',
    },
    'nz4enkka': {
      'en': '{12} Tasks',
      'ar': '{12} المهام',
    },
    '8olvp832': {
      'en': 'Pending',
      'ar': 'قيد الانتظار',
    },
    'x6xtkr31': {
      'en': '{Task Name}',
      'ar': '{اسم المهمة}',
    },
    '7yoz6vwu': {
      'en': 'View',
      'ar': 'منظر',
    },
    'zwrqwk2r': {
      'en': '{Discription}',
      'ar': '{وصف}',
    },
    'mmnfxuta': {
      'en': 'Due',
      'ar': 'حق',
    },
    'gqck59l9': {
      'en': 'Tuesday, 10:00am',
      'ar': 'الثلاثاء، الساعة 10:00 صباحاً',
    },
    '0oxhwfw1': {
      'en': 'In Progress',
      'ar': 'في تَقَدم',
    },
    'kw0awglp': {
      'en': '{Task Name}',
      'ar': '{اسم المهمة}',
    },
    'u7ivogvc': {
      'en': 'View',
      'ar': 'منظر',
    },
    'w9slmqbf': {
      'en': '{Discription}',
      'ar': '{وصف}',
    },
    '6zucelhn': {
      'en': 'Due',
      'ar': 'حق',
    },
    'mvjeo69g': {
      'en': 'Tuesday, 10:00am',
      'ar': 'الثلاثاء، الساعة 10:00 صباحاً',
    },
    'cegnnv7t': {
      'en': 'In Progress',
      'ar': 'في تَقَدم',
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
      'ar': 'شاشات قالب التصميم',
    },
    '4xe382y1': {
      'en': 'Create template screen for task todo app.',
      'ar': 'إنشاء شاشة قالب لتطبيق المهام الواجبة.',
    },
    'lj8l8c29': {
      'en': 'Tuesday, 10:00am',
      'ar': 'الثلاثاء، الساعة 10:00 صباحاً',
    },
    'jerg319h': {
      'en': 'Completed',
      'ar': 'مكتمل',
    },
    'crra11hj': {
      'en': 'Daily Report',
      'ar': 'تقرير يومي',
    },
    's9e9ngqz': {
      'en': 'The daily report is delivered at the end of the shift',
      'ar': 'يتم تسليم التقرير اليومي في نهاية الوردية',
    },
    'zuy2topf': {
      'en': 'late',
      'ar': 'متأخر',
    },
    'v3gunpi9': {
      'en': '{Task Name}',
      'ar': '{اسم المهمة}',
    },
    'ovn0iahu': {
      'en': 'Provide reason',
      'ar': 'تقديم السبب',
    },
    'a42jbf5u': {
      'en': '{Discription}',
      'ar': '{وصف}',
    },
    '0tmvzxjl': {
      'en': 'Tuesday, 10:00am',
      'ar': 'الثلاثاء، الساعة 10:00 صباحاً',
    },
    '7y0a7ht6': {
      'en': 'Lated',
      'ar': 'متأخرا',
    },
    'a6u6ex2k': {
      'en': 'Task Tracker',
      'ar': 'تعقب المهام',
    },
    'dsy0bd7i': {
      'en': 'Tasks',
      'ar': 'مهام',
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
    '9201d0h7': {
      'en': 'Search listings...',
      'ar': 'قوائم البحث...',
    },
    'eiyc2m93': {
      'en': 'Section',
      'ar': 'قسم',
    },
    'o39cebb2': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'b0cy2tun': {
      'en': 'Morning',
      'ar': 'صباحي',
    },
    '8d6jrnn5': {
      'en': 'Evening',
      'ar': 'مسائي',
    },
    'p22wav2f': {
      'en': 'Night',
      'ar': 'ليلي',
    },
    'auoc8mgw': {
      'en': 'Shift',
      'ar': 'يحول',
    },
    '47jvouug': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'fofuopu6': {
      'en': '8 h',
      'ar': '8 ساعات',
    },
    '356irprz': {
      'en': '16 h',
      'ar': '16 ساعة',
    },
    'lmd7hzim': {
      'en': 'Day',
      'ar': 'يوم',
    },
    'hb1kdvar': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'i98ojcnt': {
      'en': 'clear',
      'ar': 'حذف',
    },
    'iyudgnjx': {
      'en': 'All',
      'ar': 'الجميع',
    },
    'qhpdwdqu': {
      'en': 'Worker',
      'ar': 'عامل',
    },
    'mp2a8rxq': {
      'en': 'Superviser',
      'ar': 'مشرف',
    },
    'm3oxy8mg': {
      'en': 'Other',
      'ar': 'آخر',
    },
    'pjcc4zh5': {
      'en': 'All',
      'ar': 'الجميع',
    },
    '42cyl7iz': {
      'en': 'All',
      'ar': 'الجميع',
    },
    'a8enoh7c': {
      'en': 'No: {20}',
      'ar': 'رقم: {20}',
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
      'ar': 'قيد الانتظار',
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
      'ar': 'قيد الانتظار',
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
  // Sv_Requests
  {
    'alqruwac': {
      'en': '*Please fill out the form below to continue.',
      'ar': '*يرجى ملء النموذج أدناه للمتابعة.',
    },
    '3rg258qg': {
      'en': 'Van',
      'ar': 'سيارة نقل',
    },
    'gykzklj5': {
      'en': 'TRICYCLE',
      'ar': 'دراجة ثلاثية العجلات',
    },
    'yh112kjz': {
      'en': 'Extra workers',
      'ar': 'عمال إضافيين',
    },
    'iep6a0tc': {
      'en': 'New tools',
      'ar': 'أدوات جديدة',
    },
    'niyjo530': {
      'en': 'Select one...',
      'ar': 'اختر واحدة...',
    },
    'tspnp1l0': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'iza4trm2': {
      'en': 'bock',
      'ar': 'بوك',
    },
    '8z435pkc': {
      'en': '2 ton',
      'ar': '2 طن',
    },
    'ge6uqk95': {
      'en': '4 ton',
      'ar': '4 طن',
    },
    'wg92uwv7': {
      'en': '44 rescue transfers',
      'ar': '44 عملية إنقاذ',
    },
    'ikr8z14a': {
      'en': 'Number*',
      'ar': 'رقم*',
    },
    '8ovemxd1': {
      'en': 'exact location',
      'ar': 'الموقع الدقيق',
    },
    'ct2ndo2d': {
      'en': '*For example, the name of the street or square,\n not the area',
      'ar': '*على سبيل المثال اسم الشارع أو الساحة،\n وليس المنطقة',
    },
    '6fi4d1en': {
      'en': 'Description....',
      'ar': 'وصف....',
    },
    '38b34et5': {
      'en': 'Submit Form',
      'ar': 'تقديم النموذج',
    },
    'gfb5dhwl': {
      'en': 'Please enter the patients full name.',
      'ar': 'الرجاء إدخال الاسم الكامل للمريض.',
    },
    '50mvtgt0': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'klg1bd61': {
      'en': 'Please enter an age for the patient.',
      'ar': 'الرجاء إدخال عمر المريض.',
    },
    '7eye35yj': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '5ecz0d1b': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'sjc3pb33': {
      'en': 'Please enter the date of birth of the patient.',
      'ar': 'الرجاء إدخال تاريخ ميلاد المريض.',
    },
    'p4v9rldb': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '59sadv3d': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '2c99dtx9': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'i9s80vgl': {
      'en': 'Requests form',
      'ar': 'نموذج الطلبات',
    },
    'oz8xu6fs': {
      'en': 'Requests',
      'ar': 'الطلبات',
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
      'ar': 'مسح الكاميرا',
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
      'ar': '{منطقة العمل}',
    },
    'ftibaqq1': {
      'en': '{General information about the area.}',
      'ar': '{معلومات عامة عن المنطقة.}',
    },
    'oyb27d5f': {
      'en': 'Tasks',
      'ar': 'مهام',
    },
    'fs4l7b0d': {
      'en': 'Start Point',
      'ar': 'نقطة البداية',
    },
    'w8akfsaj': {
      'en': 'End Point',
      'ar': 'نقطة النهاية',
    },
    '4j1b6o6u': {
      'en': 'Description',
      'ar': 'وصف',
    },
    'sx3v4cna': {
      'en':
          '{A beach is a narrow, gently sloping strip of land that lies along the edge of an ocean, lake, or river. Materials such as sand, pebbles, rocks, and seashell fragments cover beaches.}',
      'ar':
          '{الشاطئ عبارة عن شريط ضيق من الأرض منحدر بلطف يقع على طول حافة محيط أو بحيرة أو نهر. تغطي الشواطئ مواد مثل الرمل والحصى والصخور وشظايا الأصداف.}',
    },
    '22am2pvo': {
      'en': 'Add New',
      'ar': 'اضف جديد',
    },
    'wepzwju4': {
      'en': 'Areas',
      'ar': 'المناطق',
    },
    'kkm0g1h0': {
      'en': 'No: {12}',
      'ar': 'رقم: {12}',
    },
    'en531u8c': {
      'en': 'Maps Details',
      'ar': 'تفاصيل الخرائط',
    },
    'rhkhgjxv': {
      'en': 'Randy Peterson',
      'ar': 'راندي بيترسون',
    },
    'dl1p973n': {
      'en': 'Need',
      'ar': 'يحتاج',
    },
    '477omxdr': {
      'en': '8',
      'ar': '8',
    },
    '70w869uu': {
      'en': 'Randy Peterson',
      'ar': 'راندي بيترسون',
    },
    'azey1ri6': {
      'en': 'Need',
      'ar': 'يحتاج',
    },
    'kmjnmkyk': {
      'en': '8',
      'ar': '8',
    },
    'vgvz2ko8': {
      'en': 'Today\'s Workers List',
      'ar': 'قائمة العمال اليوم',
    },
    'z2ythfe5': {
      'en': 'PDF',
      'ar': 'بي دي إف',
    },
    'gmj5aubd': {
      'en': 'You can distribute workers like you want ',
      'ar': 'يمكنك توزيع العمال كما تريد',
    },
    '5mufhngh': {
      'en': '{Street Name}',
      'ar': '{اسم الشارع}',
    },
    '68mfjvxi': {
      'en': 'Need : {5}',
      'ar': 'الحاجة : {5}',
    },
    'ochnb0cj': {
      'en': 'worker name',
      'ar': 'اسم العامل',
    },
    'sd4331bz': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    '9j6p7t6e': {
      'en': 'Randy Peterson',
      'ar': 'راندي بيترسون',
    },
    'vj8i9xkx': {
      'en': '#2008',
      'ar': '#2008',
    },
    'j72fmf3l': {
      'en': 'Car',
      'ar': 'سيارة',
    },
    'ex3s6xvs': {
      'en': 'worker',
      'ar': 'عامل',
    },
    '5r3fdcq2': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'y8nwm4ox': {
      'en': 'worker',
      'ar': 'عامل',
    },
    'givs8cpr': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'xs6e3wvn': {
      'en': 'Randy Peterson',
      'ar': 'راندي بيترسون',
    },
    '2i5s47pw': {
      'en': '#2008',
      'ar': '#2008',
    },
    'n0ksiuqi': {
      'en': 'Car',
      'ar': 'سيارة',
    },
    'xd5kmrp2': {
      'en': 'worker',
      'ar': 'عامل',
    },
    '28z0oqd4': {
      'en': 'Search for an item...',
      'ar': '',
    },
    'r5za8r6v': {
      'en': 'worker',
      'ar': 'عامل',
    },
    'h8dk62gk': {
      'en': 'Search for an item...',
      'ar': '',
    },
    'ibq61164': {
      'en': 'Al Rahma',
      'ar': 'الرحمة',
    },
    'wn4dmqi8': {
      'en': 'Working Area',
      'ar': 'منطقة العمل',
    },
    '3odgey11': {
      'en': 'Working Area',
      'ar': 'بيت',
    },
  },
  // AttendenceofSupervisor
  {
    'un5c2em0': {
      'en': 'camera scan',
      'ar': 'مسح الكاميرا',
    },
    '1mncq6a6': {
      'en': 'Please scan the code to enter the system',
      'ar': 'يرجى مسح الرمز ضوئيًا للدخول إلى النظام',
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
      'ar': 'مسح الكاميرا',
    },
    '98y2lu2a': {
      'en': 'Please scan the code to logout from the system',
      'ar': 'يرجى مسح الرمز ضوئيًا لتسجيل الخروج من النظام',
    },
    '0jzyuw1b': {
      'en': 'Loggingout For Supervisor',
      'ar': '',
    },
    'dqki1ron': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // Submitting_complaints
  {
    'zr0c63b9': {
      'en': 'Inspector Name',
      'ar': 'اسم المفتش',
    },
    'iyqb6m0k': {
      'en': 'superviser',
      'ar': 'المشرف',
    },
    'f80uyqpf': {
      'en': 'ID: #1520',
      'ar': 'رقم التعريف: #1520',
    },
    'cw5lt8ov': {
      'en': '8h',
      'ar': '8 ساعات',
    },
    'sbn6rj2y': {
      'en': 'Leaving Work',
      'ar': 'ترك العمل',
    },
    'lr60dler': {
      'en': 'Negligence at Work',
      'ar': 'الإهمال في العمل',
    },
    'ykblzrmg': {
      'en': 'Insult and Slander',
      'ar': 'السب والقذف',
    },
    'l8benbiz': {
      'en': 'Assault by beating',
      'ar': 'الاعتداء بالضرب',
    },
    'bn3k4bym': {
      'en': 'Negligence in the tools',
      'ar': 'الإهمال في الأدوات',
    },
    'j01hmmfv': {
      'en': 'Unclean uniform',
      'ar': 'زي غير نظيف',
    },
    'di1h86r1': {
      'en': 'Reason..',
      'ar': 'سبب..',
    },
    'yu0wzol0': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'dkdcu4hu': {
      'en': 'Details',
      'ar': 'تفاصيل',
    },
    'f7ikp5m1': {
      'en': 'Upload Screenshot',
      'ar': 'تحميل لقطة الشاشة',
    },
    '3lr7t518': {
      'en': 'Maximum 3 img/jpg',
      'ar': 'الحد الأقصى 3img/jpg',
    },
    '2xu9ygjm': {
      'en': 'Make Complain',
      'ar': 'تقديم شكوى',
    },
    'uqcv56iy': {
      'en': 'Submitting complaints',
      'ar': 'تقديم الشكاوى',
    },
    'y7jsl6me': {
      'en': 'Home',
      'ar': 'بيت',
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
  // Taskdetails
  {
    'zg9ylgih': {
      'en': '{Task Area}',
      'ar': '{منطقة المهمة}',
    },
    'ebatp1zh': {
      'en': '{General information about the area.}',
      'ar': '{معلومات عامة عن المنطقة.}',
    },
    '7jwop0dm': {
      'en': 'Tasks',
      'ar': 'مهام',
    },
    '8eayl07z': {
      'en': 'Start Point',
      'ar': 'نقطة البداية',
    },
    'cr8055qh': {
      'en': 'End Point',
      'ar': 'نقطة النهاية',
    },
    'nrty5alo': {
      'en': 'Description',
      'ar': 'وصف',
    },
    '4mx9l0rp': {
      'en':
          '{A beach is a narrow, gently sloping strip of land that lies along the edge of an ocean, lake, or river. Materials such as sand, pebbles, rocks, and seashell fragments cover beaches.}',
      'ar':
          '{الشاطئ عبارة عن شريط ضيق من الأرض منحدر بلطف يقع على طول حافة محيط أو بحيرة أو نهر. تغطي الشواطئ مواد مثل الرمل والحصى والصخور وشظايا الأصداف.}',
    },
    'xanuoi83': {
      'en': 'Today\'s Workers',
      'ar': 'قائمة العمال اليوم',
    },
    '9v5apylh': {
      'en': 'Due Date',
      'ar': 'تاريخ الاستحقاق',
    },
    '22eb2j9h': {
      'en': 'Actions',
      'ar': 'أجراءات',
    },
    'ry7v71pc': {
      'en': 'Randy Peterson',
      'ar': 'راندي بيترسون',
    },
    'v29dvb1c': {
      'en': '#2008',
      'ar': '#2008',
    },
    '6b5jb40e': {
      'en': 'Fri. Aug 11th',
      'ar': 'الجمعة. 11 أغسطس',
    },
    's88ljdn3': {
      'en': 'Car',
      'ar': 'سيارة',
    },
    '3s03rpek': {
      'en': 'worker',
      'ar': 'عامل',
    },
    'f0ks9a3r': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'ga09kej3': {
      'en': 'Randy Peterson',
      'ar': 'راندي بيترسون',
    },
    'sctpdhof': {
      'en': '#2008',
      'ar': '#2008',
    },
    'x9r3js2a': {
      'en': 'Fri. Aug 11th',
      'ar': 'الجمعة. 11 أغسطس',
    },
    'fv1tda3d': {
      'en': 'Car',
      'ar': 'سيارة',
    },
    'srfnbxfp': {
      'en': 'worker',
      'ar': 'عامل',
    },
    'upcele1s': {
      'en': 'Search for an item...',
      'ar': '',
    },
    'gh3z1e6u': {
      'en': 'Randy Peterson',
      'ar': 'راندي بيترسون',
    },
    '19zk9zuq': {
      'en': '#2008',
      'ar': '#2008',
    },
    'gqi1f22x': {
      'en': 'Fri. Aug 11th',
      'ar': 'الجمعة. 11 أغسطس',
    },
    'mhdpv53u': {
      'en': 'Car',
      'ar': 'سيارة',
    },
    '1svdwnky': {
      'en': 'worker',
      'ar': 'عامل',
    },
    'br841o1f': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    '04ee2bqs': {
      'en': 'Upload Screenshot',
      'ar': 'تحميل لقطة الشاشة',
    },
    'fa6nvb27': {
      'en': 'Maximum 3 img/jpg',
      'ar': 'الحد الأقصى 3img/jpg',
    },
    't3wwkofo': {
      'en': 'Details...',
      'ar': 'تفاصيل...',
    },
    'pk9qzrbg': {
      'en': 'submit',
      'ar': 'يُقدِّم',
    },
    'tr4gjg97': {
      'en': 'Task Details',
      'ar': 'تفاصيل المهمة',
    },
    '7vkdg2mk': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // loggingout_for_Workers
  {
    '6yo7yalg': {
      'en': 'camera scan',
      'ar': 'مسح الكاميرا',
    },
    'tbgfks6y': {
      'en': 'Please scan the code to logout from the system',
      'ar': 'يرجى مسح الرمز ضوئيًا لتسجيل الخروج من النظام',
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
      'ar': 'اسم المفتش',
    },
    '1hy8col7': {
      'en': 'worker',
      'ar': 'عامل',
    },
    'jenthgkx': {
      'en': 'ID: #1520',
      'ar': 'رقم التعريف: #1520',
    },
    'vt96rrvg': {
      'en': '8h',
      'ar': '8 ساعات',
    },
    '5915fyrp': {
      'en': 'Answer the call',
      'ar': 'ردي على المكالمة',
    },
    'dq04wzzt': {
      'en': 'Street cleanliness',
      'ar': 'نظافة الشوارع',
    },
    '19e4sfl3': {
      'en': 'manner with supervisor',
      'ar': 'الطريقة مع المشرف',
    },
    'prci80vl': {
      'en': 'Removing ',
      'ar': 'إزالة',
    },
    '4i48ykt5': {
      'en': 'to lift',
      'ar': 'لرفع',
    },
    '2vzwbehr': {
      'en': 'wash',
      'ar': 'غسل',
    },
    'fh2487yn': {
      'en': 'make a complaint?',
      'ar': 'تقديم شكوى؟',
    },
    'konxwuux': {
      'en': 'submit',
      'ar': 'يُقدِّم',
    },
    'e34iw7co': {
      'en': 'Worker Review',
      'ar': 'مراجعة العامل',
    },
    '84ldmo4n': {
      'en': 'Home',
      'ar': 'بيت',
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
    'e8v3icth': {
      'en': 'Home',
      'ar': 'الصفحه الرئيسيه',
    },
  },
  // Tm_Home
  {
    'ttjcsrzi': {
      'en': 'Al Rahma',
      'ar': 'الرحمة',
    },
    'mhy2yg3f': {
      'en': 'Traffic management',
      'ar': 'إدارة المرور',
    },
    '5ramxson': {
      'en': 'Hello,',
      'ar': 'مرحبًا،',
    },
    '2jv2y9vp': {
      'en': 'servicing report',
      'ar': 'تقرير الخدمة',
    },
    '7iiblxym': {
      'en': 'Add movement',
      'ar': 'أضف الحركة',
    },
    'j8cmh55u': {
      'en': ' Requests\n',
      'ar': 'الطلبات',
    },
    'clz7l79f': {
      'en': 'Powerd by Omar-s Team',
      'ar': 'بدعم من فريق عمر',
    },
    'oo4equt8': {
      'en': '__',
      'ar': '__',
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
    'b2im9x3r': {
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
    'qve8sti1': {
      'en': 'Home',
      'ar': 'الصفحه الرئيسيه',
    },
  },
  // movment
  {
    'x9vapwtu': {
      'en': 'motocycle',
      'ar': 'دراجة نارية',
    },
    'zia5wmfv': {
      'en': 'truecycle',
      'ar': '',
    },
    'smd9d7b9': {
      'en': 'The Truck',
      'ar': 'شاحنة',
    },
    'svx1zzyt': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    '0wybuh87': {
      'en': 'driver1',
      'ar': 'driver1',
    },
    '5pabmors': {
      'en': 'driver2',
      'ar': 'driver2',
    },
    'kfr4bwp5': {
      'en': 'driver3',
      'ar': 'driver3',
    },
    'aalfmvcg': {
      'en': 'The Driver',
      'ar': 'السائق',
    },
    'tjvovdn2': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'yu0x4g3k': {
      'en': '123 | م ن ص ',
      'ar': '123 | م ن ص',
    },
    '7m4y6379': {
      'en': '127 | م ن ص ',
      'ar': '127 | م ن ص',
    },
    'ora15h7c': {
      'en': '134 | م ن ص ',
      'ar': '134 | م ن ص',
    },
    'ezhqnpk5': {
      'en': '143 | م ن ص ',
      'ar': '143 | م ن ص',
    },
    'afzp9966': {
      'en': '936 | ل ن ص ',
      'ar': '936 | ل ن ص',
    },
    '7h85una5': {
      'en': '938 | ل ن ص ',
      'ar': '938 | ل ن ص',
    },
    'nuiz1nft': {
      'en': '942 | ل ن ص ',
      'ar': '942 | ل ن ص',
    },
    'dxw5ffpm': {
      'en': '943 | ل ن ص ',
      'ar': '943 | ل ن ص',
    },
    '685xvyjx': {
      'en': '964 | ل ن ص ',
      'ar': '964 | ل ن ص',
    },
    'c8q4pf0w': {
      'en': '987 | ل ن ص ',
      'ar': '987 | ل ن ص',
    },
    'u9fb727w': {
      'en': 'Tricycle',
      'ar': 'دراجة ثلاثية العجلات',
    },
    'ag69gso8': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'dym09nuy': {
      'en': '936 | ل ن ص ',
      'ar': '936 | ل ن ص',
    },
    'kjw16xyi': {
      'en': '..',
      'ar': '..',
    },
    '0iqxia66': {
      'en': 'Motocycle',
      'ar': 'دراجة نارية',
    },
    '1z59pjzc': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'pe7viyok': {
      'en': 'Details',
      'ar': 'تفاصيل',
    },
    '3xgek4pu': {
      'en': 'Done',
      'ar': 'منتهي',
    },
    'n2pwke1e': {
      'en': 'Adding Movement !',
      'ar': 'إضافة حركة!',
    },
    'foek0c6i': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // Add_servicingreport
  {
    '7a13kl4g': {
      'en': 'motocycle',
      'ar': 'دراجة نارية',
    },
    'frjmbwmk': {
      'en': 'true cycle',
      'ar': 'دورة حقيقية',
    },
    'ioyfj7od': {
      'en': 'The Truck',
      'ar': 'شاحنة',
    },
    'hf1k8c3e': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    '3tkugylh': {
      'en': 'driver1',
      'ar': 'driver1',
    },
    '24dubdc8': {
      'en': 'driver2',
      'ar': 'driver2',
    },
    'htbhljiu': {
      'en': 'driver3',
      'ar': 'driver3',
    },
    'ogo4tyx6': {
      'en': 'Mechanical',
      'ar': 'السائق',
    },
    'a257llc2': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'oh6ocqr5': {
      'en': '123 | م ن ص ',
      'ar': '123 | م ن ص',
    },
    'umj4dnz2': {
      'en': '127 | م ن ص ',
      'ar': '127 | م ن ص',
    },
    '0lgh9jn2': {
      'en': '134 | م ن ص ',
      'ar': '134 | م ن ص',
    },
    'org8s2dl': {
      'en': '143 | م ن ص ',
      'ar': '143 | م ن ص',
    },
    'v6xvv5pp': {
      'en': '936 | ل ن ص ',
      'ar': '936 | ل ن ص',
    },
    'rw6j9s3n': {
      'en': '938 | ل ن ص ',
      'ar': '938 | ل ن ص',
    },
    'zl3oyy3f': {
      'en': '942 | ل ن ص ',
      'ar': '942 | ل ن ص',
    },
    's9ez23pe': {
      'en': '943 | ل ن ص ',
      'ar': '943 | ل ن ص',
    },
    'tkq5fhgs': {
      'en': '964 | ل ن ص ',
      'ar': '964 | ل ن ص',
    },
    'pvad9ayd': {
      'en': '987 | ل ن ص ',
      'ar': '987 | ل ن ص',
    },
    'fpsk3lfx': {
      'en': 'Tricycle',
      'ar': 'دراجة ثلاثية العجلات',
    },
    'hz7xeawl': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'fikhx5ie': {
      'en': 'Total price :',
      'ar': 'السعر الكلي :',
    },
    'i7l74eky': {
      'en': '...........',
      'ar': '............',
    },
    'n40p0sl5': {
      'en': 'Details',
      'ar': 'تفاصيل',
    },
    'vm7iv8uh': {
      'en': 'Done',
      'ar': 'منتهي',
    },
    'qra1mrrw': {
      'en': 'servicing report !',
      'ar': 'تقرير الخدمة!',
    },
    'do2jph4l': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Tm_List_Requests
  {
    '5jwjbaz7': {
      'en': 'Active Requests : {12} ',
      'ar': 'الطلبات النشطة : {12}',
    },
    '1ge5y561': {
      'en': 'Pending',
      'ar': 'عامل',
    },
    '98akjcqy': {
      'en': '{Sv Name}',
      'ar': '{اسم سيفرت}',
    },
    '8o2snr1w': {
      'en': 'View',
      'ar': 'منظر',
    },
    '0jg2k6yl': {
      'en': '{Leader 5} | {Maadi}',
      'ar': '{القائد 5} | {المعادي}',
    },
    '1ygzw5rp': {
      'en': '{Details}',
      'ar': '{تفاصيل}',
    },
    'xc9pfwev': {
      'en': 'Truesicly',
      'ar': 'بصدق',
    },
    'g7vvr5qc': {
      'en': 'Due',
      'ar': 'حق',
    },
    '4mkmu4fp': {
      'en': 'Tuesday, 10:00am',
      'ar': 'الثلاثاء، الساعة 10:00 صباحاً',
    },
    'm6btcpn6': {
      'en': 'In Progress',
      'ar': 'في تَقَدم',
    },
    'xk1chcp4': {
      'en': '{Sv Name}',
      'ar': '{اسم سيفرت}',
    },
    'ume75mu0': {
      'en': 'View',
      'ar': 'منظر',
    },
    '7brc8mrr': {
      'en': '{Leader 5} | {Maadi}',
      'ar': '{القائد 5} | {المعادي}',
    },
    'rn328ijr': {
      'en': '{Details}',
      'ar': '{تفاصيل}',
    },
    '6tyydwpj': {
      'en': 'Truesicly',
      'ar': 'بصدق',
    },
    'q90p1knc': {
      'en': 'Due',
      'ar': 'حق',
    },
    'nxzf6nho': {
      'en': 'Tuesday, 10:00am',
      'ar': 'الثلاثاء، الساعة 10:00 صباحاً',
    },
    'tedllljo': {
      'en': 'In Progress',
      'ar': 'في تَقَدم',
    },
    'w89kyjul': {
      'en': 'Completed',
      'ar': 'مكتمل',
    },
    'vwxaucc9': {
      'en': '{Sv Name}',
      'ar': '{اسم سيفرت}',
    },
    '4x9t2r3h': {
      'en': '{Leader 5} | {Maadi}',
      'ar': '{القائد 5} | {المعادي}',
    },
    'zba47is3': {
      'en': 'Create template screen for task todo app.',
      'ar': 'إنشاء شاشة قالب لتطبيق المهام الواجبة.',
    },
    'mb7feii0': {
      'en': 'Truesicly',
      'ar': 'بصدق',
    },
    '9w3xnifp': {
      'en': 'Driver name',
      'ar': 'اسم السائق',
    },
    'gzzzmjc8': {
      'en': 'Tuesday, 10:00am',
      'ar': 'الثلاثاء، الساعة 10:00 صباحاً',
    },
    '1mh327c9': {
      'en': 'Completed',
      'ar': 'مكتمل',
    },
    '9gjw61m7': {
      'en': '{Sv Name}',
      'ar': '{اسم سيفرت}',
    },
    'zenjy83w': {
      'en': 'Traffic Manager | Errands',
      'ar': 'مدير المرور | المهمات',
    },
    'fpjskrvs': {
      'en': 'Create template screen for task todo app.',
      'ar': 'إنشاء شاشة قالب لتطبيق المهام الواجبة.',
    },
    'plyh38hw': {
      'en': 'Truesicly',
      'ar': 'بصدق',
    },
    'fm97i9uy': {
      'en': 'Driver name',
      'ar': 'اسم السائق',
    },
    '4w0ftt3g': {
      'en': 'Tuesday, 10:00am',
      'ar': 'الثلاثاء، الساعة 10:00 صباحاً',
    },
    'kmmlhg1u': {
      'en': 'Completed',
      'ar': 'مكتمل',
    },
    'ltsbyy48': {
      'en': 'Export PDF',
      'ar': 'تصدير قوات الدفاع الشعبي',
    },
    'btxf0k44': {
      'en': 'Report on errands and motorcycle movement',
      'ar': 'تقرير عن المهمات وحركة الدراجات النارية',
    },
    'g17fmf21': {
      'en': 'All Requests',
      'ar': 'جميع الطلبات',
    },
    '7r9wb1u4': {
      'en': 'Tasks',
      'ar': 'مهام',
    },
  },
  // Tm_Task_Discription
  {
    'utbn2jvm': {
      'en': '{Sv Name}',
      'ar': '{اسم سيفرت}',
    },
    '3g0cfbml': {
      'en': '{Leader 5} | {Maadi}',
      'ar': '{القائد 5} | {المعادي}',
    },
    'p5zjqoxs': {
      'en': '#ID',
      'ar': '#بطاقة تعريف',
    },
    'i16xuzen': {
      'en': 'Due',
      'ar': 'حق',
    },
    'b68fnzl7': {
      'en': 'In Progress',
      'ar': 'في تَقَدم',
    },
    'a600nrfk': {
      'en': 'Tuesday, 10:00am',
      'ar': 'الثلاثاء، الساعة 10:00 صباحاً',
    },
    'rzroif9e': {
      'en': 'Discription',
      'ar': 'وصف',
    },
    'yiqe28er': {
      'en': 'ST',
      'ar': 'شارع',
    },
    'bgqgriii': {
      'en': '15',
      'ar': '15',
    },
    'xa2nozcq': {
      'en': 'KIND OF CAR',
      'ar': 'نوع السيارة',
    },
    'snalz0mi': {
      'en': 'Truci',
      'ar': 'تروسي',
    },
    'v4v2o423': {
      'en': 'Discription',
      'ar': 'وصف',
    },
    '80uy1gjc': {
      'en':
          'hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhcompanyname.co',
      'ar':
          'هههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههه اسم الشركة.',
    },
    'ap9dn0r8': {
      'en': 'Asghin Driver & Area',
      'ar': 'سائق ومنطقة Asghin',
    },
    'bpmv1nkh': {
      'en': 'motocycle',
      'ar': 'دراجة نارية',
    },
    'k8pynclf': {
      'en': 'true cycle',
      'ar': 'دورة حقيقية',
    },
    'dj4fv7ye': {
      'en': 'The Truck',
      'ar': 'شاحنة',
    },
    'sxss7eo9': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'zj9mdihv': {
      'en': 'driver1',
      'ar': 'driver1',
    },
    'oibggz4a': {
      'en': 'driver2',
      'ar': 'driver2',
    },
    'jxomncy2': {
      'en': 'driver3',
      'ar': 'driver3',
    },
    'h4p61aih': {
      'en': 'The Driver',
      'ar': 'السائق',
    },
    'pnme5x46': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'bdqkvrqi': {
      'en': '123 | م ن ص ',
      'ar': '123 | م ن ص',
    },
    'aj672dy3': {
      'en': '127 | م ن ص ',
      'ar': '127 | م ن ص',
    },
    'hbd3g4ro': {
      'en': '134 | م ن ص ',
      'ar': '134 | م ن ص',
    },
    'l6os2yt9': {
      'en': '143 | م ن ص ',
      'ar': '143 | م ن ص',
    },
    'n3ulb91y': {
      'en': '936 | ل ن ص ',
      'ar': '936 | ل ن ص',
    },
    'uhih9rb3': {
      'en': '938 | ل ن ص ',
      'ar': '938 | ل ن ص',
    },
    'kw1xzqoo': {
      'en': '942 | ل ن ص ',
      'ar': '942 | ل ن ص',
    },
    'zy07rhtq': {
      'en': '943 | ل ن ص ',
      'ar': '943 | ل ن ص',
    },
    '8b717lgx': {
      'en': '964 | ل ن ص ',
      'ar': '964 | ل ن ص',
    },
    '9tontz6w': {
      'en': '987 | ل ن ص ',
      'ar': '987 | ل ن ص',
    },
    'isvi0gkv': {
      'en': 'Tricycle',
      'ar': 'دراجة ثلاثية العجلات',
    },
    'wasdiuiz': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'aynxxi43': {
      'en': 'Mark as Complete',
      'ar': 'وضع علامة كمكتمل',
    },
    'z5xo7c6b': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // ServicingDiscription
  {
    'xi7lfxbs': {
      'en': 'The Truck',
      'ar': 'شاحنة',
    },
    'yuw4cnwn': {
      'en': 'Mechanical',
      'ar': 'ميكانيكي',
    },
    '3zmj57zv': {
      'en': 'tricycle',
      'ar': 'دراجة ثلاثية العجلات',
    },
    'u885ljfw': {
      'en': 'Total price :',
      'ar': 'السعر الكلي :',
    },
    '4okytpln': {
      'en': 'L.E',
      'ar': 'جنيه مصري',
    },
    'ycsft9se': {
      'en': 'Details',
      'ar': 'تفاصيل',
    },
    's0yk1dgb': {
      'en': 'Export PDF',
      'ar': 'تصدير قوات الدفاع الشعبي',
    },
    '1981rbb3': {
      'en': 'Servicing Discription',
      'ar': 'وصف الخدمة',
    },
    'xbbj12zh': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // Tm_List_Fixing
  {
    'r138awnv': {
      'en': 'Total Fixing Reports : {12} ',
      'ar': 'إجمالي تقارير الإصلاح : {12}',
    },
    'j1iyh2qi': {
      'en': 'Truesicly',
      'ar': 'بصدق',
    },
    'rd3gvxtw': {
      'en': 'View',
      'ar': 'منظر',
    },
    'nascr4hr': {
      'en': ' م ن ص | 127',
      'ar': 'م ن ص | 127',
    },
    'cqdp8lhd': {
      'en': '{Details}',
      'ar': '{تفاصيل}',
    },
    'dqr1b7ea': {
      'en': 'mechanical name',
      'ar': 'الاسم الميكانيكي',
    },
    'qs3yu1qw': {
      'en': 'Tuesday, 10:00am',
      'ar': 'الثلاثاء، الساعة 10:00 صباحاً',
    },
    'q0k5k7xp': {
      'en': '500 L.E',
      'ar': '500 ج.م',
    },
    'ln27oahb': {
      'en': 'Export PDF',
      'ar': 'تصدير قوات الدفاع الشعبي',
    },
    'yq2uhgp7': {
      'en': 'List of Fixing Reports',
      'ar': 'قائمة تقارير الإصلاح',
    },
    '0btmtwv4': {
      'en': 'Tasks',
      'ar': 'مهام',
    },
  },
  // Form_for_LatedTask
  {
    'x3zcsk3s': {
      'en': 'Write your Details , Tells your manegar about reason.',
      'ar': 'اكتب التفاصيل الخاصة بك، ويخبر مديرك عن السبب.',
    },
    '83kgyw5v': {
      'en': 'Details',
      'ar': 'تفاصيل',
    },
    '4ap4cl3y': {
      'en': 'Upload Screenshot',
      'ar': 'تحميل لقطة الشاشة',
    },
    '6tk2f14z': {
      'en': 'Maximum 3 img/jpg',
      'ar': 'الحد الأقصى 3img/jpg',
    },
    '7joqfo2i': {
      'en': 'Submit',
      'ar': 'يُقدِّم',
    },
    'cjgwmno4': {
      'en': 'Lated Task',
      'ar': 'تقديم الشكاوى',
    },
    'mhn69er9': {
      'en': 'Home',
      'ar': 'بيت',
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
      'ar': '{معلومات عامة عن المنطقة.}',
    },
    '5w7be2nm': {
      'en': 'Tasks',
      'ar': 'مهام',
    },
    'tnb65x9m': {
      'en': 'Start Point',
      'ar': 'نقطة البداية',
    },
    '01tw8lkz': {
      'en': 'End Point',
      'ar': 'نقطة النهاية',
    },
    'ptcgp792': {
      'en': 'Description',
      'ar': 'وصف',
    },
    'lnjpxv5a': {
      'en':
          '{A beach is a narrow, gently sloping strip of land that lies along the edge of an ocean, lake, or river. Materials such as sand, pebbles, rocks, and seashell fragments cover beaches.}',
      'ar':
          '{الشاطئ عبارة عن شريط ضيق من الأرض منحدر بلطف يقع على طول حافة محيط أو بحيرة أو نهر. تغطي الشواطئ مواد مثل الرمل والحصى والصخور وشظايا الأصداف.}',
    },
    '3dy7kavg': {
      'en': 'Today\'s Workers',
      'ar': '',
    },
    'utbpn9jh': {
      'en': 'Due Date',
      'ar': '',
    },
    'uxemoir7': {
      'en': 'Actions',
      'ar': '',
    },
    '2qmskmps': {
      'en': 'Randy Peterson',
      'ar': 'راندي بيترسون',
    },
    'vx9jhi1k': {
      'en': '#2008',
      'ar': '#2008',
    },
    'bd6u764h': {
      'en': 'Fri. Aug 11th',
      'ar': '',
    },
    'g8dbrj84': {
      'en': 'Car',
      'ar': '',
    },
    'h34plf1q': {
      'en': 'worker',
      'ar': '',
    },
    'ira6s34r': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    '9rlld8lx': {
      'en': 'Randy Peterson',
      'ar': 'راندي بيترسون',
    },
    'sphpjqc7': {
      'en': '#2008',
      'ar': '#2008',
    },
    '0x6ee3pf': {
      'en': 'Fri. Aug 11th',
      'ar': '',
    },
    '2b6vf2py': {
      'en': 'Car',
      'ar': 'سيارة',
    },
    '90pec0p2': {
      'en': 'worker',
      'ar': '',
    },
    '33h2dh1m': {
      'en': 'Search for an item...',
      'ar': '',
    },
    '2rs3lhkm': {
      'en': 'Randy Peterson',
      'ar': 'راندي بيترسون',
    },
    'n8673utv': {
      'en': '#2008',
      'ar': '',
    },
    'xy5wpe11': {
      'en': 'Fri. Aug 11th',
      'ar': '',
    },
    'nctq4an9': {
      'en': 'Car',
      'ar': 'سيارة',
    },
    '6irqnrmn': {
      'en': 'worker',
      'ar': '',
    },
    'mqpfad71': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'pbg3g1vi': {
      'en': 'Upload Screenshot',
      'ar': '',
    },
    'sj073f9z': {
      'en': 'Maximum 3 img/jpg',
      'ar': 'الحد الأقصى 3img/jpg',
    },
    '2s2lg07w': {
      'en': 'submit',
      'ar': 'يُقدِّم',
    },
    '1oyt1p3m': {
      'en': 'Task Details',
      'ar': '',
    },
    '4eqbjzu4': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // Sv_RequestsCopy
  {
    'u3glddcb': {
      'en': '{Sv Name}',
      'ar': '{اسم سيفرت}',
    },
    '431h54gy': {
      'en': 'View',
      'ar': 'منظر',
    },
    'nyqdi7a0': {
      'en': '{Leader 5}  | {Maadi}',
      'ar': '',
    },
    '2a1tr5rp': {
      'en': '{Details}',
      'ar': '{تفاصيل}',
    },
    'c120pjv2': {
      'en': 'Truesicly',
      'ar': 'بصدق',
    },
    'i7n5uma8': {
      'en': 'Due',
      'ar': '',
    },
    '8mrn7yp7': {
      'en': 'Tuesday, 10:00am',
      'ar': 'الثلاثاء، الساعة 10:00 صباحاً',
    },
    'msz8qrb0': {
      'en': 'In Progress',
      'ar': 'في تَقَدم',
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
    'yi0mupst': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
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
    'm9hde46z': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'cbwncork': {
      'en': 'Please enter an age for the patient.',
      'ar': '',
    },
    '6jmgnqqz': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'mk7vinbk': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '2z99u79b': {
      'en': 'Please enter the date of birth of the patient.',
      'ar': '',
    },
    'tz8hguxz': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'uqp1cu71': {
      'en': 'Field is required',
      'ar': ' مطلوب الملء',
    },
    '0tzma4qa': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
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
  // supllierHome
  {
    '7ksbf9qh': {
      'en': 'Hello,',
      'ar': 'مرحبًا،',
    },
    'jzucjc6q': {
      'en': 'Team Overview',
      'ar': 'نظرة عامة على الفريق',
    },
    'km0aji3e': {
      'en': 'Review the details below of your Team.',
      'ar': 'قم بمراجعة التفاصيل أدناه الخاصة بفريقك.',
    },
    '2krhrc0b': {
      'en': 'Assign',
      'ar': 'تعيين',
    },
    'xee4zb8j': {
      'en': 'Workers',
      'ar': 'عمال',
    },
    'wi0bsfep': {
      'en': '32.2%',
      'ar': '32.2%',
    },
    'an47agsm': {
      'en': '50 ',
      'ar': '50',
    },
    'he1zirqe': {
      'en': '/ 500',
      'ar': '/ 500',
    },
    'u6he5v84': {
      'en': 'Upcoming Tasks',
      'ar': 'المهام القادمة',
    },
    'o3ig2bh1': {
      'en': '17',
      'ar': '17',
    },
    '9rq44aie': {
      'en': '45.5%',
      'ar': '45.5%',
    },
    '9jfmypz6': {
      'en': 'Work Area',
      'ar': 'منطقة العمل',
    },
    'g1sx88fe': {
      'en': 'General information about the area.',
      'ar': 'معلومات عامة عن المنطقة.',
    },
    'djhy12c0': {
      'en': 'Tasks',
      'ar': 'مهام',
    },
    'nshbnc0k': {
      'en': 'Start Point',
      'ar': 'نقطة البداية',
    },
    '2m8pk3as': {
      'en': 'End Point',
      'ar': 'نقطة النهاية',
    },
    'lh2ros73': {
      'en': 'Daily Goal',
      'ar': 'الهدف اليومي',
    },
    'bwxjociu': {
      'en': '62.2% /',
      'ar': '62.2% /',
    },
    'lijqyy0d': {
      'en': ' 12',
      'ar': '12',
    },
    'ipynbttm': {
      'en': '',
      'ar': '',
    },
    'j48cofx9': {
      'en': 'Achieved goals: ',
      'ar': 'الأهداف المحققة:',
    },
    'j4f3eltl': {
      'en': '3',
      'ar': '3',
    },
    '6q16sq71': {
      'en': 'All',
      'ar': 'الجميع',
    },
    'iaq7esau': {
      'en': 'Current Task',
      'ar': 'المهمة الحالية',
    },
    '7rdj0s8n': {
      'en': 'View',
      'ar': 'منظر',
    },
    'b7a8imtz': {
      'en': '{Upcoming Milestones}',
      'ar': '{المعالم القادمة}',
    },
    'uixdvj2c': {
      'en': '{Below are some of the upcoming tasks for.}',
      'ar': '{في ما يلي بعض المهام القادمة لـ.}',
    },
    'sdnxewab': {
      'en': 'Due',
      'ar': 'حق',
    },
    'p2w9doze': {
      'en': 'Tuesday, 10:00am',
      'ar': 'الثلاثاء، الساعة 10:00 صباحاً',
    },
    'lv5x10gz': {
      'en': 'In Progress',
      'ar': 'في تَقَدم',
    },
    'duq1qm9n': {
      'en': 'Today\'s Workers List',
      'ar': 'قائمة العمال اليوم',
    },
    'rwboq6iq': {
      'en': 'Logout',
      'ar': 'تسجيل خروج',
    },
    'mc1vxhr3': {
      'en': 'Logout For Worker',
      'ar': 'تسجيل الخروج للعامل',
    },
    'awdkcyxo': {
      'en': 'Add New',
      'ar': 'اضف جديد',
    },
    '9593xxnl': {
      'en': 'Assigned Users',
      'ar': 'المستخدمون المعينون',
    },
    '2ru4ldaz': {
      'en': 'Due Date',
      'ar': 'تاريخ الاستحقاق',
    },
    '22stnhbk': {
      'en': 'Actions',
      'ar': 'أجراءات',
    },
    'aafd1awp': {
      'en': 'Randy Peterson',
      'ar': 'راندي بيترسون',
    },
    'vjnm8idm': {
      'en': '#2008',
      'ar': '#2008',
    },
    '8wd932sp': {
      'en': 'Fri. Aug 11th',
      'ar': 'الجمعة. 11 أغسطس',
    },
    'lgmztent': {
      'en': 'worker',
      'ar': 'عامل',
    },
    'cnoqdw77': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'yrt5bu3s': {
      'en': 'Randy Peterson',
      'ar': 'راندي بيترسون',
    },
    'gtn6m6b4': {
      'en': '#2008',
      'ar': '#2008',
    },
    'dupjdyb5': {
      'en': 'Fri. Aug 11th',
      'ar': 'الجمعة. 11 أغسطس',
    },
    'wo939onq': {
      'en': 'worker',
      'ar': 'عامل',
    },
    'ni2rb8pu': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'hk5j95lc': {
      'en': 'Randy Peterson',
      'ar': 'راندي بيترسون',
    },
    'ak5i7r4u': {
      'en': '#2008',
      'ar': '#2008',
    },
    'elsv6sq3': {
      'en': 'Fri. Aug 11th',
      'ar': 'الجمعة. 11 أغسطس',
    },
    'rsmkgav7': {
      'en': 'worker',
      'ar': 'عامل',
    },
    'w3747xf8': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    '0c1i7k7y': {
      'en': 'Randy Peterson',
      'ar': 'راندي بيترسون',
    },
    '6ezhy05k': {
      'en': '#2008',
      'ar': '#2008',
    },
    '6umbcp5y': {
      'en': 'Fri. Aug 11th',
      'ar': 'الجمعة. 11 أغسطس',
    },
    '1wvcn098': {
      'en': 'worker',
      'ar': 'عامل',
    },
    'vm2qlpff': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'xs9hi29a': {
      'en': 'End Shift For Superviser',
      'ar': 'نهاية التحول للمشرف',
    },
    '15r7590t': {
      'en': 'Activity',
      'ar': 'نشاط',
    },
    'e4xwn0qe': {
      'en': 'Recent completed tasks from your team.',
      'ar': 'المهام المكتملة الأخيرة من فريقك.',
    },
    'dtsva3b7': {
      'en': 'Rudy Fernandez',
      'ar': 'رودي فرنانديز',
    },
    '9946r7fu': {
      'en': '4m ago',
      'ar': 'منذ 4 م',
    },
    '0ls3xeo2': {
      'en': 'Completed ',
      'ar': 'مكتمل',
    },
    'ombjhakb': {
      'en': 'Marketing Plan',
      'ar': 'خطة التسويق',
    },
    '7t0ec7u0': {
      'en': 'Rudy Fernandez',
      'ar': 'رودي فرنانديز',
    },
    'ug9gkjne': {
      'en': '4m ago',
      'ar': 'منذ 4 م',
    },
    '0pc3nhvv': {
      'en': 'Started ',
      'ar': 'بدأت',
    },
    'pni8myp4': {
      'en': 'Marketing Plan',
      'ar': 'خطة التسويق',
    },
    'sa5ps0vc': {
      'en': 'Abigail Rojas',
      'ar': 'أبيجيل روخاس',
    },
    '9x0em7u6': {
      'en': '4m ago',
      'ar': 'منذ 4 م',
    },
    '56r8jzfn': {
      'en': 'Assigned  ',
      'ar': 'مُكَلَّف',
    },
    'dea0qrv8': {
      'en': 'Rudy Fernandez ',
      'ar': 'رودي فرنانديز',
    },
    'vzrgxdm7': {
      'en': 'to ',
      'ar': 'ل',
    },
    'mrrie7qp': {
      'en': 'Marketing Plan',
      'ar': 'خطة التسويق',
    },
    'xacbrv4a': {
      'en': 'Abigail Rojas',
      'ar': 'أبيجيل روخاس',
    },
    'ym46w978': {
      'en': '4m ago',
      'ar': 'منذ 4 م',
    },
    'fjc3njz7': {
      'en': 'Created a project: ',
      'ar': 'تم إنشاء مشروع:',
    },
    'jgicfa72': {
      'en': 'Marketing Plan',
      'ar': 'خطة التسويق',
    },
    't5sn6z24': {
      'en': 'Liz Ambridge',
      'ar': 'ليز أمبريدج',
    },
    'bnv7du73': {
      'en': '4m ago',
      'ar': 'منذ 4 م',
    },
    'jzxzr6xb': {
      'en': 'Sent a plan update for ',
      'ar': 'تم إرسال تحديث الخطة لـ',
    },
    '4tnb3m92': {
      'en': 'Marketing Plan',
      'ar': 'خطة التسويق',
    },
    '6rgndvx9': {
      'en': 'Project Started',
      'ar': 'بدأ المشروع',
    },
    'yfg4pvhd': {
      'en': '12d ago',
      'ar': 'منذ 12 يومًا',
    },
    '6za7njwq': {
      'en': 'Al Rahma',
      'ar': 'الرحمة',
    },
    'si9wefdm': {
      'en': 'Fieldwork management',
      'ar': 'إدارة العمل الميداني',
    },
    'ex5qv1dl': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // send_personal_request
  {
    '560mis69': {
      'en': 'Inspector Name',
      'ar': 'اسم المفتش',
    },
    'm1pwxbj3': {
      'en': 'superviser',
      'ar': 'المشرف',
    },
    'ez7f630t': {
      'en': 'ID: #1520',
      'ar': 'رقم التعريف: #1520',
    },
    'ojiq14ma': {
      'en': '8h',
      'ar': '8 ساعات',
    },
    'u6ba8naf': {
      'en': 'Loan',
      'ar': 'سلفة',
    },
    'v77lyi3o': {
      'en': 'Reason..',
      'ar': 'السبب...',
    },
    '2owmxxbi': {
      'en': 'Search for an item...',
      'ar': '',
    },
    'al9ftujl': {
      'en': 'Details',
      'ar': 'تفاصيل',
    },
    '0ic6qwwb': {
      'en': 'Done',
      'ar': 'منتهي',
    },
    'drgpoknm': {
      'en': 'Submitting complaints',
      'ar': 'تقديم الشكاوى',
    },
    'oq3skcry': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // workersattendance
  {
    '3n63p5zq': {
      'en': 'Search listings...',
      'ar': 'قوائم البحث...',
    },
    'uiluffzx': {
      'en': 'Option 1',
      'ar': 'الخيار 1',
    },
    'uwjgj8sc': {
      'en': 'Section',
      'ar': 'قطاع',
    },
    'louq209d': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    '902cu81n': {
      'en': 'Option 1',
      'ar': 'الخيار 1',
    },
    'sa0g4vfc': {
      'en': 'Shift',
      'ar': 'وردية',
    },
    'tkgdmofg': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    '07384inp': {
      'en': 'Option 1',
      'ar': 'الخيار 1',
    },
    'uci54l8p': {
      'en': 'Day',
      'ar': 'يوم',
    },
    'dzfxrzg2': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    '47s7hgx9': {
      'en': 'All',
      'ar': 'الجميع',
    },
    '6o5jnil3': {
      'en': 'Worker',
      'ar': 'عامل',
    },
    'z39831wv': {
      'en': 'Superviser',
      'ar': 'المشرف',
    },
    'dgjmz0np': {
      'en': 'Other',
      'ar': 'آخر',
    },
    'ipen9dql': {
      'en': 'All',
      'ar': 'الجميع',
    },
    'juanafum': {
      'en': 'All',
      'ar': 'الجميع',
    },
    'j1jyl42y': {
      'en': 'No: {20}',
      'ar': 'رقم: {20}',
    },
    'tror1adm': {
      'en': 'Maadi',
      'ar': 'المعادي',
    },
    'o6p3blev': {
      'en': '32.2%',
      'ar': '32.2%',
    },
    '4b9igy2v': {
      'en': '50 ',
      'ar': '50',
    },
    'h0tois0z': {
      'en': '/ 150',
      'ar': '/ 150',
    },
    '5hc4hs4t': {
      'en': '9',
      'ar': '9',
    },
    'fib4or31': {
      'en': '/ 10 ',
      'ar': '/ 10',
    },
    'q77e13ot': {
      'en': 'Workers',
      'ar': 'عمال',
    },
    'nlou91q4': {
      'en': 'Supervisers',
      'ar': 'مشرفين',
    },
    'pp2h6y3o': {
      'en': 'Basatin',
      'ar': 'البساتين',
    },
    'vu2af5ec': {
      'en': '32.2%',
      'ar': '32.2%',
    },
    'iast7cmn': {
      'en': '50 ',
      'ar': '50',
    },
    'lsgomy0t': {
      'en': '/ 150',
      'ar': '/ 150',
    },
    'gixe4tpu': {
      'en': '9 ',
      'ar': '9',
    },
    '8etg6sco': {
      'en': '/ 10',
      'ar': '/ 10',
    },
    'gledmfdk': {
      'en': 'Workers',
      'ar': 'عمال',
    },
    'rhzak0gy': {
      'en': 'Supervisers',
      'ar': 'مشرفين',
    },
    'ktnzb0wi': {
      'en': 'Marag',
      'ar': 'مارج',
    },
    'r54lj7xa': {
      'en': '32.2%',
      'ar': '32.2%',
    },
    'yn7uibph': {
      'en': '50 ',
      'ar': '50',
    },
    'bx1sqvbw': {
      'en': '/ 150',
      'ar': '/ 150',
    },
    'vpa1ow29': {
      'en': '9 ',
      'ar': '9',
    },
    'x7dhst2l': {
      'en': '/ 10',
      'ar': '/ 10',
    },
    'uvnf6i5p': {
      'en': 'Workers',
      'ar': 'عمال',
    },
    '9vsxkcl8': {
      'en': 'Superviser',
      'ar': 'المشرف',
    },
    's88ef1m4': {
      'en': 'Add New',
      'ar': 'اضف جديد',
    },
    'q8wenxba': {
      'en': 'Attendance Users',
      'ar': 'الحضور',
    },
    'l05rqusu': {
      'en': 'Date',
      'ar': 'تاريخ',
    },
    'npq4ethq': {
      'en': 'Time',
      'ar': 'وقت',
    },
    'u5b85krf': {
      'en': 'PDF',
      'ar': 'PDF',
    },
    '8nbnb0jf': {
      'en': 'Randy Peterson',
      'ar': 'راندي بيترسون',
    },
    'fyg9qbie': {
      'en': '#2008',
      'ar': '#2008',
    },
    'bsw3e89i': {
      'en': 'Fri. Aug 11th',
      'ar': 'الجمعة. 11 أغسطس',
    },
    'ewpczk1i': {
      'en': 'In :',
      'ar': 'حضور :',
    },
    'r35sexov': {
      'en': 'Out :',
      'ar': 'انصراف :',
    },
    '3krcpyog': {
      'en': '10:00am',
      'ar': '10:00 ص',
    },
    'uzmwoqmq': {
      'en': '03:00pm',
      'ar': '03:00 مساءا',
    },
    'hkwwdspv': {
      'en': 'worker',
      'ar': 'عامل',
    },
    'f0z0xpwj': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    '2kgsgdsf': {
      'en': 'Randy Peterson',
      'ar': 'راندي بيترسون',
    },
    'sdyryprt': {
      'en': '#2008',
      'ar': '#2008',
    },
    '5gyj1y2s': {
      'en': 'Fri. Aug 11th',
      'ar': 'الجمعة. 11 أغسطس',
    },
    'o1zts0iw': {
      'en': 'In :',
      'ar': 'حضور :',
    },
    'rhlfzc1g': {
      'en': 'Out :',
      'ar': 'انصراف :',
    },
    'xq840hyz': {
      'en': '10:00am',
      'ar': '10:00 ص',
    },
    '4o30qc8v': {
      'en': '---',
      'ar': '---',
    },
    'iqerxa08': {
      'en': 'worker',
      'ar': 'عامل',
    },
    'etd0with': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    '0gxqp5eu': {
      'en': 'Attendance',
      'ar': 'الحضور',
    },
    'z2pyolx6': {
      'en': '•',
      'ar': '•',
    },
  },
  // home
  {
    'etooffic': {
      'en': 'Items that are getting attention',
      'ar': '',
    },
    'vjsr0lot': {
      'en': 'Shoes in the cubbard',
      'ar': '',
    },
    'chzvgmm7': {
      'en': 'Find the latest look in our recent review.',
      'ar': '',
    },
    'h8s3vehe': {
      'en': 'Nike Air Shoe',
      'ar': '',
    },
    'mlx2brwk': {
      'en': '\$250.00',
      'ar': '',
    },
    'aufhalm3': {
      'en': 'Nike Air Shoe',
      'ar': '',
    },
    '0qh314ar': {
      'en': '\$120',
      'ar': '',
    },
    'ry6q8ar7': {
      'en': 'AirMax',
      'ar': '',
    },
    'f5qsycvt': {
      'en': '\$250.00',
      'ar': '',
    },
    'n895yucn': {
      'en': 'Popular Looks',
      'ar': '',
    },
    'robiamd9': {
      'en': 'Shop',
      'ar': '',
    },
  },
  // Home19PropertyAppbookingapp
  {
    '3320j9bd': {
      'en': 'Welcome, Jenny',
      'ar': 'مرحبًا جيني',
    },
    'jopk0j2k': {
      'en': 'Search listings...',
      'ar': 'قوائم البحث...',
    },
    'gd1snlge': {
      'en': 'Top Beaches',
      'ar': 'أفضل الشواطئ',
    },
    'lw91zc33': {
      'en': 'Beach Name',
      'ar': 'اسم الشاطئ',
    },
    '41kw5c8a': {
      'en': '\$421',
      'ar': '421 دولارًا',
    },
    'ru3ewh0e': {
      'en': ' /night',
      'ar': '/ليلة',
    },
    'lbn1ouex': {
      'en': 'Beach Name',
      'ar': 'اسم الشاطئ',
    },
    'nzxy5qtp': {
      'en': '\$421',
      'ar': '421 دولارًا',
    },
    '3dhfr6io': {
      'en': ' /night',
      'ar': '/ليلة',
    },
    'h5ii4f3i': {
      'en': 'Beach Name',
      'ar': 'اسم الشاطئ',
    },
    '3mqswf2a': {
      'en': '\$421',
      'ar': '421 دولارًا',
    },
    'zbeo9isi': {
      'en': ' /night',
      'ar': '/ليلة',
    },
    'fewxjani': {
      'en': 'Recent Properties',
      'ar': 'العقارات الحديثة',
    },
    '9nsdjdnj': {
      'en': '12 nights available',
      'ar': '12 ليلة متاحة',
    },
    'ilq1seko': {
      'en': 'Property Name',
      'ar': 'اسم الخاصية',
    },
    '5zvjula8': {
      'en': '\$210',
      'ar': '210 دولار',
    },
    'n6ee6ftm': {
      'en': ' /night',
      'ar': '/ليلة',
    },
    's4hsxi82': {
      'en': 'Kauai, Hawaii',
      'ar': 'كاواي، هاواي',
    },
    '87rksvw2': {
      'en': '12 nights available',
      'ar': '12 ليلة متاحة',
    },
    '6jez8w6l': {
      'en': 'Property Name',
      'ar': 'اسم الخاصية',
    },
    '0eanoxab': {
      'en': '\$168',
      'ar': '168 دولارًا',
    },
    'a7oay342': {
      'en': ' /night',
      'ar': '/ليلة',
    },
    'j4jet6vx': {
      'en': 'Kauai, Hawaii',
      'ar': 'كاواي، هاواي',
    },
    'df1j5t0p': {
      'en': '4 nights available',
      'ar': '4 ليال متاحة',
    },
    '15wz427u': {
      'en': 'Property Name',
      'ar': 'اسم الخاصية',
    },
    '01huj2cq': {
      'en': '\$421',
      'ar': '421 دولارًا',
    },
    'uk99brsy': {
      'en': ' /night',
      'ar': '/ليلة',
    },
    '25jm9mi1': {
      'en': 'Kauai, Hawaii',
      'ar': 'كاواي، هاواي',
    },
    'xpmn2uff': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // rr
  {
    'a22vb1yy': {
      'en': 'Page Title',
      'ar': 'عنوان الصفحة',
    },
    '2xwzh6tb': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // complaints
  {
    'i4ed4b4v': {
      'en': 'Search listings...',
      'ar': 'قوائم البحث...',
    },
    'yfcyi282': {
      'en': 'Leaving work',
      'ar': 'ترك العمل',
    },
    'gvzml36l': {
      'en': 'Being late',
      'ar': 'يجري في وقت متأخر',
    },
    'chbosett': {
      'en': 'Negligence in work',
      'ar': 'اهمال في العمل',
    },
    '4psx3ssp': {
      'en': 'Negligence in the covenant',
      'ar': 'الإهمال في العهد',
    },
    'j6gidr3p': {
      'en': 'Inslut and slander',
      'ar': 'السب والقذف',
    },
    'z271u6c3': {
      'en': 'Assault on a co-worker',
      'ar': 'الاعتداء على زميل العمل',
    },
    'ch8tw2ze': {
      'en': 'Type',
      'ar': 'يكتب',
    },
    '7oe8fxlg': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'pgwnav97': {
      'en': 'Date ',
      'ar': 'تاريخ',
    },
    '2qqrdjup': {
      'en': '',
      'ar': '',
    },
    'm55cu1tw': {
      'en': 'New ',
      'ar': 'جديد',
    },
    'va3svq03': {
      'en': '{Worker Name}',
      'ar': '{اسم العامل}',
    },
    'rdoh2q7o': {
      'en': '{Area}',
      'ar': '{منطقة}',
    },
    'f6wcxek9': {
      'en': '{type}',
      'ar': '{يكتب}',
    },
    '53z00i72': {
      'en': '#{id}',
      'ar': '#{بطاقة تعريف}',
    },
    'x2xsjexg': {
      'en': '{30/5/2024, 10:00am}',
      'ar': '{30/5/2024، 10:00 صباحًا}',
    },
    'yiswr2c8': {
      'en': 'In Progress',
      'ar': 'في تَقَدم',
    },
    'qbedkbt1': {
      'en': 'Accepted',
      'ar': 'قبلت',
    },
    'ynmm34zs': {
      'en': '{Worker Name}',
      'ar': '{اسم العامل}',
    },
    'ofmf1xq9': {
      'en': '{Leader 5} | {Maadi}',
      'ar': '{القائد 5} | {المعادي}',
    },
    'yssum480': {
      'en': 'Create template screen for task todo app.',
      'ar': 'إنشاء شاشة قالب لتطبيق المهام الواجبة.',
    },
    'p4iwt7kf': {
      'en': '{type}',
      'ar': '{يكتب}',
    },
    'oxo7ryip': {
      'en': '#{id}',
      'ar': '#{بطاقة تعريف}',
    },
    '5i2o8v1z': {
      'en': 'Date',
      'ar': 'تاريخ',
    },
    '1bg9e6qs': {
      'en': 'Tuesday, 10:00am',
      'ar': 'الثلاثاء، الساعة 10:00 صباحاً',
    },
    'nzecbfc1': {
      'en': 'Completed',
      'ar': 'مكتمل',
    },
    'kqfbddnp': {
      'en': 'Daily Report',
      'ar': 'تقرير يومي',
    },
    'zi57x5g5': {
      'en': 'The daily report is delivered at the end of the shift',
      'ar': 'يتم تسليم التقرير اليومي في نهاية الوردية',
    },
    'rpq3vl4b': {
      'en': 'Rejected',
      'ar': 'مرفوض',
    },
    'xm60ziyo': {
      'en': '{Worker Name}',
      'ar': '{اسم العامل}',
    },
    '86xk2d1b': {
      'en': '{Leader 5} | {Maadi}',
      'ar': '{القائد 5} | {المعادي}',
    },
    'phscjhb9': {
      'en': 'Create template screen for task todo app.',
      'ar': 'إنشاء شاشة قالب لتطبيق المهام الواجبة.',
    },
    'smfp1zzw': {
      'en': '{type}',
      'ar': '{يكتب}',
    },
    'wjdw1r8r': {
      'en': '#{id}',
      'ar': '#{بطاقة تعريف}',
    },
    '0dgfksl6': {
      'en': 'Date',
      'ar': 'تاريخ',
    },
    '2jpdjgmh': {
      'en': 'Tuesday, 10:00am',
      'ar': 'الثلاثاء، الساعة 10:00 صباحاً',
    },
    '6pjwnufe': {
      'en': 'Rejected',
      'ar': 'مرفوض',
    },
    '5mzksuxb': {
      'en': 'Complaints',
      'ar': 'شكاوي',
    },
    'w9cxl33f': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // OM_Home
  {
    'uf364dwj': {
      'en': 'Hello,',
      'ar': 'مرحبًا،',
    },
    '0xrhe36b': {
      'en': 'Morning',
      'ar': 'صباح',
    },
    'tuvazi29': {
      'en': 'Workers',
      'ar': 'عمال',
    },
    '207bsb8n': {
      'en': '32.2%',
      'ar': '32.2%',
    },
    '7g52iw3k': {
      'en': '480 ',
      'ar': '480',
    },
    'chahribi': {
      'en': '/ 500',
      'ar': '/ 500',
    },
    'zt2wnmyd': {
      'en': 'Supervisers',
      'ar': 'المشرفين',
    },
    '73j5jjfp': {
      'en': '32.2%',
      'ar': '32.2%',
    },
    'wbsojknu': {
      'en': '18 ',
      'ar': '18',
    },
    'u9akj5ih': {
      'en': '/ 20',
      'ar': '/ 20',
    },
    'hajn9dba': {
      'en': 'Maadi',
      'ar': 'المعادي',
    },
    'zvec2zhb': {
      'en': '32.2%',
      'ar': '32.2%',
    },
    'd8i6a0kj': {
      'en': '50 ',
      'ar': '50',
    },
    '6p8bgdtd': {
      'en': '/ 150',
      'ar': '/ 150',
    },
    'saj4lsxl': {
      'en': '9 ',
      'ar': '9',
    },
    'z4f0akm2': {
      'en': '/ 10',
      'ar': '/ 10',
    },
    'rrbrs1xw': {
      'en': 'Workers',
      'ar': 'عمال',
    },
    'ewaubs6z': {
      'en': 'Superviser',
      'ar': 'المشرف',
    },
    '17eq48cx': {
      'en': 'Basatin',
      'ar': 'البساتين',
    },
    'vqiazft7': {
      'en': '32.2%',
      'ar': '32.2%',
    },
    'xs6p2r9g': {
      'en': '50 ',
      'ar': '50',
    },
    '2lts0n1q': {
      'en': '/ 150',
      'ar': '/ 150',
    },
    'dr7hy0ac': {
      'en': '9 ',
      'ar': '9',
    },
    'apyltfmn': {
      'en': '/ 10',
      'ar': '/ 10',
    },
    '36zogk9r': {
      'en': 'Workers',
      'ar': 'عمال',
    },
    'zkz2aovm': {
      'en': 'Superviser',
      'ar': 'المشرف',
    },
    '32flg1yy': {
      'en': 'Marag',
      'ar': 'معراج',
    },
    'a3l7gf31': {
      'en': '32.2%',
      'ar': '32.2%',
    },
    '1351x4m6': {
      'en': '50 ',
      'ar': '50',
    },
    'w546vhax': {
      'en': '/ 150',
      'ar': '/ 150',
    },
    '9on9lclp': {
      'en': '9 ',
      'ar': '9',
    },
    'opsahte5': {
      'en': '/ 10',
      'ar': '/ 10',
    },
    'b7tnrcti': {
      'en': 'Workers',
      'ar': 'عمال',
    },
    'v9lgz6kw': {
      'en': 'Superviser',
      'ar': 'المشرف',
    },
    'gdduwljn': {
      'en': 'Daily Goal',
      'ar': 'الهدف اليومي',
    },
    '3z66g6d6': {
      'en': '62.2% /',
      'ar': '62.2% /',
    },
    'iief1prw': {
      'en': ' 12',
      'ar': '12',
    },
    'kyhiedjn': {
      'en': '',
      'ar': '',
    },
    'mnmbrgx4': {
      'en': 'Achieved goals: ',
      'ar': 'الأهداف المحققة:',
    },
    'r4tzm3nt': {
      'en': '3',
      'ar': '3',
    },
    'e0zofosb': {
      'en': 'All',
      'ar': 'الجميع',
    },
    'wxsguin0': {
      'en': 'Work Area',
      'ar': 'منطقة العمل',
    },
    'm2th2o94': {
      'en': 'General information about the area.',
      'ar': 'معلومات عامة عن المنطقة.',
    },
    'r0e087w8': {
      'en': 'Tasks',
      'ar': 'مهام',
    },
    '1i2hgtf4': {
      'en': 'Start Point',
      'ar': 'نقطة البداية',
    },
    'tsn9pyo2': {
      'en': 'End Point',
      'ar': 'نقطة النهاية',
    },
    '5h7d7wz1': {
      'en': 'Natifications',
      'ar': 'المواليد',
    },
    'qy4lctl6': {
      'en': 'personal order',
      'ar': 'أمر شخصي',
    },
    'jupa7up6': {
      'en': '1',
      'ar': '1',
    },
    'ij4n64i9': {
      'en': 'Superviser order',
      'ar': 'أمر المشرف',
    },
    'gufgxo93': {
      'en': '1',
      'ar': '1',
    },
    'z4usu2ej': {
      'en': 'complans',
      'ar': 'يشكو',
    },
    'yrgm6htn': {
      'en': '1',
      'ar': '1',
    },
    '9lx2mzy8': {
      'en': 'Other seirves',
      'ar': 'سيرفيس أخرى',
    },
    'cfgacydq': {
      'en': 'Due Date',
      'ar': 'تاريخ الاستحقاق',
    },
    '5peecpde': {
      'en': 'Actions',
      'ar': 'أجراءات',
    },
    're64bovm': {
      'en': 'personal request',
      'ar': 'طلب شخصي',
    },
    'qxvor6le': {
      'en': 'Reports',
      'ar': 'التقارير',
    },
    'rc1b615a': {
      'en': 'Atindanse',
      'ar': 'حاضر',
    },
    '4c1sx0ez': {
      'en': 'Map',
      'ar': 'خريطة',
    },
    'lhcjr8y8': {
      'en': 'personal request',
      'ar': 'طلب شخصي',
    },
    'v4v07ytb': {
      'en': 'daily report',
      'ar': 'تقرير يومي',
    },
    'z1if7a3k': {
      'en': 'Users',
      'ar': 'المستخدمين',
    },
    '5u23m32s': {
      'en': 'Reviwes',
      'ar': 'المراجعات',
    },
    '77nfs5ij': {
      'en': 'personal request',
      'ar': 'طلب شخصي',
    },
    '3hbx66jt': {
      'en': 'daily report',
      'ar': 'التقرير اليومي',
    },
    'tx602u1w': {
      'en': 'Add User',
      'ar': 'إضافة مستخدم',
    },
    'zsljq4y7': {
      'en': 'Reviwes',
      'ar': 'المراجعات',
    },
    'ag33nm0k': {
      'en': 'Activity',
      'ar': 'نشاط',
    },
    '92iedlyb': {
      'en': 'Recent completed tasks from your team.',
      'ar': 'المهام المكتملة الأخيرة من فريقك.',
    },
    '0a7w2hch': {
      'en': 'Rudy Fernandez',
      'ar': 'رودي فرنانديز',
    },
    'ujpjvg8o': {
      'en': '4m ago',
      'ar': 'منذ 4 م',
    },
    'kthh7da8': {
      'en': 'Completed ',
      'ar': 'مكتمل',
    },
    'wo4yi0vd': {
      'en': 'Marketing Plan',
      'ar': 'خطة التسويق',
    },
    'byil4lvg': {
      'en': 'Rudy Fernandez',
      'ar': 'رودي فرنانديز',
    },
    'fw665rpr': {
      'en': '4m ago',
      'ar': 'منذ 4 م',
    },
    'ex7lisu2': {
      'en': 'Started ',
      'ar': 'بدأت',
    },
    'hg2lon57': {
      'en': 'Marketing Plan',
      'ar': 'خطة التسويق',
    },
    'odww1fxf': {
      'en': 'Abigail Rojas',
      'ar': 'أبيجيل روخاس',
    },
    'cf6tg09d': {
      'en': '4m ago',
      'ar': 'منذ 4 م',
    },
    '4dmjmpf8': {
      'en': 'Assigned  ',
      'ar': 'مُكَلَّف',
    },
    'hnvh055l': {
      'en': 'Rudy Fernandez ',
      'ar': 'رودي فرنانديز',
    },
    '0jx9xg1w': {
      'en': 'to ',
      'ar': 'ل',
    },
    'gsdxap08': {
      'en': 'Marketing Plan',
      'ar': 'خطة التسويق',
    },
    '0rxp24sb': {
      'en': 'Abigail Rojas',
      'ar': 'أبيجيل روخاس',
    },
    'ekft8aij': {
      'en': '4m ago',
      'ar': 'منذ 4 م',
    },
    '76hatj7w': {
      'en': 'Created a project: ',
      'ar': 'تم إنشاء مشروع:',
    },
    '14o9vpea': {
      'en': 'Marketing Plan',
      'ar': 'خطة التسويق',
    },
    'kx94co3n': {
      'en': 'Liz Ambridge',
      'ar': 'ليز أمبريدج',
    },
    'i4m0kq4r': {
      'en': '4m ago',
      'ar': 'منذ 4 م',
    },
    '5qvaylno': {
      'en': 'Sent a plan update for ',
      'ar': 'تم إرسال تحديث الخطة لـ',
    },
    'rl4e1sez': {
      'en': 'Marketing Plan',
      'ar': 'خطة التسويق',
    },
    'p9bgmfog': {
      'en': 'Project Started',
      'ar': 'بدأ المشروع',
    },
    'agqlvqjv': {
      'en': '12d ago',
      'ar': 'منذ 12 يومًا',
    },
    '1ddnxj2l': {
      'en': 'Powerd by Omar-s Team',
      'ar': 'بدعم من فريق عمر',
    },
    '0j0nk6cr': {
      'en': 'Al Rahma',
      'ar': 'الرحمة',
    },
    'c8xarm8i': {
      'en': 'Fieldwork management',
      'ar': 'إدارة العمل الميداني',
    },
    'gck0id7k': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // Details03TransactionsSummary
  {
    'oubzm30n': {
      'en': 'Profit Details',
      'ar': 'تفاصيل الربح',
    },
    'hrq6qe0n': {
      'en': 'Sales & Revenue',
      'ar': 'المبيعات والإيرادات',
    },
    'b8uqztpz': {
      'en': '56.4k',
      'ar': '56.4 ألف',
    },
    'yzvkmi3f': {
      'en': 'Customers',
      'ar': 'عملاء',
    },
    '0948r0q6': {
      'en': '\$320k',
      'ar': '320 ألف دولار',
    },
    'udns81xe': {
      'en': 'Total Sales',
      'ar': 'إجمالي المبيعات',
    },
    'wy64vt34': {
      'en': '\$45.6M',
      'ar': '45.6 مليون دولار',
    },
    'frafubk3': {
      'en': 'Revenue',
      'ar': 'ربح',
    },
    'iilcdd8p': {
      'en': '56.4k',
      'ar': '56.4 ألف',
    },
    'bhjux1tc': {
      'en': 'Customers',
      'ar': 'عملاء',
    },
    'k3uoozxi': {
      'en': '56.4k',
      'ar': '56.4 ألف',
    },
    'so2uj1ho': {
      'en': 'Customers',
      'ar': 'عملاء',
    },
    'rwcfk8iw': {
      'en': 'Your transactions',
      'ar': 'معاملاتك',
    },
    'jvvo54l5': {
      'en': 'List Item Title',
      'ar': 'عنوان عنصر القائمة',
    },
    'my34p3rj': {
      'en': 'Secondary text',
      'ar': 'النص الثانوي',
    },
    'thb02ezz': {
      'en': '\$1.50',
      'ar': '1.50 دولار',
    },
    '6crclec0': {
      'en': 'List Item Title',
      'ar': 'عنوان عنصر القائمة',
    },
    'w5bu7h54': {
      'en': 'Secondary text',
      'ar': 'النص الثانوي',
    },
    'r2b2uvtp': {
      'en': '\$1.50',
      'ar': '1.50 دولار',
    },
    'ruliysto': {
      'en': 'List Item Title',
      'ar': 'عنوان عنصر القائمة',
    },
    'ezv2lo8v': {
      'en': 'Secondary text',
      'ar': 'النص الثانوي',
    },
    'pla9f53c': {
      'en': '\$1.50',
      'ar': '1.50 دولار',
    },
    '50eyj9aw': {
      'en': 'List Item Title',
      'ar': 'عنوان عنصر القائمة',
    },
    '1snqp0nl': {
      'en': 'Secondary text',
      'ar': 'النص الثانوي',
    },
    'oxws74fq': {
      'en': '\$1.50',
      'ar': '1.50 دولار',
    },
    'w80yel9w': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // OM_complandiscription
  {
    'v9856fn3': {
      'en': 'Inspector Name',
      'ar': 'اسم المفتش',
    },
    '6oe3fmj5': {
      'en': 'superviser',
      'ar': 'المشرف',
    },
    '8h7muonz': {
      'en': 'ID: #1520',
      'ar': 'رقم التعريف: #1520',
    },
    'ifvh7k1x': {
      'en': '8h',
      'ar': '8 ساعات',
    },
    'kmc636tm': {
      'en': 'Type',
      'ar': 'تفاصيل',
    },
    '3h2nbtq4': {
      'en': 'Details',
      'ar': 'تفاصيل',
    },
    'iml3bzff': {
      'en': 'Maximum 3 img/jpg',
      'ar': 'الحد الأقصى 3img/jpg',
    },
    'sm5npurt': {
      'en': 'Comment',
      'ar': 'تعليق',
    },
    '0jprgnzl': {
      'en': 'Accept',
      'ar': 'يقبل',
    },
    'i0fq81sn': {
      'en': 'Reject',
      'ar': 'يرفض',
    },
    'ie5vtsz0': {
      'en': 'Submitting complaints',
      'ar': 'تقديم الشكاوى',
    },
    'xb5m4kk1': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // OM_List_work_orders
  {
    't2oayvy8': {
      'en': 'Search listings...',
      'ar': 'قوائم البحث...',
    },
    'a4ztindq': {
      'en': 'Option 1',
      'ar': 'الخيار 1',
    },
    'argr034c': {
      'en': 'Section',
      'ar': 'قسم',
    },
    'ljn310k9': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'ij3gdwhl': {
      'en': 'Option 1',
      'ar': 'الخيار 1',
    },
    'xks3gqa7': {
      'en': 'Shift',
      'ar': 'يحول',
    },
    'd2tuusfi': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'e5d3ouch': {
      'en': 'Option 1',
      'ar': 'صباحي',
    },
    'z44xaggt': {
      'en': 'Day',
      'ar': 'يوم',
    },
    '8czprnp1': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'ghuqg6zb': {
      'en': 'No: {20}',
      'ar': 'رقم: {20}',
    },
    'vyf9o7jr': {
      'en': 'Pending',
      'ar': 'قيد الانتظار',
    },
    'gshw6an5': {
      'en': '{Sv Name}',
      'ar': '{اسم سيفرت}',
    },
    '5wv3osy2': {
      'en': 'View',
      'ar': 'منظر',
    },
    'gsrhrssx': {
      'en': '{Leader 5} | {Maadi}',
      'ar': '{القائد 5} | {المعادي}',
    },
    'dl8zcn4c': {
      'en': '{Details}',
      'ar': '{تفاصيل}',
    },
    '66vhiulo': {
      'en': '{type}',
      'ar': '{يكتب}',
    },
    'tqzqn72t': {
      'en': 'Due',
      'ar': 'حق',
    },
    '8b0wf1wl': {
      'en': 'Tuesday, 10:00am',
      'ar': 'الثلاثاء، الساعة 10:00 صباحاً',
    },
    'awp3v7ez': {
      'en': 'In Progress',
      'ar': 'في تَقَدم',
    },
    '1lswmnpp': {
      'en': '{Sv Name}',
      'ar': '{اسم سيفرت}',
    },
    '2sodr5jg': {
      'en': 'View',
      'ar': 'منظر',
    },
    '9h1t34yn': {
      'en': '{Leader 5} | {Maadi}',
      'ar': '{القائد 5} | {المعادي}',
    },
    'g3ysal1v': {
      'en': '{Details}',
      'ar': '{تفاصيل}',
    },
    'i492vcez': {
      'en': '{type}',
      'ar': '{يكتب}',
    },
    'ee05y63q': {
      'en': 'Due',
      'ar': 'حق',
    },
    '7yi6lkfe': {
      'en': 'Tuesday, 10:00am',
      'ar': 'الثلاثاء، الساعة 10:00 صباحاً',
    },
    'v8i2f3ei': {
      'en': 'In Progress',
      'ar': 'في تَقَدم',
    },
    's5gzruzl': {
      'en': 'Completed',
      'ar': 'مكتمل',
    },
    'w9uen6f3': {
      'en': '{Sv Name}',
      'ar': '{اسم سيفرت}',
    },
    'g1y7sx99': {
      'en': '{Leader 5} | {Maadi}',
      'ar': '{القائد 5} | {المعادي}',
    },
    '8zzju9r1': {
      'en': 'Create template screen for task todo app.',
      'ar': 'إنشاء شاشة قالب لتطبيق المهام الواجبة.',
    },
    'zifu8bk8': {
      'en': 'Truesicly',
      'ar': 'بصدق',
    },
    't80mkcnh': {
      'en': 'Driver name',
      'ar': 'اسم السائق',
    },
    'owyvpdt9': {
      'en': 'Tuesday, 10:00am',
      'ar': 'الثلاثاء، الساعة 10:00 صباحاً',
    },
    'tbvkocmg': {
      'en': 'Completed',
      'ar': 'مكتمل',
    },
    'q1b7t8dz': {
      'en': '{Sv Name}',
      'ar': '{اسم سيفرت}',
    },
    '74gey6ke': {
      'en': 'Traffic Manager | Errands',
      'ar': 'مدير المرور | المهمات',
    },
    '4ep6idzj': {
      'en': 'Create template screen for task todo app.',
      'ar': 'إنشاء شاشة قالب لتطبيق المهام الواجبة.',
    },
    '48wvyfrn': {
      'en': 'Truesicly',
      'ar': 'بصدق',
    },
    '02g48n3l': {
      'en': 'Driver name',
      'ar': 'اسم السائق',
    },
    'jse98nx5': {
      'en': 'Tuesday, 10:00am',
      'ar': 'الثلاثاء، الساعة 10:00 صباحاً',
    },
    '1cqa8rab': {
      'en': 'Completed',
      'ar': 'مكتمل',
    },
    'pjwse1gj': {
      'en': 'Export PDF',
      'ar': 'تصدير قوات الدفاع الشعبي',
    },
    '1fbktxv1': {
      'en': 'Report on errands and motorcycle movement',
      'ar': 'تقرير عن المهمات وحركة الدراجات النارية',
    },
    'qe75adpc': {
      'en': 'Work orders',
      'ar': 'طلبات العمل',
    },
    'a74m9tw3': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // OM_work_Orders_discription
  {
    'n4xwwinl': {
      'en': '{Sv Name}',
      'ar': '{اسم سيفرت}',
    },
    'y7ptaeij': {
      'en': '{Leader 5} | {Maadi}',
      'ar': '{القائد 5} | {المعادي}',
    },
    'geoxq1rg': {
      'en': '#ID',
      'ar': '#بطاقة تعريف',
    },
    '6qawikun': {
      'en': 'Due',
      'ar': 'حق',
    },
    'hxv6ipld': {
      'en': 'In Progress',
      'ar': 'في تَقَدم',
    },
    'nlpf53sx': {
      'en': 'Tuesday, 10:00am',
      'ar': 'الثلاثاء، الساعة 10:00 صباحاً',
    },
    'r7a62j8h': {
      'en': 'Details',
      'ar': 'تفاصيل',
    },
    'et7s7v1c': {
      'en': 'kind of order',
      'ar': 'نوع من النظام',
    },
    '3kkhowwh': {
      'en': '{no: 5}',
      'ar': '{رقم 5}',
    },
    '9w35wr0t': {
      'en': '{if its a car then it shows the kind of it}',
      'ar': '{إذا كانت سيارة فهذا يدل على نوعها}',
    },
    'yyinykyo': {
      'en': 'ST',
      'ar': 'شارع',
    },
    '0krk3esn': {
      'en': '{15}',
      'ar': '{15}',
    },
    'htdnav2t': {
      'en': 'Discription',
      'ar': 'وصف',
    },
    '7ab2zad7': {
      'en':
          'hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhcompanyname.co',
      'ar':
          'هههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههه اسم الشركة.',
    },
    'mwwrd9qx': {
      'en': 'Response',
      'ar': 'إجابة',
    },
    'iju0abq3': {
      'en': 'Comment',
      'ar': 'تعليق',
    },
    '6kjapcj8': {
      'en': 'Accept',
      'ar': 'يقبل',
    },
    '6ojztb7b': {
      'en': 'Reject',
      'ar': 'يرفض',
    },
    'qitjwm2z': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // List_Ratings
  {
    '8xui5vko': {
      'en': 'Rating Overview',
      'ar': 'نظرة عامة على التقييم',
    },
    'z6fe1xal': {
      'en': 'A summary of month',
      'ar': 'ملخص الشهر',
    },
    't7p0661q': {
      'en': 'Option 1',
      'ar': 'الخيار 1',
    },
    'rrm437k3': {
      'en': 'All',
      'ar': 'الجميع',
    },
    'jbvd61f6': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    '3l84c82d': {
      'en': 'Worker',
      'ar': 'المهام',
    },
    'sf3wos36': {
      'en': 'Superviser',
      'ar': 'المشرف',
    },
    'm8335u1q': {
      'en': 'Last 30 Days',
      'ar': 'آخر 30 يومًا',
    },
    'ilmmmxat': {
      'en': 'Avg. Grade',
      'ar': 'متوسط درجة',
    },
    '7f9yw7c5': {
      'en': 'Top Rating',
      'ar': 'أعلى تقييم',
    },
    '3uixknld': {
      'en': 'A summary of month',
      'ar': 'ملخص الشهر',
    },
    '0sotpsm2': {
      'en': 'Top 5  Workers',
      'ar': 'أفضل 5 عمال',
    },
    '745ipblv': {
      'en': 'Rudy Fernandez',
      'ar': 'رودي فرنانديز',
    },
    'n7vj6opx': {
      'en': '#Id',
      'ar': '#بطاقة تعريف',
    },
    'r28kkawu': {
      'en': 'Abigail Herrara',
      'ar': 'أبيجيل هيرارا',
    },
    '110r0j8n': {
      'en': 'Designer',
      'ar': 'مصمم',
    },
    '0rdsadl4': {
      'en': 'Liz Ambridge',
      'ar': 'ليز أمبريدج',
    },
    'jmj95yqd': {
      'en': 'Manager',
      'ar': 'مدير',
    },
    'er14sj16': {
      'en': 'Liz Rogers',
      'ar': 'ليز روجرز',
    },
    'ussdl5bp': {
      'en': 'Front End Dev',
      'ar': 'تطوير الواجهة الأمامية',
    },
    'zr2g1qya': {
      'en': 'Top 5  Superviser',
      'ar': 'أعلى 5 المشرفين',
    },
    'fjntb27s': {
      'en': 'Rudy Fernandez',
      'ar': 'رودي فرنانديز',
    },
    'tk327ur8': {
      'en': '#Id',
      'ar': '#بطاقة تعريف',
    },
    'uewnb1oa': {
      'en': 'Abigail Herrara',
      'ar': 'أبيجيل هيرارا',
    },
    'l2vbh3fn': {
      'en': 'Designer',
      'ar': 'مصمم',
    },
    'n7kcrks0': {
      'en': 'Liz Ambridge',
      'ar': 'ليز أمبريدج',
    },
    'yechqe26': {
      'en': 'Manager',
      'ar': 'مدير',
    },
    'fe3wv3pn': {
      'en': 'Liz Rogers',
      'ar': 'ليز روجرز',
    },
    '9ulfe9gb': {
      'en': 'Front End Dev',
      'ar': 'تطوير الواجهة الأمامية',
    },
    'e8qctkyb': {
      'en': 'Rating Overview',
      'ar': 'نظرة عامة على التقييم',
    },
    'rh29z3z9': {
      'en': 'A summary of month.',
      'ar': 'ملخص الشهر.',
    },
    'ii1qo2wr': {
      'en': 'Option 1',
      'ar': 'الخيار 1',
    },
    '5vvy11vk': {
      'en': 'Section',
      'ar': 'قسم',
    },
    'wnt83d1l': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'af0dw4kc': {
      'en': 'Worker',
      'ar': 'عامل',
    },
    'wmdbiiv7': {
      'en': 'Superviser',
      'ar': 'مشرف',
    },
    'pheqirud': {
      'en': '',
      'ar': '',
    },
    'pevuvo35': {
      'en': 'All',
      'ar': 'الجميع',
    },
    '343acre1': {
      'en': 'No: {20}',
      'ar': 'عدد : {20}',
    },
    '8dnp24cz': {
      'en': 'Emploee',
      'ar': 'موظف',
    },
    'zeixxp99': {
      'en': 'Work',
      'ar': 'عمل',
    },
    'u1d3rxiy': {
      'en': 'Rating',
      'ar': 'تقييم',
    },
    'fij8fswr': {
      'en': 'Randy Peterson',
      'ar': 'راندي بيترسون',
    },
    'pwqg5tm7': {
      'en': '#2008',
      'ar': '#2008',
    },
    'g8yjr6su': {
      'en': 'Car',
      'ar': 'سيارة',
    },
    'nt6uv8wo': {
      'en': '4.7',
      'ar': '4.7',
    },
    'fyjldjgr': {
      'en': 'Randy Peterson',
      'ar': 'راندي بيترسون',
    },
    'fa60wuq5': {
      'en': '#2008',
      'ar': '#2008',
    },
    'ui2hu7ie': {
      'en': 'Car',
      'ar': 'سيارة',
    },
    'iz0l6fic': {
      'en': '4.7',
      'ar': '4.7',
    },
    '7r005n3u': {
      'en': 'Ratings',
      'ar': 'التقييمات',
    },
    'zfc7yl5q': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // dash2
  {
    'y2sz8mkk': {
      'en': 'check.io',
      'ar': 'check.io',
    },
    's2hx2tew': {
      'en': 'Andrew D.',
      'ar': 'أندرو د.',
    },
    'x6gd0rj9': {
      'en': 'admin@gmail.com',
      'ar': 'admin@gmail.com',
    },
    '7j7cv67a': {
      'en': 'Dashboard',
      'ar': 'لوحة القيادة',
    },
    '04q02krv': {
      'en': 'Transactions',
      'ar': 'المعاملات',
    },
    'bgbml7ni': {
      'en': 'Projects',
      'ar': 'المشاريع',
    },
    'cixqp0ta': {
      'en': 'Users',
      'ar': 'المستخدمين',
    },
    '86s68wx0': {
      'en': 'Overview',
      'ar': 'ملخص',
    },
    'cv6i5yty': {
      'en': 'Below is a company overview',
      'ar': 'فيما يلي نظرة عامة على الشركة',
    },
    'nsun3i9p': {
      'en': 'Andrew D.',
      'ar': 'أندرو د.',
    },
    'u72zo9rb': {
      'en': 'admin@gmail.com',
      'ar': 'admin@gmail.com',
    },
    'dwlwmff6': {
      'en': 'Income this Month',
      'ar': 'الدخل هذا الشهر',
    },
    'gyeh13o7': {
      'en': '\$567,402',
      'ar': '567,402 دولار',
    },
    'xw5w6ial': {
      'en': 'Total Orders',
      'ar': 'إجمالي الطلبات',
    },
    '54w4k1yd': {
      'en': '2,208',
      'ar': '2,208',
    },
    'y0pctxky': {
      'en': 'Total Orders',
      'ar': 'إجمالي الطلبات',
    },
    'gteqhj9r': {
      'en': '2,208',
      'ar': '2,208',
    },
    'h0ilskrt': {
      'en': 'Total Orders',
      'ar': 'إجمالي الطلبات',
    },
    '0mxl2pfg': {
      'en': '2,208',
      'ar': '2,208',
    },
    'an0ta56r': {
      'en': 'Account Overview',
      'ar': 'نظرة عامة على الحساب',
    },
    'nh69fhxe': {
      'en': 'Your Balance',
      'ar': 'رصيدك',
    },
    'oqillfe3': {
      'en': '\$6,424.20',
      'ar': '6,424.20 دولارًا',
    },
    'qhz5b98b': {
      'en': 'Transfer Balance',
      'ar': 'تحويل الرصيد',
    },
    'ir4ygmls': {
      'en': 'Monthly Goal',
      'ar': 'الهدف الشهري',
    },
    '9e6lwf3w': {
      'en': '62.2% /',
      'ar': '62.2% /',
    },
    'rxm3n92g': {
      'en': ' \$12,000',
      'ar': '12000 دولار',
    },
    'tp3gby7u': {
      'en': 'Forecasted income is: ',
      'ar': 'الدخل المتوقع هو:',
    },
    'dqhj7ayd': {
      'en': '\$3,502',
      'ar': '3,502 دولار',
    },
    '7p1giky5': {
      'en': 'Edit',
      'ar': 'يحرر',
    },
    'hpkf1jde': {
      'en': 'Top Friends',
      'ar': 'أفضل الأصدقاء',
    },
    'xy6fbnui': {
      'en': 'Rudy Fernandez',
      'ar': 'رودي فرنانديز',
    },
    '9fk9tlow': {
      'en': 'Manager',
      'ar': 'مدير',
    },
    'mz05ut1v': {
      'en': 'Abigail Herrara',
      'ar': 'أبيجيل هيرارا',
    },
    'p8gne16b': {
      'en': 'Designer',
      'ar': 'مصمم',
    },
    '5pdrh81o': {
      'en': 'Liz Ambridge',
      'ar': 'ليز أمبريدج',
    },
    'bnu65r6o': {
      'en': 'Manager',
      'ar': 'مدير',
    },
    '18j10bhk': {
      'en': 'Liz Rogers',
      'ar': 'ليز روجرز',
    },
    'zofxwhs8': {
      'en': 'Front End Dev',
      'ar': 'تطوير الواجهة الأمامية',
    },
    'hn2eg3oe': {
      'en': 'Outstanding Balance',
      'ar': 'اتزان رائع',
    },
    'mh83ahzd': {
      'en': '\$529,204',
      'ar': '529,204 دولار',
    },
    '5h85k1w9': {
      'en': '55%',
      'ar': '55%',
    },
    'sy3bun6w': {
      'en': 'Budget Overview',
      'ar': 'نظرة عامة على الميزانية',
    },
    'abv5hu7q': {
      'en': '\$242,102',
      'ar': '242,102 دولار',
    },
    '2i13ftzw': {
      'en': '25%',
      'ar': '25%',
    },
    'zvzh3rsd': {
      'en': 'Outstanding Invoices',
      'ar': 'الفواتير المستحقة',
    },
    'n1prv95w': {
      'en': 'Below are some of the outstanding invoices for your clients.',
      'ar': 'فيما يلي بعض الفواتير المستحقة لعملائك.',
    },
    '0zrvnrmd': {
      'en': 'Add New',
      'ar': 'اضف جديد',
    },
    '5u299iwq': {
      'en': 'Work Type',
      'ar': 'نوع العمل',
    },
    'xmwq07x9': {
      'en': 'Sent To:',
      'ar': 'تم الإرسال إلى:',
    },
    'mep48gn1': {
      'en': 'Contract Amount',
      'ar': 'قيمة العقد',
    },
    'tbdr2sff': {
      'en': 'Status',
      'ar': 'حالة',
    },
    '5wqjcbyz': {
      'en': 'Actions',
      'ar': 'أجراءات',
    },
    'uvi4vwwi': {
      'en': 'Design Work',
      'ar': 'عمل التصميم',
    },
    'h9mm6xs1': {
      'en': 'Randy Peterson',
      'ar': 'راندي بيترسون',
    },
    'szamqouj': {
      'en': 'Business Name',
      'ar': 'الاسم التجاري',
    },
    'v2wtmajt': {
      'en': '\$2,100',
      'ar': '2100 دولار',
    },
    '1b6e1kkv': {
      'en': 'Paid',
      'ar': 'مدفوع',
    },
    '0ak1t1hh': {
      'en': 'Design Work',
      'ar': 'عمل التصميم',
    },
    '4hz4fdmd': {
      'en': 'Randy Peterson',
      'ar': 'راندي بيترسون',
    },
    'yrba2i3h': {
      'en': 'Business Name',
      'ar': 'الاسم التجاري',
    },
    'pp5hste5': {
      'en': '\$2,100',
      'ar': '2100 دولار',
    },
    'jalbfkgd': {
      'en': 'Paid',
      'ar': 'مدفوع',
    },
    'tbcifyw4': {
      'en': 'Design Work',
      'ar': 'عمل التصميم',
    },
    'aw1f2vdb': {
      'en': 'Randy Peterson',
      'ar': 'راندي بيترسون',
    },
    'izmma1m4': {
      'en': 'Business Name',
      'ar': 'الاسم التجاري',
    },
    'bynt42lz': {
      'en': '\$2,100',
      'ar': '2100 دولار',
    },
    'o5fbshmc': {
      'en': 'Paid',
      'ar': 'مدفوع',
    },
    'nlmkhs73': {
      'en': 'Design Work',
      'ar': 'عمل التصميم',
    },
    'dj1xoljg': {
      'en': 'Randy Peterson',
      'ar': 'راندي بيترسون',
    },
    '27noxf3x': {
      'en': 'Business Name',
      'ar': 'الاسم التجاري',
    },
    'i5so75rg': {
      'en': '\$2,100',
      'ar': '2100 دولار',
    },
    'yy5rjy5z': {
      'en': 'Paid',
      'ar': 'مدفوع',
    },
    'cf1mk51u': {
      'en': 'Design Work',
      'ar': 'عمل التصميم',
    },
    'a92u3t5w': {
      'en': 'Randy Peterson',
      'ar': 'راندي بيترسون',
    },
    '4kj14w31': {
      'en': 'Business Name',
      'ar': 'الاسم التجاري',
    },
    '9gpxn00q': {
      'en': '\$2,100',
      'ar': '2100 دولار',
    },
    'dbbsnrsv': {
      'en': 'Pending',
      'ar': 'قيد الانتظار',
    },
    'rq9s1ckf': {
      'en': 'Design Work',
      'ar': 'عمل التصميم',
    },
    'juw73a8k': {
      'en': 'Randy Peterson',
      'ar': 'راندي بيترسون',
    },
    'br5w7kgs': {
      'en': 'Business Name',
      'ar': 'الاسم التجاري',
    },
    'l688zy3w': {
      'en': '\$2,100',
      'ar': '2100 دولار',
    },
    'j8qkvlwv': {
      'en': 'Pending',
      'ar': 'قيد الانتظار',
    },
    'u8barbn3': {
      'en': 'Design Work',
      'ar': 'عمل التصميم',
    },
    '88n5z8un': {
      'en': 'Randy Peterson',
      'ar': 'راندي بيترسون',
    },
    'eizcxv1n': {
      'en': 'Business Name',
      'ar': 'الاسم التجاري',
    },
    't87cum03': {
      'en': '\$2,100',
      'ar': '2100 دولار',
    },
    'fm6kujue': {
      'en': 'Pending',
      'ar': 'قيد الانتظار',
    },
    '6q54evxy': {
      'en': 'Card Header',
      'ar': 'رأس البطاقة',
    },
    'z17e1pwc': {
      'en': 'Create tables and ui elements that work below.',
      'ar': 'قم بإنشاء الجداول وعناصر واجهة المستخدم التي تعمل أدناه.',
    },
    'xl2va3e4': {
      'en': 'Add New',
      'ar': 'اضف جديد',
    },
    'lmaom7k3': {
      'en': 'Work Type',
      'ar': 'نوع العمل',
    },
    '3jg7igwr': {
      'en': 'Assigned User',
      'ar': 'المستخدم المعين',
    },
    '0lbafh66': {
      'en': 'Contract Amount',
      'ar': 'قيمة العقد',
    },
    'zdk5qmqw': {
      'en': 'Status',
      'ar': 'حالة',
    },
    '0iwwmrkc': {
      'en': 'Actions',
      'ar': 'أجراءات',
    },
    'focpcxqy': {
      'en': 'Design Work',
      'ar': 'عمل التصميم',
    },
    'hgrg8aav': {
      'en': 'Randy Peterson',
      'ar': 'راندي بيترسون',
    },
    'g5hwxmwr': {
      'en': 'Business Name',
      'ar': 'الاسم التجاري',
    },
    'mz5en407': {
      'en': '\$2,100',
      'ar': '2100 دولار',
    },
    '5l5xsefr': {
      'en': 'Paid',
      'ar': 'مدفوع',
    },
    'zi1zvlyi': {
      'en': 'Design Work',
      'ar': 'عمل التصميم',
    },
    'mewqgimu': {
      'en': 'Randy Peterson',
      'ar': 'راندي بيترسون',
    },
    '5dxrxz98': {
      'en': 'Business Name',
      'ar': 'الاسم التجاري',
    },
    '4xilfwto': {
      'en': '\$2,100',
      'ar': '2100 دولار',
    },
    'rqxrbszj': {
      'en': 'Paid',
      'ar': 'مدفوع',
    },
    '2u6t8dwc': {
      'en': 'Design Work',
      'ar': 'عمل التصميم',
    },
    '4j3nsjss': {
      'en': 'Randy Peterson',
      'ar': 'راندي بيترسون',
    },
    'dsepcigf': {
      'en': 'Business Name',
      'ar': 'الاسم التجاري',
    },
    'ylp4o3sk': {
      'en': '\$2,100',
      'ar': '2100 دولار',
    },
    'a0gqsqf3': {
      'en': 'Paid',
      'ar': 'مدفوع',
    },
    'hx5secah': {
      'en': 'Design Work',
      'ar': 'عمل التصميم',
    },
    '642g3q5p': {
      'en': 'Randy Peterson',
      'ar': 'راندي بيترسون',
    },
    'jad2anmx': {
      'en': 'Business Name',
      'ar': 'الاسم التجاري',
    },
    '8ughu6ro': {
      'en': '\$2,100',
      'ar': '2100 دولار',
    },
    '25bgdl3n': {
      'en': 'Paid',
      'ar': 'مدفوع',
    },
    'getkbrhe': {
      'en': 'Design Work',
      'ar': 'عمل التصميم',
    },
    'oxtl7gix': {
      'en': 'Randy Peterson',
      'ar': 'راندي بيترسون',
    },
    'ah8fsiib': {
      'en': 'Business Name',
      'ar': 'الاسم التجاري',
    },
    '3drjoqp7': {
      'en': '\$2,100',
      'ar': '2100 دولار',
    },
    'q1r4p259': {
      'en': 'Pending',
      'ar': 'قيد الانتظار',
    },
    'kj91jept': {
      'en': 'Design Work',
      'ar': 'عمل التصميم',
    },
    'mpuh7uqn': {
      'en': 'Randy Peterson',
      'ar': 'راندي بيترسون',
    },
    'lbd0eexr': {
      'en': 'Business Name',
      'ar': 'الاسم التجاري',
    },
    'd4d2yxmz': {
      'en': '\$2,100',
      'ar': '2100 دولار',
    },
    'f24klmf8': {
      'en': 'Pending',
      'ar': 'قيد الانتظار',
    },
    'zs0nhyrk': {
      'en': 'Design Work',
      'ar': 'عمل التصميم',
    },
    'fnd21sdv': {
      'en': 'Randy Peterson',
      'ar': 'راندي بيترسون',
    },
    'kep7c6qw': {
      'en': 'Business Name',
      'ar': 'الاسم التجاري',
    },
    'kxvqbncg': {
      'en': '\$2,100',
      'ar': '2100 دولار',
    },
    'ca8xhrb7': {
      'en': 'Pending',
      'ar': 'قيد الانتظار',
    },
    '4d9qn7mw': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // List_maps
  {
    '4c1qqsgt': {
      'en': 'Search listings...',
      'ar': 'قوائم البحث...',
    },
    'ae9bk24k': {
      'en': 'Option 1',
      'ar': '8 ساعات',
    },
    'ep4812uq': {
      'en': 'Sector',
      'ar': 'قطاع',
    },
    '9v86w89k': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'yt923507': {
      'en': 'Option 1',
      'ar': 'الخيار 1',
    },
    'bzoua52d': {
      'en': 'Square',
      'ar': 'مربع',
    },
    'vbnmp9oy': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'oys6kyht': {
      'en': 'Option 1',
      'ar': 'الخيار 1',
    },
    'z2dj3n2y': {
      'en': 'Leader',
      'ar': 'قائد',
    },
    'pvqv7ehd': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'lpg29i8j': {
      'en': 'Add New',
      'ar': 'اضف جديد',
    },
    'ikt69ycd': {
      'en': 'No: {450}',
      'ar': 'رقم: {450}',
    },
    '8odfyco6': {
      'en': 'Maps Details',
      'ar': 'تفاصيل الخرائط',
    },
    'zffe55o2': {
      'en': 'Due Date',
      'ar': 'تاريخ الاستحقاق',
    },
    '69pkwk2a': {
      'en': 'Actions',
      'ar': 'أجراءات',
    },
    'jnpm4796': {
      'en': 'PDF',
      'ar': 'PDF',
    },
    '0sybt3kt': {
      'en': 'Randy Peterson',
      'ar': 'راندي بيترسون',
    },
    'w9we337t': {
      'en': 'Fri. Aug 11th',
      'ar': 'الجمعة. 11 أغسطس',
    },
    'ouygul91': {
      'en': 'Need',
      'ar': 'يحتاج',
    },
    'k2yc9x59': {
      'en': '8',
      'ar': '8',
    },
    '9985evvu': {
      'en': 'worker',
      'ar': 'عامل',
    },
    'tbtyod24': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    '3iom27l0': {
      'en': 'Randy Peterson',
      'ar': 'راندي بيترسون',
    },
    'jutc63ax': {
      'en': 'Fri. Aug 11th',
      'ar': 'الجمعة. 11 أغسطس',
    },
    '7bkm0map': {
      'en': 'Need',
      'ar': 'يحتاج',
    },
    '9djvqh3u': {
      'en': '8',
      'ar': '8',
    },
    '4841hldm': {
      'en': 'worker',
      'ar': 'عامل',
    },
    'ktz60aiu': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'ejedmcdw': {
      'en': 'Maps',
      'ar': 'خرائط',
    },
    '9n1stm40': {
      'en': '•',
      'ar': '•',
    },
  },
  // Add_maps
  {
    '03taiu3w': {
      'en': 'Choose what you want to add ?',
      'ar': 'اختر ما تريد إضافته؟',
    },
    'ohbwcmhk': {
      'en': 'Sector',
      'ar': 'قطاع',
    },
    'pou6abj7': {
      'en': 'Square',
      'ar': 'مربع',
    },
    'oqeafqtm': {
      'en': 'Leader',
      'ar': 'قائد',
    },
    '3zsifane': {
      'en': 'Street',
      'ar': 'شارع',
    },
    'bowmbbkp': {
      'en': 'Street',
      'ar': 'شارع',
    },
    '1lnv0fff': {
      'en': 'All',
      'ar': 'الجميع',
    },
    'z3lbrqtf': {
      'en': 'Option 1',
      'ar': 'الخيار 1',
    },
    'chhv192r': {
      'en': 'Sector',
      'ar': 'قطاع',
    },
    'zoz3rb75': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    '4mt48tae': {
      'en': 'Option 1',
      'ar': 'الخيار 1',
    },
    'yya03cvm': {
      'en': 'Square',
      'ar': 'مربع',
    },
    '0vn6d4q5': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'pd9zdobm': {
      'en': 'Option 1',
      'ar': 'الخيار 1',
    },
    'r2yjcja5': {
      'en': 'Leader',
      'ar': 'قائد',
    },
    'jgodsc6y': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'okqqjnsn': {
      'en': 'loc. Name',
      'ar': 'loc. اسم',
    },
    'fu56hro8': {
      'en': 'location (If St.)',
      'ar': 'الموقع (إذا كان St.)',
    },
    '9hhjyova': {
      'en': '',
      'ar': '',
    },
    '81d0wbqf': {
      'en': 'Description (If St Or Sector)',
      'ar': 'الوصف (إذا كان St أو القطاع)',
    },
    'mdbr2gc0': {
      'en': 'St. Workers Need',
      'ar': 'احتياج الشارع من العمال',
    },
    'i20b277b': {
      'en': 'Add Location',
      'ar': 'أضف الموقع',
    },
    'om9koc24': {
      'en': 'Add Maps',
      'ar': 'أضف الخرائط',
    },
    'p0l9mhcd': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // user_Profile
  {
    '59511w1r': {
      'en': 'Basic',
      'ar': 'أساسي',
    },
    'drx1hobp': {
      'en': '|',
      'ar': '|',
    },
    'axtdvqkt': {
      'en': 'Worker',
      'ar': 'عامل',
    },
    'gfxmkct1': {
      'en': 'Chat',
      'ar': 'محادثة',
    },
    '0ixnykb3': {
      'en': 'Call',
      'ar': 'يتصل',
    },
    'kij21wbf': {
      'en': '4.7',
      'ar': '4.7',
    },
    '0i65iy2o': {
      'en': 'Gonea',
      'ar': 'جونيه',
    },
    '4ntzy0xn': {
      'en': 'Work Info',
      'ar': 'معلومات العمل',
    },
    'lkmavl53': {
      'en': 'Address Work {If Super}',
      'ar': 'عنوان العمل {إذا كان ممتازًا}',
    },
    '1zhr8ylj': {
      'en': 'Time:  ',
      'ar': 'وقت:',
    },
    'lcf6rzpy': {
      'en': 'Supplier Info',
      'ar': 'معلومات المورد',
    },
    '4przn1fm': {
      'en': '{Supplier Nickname}',
      'ar': '{الاسم المستعار للمورد}',
    },
    '9ra2d6fe': {
      'en': '|',
      'ar': '|',
    },
    'nc83futi': {
      'en': 'ID: #{15}',
      'ar': 'المعرف: #{15}',
    },
    'rrf5kyl6': {
      'en': ' have a problem? ',
      'ar': 'لديك مشكلة؟',
    },
    'j2bp3cl8': {
      'en': ' Make Complan',
      'ar': ' ابلاغ عن مشكلة',
    },
    's96fgcgz': {
      'en': 'Deactivate User',
      'ar': 'إلغاء تنشيط المستخدم',
    },
    'sbm7puci': {
      'en': 'Advanced',
      'ar': 'اضافي',
    },
    '9iubauvf': {
      'en': 'ID: #1502',
      'ar': 'رقم التعريف: #1502',
    },
    'j42wrsnu': {
      'en': 'First Name',
      'ar': 'الاسم الأول',
    },
    'g6p8et53': {
      'en': 'Middle Name',
      'ar': 'الاسم الأوسط',
    },
    'vp9m3683': {
      'en': 'Last Name',
      'ar': 'اسم العائلة',
    },
    '5u1ew8ep': {
      'en': 'Nick Name',
      'ar': 'الشهرة',
    },
    '6e8c39q3': {
      'en': 'religion ',
      'ar': 'الجنس',
    },
    'ple0zq04': {
      'en': 'Gender',
      'ar': '',
    },
    '9uh7vdup': {
      'en': '',
      'ar': '',
    },
    'iinrky9v': {
      'en': 'maritial status',
      'ar': '',
    },
    'lbvayuoe': {
      'en': 'nationality',
      'ar': '',
    },
    'h02dy9m3': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'g0t5b82n': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'emgbqhzq': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    't0bh1zlv': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '6quszuut': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'uatogsc0': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'xs113aiw': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'hzhpxc26': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'fk5avii6': {
      'en': 'national id',
      'ar': '',
    },
    '9uh78vj8': {
      'en': 'Birthdate',
      'ar': 'تاريخ الميلاد',
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
      'ar': 'تاريخ الهوية الوطنية',
    },
    '5fnfyr2h': {
      'en': 'Expiry date',
      'ar': 'تاريخ الانتهاء',
    },
    'ycwc7s5w': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'pjtzalo9': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'yofs1kcr': {
      'en': 'Field is required',
      'ar': '',
    },
    'a76r88ew': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'ulqrenzc': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '92qdid5a': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '0nzhj4zz': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'nzqn0som': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'tl1hsk73': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'cf6h6b08': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '607thgj8': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'wgs6a99w': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '33dqm631': {
      'en': 'Enter Nationality',
      'ar': 'أدخل الجنسية',
    },
    '8tve2c3r': {
      'en': 'Passport No.',
      'ar': 'رقم جواز السفر.',
    },
    'akv0sd1d': {
      'en': 'Birthdate',
      'ar': 'تاريخ الميلاد',
    },
    '2lu8vseg': {
      'en': 'Age',
      'ar': 'العمر',
    },
    '6i44ora1': {
      'en': 'Place of Issue',
      'ar': 'مكان الإصدار',
    },
    'yf3c6q7i': {
      'en': 'Date of civil ID',
      'ar': 'تاريخ الميلاد',
    },
    'if9heimp': {
      'en': 'Expiry date',
      'ar': 'تاريخ الانتهاء',
    },
    'cswlnhig': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'kehoco0y': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'v3rmz8xq': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'w4zkvob5': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'kglqpxlo': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '881aasz9': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'd7dhwjcz': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '7v6f0xx1': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'hg7l4b7n': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'txeos5rq': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '1fw2utw0': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'rfaza3dv': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'b2cu114e': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '8841suwc': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '48ckvhzt': {
      'en': 'Government',
      'ar': 'حكومة',
    },
    'lyy2glmr': {
      'en': 'city',
      'ar': 'مدينة',
    },
    'wfrvjm6v': {
      'en': 'Full Address',
      'ar': 'العنوان الكامل',
    },
    'btf7lpz1': {
      'en': 'Phone Number',
      'ar': 'رقم التليفون',
    },
    '9x88nppo': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '0ja5w2he': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '3b5htmd4': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'chd65nto': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '61lzqnwf': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'jybvddsq': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'lhpe7emp': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'vzn9h8jy': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'mophqzng': {
      'en': 'Education Data',
      'ar': 'بيانات التعليم',
    },
    'yerr0sks': {
      'en': 'Employed now?',
      'ar': 'موظف الآن؟',
    },
    'amsix5ro': {
      'en': 'employee status',
      'ar': '',
    },
    'vcqki3dz': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '6jmcc71z': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'tipdh689': {
      'en': ' Role',
      'ar': 'دور',
    },
    'ij2wa0hz': {
      'en': 'Role',
      'ar': '',
    },
    'y6m6654y': {
      'en': 'Contractor',
      'ar': 'مقاول',
    },
    's5gtdub1': {
      'en': 'Contract Status',
      'ar': '',
    },
    'skmpp1xz': {
      'en': 'Contractor ID',
      'ar': 'معرف المقاول',
    },
    'oqley6xf': {
      'en': 'Num Of Workers',
      'ar': 'عدد العمال',
    },
    'kbzhng2c': {
      'en': 'Starting Shift',
      'ar': 'بدء التحول',
    },
    '3gxzi635': {
      'en': 'Starting Shift',
      'ar': '',
    },
    '3htzzlem': {
      'en': 'Shift hours',
      'ar': '',
    },
    '5c3rujur': {
      'en': 'Please Select Contractor',
      'ar': 'الرجاء اختيار المقاول',
    },
    'kl74w9w1': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '5ss6r3g1': {
      'en': 'Please Select Contractor',
      'ar': 'الرجاء اختيار المقاول',
    },
    'bj7l1rgs': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '29egc17k': {
      'en': 'Have a driving license?',
      'ar': 'هل لديك رخصة قيادة؟',
    },
    '4n9fjwr3': {
      'en': 'Is there driving license?',
      'ar': '',
    },
    'toh0by3y': {
      'en': 'Type of driving license?',
      'ar': 'نوع رخصة القيادة؟',
    },
    '7sckg67s': {
      'en': 'Type of driving license',
      'ar': '',
    },
    'pkotzqut': {
      'en': 'Place of Issue',
      'ar': 'مكان الإصدار',
    },
    'yms4r7yo': {
      'en': 'Driving License Isuue Date',
      'ar': 'تاريخ إصدار رخصة القيادة',
    },
    '7gc25bvf': {
      'en': '',
      'ar': '',
    },
    '5sxgj8rk': {
      'en': '',
      'ar': '',
    },
    '06mh3ji4': {
      'en': 'Driving License Expiry Date',
      'ar': 'تاريخ انتهاء رخصة القيادة',
    },
    'v4zxw4om': {
      'en': '',
      'ar': '',
    },
    '72m78qnu': {
      'en': 'Work Area',
      'ar': 'منطقة العمل',
    },
    'p2i644dr': {
      'en': 'working area',
      'ar': '',
    },
    '3apmdi0x': {
      'en': 'Code (optional)',
      'ar': 'الكود (اختياري)',
    },
    'h0k7r3v9': {
      'en': 'code',
      'ar': '',
    },
    'icakhx9r': {
      'en': 'employment date',
      'ar': 'تاريخ التوظيف',
    },
    'h10l9uqf': {
      'en': 'Number of Workers',
      'ar': 'عدد العمال',
    },
    'pf27xi3y': {
      'en': 'Shift Price',
      'ar': 'سعر التحول',
    },
    'wq48jwbh': {
      'en': 'Permissible monthly deficit %',
      'ar': 'العجز الشهري المسموح به %',
    },
    'im8dgsd0': {
      'en': 'contract date',
      'ar': 'تاريخ العقد',
    },
    'y6rrq0qw': {
      'en': '',
      'ar': '',
    },
    '6h5ylbrm': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '0z33pf2e': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'qg9i8cyf': {
      'en': 'Field is required',
      'ar': '',
    },
    'zp31aw7b': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '5yusgnyb': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'oz2wq3bi': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '5tcqb9s4': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'zo89p8ml': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'ck2oishc': {
      'en': 'National ID',
      'ar': 'الهوية الوطنية',
    },
    'geruih04': {
      'en': 'Front ID.',
      'ar': 'معرف أمامي.',
    },
    'nlqv29od': {
      'en': 'Show Photo',
      'ar': 'عرض الصورة',
    },
    'wxnbjhnv': {
      'en': 'Show an image here...',
      'ar': 'اعرض الصورة هنا...',
    },
    'ohgr0nq5': {
      'en': 'National ID',
      'ar': 'الهوية الوطنية',
    },
    'qpavxuls': {
      'en': 'Back ID.',
      'ar': 'معرف العودة.',
    },
    '5z2j14fo': {
      'en': 'Show Photo',
      'ar': 'عرض الصورة',
    },
    'kr4xwd28': {
      'en': 'Show an image here...',
      'ar': 'اعرض الصورة هنا...',
    },
    'ksg7cu9b': {
      'en': 'Driving license',
      'ar': 'رخصة قيادة',
    },
    'aropjfik': {
      'en': 'Front driving license.',
      'ar': 'رخصة القيادة الأمامية.',
    },
    'spefryek': {
      'en': 'Show Photo',
      'ar': 'عرض الصورة',
    },
    '4x8mayw5': {
      'en': ' Show an image here...',
      'ar': 'اعرض الصورة هنا...',
    },
    'mbxqxwgt': {
      'en': 'Driving license',
      'ar': 'رخصة قيادة',
    },
    'w7i565rs': {
      'en': 'Back driving license.',
      'ar': 'رخصة القيادة الخلفية.',
    },
    '93aem41h': {
      'en': 'Show Photo',
      'ar': 'عرض الصورة',
    },
    'mpaen9wk': {
      'en': 'Show an image here...',
      'ar': 'اعرض الصورة هنا...',
    },
    'z89uqevv': {
      'en': 'Drug test',
      'ar': 'اختبار المخدرات',
    },
    'im4nlqwl': {
      'en': 'Last drug test.',
      'ar': 'آخر اختبار للمخدرات.',
    },
    'xsf42yb4': {
      'en': 'Show Photo',
      'ar': 'عرض الصورة',
    },
    'juqwxw92': {
      'en': 'Show an image here...',
      'ar': 'اعرض الصورة هنا...',
    },
    '1qljnq1y': {
      'en': 'Export PDF',
      'ar': 'تصدير PDF',
    },
    '23c7pzhq': {
      'en': 'Attendance',
      'ar': 'الحضور',
    },
    'bllxekay': {
      'en': 'Will Hobbiton',
      'ar': 'ويل هوبيتون',
    },
    '845y5z3d': {
      'en': 'Nickname',
      'ar': 'كنية',
    },
    'adryeuv4': {
      'en': '|',
      'ar': '|',
    },
    '6o8ygn9p': {
      'en': 'ID: #1502',
      'ar': 'رقم التعريف: #1502',
    },
    'kxl5rn0v': {
      'en': 'Worker',
      'ar': 'عامل',
    },
    '1bgv9vqw': {
      'en': 'Option 1',
      'ar': 'الخيار 1',
    },
    'i12tx7sj': {
      'en': 'Day',
      'ar': 'يوم',
    },
    'd3bhkg4e': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    '7ygg4m33': {
      'en': 'Option 1',
      'ar': 'الخيار 1',
    },
    'jigf6h4y': {
      'en': 'Month',
      'ar': 'شهر',
    },
    'skyah6l7': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'whpy32f3': {
      'en': 'Option 1',
      'ar': 'الخيار 1',
    },
    'vnkhy9x6': {
      'en': 'Year',
      'ar': 'سنة',
    },
    'qxfb0cct': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    '12nq13js': {
      'en': 'Attendance',
      'ar': 'حضور',
    },
    'nfq6n3ci': {
      'en': 'Attendance',
      'ar': 'حضور',
    },
    'ktvsgi0k': {
      'en': 'Time',
      'ar': 'وقت',
    },
    '2jq0wdpb': {
      'en': 'Work Info',
      'ar': 'معلومات العمل',
    },
    'kuc43ksv': {
      'en': '03/01/2024',
      'ar': '01/03/2024',
    },
    '0ssjuef6': {
      'en': 'In :',
      'ar': 'في :',
    },
    'k9d7qpth': {
      'en': 'Out :',
      'ar': 'خارج :',
    },
    'oei56k89': {
      'en': '10:00am',
      'ar': '10:00 ص',
    },
    'km7r4os3': {
      'en': '03:00pm',
      'ar': '03:00 مساءا',
    },
    'nt1ml2p6': {
      'en': '{Sv Name}',
      'ar': '{اسم سيفرت}',
    },
    'caq6v498': {
      'en': '{Area}',
      'ar': '{منطقة}',
    },
    '0kmd66ib': {
      'en': '|',
      'ar': '|',
    },
    'awurslgx': {
      'en': '{Car}',
      'ar': '{سيارة}',
    },
    'lttidju6': {
      'en': 'No: {1502}',
      'ar': 'رقم: {1502}',
    },
    'glujl3km': {
      'en': 'Export PDF',
      'ar': 'تصدير قوات الدفاع الشعبي',
    },
    'kkhqfu75': {
      'en': 'Complaints',
      'ar': 'شكاوي',
    },
    'dkfwcf2s': {
      'en': 'Complaints',
      'ar': 'شكاوي',
    },
    '253o9eas': {
      'en': 'Time',
      'ar': 'وقت',
    },
    'xbp5ab6y': {
      'en': 'Work Info',
      'ar': 'معلومات العمل',
    },
    '1aeh6wtz': {
      'en': '{Type}',
      'ar': '{يكتب}',
    },
    'd0ncbsxb': {
      'en': '#2008',
      'ar': '#2008',
    },
    '6gyekhkc': {
      'en': '03/05/2056',
      'ar': '03/05/2056',
    },
    'jx6hjl7w': {
      'en': '03:00pm',
      'ar': '03:00 مساءا',
    },
    'q1u04z1d': {
      'en': '{Sv Name}',
      'ar': '{اسم سيفرت}',
    },
    'busqcrsf': {
      'en': '{Area}',
      'ar': '{منطقة}',
    },
    'odq1g6d3': {
      'en': '|',
      'ar': '|',
    },
    'u1rnb0i7': {
      'en': '{Car}',
      'ar': '{سيارة}',
    },
    '172txndb': {
      'en': 'No: {1502}',
      'ar': 'رقم: {1502}',
    },
    '0v46h0gc': {
      'en': 'Export PDF',
      'ar': 'تصدير قوات الدفاع الشعبي',
    },
    '09u5ygvg': {
      'en': 'Uniform',
      'ar': 'زي مُوحد',
    },
    '12tcviu7': {
      'en': 'Unifoam receipts',
      'ar': 'إيصالات Unifoam',
    },
    'agmbrxbt': {
      'en': 'Price',
      'ar': 'سعر',
    },
    '6lvfxgzf': {
      'en': 'Type',
      'ar': 'يكتب',
    },
    '2m3ep1r3': {
      'en': '03/05/2056',
      'ar': '03/05/2056',
    },
    'pcmzwsie': {
      'en': '03:00pm',
      'ar': '03:00 مساءا',
    },
    'lc6ffk0o': {
      'en': '500 L.E',
      'ar': '500 ج.م',
    },
    'aq132fb6': {
      'en': 'قيد التقسيط',
      'ar': 'قيد التشغيل',
    },
    'vmcm3xud': {
      'en': 'No: {1502}',
      'ar': 'رقم: {1502}',
    },
    '3lisefcm': {
      'en': 'Export PDF',
      'ar': 'تصدير قوات الدفاع الشعبي',
    },
    'p7v78m1o': {
      'en': 'Personal Order',
      'ar': 'أمر شخصي',
    },
    'n9xt5xt0': {
      'en': 'Id',
      'ar': 'بطاقة تعريف',
    },
    'qm9p9cxz': {
      'en': 'Description',
      'ar': 'وصف',
    },
    'xsaik1m7': {
      'en': 'Time',
      'ar': 'وقت',
    },
    '869x05z5': {
      'en': '#125',
      'ar': '#125',
    },
    't5uqvaih': {
      'en': 'انا غلبان من الشرقية فلوسي ضاعت وعايز اروح :(',
      'ar': 'انا غلبان من الشرقية فلوسي ضاعت وعايز اروح :(',
    },
    'xbfn05k0': {
      'en': '03/05/2056',
      'ar': '03/05/2056',
    },
    '4lgi70s2': {
      'en': '03:00pm',
      'ar': '03:00 مساءا',
    },
    'o6ipkmze': {
      'en': 'No: {1502}',
      'ar': 'رقم: {1502}',
    },
    'sxc6m2lb': {
      'en': 'Export PDF',
      'ar': 'تصدير قوات الدفاع الشعبي',
    },
    'dgi0zmwp': {
      'en': 'Profile',
      'ar': 'حساب تعريفي',
    },
    'hx5ls4oj': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // updateUser
  {
    'emgoopnd': {
      'en': 'ID: #1502',
      'ar': 'رقم التعريف: #1502',
    },
    'yndvaxe6': {
      'en': 'First Name',
      'ar': 'الاسم الأول',
    },
    '4cfe58qo': {
      'en': 'Middle Name',
      'ar': 'الاسم الأوسط',
    },
    'puw2zw53': {
      'en': 'Last Name',
      'ar': 'اسم العائلة',
    },
    '8ccq17hy': {
      'en': 'Nick Name',
      'ar': 'الشهرة',
    },
    'fv5vjl8z': {
      'en': 'Religion',
      'ar': 'الديانة',
    },
    '5c3yniy7': {
      'en': 'Muslim',
      'ar': 'مسلم',
    },
    'b7v2yy3n': {
      'en': 'Christiran',
      'ar': 'مسيحي',
    },
    'quevxoty': {
      'en': 'Religion',
      'ar': 'دِين',
    },
    '6p08g0kz': {
      'en': 'Gender',
      'ar': 'الجنس',
    },
    'x82dctlw': {
      'en': 'Male',
      'ar': 'ذكر',
    },
    'h7k2nbpz': {
      'en': 'Female',
      'ar': 'أنثى',
    },
    '3e9mudts': {
      'en': 'Select Gender',
      'ar': 'حدد نوع الجنس',
    },
    'y2ynz8bm': {
      'en': 'Marital Status',
      'ar': 'الحالة الاجتماعية',
    },
    'lyuk9k01': {
      'en': 'Married',
      'ar': 'متزوج',
    },
    '1jzs5tr8': {
      'en': 'Single',
      'ar': 'أعزب',
    },
    'qh7c9fxr': {
      'en': 'Marital Status',
      'ar': 'الحالة الاجتماعية',
    },
    'emhylr8w': {
      'en': 'Nationality',
      'ar': 'الجنسية',
    },
    'uvmzl1zs': {
      'en': 'Egypt',
      'ar': 'مصر',
    },
    '5034j0qz': {
      'en': 'Other',
      'ar': 'آخر',
    },
    'nx9mxld8': {
      'en': 'Nationality',
      'ar': 'جنسية',
    },
    'enfyho2b': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'doria04w': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'tzhb6rj4': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'ah30xzxy': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'avc5ehen': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'nvbjvpp1': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'pngdvivk': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '9pzk0wel': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '2yy2t179': {
      'en': 'National ID',
      'ar': 'الهوية الوطنية',
    },
    'yfbawa65': {
      'en': 'Confirm Nat',
      'ar': 'تأكيد الرقم',
    },
    'lkdlw7r6': {
      'en': 'Birthdate',
      'ar': 'تاريخ الميلاد',
    },
    'xswc1lq2': {
      'en': 'Age',
      'ar': 'العُمر',
    },
    'isrt1y73': {
      'en': 'Place of Issue',
      'ar': 'مكان الإصدار',
    },
    'n0zxdjt6': {
      'en': 'Date of national id',
      'ar': 'تاريخ الهوية الوطنية',
    },
    '0e7rjtsg': {
      'en': '',
      'ar': '',
    },
    '8hy4o4du': {
      'en': 'Expiry date',
      'ar': 'تاريخ الانتهاء',
    },
    '1g2f64vk': {
      'en': '',
      'ar': '',
    },
    'wa1ynn8k': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'w4262zc6': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'ixl2pk2j': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'fn3j2c20': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'opi0uzff': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'pclmnwps': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'ohp4cx1x': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '8rae2x2x': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'sp9k95fb': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'wtoagvem': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'gwck1nvk': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'kmjxuij7': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    't34z7mo1': {
      'en': 'Enter Nationality',
      'ar': 'أدخل الجنسية',
    },
    'pp7hjhsc': {
      'en': 'Passport No.',
      'ar': '',
    },
    'k7ddc0xy': {
      'en': 'Birthdate',
      'ar': 'تاريخ الميلاد',
    },
    'zsy5lqiy': {
      'en': '',
      'ar': '',
    },
    '5nqnaiah': {
      'en': 'Calc Age',
      'ar': 'حساب العمر',
    },
    'hgoa5kqn': {
      'en': 'Age',
      'ar': 'العمر',
    },
    'bal0mlcw': {
      'en': '',
      'ar': '',
    },
    'q4iwyxsm': {
      'en': 'Place of Issue',
      'ar': 'مكان الإصدار',
    },
    '42vgq0yr': {
      'en': 'Date of civil ID',
      'ar': 'تاريخ البطاقة المدنية',
    },
    '3k43pxg4': {
      'en': '',
      'ar': '',
    },
    'x5q44nvx': {
      'en': 'Expiry date',
      'ar': '',
    },
    'hoc0zf6s': {
      'en': '',
      'ar': '',
    },
    'hnkgms9m': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '6fmof2oz': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'dlh4j6fx': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'ng5fhzhu': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'ghahtwl6': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'qxme88gp': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '14qepzq2': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    's02rbq88': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'lozh12lu': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'byfsi2hl': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '0ljutgzs': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'achf11vh': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'ii8sufu6': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '32f4ehu2': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'w0fx8ggb': {
      'en': 'Government',
      'ar': 'حكومة',
    },
    'o1457cb7': {
      'en': 'city',
      'ar': 'مدينة',
    },
    'o82vyrnc': {
      'en': 'Full Address',
      'ar': 'العنوان الكامل',
    },
    'djxxns3i': {
      'en': 'Phone Number',
      'ar': 'رقم التليفون',
    },
    'w7zsdmbv': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'gzzfl1bn': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'cauc26jv': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'qiie0qkm': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'k70pcnn3': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'ghlnn2kr': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'f8gdqhod': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '7e7p7frv': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'wbewlluf': {
      'en': 'Education Data',
      'ar': 'بيانات التعليم',
    },
    'fdbhrotj': {
      'en': 'Employed now?',
      'ar': 'موظف الآن؟',
    },
    'qwkcrubq': {
      'en': 'Yes',
      'ar': 'نعم',
    },
    'l004abfx': {
      'en': 'No',
      'ar': 'لا',
    },
    'd0xh78gg': {
      'en': 'Employed now?',
      'ar': 'موظف الآن؟',
    },
    '9c5lzbik': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'ken37vf0': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '37fmt8jf': {
      'en': 'Select Role',
      'ar': 'حدد الدور',
    },
    '8wnjj02k': {
      'en': 'Worker',
      'ar': 'عامل',
    },
    '3nj6g1wx': {
      'en': 'Select Role',
      'ar': 'حدد الدور',
    },
    '8tcog14o': {
      'en': 'Select Contractor',
      'ar': 'حدد المقاول',
    },
    'm824gqyi': {
      'en': 'Al Rahma',
      'ar': 'الرحمة',
    },
    'r1hfx48i': {
      'en': 'Select Contractor',
      'ar': 'حدد المقاول',
    },
    'jxtcjkwl': {
      'en': 'Contractor ID',
      'ar': 'معرف المقاول',
    },
    'pcebteng': {
      'en': 'Num Of Workers',
      'ar': 'عدد العمال',
    },
    'op525m9c': {
      'en': 'Select Starting Shift',
      'ar': 'حدد بدء التحول',
    },
    '2w314fqm': {
      'en': 'Morning',
      'ar': 'صباح',
    },
    'miiulivf': {
      'en': 'Evening',
      'ar': 'مساء',
    },
    '5b7x6b56': {
      'en': 'Night',
      'ar': 'ليلة',
    },
    'rd2je9fl': {
      'en': 'Select starting shift ',
      'ar': 'حدد تحول البداية',
    },
    '09nl5s4l': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'dcajv0og': {
      'en': '8 h',
      'ar': '8 ساعات',
    },
    'std7kjt6': {
      'en': '16 h',
      'ar': '16 ساعة',
    },
    '7cuv8j56': {
      'en': 'Time',
      'ar': 'وقت',
    },
    'olspi0j0': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    '8tnvoifp': {
      'en': 'Select Starting Shift',
      'ar': 'حدد بدء التحول',
    },
    'xrefqmhc': {
      'en': 'Please Select Contractor',
      'ar': 'الرجاء اختيار المقاول',
    },
    'cru62lok': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '1prkhs7c': {
      'en': 'Please Select Contractor',
      'ar': 'الرجاء اختيار المقاول',
    },
    'jjlftoy1': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'a8doh1tt': {
      'en': 'Morning',
      'ar': 'صباح',
    },
    '1gvtqcho': {
      'en': 'Evening',
      'ar': 'مساء',
    },
    'dp2pzh1u': {
      'en': 'Night',
      'ar': '',
    },
    'tq47fjpu': {
      'en': 'Select starting shift ',
      'ar': 'حدد بداية  الوردية',
    },
    'xfc8cimb': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'scdqybor': {
      'en': '8 h',
      'ar': '8 ساعات',
    },
    'ysxlsb9q': {
      'en': '12 h',
      'ar': '',
    },
    'lb82g14l': {
      'en': '16 h',
      'ar': '',
    },
    '1zc3bz0f': {
      'en': 'Time',
      'ar': 'وقت',
    },
    '0qqqwg1r': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'z9u279o7': {
      'en': 'Have a driving license?',
      'ar': 'هل لديك رخصة قيادة؟',
    },
    '9kf7nwsm': {
      'en': 'Yes',
      'ar': 'نعم',
    },
    's2rrv8vx': {
      'en': 'No',
      'ar': 'لا',
    },
    'dgmflr1h': {
      'en': 'Do you have a driving license?',
      'ar': 'هل لديك رخصة قيادة؟',
    },
    '5hsor24h': {
      'en': 'Type of driving license?',
      'ar': 'نوع رخصة القيادة؟',
    },
    '04xkllzm': {
      'en': 'Car',
      'ar': 'سيارة',
    },
    '3hcrf4ti': {
      'en': 'Motorcycle / Tricycle',
      'ar': 'دراجة نارية / دراجة ثلاثية العجلات',
    },
    'to288cxg': {
      'en': 'Van',
      'ar': 'سيارة نقل',
    },
    'yui5kvi6': {
      'en': 'Type of driving license?',
      'ar': 'نوع رخصة القيادة؟',
    },
    'wy79051k': {
      'en': 'Place of Issue',
      'ar': 'مكان الإصدار',
    },
    'c8iexdqj': {
      'en': 'Driving Liccense Isuue Date',
      'ar': 'تاريخ إصدار رخصة القيادة',
    },
    'udichc1k': {
      'en': '',
      'ar': '',
    },
    'k6cfiys7': {
      'en': '',
      'ar': '',
    },
    '8j78azse': {
      'en': 'Driving Liccense Expiry Date',
      'ar': 'تاريخ انتهاء رخصة القيادة',
    },
    'ym3w7fwb': {
      'en': '',
      'ar': '',
    },
    'zqogz5ks': {
      'en': '',
      'ar': '',
    },
    'ebcferv5': {
      'en': 'Select Work Area',
      'ar': 'حدد منطقة العمل',
    },
    '5k1mpow6': {
      'en': '',
      'ar': '',
    },
    'aqw9vu6m': {
      'en': 'Leader Area 1',
      'ar': 'منطقة القائد 1',
    },
    'nhg7y4a9': {
      'en': 'Leader Area 2',
      'ar': 'منطقة القائد 2',
    },
    'qccpp1jg': {
      'en': 'Leader Area 3',
      'ar': 'منطقة القائد 3',
    },
    'sy11t9zg': {
      'en': 'Leader Area 4',
      'ar': 'منطقة القائد 4',
    },
    'zsp0wr1g': {
      'en': 'Leader Area 5',
      'ar': 'منطقة القائد 5',
    },
    'o6vmlkz2': {
      'en': 'Leader Area 6',
      'ar': 'منطقة القائد 6',
    },
    'zbcjahf6': {
      'en': 'Leader Area 7',
      'ar': 'منطقة القائد 7',
    },
    'panknvpj': {
      'en': 'Leader Area 8',
      'ar': 'منطقة القائد 8',
    },
    '0i10j0z2': {
      'en': 'Leader Area 9',
      'ar': 'منطقة القائد 9',
    },
    'i9vl268p': {
      'en': 'Leader Area 10',
      'ar': 'منطقة القائد 10',
    },
    'i27rg9kz': {
      'en': 'Leader Area 11',
      'ar': 'منطقة القائد 11',
    },
    '359vqjbc': {
      'en': 'Leader Area 12',
      'ar': 'منطقة القائد 12',
    },
    '9o2z2spi': {
      'en': 'Leader Area 13',
      'ar': 'منطقة القائد 13',
    },
    's1b92hlf': {
      'en': 'Leader Area 14',
      'ar': 'منطقة القائد 14',
    },
    'rpgye2ew': {
      'en': 'Leader Area 15',
      'ar': 'منطقة القائد 15',
    },
    'wx0qqw5a': {
      'en': 'Leader Area 16',
      'ar': 'منطقة القائد 16',
    },
    'gi6o7tou': {
      'en': 'Leader Area 17',
      'ar': 'منطقة القائد 17',
    },
    'uz21l403': {
      'en': 'Leader Area 18',
      'ar': 'منطقة القائد 18',
    },
    'kw0206r8': {
      'en': 'Leader Area 19',
      'ar': 'منطقة القائد 19',
    },
    'mtmoqf1a': {
      'en': 'Leader Area 20',
      'ar': 'منطقة القائد 20',
    },
    '2ysb2s3a': {
      'en': 'Select Work Area',
      'ar': 'حدد منطقة العمل',
    },
    'jq0vsqkd': {
      'en': 'Select Code (optional)',
      'ar': 'اختر الرمز (اختياري)',
    },
    '7urv47kd': {
      'en': '150: Superviser',
      'ar': '150 : المشرف',
    },
    '2kwrdx53': {
      'en': '220: fixed point',
      'ar': '220: نقطة ثابتة',
    },
    '2d5iih0i': {
      'en': '250: Garage worker (maintenance)',
      'ar': '250: عامل جراج (صيانة)',
    },
    '7s0c4fuc': {
      'en': '260: Authority worker',
      'ar': '260 : عامل السلطة',
    },
    '2gwx8ilt': {
      'en': '270: Workers’ driver',
      'ar': '270 : سائق العمال',
    },
    'erlk47g2': {
      'en': '280: Authority car driver',
      'ar': '280 : سائق سيارة السلطة',
    },
    'okwezz6n': {
      'en': '150-',
      'ar': '150-',
    },
    'x34btdvb': {
      'en': 'Street Worker',
      'ar': 'عامل الشارع',
    },
    'tidi8bxo': {
      'en': 'Select code',
      'ar': 'حدد الرمز',
    },
    'e0e638kt': {
      'en': 'employment date',
      'ar': 'تاريخ التوظيف',
    },
    'gdtp3agg': {
      'en': '',
      'ar': '',
    },
    '71kzt7n0': {
      'en': 'Number of Workers',
      'ar': 'عدد العمال',
    },
    'y7eko6mp': {
      'en': 'Shift Price',
      'ar': 'سعر الوردية',
    },
    'yonvhnvo': {
      'en': 'Permissible monthly deficit %',
      'ar': 'العجز الشهري المسموح به %',
    },
    '7ns0f9xu': {
      'en': 'contract date',
      'ar': 'تاريخ العقد',
    },
    '9fiau5hx': {
      'en': '',
      'ar': '',
    },
    'lmm7wjpt': {
      'en': '',
      'ar': '',
    },
    'llj5640u': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'ppl7ccu4': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'qmqs7lc9': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '8mn7s4rh': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '7yddi9a7': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'gn2q2xxa': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'ix2eip19': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'yjo80feq': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'i23w2oac': {
      'en': 'Upload Photo',
      'ar': 'حمل الصورة',
    },
    'd38g3q5b': {
      'en': 'Personal Photo',
      'ar': 'صورة شخصية',
    },
    'c9n2h4u6': {
      'en': 'Add Photo',
      'ar': 'إضافة صورة',
    },
    'zk6ecwu3': {
      'en': 'Upload an image here...',
      'ar': 'ارفع صورة هنا...',
    },
    '9dxsjed0': {
      'en': 'Upload National ID',
      'ar': 'تحميل الرقم القومي',
    },
    'ns4tb7dl': {
      'en': 'National ID',
      'ar': 'الهوية الوطنية',
    },
    'wi8pmnhb': {
      'en': 'Please upload front ID.',
      'ar': 'يرجى تحميل صورة الجهة  الأمامية.',
    },
    'f89pemp5': {
      'en': 'Add Photo',
      'ar': 'إضافة صورة',
    },
    '3be81d8t': {
      'en': 'Upload an image here...',
      'ar': 'ارفع صورة هنا...',
    },
    'o5trzlx9': {
      'en': 'National ID',
      'ar': 'الهوية الوطنية',
    },
    'jrf7hy4b': {
      'en': 'Please upload back ID.',
      'ar': 'يرجى تحميل صورة الجهة الخلفية.',
    },
    'w9n8l4rk': {
      'en': 'Add Photo',
      'ar': 'إضافة صورة',
    },
    '3pctfapy': {
      'en': 'Upload an image here...',
      'ar': 'ارفع صورة هنا...',
    },
    'rq9kitlp': {
      'en': 'Upload driving license',
      'ar': 'تحميل رخصة القيادة',
    },
    '4id83t8a': {
      'en': 'Driving license',
      'ar': 'رخصة القيادة',
    },
    'mojaxy2c': {
      'en': 'Please upload front driving license.',
      'ar': 'يرجى تحميل رخصة القيادة الأمامية.',
    },
    'wrkvpmmk': {
      'en': 'Add Photo',
      'ar': 'إضافة صورة',
    },
    's5iammb7': {
      'en': 'Upload an image here...',
      'ar': 'ارفع صورة هنا...',
    },
    'dg7e4ldf': {
      'en': 'Driving license',
      'ar': 'رخصة القيادة',
    },
    '220h2v78': {
      'en': 'Please upload back ID.',
      'ar': 'يرجى تحميل رخصة القيادة الخلفية.',
    },
    'w1qw3jqo': {
      'en': 'Add Photo',
      'ar': 'إضافة صورة',
    },
    'v2lys5vb': {
      'en': 'Upload an image here...',
      'ar': 'ارفع صورة هنا...',
    },
    'a8yp9miy': {
      'en': 'Drug test',
      'ar': 'اختبار المخدرات',
    },
    'afyhmkoi': {
      'en': 'Last drug test.',
      'ar': 'آخر اختبار للمخدرات.',
    },
    'raej25cn': {
      'en': 'Show Photo',
      'ar': 'عرض الصورة',
    },
    'kbcwhds2': {
      'en': 'Show an image here...',
      'ar': 'اعرض الصورة هنا...',
    },
    'dq7vyo8g': {
      'en': '* Please verify the data, it cannot be changed later*',
      'ar': '*يرجى التأكد من البيانات فلا يمكن تغييرها لاحقاً*',
    },
    'b0gkzl62': {
      'en': 'Update',
      'ar': 'تحديث',
    },
    'yxcxejbg': {
      'en': 'Update  Profile',
      'ar': 'تحديث الملف',
    },
  },
  // Details20Property
  {
    '21ds7gqx': {
      'en': 'Spectacular Views of Queenstown',
      'ar': 'مناظر خلابة لكوينزتاون',
    },
    '20r9k9jk': {
      'en':
          'Non so se la bellezza salverà il mondo ma sicuramente aiuta. Sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
      'ar':
          'لا تنقذ العالم بشكل آمن. Sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut Labore et dolore magna aliqua. إننا لا نسمح إلا بالحد الأدنى من النشاط الذي نمارسه من خلال العمل، ولا نتركه بعيدًا عن أي شيء يترتب على ذلك.',
    },
    'ybap76zq': {
      'en': '4.7',
      'ar': '4.7',
    },
    'gmo97ajj': {
      'en': 'Superhost',
      'ar': 'مضيف متميز',
    },
    '03e7elhc': {
      'en': '\$156',
      'ar': '156 دولارًا',
    },
    'tkq7zev6': {
      'en': '+ taxes',
      'ar': '+ الضرائب',
    },
    '58rsqh21': {
      'en': 'per night',
      'ar': 'لليلة الواحدة',
    },
    '0x6zdqgz': {
      'en': 'Book Now',
      'ar': 'احجز الآن',
    },
    'j6zzcs5a': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // OM_List_All_Task
  {
    '4898ga5v': {
      'en': 'Search...( Area, Superviser )',
      'ar': 'بحث...(منطقة، مشرف)',
    },
    '30jkep8b': {
      'en': 'Option 1',
      'ar': 'الخيار 1',
    },
    'wa3kwpbs': {
      'en': 'Section',
      'ar': 'قسم',
    },
    'z70qzcg8': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'w8r87gsz': {
      'en': 'Option 1',
      'ar': 'الخيار 1',
    },
    'japiea9o': {
      'en': 'Shift',
      'ar': 'يحول',
    },
    'rbt6uvpe': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'y0qgiom4': {
      'en': 'Option 1',
      'ar': 'الخيار 1',
    },
    'bmrl29ni': {
      'en': 'Day',
      'ar': 'يوم',
    },
    'jkq83rnz': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    '725caxye': {
      'en': 'No: {20}',
      'ar': 'عدد : {20}',
    },
    'n78ios4q': {
      'en': 'Pending',
      'ar': 'قيد الانتظار',
    },
    '0ei5qbe2': {
      'en': '{Sv Name}',
      'ar': '{اسم سيفرت}',
    },
    '5wpaoimi': {
      'en': 'View',
      'ar': 'منظر',
    },
    'j2hx4b26': {
      'en': '{Leader 5} | {Maadi}',
      'ar': '{القائد 5} | {المعادي}',
    },
    'p1vmz3z5': {
      'en': '{Street}',
      'ar': '{شارع}',
    },
    'pj7yvfjl': {
      'en': 'Morning',
      'ar': 'صباح',
    },
    'qlq9u4cq': {
      'en': 'Tuesday, 10:00am',
      'ar': 'الثلاثاء، الساعة 10:00 صباحاً',
    },
    'jybs926k': {
      'en': 'In Progress',
      'ar': 'في تَقَدم',
    },
    '2j7kmkq0': {
      'en': 'Completed',
      'ar': 'مكتمل',
    },
    '1zs50eep': {
      'en': '{Sv Name}',
      'ar': '{اسم سيفرت}',
    },
    'c3n4yeaf': {
      'en': 'View',
      'ar': 'منظر',
    },
    '46bpj7ev': {
      'en': '{Leader 5} | {Maadi}',
      'ar': '{القائد 5} | {المعادي}',
    },
    '1aa5jskt': {
      'en': '{Street}',
      'ar': '{شارع}',
    },
    'uqkjqk6l': {
      'en': 'Morning',
      'ar': 'صباح',
    },
    'j9p9xsh3': {
      'en': 'Tuesday, 10:00am',
      'ar': 'الثلاثاء، الساعة 10:00 صباحاً',
    },
    'mye98ye4': {
      'en': 'Completed',
      'ar': 'مكتمل',
    },
    'wbfnlf1b': {
      'en': 'Reviewed',
      'ar': 'تمت المراجعة',
    },
    'lxwbol6f': {
      'en': '{Sv Name}',
      'ar': '{اسم سيفرت}',
    },
    'eynbxxht': {
      'en': '{Leader 5} | {Maadi}',
      'ar': '{القائد 5} | {المعادي}',
    },
    'mgs9gjy7': {
      'en': 'Street',
      'ar': 'شارع',
    },
    '03v77zfw': {
      'en': 'Morning',
      'ar': 'صباح',
    },
    'w1wk6bnd': {
      'en': 'Tuesday, 10:00am',
      'ar': 'الثلاثاء، الساعة 10:00 صباحاً',
    },
    'd2oor1ka': {
      'en': 'Reviewed',
      'ar': 'تمت المراجعة',
    },
    '8yh2kxuw': {
      'en': 'Export PDF',
      'ar': 'تصدير PDF',
    },
    'czciey4t': {
      'en': 'Lated',
      'ar': 'متأخرا',
    },
    'k2ey0v81': {
      'en': '{Sv Name}',
      'ar': '{اسم سيفرت}',
    },
    'g3qk8wvw': {
      'en': 'View',
      'ar': 'منظر',
    },
    'ofdsld3s': {
      'en': '{Leader 5} | {Maadi}',
      'ar': '{القائد 5} | {المعادي}',
    },
    'x8fvci2v': {
      'en': '{Street}',
      'ar': '{شارع}',
    },
    'yyece55q': {
      'en': 'Morning',
      'ar': 'صباح',
    },
    'kcej4f6t': {
      'en': 'Tuesday, 10:00am',
      'ar': 'الثلاثاء، الساعة 10:00 صباحاً',
    },
    'yfg9l4is': {
      'en': 'Lated',
      'ar': 'متأخرا',
    },
    'un59dsce': {
      'en': 'Export PDF',
      'ar': 'تصدير قوات الدفاع الشعبي',
    },
    '83yh0esk': {
      'en': 'Bookmarked',
      'ar': 'إشارة مرجعية',
    },
    '0x4ssqqp': {
      'en': '{Sv Name}',
      'ar': '{اسم سيفرت}',
    },
    '7x4xjds5': {
      'en': 'View',
      'ar': 'منظر',
    },
    'bo7jniko': {
      'en': '{Leader 5} | {Maadi}',
      'ar': '{القائد 5} | {المعادي}',
    },
    'hrqi5x10': {
      'en': '{Street}',
      'ar': '{شارع}',
    },
    'yy1oqlve': {
      'en': 'Morning',
      'ar': 'صباح',
    },
    'za96705k': {
      'en': 'Tuesday, 10:00am',
      'ar': 'الثلاثاء، الساعة 10:00 صباحاً',
    },
    '3wqwyh3v': {
      'en': 'Lated{Same}',
      'ar': 'متأخر {نفس}',
    },
    'm9tca6q6': {
      'en': 'Export PDF',
      'ar': 'تصدير قوات الدفاع الشعبي',
    },
    '8t425t70': {
      'en': 'Daily Tasks',
      'ar': 'مهمات يوميه',
    },
    'b2ikt2le': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // OM_Supmited_taskDetalis
  {
    'hvpshf26': {
      'en': '{Sv Name}',
      'ar': '{اسم سيفرت}',
    },
    'n3ikgw1t': {
      'en': '{Leader 5} | {Maadi}',
      'ar': '{القائد 5} | {المعادي}',
    },
    '9u041xcp': {
      'en': '#ID',
      'ar': '#بطاقة تعريف',
    },
    'ut2cpeob': {
      'en': 'Due',
      'ar': 'حق',
    },
    'ssaa8ytq': {
      'en': 'In Progress',
      'ar': 'في تَقَدم',
    },
    'p4p6qsbi': {
      'en': 'Tuesday, 10:00am',
      'ar': 'الثلاثاء، الساعة 10:00 صباحاً',
    },
    'nym7i83i': {
      'en': 'Details',
      'ar': 'تفاصيل',
    },
    '65cb17r0': {
      'en': 'ST',
      'ar': 'شارع',
    },
    'ny3a1rk5': {
      'en': '{15}',
      'ar': '{15}',
    },
    'zw3trjy5': {
      'en': 'Discription',
      'ar': 'وصف',
    },
    'l6f5auq4': {
      'en':
          'hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhcompanyname.co',
      'ar':
          'هههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههه اسم الشركة.',
    },
    't5c1jzmn': {
      'en': 'Response',
      'ar': 'إجابة',
    },
    '1wgpjkaz': {
      'en': 'Comment',
      'ar': 'تعليق',
    },
    'w7hbwt9e': {
      'en': 'Reviewed',
      'ar': 'تمت المراجعة',
    },
    'g0c4l202': {
      'en': 'Task Details',
      'ar': 'تفاصيل المهمة',
    },
    'km7ncqey': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // OM_List_All_DailyReports
  {
    'h77pfxos': {
      'en': 'Search...( Area, Superviser )',
      'ar': 'بحث...(منطقة، مشرف)',
    },
    '88os7bbc': {
      'en': 'Option 1',
      'ar': 'الخيار 1',
    },
    '94ddpvqd': {
      'en': 'Section',
      'ar': 'قسم',
    },
    'r4zm4vss': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    '9r493iib': {
      'en': 'Option 1',
      'ar': 'الخيار 1',
    },
    'qr3im1dt': {
      'en': 'Shift',
      'ar': 'يحول',
    },
    'm1ukmeyq': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'ubk1boj3': {
      'en': 'Option 1',
      'ar': 'الخيار 1',
    },
    'l6m2mcjv': {
      'en': 'Day',
      'ar': 'يوم',
    },
    'dvp0hodp': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    '2ajwjt22': {
      'en': 'No: {20}',
      'ar': 'رقم: {20}',
    },
    'kivwp5rp': {
      'en': 'Pending',
      'ar': 'قيد الانتظار',
    },
    'pvc23x2m': {
      'en': '{Sv Name}',
      'ar': '{اسم سيفرت}',
    },
    'tsivqe8h': {
      'en': 'View',
      'ar': 'منظر',
    },
    'iiwc7q6e': {
      'en': '{Leader 5} | {Maadi}',
      'ar': '{القائد 5} | {المعادي}',
    },
    'vwhbade8': {
      'en': 'Morning',
      'ar': 'صباح',
    },
    'xez9cbit': {
      'en': 'Tuesday, 10:00am',
      'ar': 'الثلاثاء، الساعة 10:00 صباحاً',
    },
    '1kl3ek94': {
      'en': 'Pending',
      'ar': 'قيد الانتظار',
    },
    'd7i98dyc': {
      'en': 'Reviewed',
      'ar': 'تمت المراجعة',
    },
    'drivydv8': {
      'en': '{Sv Name}',
      'ar': '{اسم سيفرت}',
    },
    'bi2adkzr': {
      'en': '{Leader 5} | {Maadi}',
      'ar': '{القائد 5} | {المعادي}',
    },
    '3ru53683': {
      'en': 'Morning',
      'ar': 'صباح',
    },
    'vvhibo02': {
      'en': 'Tuesday, 10:00am',
      'ar': 'الثلاثاء، الساعة 10:00 صباحاً',
    },
    'u3tmk6jr': {
      'en': 'Reviewed',
      'ar': 'تمت المراجعة',
    },
    '2pgy4hc1': {
      'en': 'Export PDF',
      'ar': 'تصدير قوات الدفاع الشعبي',
    },
    '7kaf3fya': {
      'en': 'Bookmarked',
      'ar': 'إشارة مرجعية',
    },
    '4d8nhbzu': {
      'en': '{Sv Name}',
      'ar': '{اسم سيفرت}',
    },
    '5qsiz68q': {
      'en': 'View',
      'ar': 'منظر',
    },
    'p4s6vu09': {
      'en': '{Leader 5} | {Maadi}',
      'ar': '{القائد 5} | {المعادي}',
    },
    '2gd41x3u': {
      'en': 'Morning',
      'ar': 'صباح',
    },
    '0c1sw764': {
      'en': 'Tuesday, 10:00am',
      'ar': 'الثلاثاء، الساعة 10:00 صباحاً',
    },
    'yd7kp1af': {
      'en': '{Same}',
      'ar': '{نفس}',
    },
    'ljg36vbs': {
      'en': 'Export PDF',
      'ar': 'تصدير قوات الدفاع الشعبي',
    },
    'ar4l1nyp': {
      'en': 'Daily Reports',
      'ar': 'التقارير اليومية',
    },
    'klkjt0dc': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // OM_View_DailyReport
  {
    '0ick0l9p': {
      'en': '{Sv Name}',
      'ar': '{اسم سيفرت}',
    },
    'ljofvq99': {
      'en': '{Leader 5} | {Maadi}',
      'ar': '{القائد 5} | {المعادي}',
    },
    'uxpi34bq': {
      'en': '#Id',
      'ar': '#بطاقة تعريف',
    },
    '6jt8i1gt': {
      'en': 'Morning',
      'ar': 'صباح',
    },
    'nc2yt7lh': {
      'en': '02/03/2034',
      'ar': '02/03/2034',
    },
    'rc1c13xy': {
      'en': '|',
      'ar': '|',
    },
    'xhg2rgg6': {
      'en': '10:00am',
      'ar': '10:00 ص',
    },
    'zd47gx1p': {
      'en': 'Daily report on the state of general cleanliness of the area',
      'ar': 'تقرير يومي عن حالة النظافة العامة بالمنطقة',
    },
    'kuhd12md': {
      'en': 'Sweep Condition',
      'ar': 'حالة الاجتياح',
    },
    'dsi3qytv': {
      'en':
          'When writing the general condition of manual street sweeping, it means the main and internal streets of the sector',
      'ar':
          'عند كتابة الحالة العامة للكنسة اليدوية للشوارع يقصد بها الشوارع الرئيسية والداخلية للقطاع',
    },
    '8lvx69s1': {
      'en': 'Sweep Condition',
      'ar': 'حالة الاجتياح',
    },
    '0ixxdui8': {
      'en': 'Dust Stripping Condition',
      'ar': 'حالة تجريد الغبار',
    },
    'opr65dye': {
      'en':
          'When writing the general status of the abstraction, it includes what has been done and what has not been done, with a periodic plan to get rid of dust in the sector.',
      'ar':
          'عند كتابة الوضع العام للتجريد يتضمن ما تم وما لم يتم مع خطة دورية للتخلص من الغبار الموجود بالقطاع.',
    },
    'qwbp3da5': {
      'en': 'Dust Stripping Condition',
      'ar': 'حالة تجريد الغبار',
    },
    'lyevgs35': {
      'en': 'Waste Removal Condition',
      'ar': 'حالة إزالة النفايات',
    },
    'oo9gkxnz': {
      'en':
          'When writing the general status of waste removal, what has been removed, what has been transferred to the next shift, and what has not been removed yet are written.',
      'ar':
          'عند كتابة الوضع العام لإزالة النفايات يتم كتابة ما تم إزالته وما تم نقله إلى الوردية التالية وما لم تتم إزالته بعد.',
    },
    '4c0arz85': {
      'en': 'Waste Removal Condition',
      'ar': 'حالة إزالة النفايات',
    },
    'nj4k25or': {
      'en': 'Section Needs',
      'ar': 'احتياجات القسم',
    },
    'uu9fij0u': {
      'en':
          'When writing the general situation of the sector’s needs, the necessary measures are taken from several needs specific to the worker, uniform, etc',
      'ar':
          'عند كتابة الوضع العام لاحتياجات القطاع يتم اتخاذ الإجراءات اللازمة من عدة احتياجات خاصة بالعامل والزي وغيره',
    },
    'fu7qsrhp': {
      'en': 'Section Needs',
      'ar': 'احتياجات القسم',
    },
    'pvbwtq5b': {
      'en': 'A State of increased hostility of al kinds',
      'ar': 'حالة من العداء المتزايد بجميع أنواعه',
    },
    'bszdyls4': {
      'en':
          'When writing the general condition for increasing equipment, all types of equipment are included (Buck - car: 4 tons - 2 tons, car 44 rescue transport',
      'ar':
          'عند كتابة الشرط العام لزيادة المعدات يتم تضمين جميع أنواع المعدات (باك - سيارة: 4 طن - 2 طن، سيارة 44 نقل إنقاذ',
    },
    'aygh182n': {
      'en': 'A State of increased hostility of al kinds',
      'ar': 'حالة من العداء المتزايد بجميع أنواعه',
    },
    'ci03wnx1': {
      'en': 'Reviewed',
      'ar': 'تمت المراجعة',
    },
    '6sjgtzc4': {
      'en': 'Daily Report',
      'ar': 'تقرير يومي',
    },
    'auq7mmv5': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // OM_List_Personal_orders
  {
    '3pyjm9v7': {
      'en': 'Search listings...',
      'ar': 'قوائم البحث...',
    },
    'c9cnf1sx': {
      'en': 'Option 1',
      'ar': 'الخيار 1',
    },
    '2niulqcd': {
      'en': 'Section',
      'ar': 'قسم',
    },
    'dlkddwat': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'jryx84eo': {
      'en': 'Option 1',
      'ar': 'الخيار 1',
    },
    'posr2jg8': {
      'en': 'Shift',
      'ar': 'يحول',
    },
    '6uh6fr2k': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'shc342rt': {
      'en': 'Option 1',
      'ar': 'الخيار 1',
    },
    '60gzn5te': {
      'en': 'Day',
      'ar': 'يوم',
    },
    'm2u4l3gj': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'y32k72pd': {
      'en': 'No: {20}',
      'ar': 'رقم: {20}',
    },
    'gn0oi1xu': {
      'en': 'Pending',
      'ar': 'قيد الانتظار',
    },
    'if86mne7': {
      'en': '{Sv Name}',
      'ar': '{اسم سيفرت}',
    },
    'v4potjhw': {
      'en': 'View',
      'ar': 'منظر',
    },
    'p3t9v15c': {
      'en': '{Leader 5} | {Maadi}',
      'ar': '{القائد 5} | {المعادي}',
    },
    's3a6hm9j': {
      'en': '{Details}',
      'ar': '{تفاصيل}',
    },
    '6on597te': {
      'en': 'Tuesday, 10:00am',
      'ar': 'الثلاثاء، الساعة 10:00 صباحاً',
    },
    'mmczymsb': {
      'en': 'In Progress',
      'ar': 'في تَقَدم',
    },
    'elowf8o9': {
      'en': 'Accepted',
      'ar': 'قبلت',
    },
    'gb1k3krd': {
      'en': '{Sv Name}',
      'ar': '{اسم سيفرت}',
    },
    'nxo05ekm': {
      'en': '{Leader 5} | {Maadi}',
      'ar': '{القائد 5} | {المعادي}',
    },
    '7qvwynuq': {
      'en': 'Create template screen for task todo app.',
      'ar': 'إنشاء شاشة قالب لتطبيق المهام الواجبة.',
    },
    '3zk1bhtg': {
      'en': 'Tuesday, 10:00am',
      'ar': 'الثلاثاء، الساعة 10:00 صباحاً',
    },
    'gf3o86dd': {
      'en': 'Accepted',
      'ar': 'قبلت',
    },
    'fhes0uf1': {
      'en': 'Export PDF',
      'ar': 'تصدير قوات الدفاع الشعبي',
    },
    'z05oayk1': {
      'en': 'Report on errands and motorcycle movement',
      'ar': 'تقرير عن المهمات وحركة الدراجات النارية',
    },
    '31wysmtk': {
      'en': 'Rejected',
      'ar': 'مرفوض',
    },
    'qiiege9a': {
      'en': '{Sv Name}',
      'ar': '{اسم سيفرت}',
    },
    'st1venbe': {
      'en': '{Leader 5} | {Maadi}',
      'ar': '{القائد 5} | {المعادي}',
    },
    'yf74y2g6': {
      'en': 'Create template screen for task todo app.',
      'ar': 'إنشاء شاشة قالب لتطبيق المهام الواجبة.',
    },
    'uxdtge3o': {
      'en': 'Tuesday, 10:00am',
      'ar': 'الثلاثاء، الساعة 10:00 صباحاً',
    },
    '7phucli6': {
      'en': 'Rejected',
      'ar': 'مرفوض',
    },
    'qyiq2vvp': {
      'en': 'Export PDF',
      'ar': 'تصدير قوات الدفاع الشعبي',
    },
    'y9xmv3kc': {
      'en': 'Report on errands and motorcycle movement',
      'ar': 'تقرير عن المهمات وحركة الدراجات النارية',
    },
    '1zbz8vgt': {
      'en': 'Personal orders',
      'ar': 'الطلبات الشخصية',
    },
    '1bhzo8l4': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
    },
  },
  // OM_Personal_Orders_discription
  {
    '8hqjfbid': {
      'en': '{Sv Name}',
      'ar': '{اسم سيفرت}',
    },
    'jmgcu539': {
      'en': '{Leader 5} | {Maadi}',
      'ar': '{القائد 5} | {المعادي}',
    },
    '3gbdwsth': {
      'en': '#ID',
      'ar': '#بطاقة تعريف',
    },
    'd9b4kcdc': {
      'en': 'Due',
      'ar': 'حق',
    },
    'fbbvnjue': {
      'en': 'In Progress',
      'ar': 'في تَقَدم',
    },
    'xaa86oda': {
      'en': 'Tuesday, 10:00am',
      'ar': 'الثلاثاء، الساعة 10:00 صباحاً',
    },
    'pt5vk3qk': {
      'en': 'Details',
      'ar': 'تفاصيل',
    },
    'u36b6api': {
      'en': 'kind of order',
      'ar': 'نوع من النظام',
    },
    '6w9au7ir': {
      'en': '{if its a car then it shows the kind of it}',
      'ar': '{إذا كانت سيارة فهذا يدل على نوعها}',
    },
    '4wav1rak': {
      'en': 'Discription',
      'ar': 'وصف',
    },
    'ab6utm8s': {
      'en':
          'hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhcompanyname.co',
      'ar':
          'ههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههههه اسم الشركة.',
    },
    'zgb6ct8t': {
      'en': 'Response',
      'ar': 'إجابة',
    },
    'fe2quupx': {
      'en': 'Comment',
      'ar': 'تعليق',
    },
    '228q2t6q': {
      'en': 'Accept',
      'ar': 'يقبل',
    },
    'zbm7v37m': {
      'en': 'Reject',
      'ar': 'يرفض',
    },
    'azltb24c': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // OM_View_Distribution_of_workers
  {
    'sn09xza2': {
      'en': '{Sv Name}',
      'ar': '{اسم سيفرت}',
    },
    'ovb415br': {
      'en': '{Leader 5} | {Maadi}',
      'ar': '{القائد 5} | {المعادي}',
    },
    'yt16iv6g': {
      'en': '#Id',
      'ar': '#بطاقة تعريف',
    },
    'q4v9cuuv': {
      'en': 'Morning',
      'ar': 'صباح',
    },
    'es6na973': {
      'en': '02/03/2034',
      'ar': '02/03/2034',
    },
    'qoac8x3d': {
      'en': '|',
      'ar': '|',
    },
    '3808okvm': {
      'en': '10:00am',
      'ar': '10:00 ص',
    },
    '1vb3vwga': {
      'en':
          'Report the distribution of workers today as the supervisor deems appropriate',
      'ar': 'تقرير توزيع العمال اليوم حسب ما يراه المشرف مناسبا',
    },
    'o53xkmrb': {
      'en': 'Today\'s Workers List',
      'ar': 'قائمة العمال اليوم',
    },
    'iktvp5hm': {
      'en': 'Distribution of workers',
      'ar': 'توزيع العمال',
    },
    'pxzvb0bz': {
      'en': '{Street Name}',
      'ar': '{اسم الشارع}',
    },
    'bd7kuxsp': {
      'en': 'Need : {5}',
      'ar': 'الحاجة : {5}',
    },
    'gpi3vvco': {
      'en': 'Randy Peterson',
      'ar': 'راندي بيترسون',
    },
    'cl6vm9wj': {
      'en': '#2008',
      'ar': '#2008',
    },
    'akt2sbsl': {
      'en': 'Car',
      'ar': 'سيارة',
    },
    '4ypb6q5l': {
      'en': 'Randy Peterson',
      'ar': 'راندي بيترسون',
    },
    'q3qx7qu5': {
      'en': '#2008',
      'ar': '#2008',
    },
    '0dv21qct': {
      'en': 'Car',
      'ar': 'سيارة',
    },
    'n29ewpng': {
      'en': 'Export to PDF',
      'ar': 'تصدير إلى PDF',
    },
    '16n01k35': {
      'en': 'Daily workers distribution',
      'ar': 'توزيع العمالة اليومية',
    },
    'w1djzvuc': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // OM_List_Distribution_of_workers
  {
    'wou81fud': {
      'en': 'Search listings...',
      'ar': 'قوائم البحث...',
    },
    '53046kf5': {
      'en': 'Option 1',
      'ar': 'الخيار 1',
    },
    '80kijiub': {
      'en': 'Section',
      'ar': 'قسم',
    },
    'u3jwwx8i': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'oklqlowq': {
      'en': 'Option 1',
      'ar': 'الخيار 1',
    },
    'rltwiq5h': {
      'en': 'Shift',
      'ar': 'يحول',
    },
    'vysg4xh7': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    '3ylv3r3f': {
      'en': 'Option 1',
      'ar': 'الخيار 1',
    },
    '01o2cdjn': {
      'en': 'Day',
      'ar': 'يوم',
    },
    'vht27tb3': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر...',
    },
    'fzhlapt3': {
      'en': 'No: {20}',
      'ar': 'رقم: {20}',
    },
    '5gcbv6f6': {
      'en': 'Add New',
      'ar': 'اضف جديد',
    },
    'tlkoomiq': {
      'en': 'Superviser',
      'ar': 'المشرف',
    },
    'avh5dk8e': {
      'en': 'Date',
      'ar': 'تاريخ',
    },
    'e366zd6l': {
      'en': 'Area',
      'ar': 'منطقة',
    },
    'mghhun5x': {
      'en': 'PDF',
      'ar': 'بي دي إف',
    },
    'g72aj8b9': {
      'en': 'Randy Peterson',
      'ar': 'راندي بيترسون',
    },
    'ag1k9abe': {
      'en': '#2008',
      'ar': '#2008',
    },
    'a2a77mea': {
      'en': 'Fri. Aug 11th',
      'ar': 'الجمعة. 11 أغسطس',
    },
    '4phjwu2i': {
      'en': '{Leader 5} | {Maadi}',
      'ar': '{القائد 5} | {المعادي}',
    },
    'fabwz36z': {
      'en': 'Attendance',
      'ar': 'حضور',
    },
    '7y0b6w4l': {
      'en': '•',
      'ar': '•',
    },
  },
  // New_Admin_Home
  {
    'aeb6a19x': {
      'en': 'Hello,',
      'ar': 'مرحبًا،',
    },
    'aotwrjjy': {
      'en': 'Morning',
      'ar': 'الصباحية',
    },
    'wkkk8ft9': {
      'en': 'Workers',
      'ar': 'عمال',
    },
    '8qx5jwvo': {
      'en': '32.2%',
      'ar': '32.2%',
    },
    'ddwkr8dj': {
      'en': '480 ',
      'ar': '480',
    },
    's4efbgc6': {
      'en': '/ 500',
      'ar': '/ 500',
    },
    'xja84gyo': {
      'en': 'Supervisers',
      'ar': 'مشرفين',
    },
    'l49ifndf': {
      'en': '32.2%',
      'ar': '32.2%',
    },
    '8eo6nck1': {
      'en': '18 ',
      'ar': '18',
    },
    'v577zxe3': {
      'en': '/ 20',
      'ar': '/ 20',
    },
    'qgpxp6g1': {
      'en': 'Maadi',
      'ar': 'المعادي',
    },
    'u4hb9j50': {
      'en': '32.2%',
      'ar': '32.2%',
    },
    'wa3o1dr8': {
      'en': '50 ',
      'ar': '50',
    },
    'hdj497hn': {
      'en': '/ 150',
      'ar': '/ 150',
    },
    '07oqbimi': {
      'en': '9 ',
      'ar': '9',
    },
    'frgk5x56': {
      'en': '/ 10',
      'ar': '/ 10',
    },
    '0sg7savz': {
      'en': 'Workers',
      'ar': 'عمال',
    },
    'xu3g00bt': {
      'en': 'Superviser',
      'ar': 'المشرف',
    },
    '0po66fyb': {
      'en': 'Basatin',
      'ar': 'البساتين',
    },
    'lv77xpci': {
      'en': '32.2%',
      'ar': '32.2%',
    },
    'gt9lm9se': {
      'en': '50 ',
      'ar': '50',
    },
    'x8jvtcpf': {
      'en': '/ 150',
      'ar': '/ 150',
    },
    '27u5ora6': {
      'en': '9 ',
      'ar': '9',
    },
    'y9960k29': {
      'en': '/ 10',
      'ar': '/ 10',
    },
    'p999euss': {
      'en': 'Workers',
      'ar': 'عمال',
    },
    'y8dxbqg9': {
      'en': 'Superviser',
      'ar': 'المشرف',
    },
    'dcm56qb9': {
      'en': 'Marag',
      'ar': 'معراج',
    },
    'wl81xceq': {
      'en': '32.2%',
      'ar': '32.2%',
    },
    'syqtp6qj': {
      'en': '50 ',
      'ar': '50',
    },
    'bgmxjyga': {
      'en': '/ 150',
      'ar': '/ 150',
    },
    '7k18v4hl': {
      'en': '9 ',
      'ar': '9',
    },
    '1s3hzmsp': {
      'en': '/ 10',
      'ar': '/ 10',
    },
    'sypg90bo': {
      'en': 'Workers',
      'ar': 'عمال',
    },
    '97szef21': {
      'en': 'Superviser',
      'ar': 'المشرف',
    },
    'bfzmz7dj': {
      'en': 'Daily Goal',
      'ar': 'الهدف اليومي',
    },
    'si1tb3dd': {
      'en': '62.2% /',
      'ar': '62.2% /',
    },
    'hze5ec9l': {
      'en': ' 12',
      'ar': '12',
    },
    'istpshqf': {
      'en': '',
      'ar': '',
    },
    'b0uz0149': {
      'en': 'Achieved goals: ',
      'ar': 'الأهداف المحققة:',
    },
    'fmty2tht': {
      'en': '3',
      'ar': '3',
    },
    'ni8wrqpv': {
      'en': 'All',
      'ar': 'الجميع',
    },
    '79rv4ltx': {
      'en': 'Work Area',
      'ar': 'منطقة العمل',
    },
    'rz8il05a': {
      'en': 'General information about the area.',
      'ar': 'معلومات عامة عن المنطقة.',
    },
    'nu9se8pd': {
      'en': 'Tasks',
      'ar': 'المهام',
    },
    'n5x3yqrr': {
      'en': 'Supervisers',
      'ar': 'المشرفين',
    },
    'yf16dqz4': {
      'en': 'Notifications',
      'ar': 'الإشعارات',
    },
    'mzucrge1': {
      'en': 'personal order',
      'ar': 'طلب  شخصي',
    },
    'v5fcg4lc': {
      'en': '1',
      'ar': '1',
    },
    '6bor7at3': {
      'en': 'Supervisers order',
      'ar': 'طلبات  المشرفين',
    },
    'brumpway': {
      'en': '1',
      'ar': '1',
    },
    '49btmwhv': {
      'en': 'complans',
      'ar': 'الشكاوي',
    },
    'pwzx29iy': {
      'en': '1',
      'ar': '1',
    },
    'wn1hdu9b': {
      'en': 'Other services',
      'ar': 'خدمات أخري',
    },
    'oydiv5y3': {
      'en': 'personal request',
      'ar': 'طلب شخصي',
    },
    '58wkvysr': {
      'en': 'Reports',
      'ar': 'التقارير',
    },
    'vozr66m3': {
      'en': 'Atindanse',
      'ar': 'الحضور',
    },
    '520wek0l': {
      'en': 'Map',
      'ar': 'الخريطة',
    },
    'hj9igy6o': {
      'en': 'personal request',
      'ar': 'طلب شخصي',
    },
    'lthsq1bv': {
      'en': 'daily report',
      'ar': 'التقرير اليومي',
    },
    'usv6033p': {
      'en': 'Users',
      'ar': 'الموظفين',
    },
    'nzusb4ds': {
      'en': 'Reviwes',
      'ar': 'المراجعات',
    },
    'xar4rr1c': {
      'en': 'personal request',
      'ar': 'طلب شخصي',
    },
    'lcy9rhm4': {
      'en': 'daily report',
      'ar': 'التقرير اليومي',
    },
    'um7peax7': {
      'en': 'Add User',
      'ar': 'إضافة مستخدم',
    },
    'xmurgibw': {
      'en': 'Reviwes',
      'ar': 'المراجعات',
    },
    'jc8rgf32': {
      'en': 'Activity',
      'ar': 'نشاط',
    },
    '7r0kx66z': {
      'en': 'Recent completed tasks from your team.',
      'ar': 'المهام المكتملة الأخيرة من فريقك.',
    },
    'eiv6spbk': {
      'en': 'Rudy Fernandez',
      'ar': 'رودي فرنانديز',
    },
    'g1xze9ad': {
      'en': '4m ago',
      'ar': 'منذ 4 م',
    },
    'tam7m1yt': {
      'en': 'Completed ',
      'ar': 'مكتمل',
    },
    'uh8dvx34': {
      'en': 'Marketing Plan',
      'ar': 'خطة التسويق',
    },
    'xemfx6en': {
      'en': 'Rudy Fernandez',
      'ar': 'رودي فرنانديز',
    },
    '9i9zizba': {
      'en': '4m ago',
      'ar': 'منذ 4 د',
    },
    'fko3rdln': {
      'en': 'Started ',
      'ar': 'بدأت',
    },
    'pcncz614': {
      'en': 'Marketing Plan',
      'ar': 'خطة التسويق',
    },
    'r8v0xe01': {
      'en': 'Abigail Rojas',
      'ar': 'أبيجيل روخاس',
    },
    'l0ct0am5': {
      'en': '4m ago',
      'ar': 'منذ 4 د',
    },
    'q6vzb957': {
      'en': 'Assigned  ',
      'ar': 'مُكَلَّف',
    },
    'azsnpied': {
      'en': 'Rudy Fernandez ',
      'ar': 'رودي فرنانديز',
    },
    '43lzuj3d': {
      'en': 'to ',
      'ar': 'ل',
    },
    '2d5b817w': {
      'en': 'Marketing Plan',
      'ar': 'خطة التسويق',
    },
    'rsfvt24o': {
      'en': 'Abigail Rojas',
      'ar': 'أبيجيل روخاس',
    },
    '4q23zsao': {
      'en': '4m ago',
      'ar': 'منذ 4 م',
    },
    '82wq3b4l': {
      'en': 'Created a project: ',
      'ar': 'تم إنشاء مشروع:',
    },
    'j8tb8vnp': {
      'en': 'Marketing Plan',
      'ar': 'خطة التسويق',
    },
    'yeh64kel': {
      'en': 'Liz Ambridge',
      'ar': 'ليز أمبريدج',
    },
    'yduyg8fz': {
      'en': '4m ago',
      'ar': 'منذ 4 د',
    },
    'oytigx7n': {
      'en': 'Sent a plan update for ',
      'ar': 'تم إرسال تحديث الخطة لـ',
    },
    'rpr4f5j0': {
      'en': 'Marketing Plan',
      'ar': 'خطة التسويق',
    },
    '2va90xlc': {
      'en': 'Project Started',
      'ar': 'بدأ المشروع',
    },
    'e8f80cx4': {
      'en': '12d ago',
      'ar': 'منذ 12 يومًا',
    },
    '215zr9ys': {
      'en': 'Powerd by Omar-s Team',
      'ar': 'بدعم من فريق عمر',
    },
    'kp5k9298': {
      'en': 'Al Rahma',
      'ar': 'الرحمة',
    },
    'zs64f60l': {
      'en': 'Fieldwork management',
      'ar': 'إدارة العمل الميداني',
    },
    'e568eps0': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // Home07Invoices
  {
    '7qmrudjq': {
      'en': 'All Reports',
      'ar': '',
    },
    '2eyqs2wz': {
      'en': 'تقرير النظافة اليومي',
      'ar': '',
    },
    'j9ih9azi': {
      'en': 'تقرير النظافة اليومي',
      'ar': '',
    },
    'icyhcgg5': {
      'en': 'تقرير النظافة اليومي',
      'ar': '',
    },
    'v1th004f': {
      'en': 'تقرير النظافة اليومي',
      'ar': '',
    },
    '1qu6dv7u': {
      'en': 'Reports',
      'ar': '',
    },
    'r6473g5y': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Manualattendance
  {
    'm1relfha': {
      'en': 'Search listings...',
      'ar': 'قوائم البحث...',
    },
    '8mtd5euj': {
      'en': 'No: {20}',
      'ar': 'رقم: {20}',
    },
    'whtbf36g': {
      'en': '#ID',
      'ar': '',
    },
    'tgs80qt7': {
      'en': 'Attend',
      'ar': 'حضور',
    },
    'hxinyg3z': {
      'en': 'Inspector Name',
      'ar': '',
    },
    '9lkve9zo': {
      'en': 'Title',
      'ar': '',
    },
    '344a4omh': {
      'en': 'Inspector Name',
      'ar': '',
    },
    'zl7k69xi': {
      'en': 'Title',
      'ar': '',
    },
    'fuyt1sww': {
      'en': 'Users',
      'ar': '',
    },
    'a7v37y1t': {
      'en': '•',
      'ar': '•',
    },
  },
  // LocationPicker
  {
    'h2kskk0t': {
      'en': 'Home',
      'ar': 'الصفحة الرئيسية',
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
      'ar': 'الحالة الاجتماعية',
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
      'ar': 'راندي بيترسون',
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
      'ar': 'راندي بيترسون',
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
      'ar': 'تمت إضافة المستخدم بنجاح!',
    },
    'vb3djp9l': {
      'en': 'Here is the login information for the new user',
      'ar': 'هنا معلومات تسجيل الدخول للمستخدم الجديد',
    },
    '2d6rteh9': {
      'en': 'Name',
      'ar': 'الأسم',
    },
    'kek8hvp1': {
      'en': 'ID',
      'ar': 'رقم التعريف',
    },
    'oo6c6yqb': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
    },
    'n99t9dfx': {
      'en': 'Password',
      'ar': 'كلمة المرور',
    },
    'elbqyng2': {
      'en': 'Done',
      'ar': 'تم',
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
      'ar': 'الصفحة الشخصية',
    },
    'kakzwltv': {
      'en': 'Back To Home',
      'ar': 'الصفحة الرئيسية',
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
  // Button
  {
    'i9x1onxn': {
      'en': 'Done',
      'ar': 'الانهاء',
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
