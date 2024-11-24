import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'user_profile_widget.dart' show UserProfileWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class UserProfileModel extends FlutterFlowModel<UserProfileWidget> {
  ///  Local state fields for this page.

  bool showAttend = true;

  List<ChecksRecord> checks = [];
  void addToChecks(ChecksRecord item) => checks.add(item);
  void removeFromChecks(ChecksRecord item) => checks.remove(item);
  void removeAtIndexFromChecks(int index) => checks.removeAt(index);
  void insertAtIndexInChecks(int index, ChecksRecord item) =>
      checks.insert(index, item);
  void updateChecksAtIndex(int index, Function(ChecksRecord) updateFn) =>
      checks[index] = updateFn(checks[index]);

  int counter = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey5 = GlobalKey<FormState>();
  final formKey11 = GlobalKey<FormState>();
  final formKey8 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  final formKey6 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();
  final formKey9 = GlobalKey<FormState>();
  final formKey4 = GlobalKey<FormState>();
  final formKey10 = GlobalKey<FormState>();
  final formKey7 = GlobalKey<FormState>();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for firstName widget.
  FocusNode? firstNameFocusNode;
  TextEditingController? firstNameTextController;
  String? Function(BuildContext, String?)? firstNameTextControllerValidator;
  String? _firstNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'h02dy9m3' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for middleName widget.
  FocusNode? middleNameFocusNode;
  TextEditingController? middleNameTextController;
  String? Function(BuildContext, String?)? middleNameTextControllerValidator;
  String? _middleNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'emgbqhzq' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for lastName widget.
  FocusNode? lastNameFocusNode;
  TextEditingController? lastNameTextController;
  String? Function(BuildContext, String?)? lastNameTextControllerValidator;
  String? _lastNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '6quszuut' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for nickName widget.
  FocusNode? nickNameFocusNode;
  TextEditingController? nickNameTextController;
  String? Function(BuildContext, String?)? nickNameTextControllerValidator;
  String? _nickNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'xs113aiw' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for religion widget.
  FocusNode? religionFocusNode;
  TextEditingController? religionTextController;
  String? Function(BuildContext, String?)? religionTextControllerValidator;
  // State field(s) for Gendersp widget.
  FocusNode? genderspFocusNode;
  TextEditingController? genderspTextController;
  String? Function(BuildContext, String?)? genderspTextControllerValidator;
  // State field(s) for maritialstatus widget.
  FocusNode? maritialstatusFocusNode;
  TextEditingController? maritialstatusTextController;
  String? Function(BuildContext, String?)?
      maritialstatusTextControllerValidator;
  // State field(s) for nationality widget.
  FocusNode? nationalityFocusNode1;
  TextEditingController? nationalityTextController1;
  String? Function(BuildContext, String?)? nationalityTextController1Validator;
  // State field(s) for nationalid widget.
  FocusNode? nationalidFocusNode;
  TextEditingController? nationalidTextController;
  String? Function(BuildContext, String?)? nationalidTextControllerValidator;
  // State field(s) for Birthdate widget.
  FocusNode? birthdateFocusNode;
  TextEditingController? birthdateTextController;
  final birthdateMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? birthdateTextControllerValidator;
  String? _birthdateTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'yofs1kcr' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for Age widget.
  FocusNode? ageFocusNode;
  TextEditingController? ageTextController;
  String? Function(BuildContext, String?)? ageTextControllerValidator;
  String? _ageTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ulqrenzc' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for natPlaceOfIssue widget.
  FocusNode? natPlaceOfIssueFocusNode;
  TextEditingController? natPlaceOfIssueTextController;
  String? Function(BuildContext, String?)?
      natPlaceOfIssueTextControllerValidator;
  String? _natPlaceOfIssueTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '0nzhj4zz' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for natIDDate widget.
  FocusNode? natIDDateFocusNode;
  TextEditingController? natIDDateTextController;
  final natIDDateMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? natIDDateTextControllerValidator;
  String? _natIDDateTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'tl1hsk73' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for expiryDate widget.
  FocusNode? expiryDateFocusNode;
  TextEditingController? expiryDateTextController;
  String? Function(BuildContext, String?)? expiryDateTextControllerValidator;
  String? _expiryDateTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '607thgj8' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for nationality widget.
  FocusNode? nationalityFocusNode2;
  TextEditingController? nationalityTextController2;
  String? Function(BuildContext, String?)? nationalityTextController2Validator;
  String? _nationalityTextController2Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'cswlnhig' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for passportNo widget.
  FocusNode? passportNoFocusNode;
  TextEditingController? passportNoTextController;
  String? Function(BuildContext, String?)? passportNoTextControllerValidator;
  String? _passportNoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'v3rmz8xq' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for passportBirthdate widget.
  FocusNode? passportBirthdateFocusNode;
  TextEditingController? passportBirthdateTextController;
  String? Function(BuildContext, String?)?
      passportBirthdateTextControllerValidator;
  String? _passportBirthdateTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'kglqpxlo' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for passportAge widget.
  FocusNode? passportAgeFocusNode;
  TextEditingController? passportAgeTextController;
  String? Function(BuildContext, String?)? passportAgeTextControllerValidator;
  // State field(s) for passportPlaceOfIssue widget.
  FocusNode? passportPlaceOfIssueFocusNode;
  TextEditingController? passportPlaceOfIssueTextController;
  String? Function(BuildContext, String?)?
      passportPlaceOfIssueTextControllerValidator;
  String? _passportPlaceOfIssueTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'hg7l4b7n' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for passportIssueDate widget.
  FocusNode? passportIssueDateFocusNode;
  TextEditingController? passportIssueDateTextController;
  String? Function(BuildContext, String?)?
      passportIssueDateTextControllerValidator;
  String? _passportIssueDateTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '1fw2utw0' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for passportExpDate widget.
  FocusNode? passportExpDateFocusNode;
  TextEditingController? passportExpDateTextController;
  String? Function(BuildContext, String?)?
      passportExpDateTextControllerValidator;
  String? _passportExpDateTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'b2cu114e' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for government widget.
  FocusNode? governmentFocusNode;
  TextEditingController? governmentTextController;
  String? Function(BuildContext, String?)? governmentTextControllerValidator;
  String? _governmentTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '9x88nppo' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for city widget.
  FocusNode? cityFocusNode;
  TextEditingController? cityTextController;
  String? Function(BuildContext, String?)? cityTextControllerValidator;
  String? _cityTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '3b5htmd4' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for fullAddress widget.
  FocusNode? fullAddressFocusNode;
  TextEditingController? fullAddressTextController;
  String? Function(BuildContext, String?)? fullAddressTextControllerValidator;
  String? _fullAddressTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '61lzqnwf' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for phoneNumber widget.
  FocusNode? phoneNumberFocusNode;
  TextEditingController? phoneNumberTextController;
  String? Function(BuildContext, String?)? phoneNumberTextControllerValidator;
  String? _phoneNumberTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'lhpe7emp' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for eduData widget.
  FocusNode? eduDataFocusNode;
  TextEditingController? eduDataTextController;
  String? Function(BuildContext, String?)? eduDataTextControllerValidator;
  String? _eduDataTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'vcqki3dz' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for isemp widget.
  FocusNode? isempFocusNode;
  TextEditingController? isempTextController;
  String? Function(BuildContext, String?)? isempTextControllerValidator;
  // State field(s) for role widget.
  FocusNode? roleFocusNode;
  TextEditingController? roleTextController;
  String? Function(BuildContext, String?)? roleTextControllerValidator;
  // State field(s) for contractorName widget.
  FocusNode? contractorNameFocusNode;
  TextEditingController? contractorNameTextController;
  String? Function(BuildContext, String?)?
      contractorNameTextControllerValidator;
  // State field(s) for contID widget.
  FocusNode? contIDFocusNode;
  TextEditingController? contIDTextController;
  String? Function(BuildContext, String?)? contIDTextControllerValidator;
  String? _contIDTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '5c3rujur' /* Please Select Contractor */,
      );
    }

    return null;
  }

  // State field(s) for contNumOfWorkers widget.
  FocusNode? contNumOfWorkersFocusNode;
  TextEditingController? contNumOfWorkersTextController;
  String? Function(BuildContext, String?)?
      contNumOfWorkersTextControllerValidator;
  String? _contNumOfWorkersTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '5ss6r3g1' /* Please Select Contractor */,
      );
    }

    return null;
  }

  // State field(s) for startingshift widget.
  FocusNode? startingshiftFocusNode;
  TextEditingController? startingshiftTextController;
  String? Function(BuildContext, String?)? startingshiftTextControllerValidator;
  // State field(s) for shifthours widget.
  FocusNode? shifthoursFocusNode;
  TextEditingController? shifthoursTextController;
  String? Function(BuildContext, String?)? shifthoursTextControllerValidator;
  // State field(s) for typeoflic widget.
  FocusNode? typeoflicFocusNode;
  TextEditingController? typeoflicTextController;
  String? Function(BuildContext, String?)? typeoflicTextControllerValidator;
  // State field(s) for drivLicPlaceOfIssue widget.
  FocusNode? drivLicPlaceOfIssueFocusNode;
  TextEditingController? drivLicPlaceOfIssueTextController;
  String? Function(BuildContext, String?)?
      drivLicPlaceOfIssueTextControllerValidator;
  // State field(s) for drivLicIssueDate widget.
  FocusNode? drivLicIssueDateFocusNode;
  TextEditingController? drivLicIssueDateTextController;
  String? Function(BuildContext, String?)?
      drivLicIssueDateTextControllerValidator;
  // State field(s) for drivLicExpiryDate widget.
  FocusNode? drivLicExpiryDateFocusNode;
  TextEditingController? drivLicExpiryDateTextController;
  String? Function(BuildContext, String?)?
      drivLicExpiryDateTextControllerValidator;
  // State field(s) for workingarea widget.
  FocusNode? workingareaFocusNode;
  TextEditingController? workingareaTextController;
  String? Function(BuildContext, String?)? workingareaTextControllerValidator;
  // State field(s) for code widget.
  FocusNode? codeFocusNode;
  TextEditingController? codeTextController;
  String? Function(BuildContext, String?)? codeTextControllerValidator;
  // State field(s) for employmentDate widget.
  FocusNode? employmentDateFocusNode;
  TextEditingController? employmentDateTextController;
  String? Function(BuildContext, String?)?
      employmentDateTextControllerValidator;
  // State field(s) for numOfWorkers widget.
  FocusNode? numOfWorkersFocusNode;
  TextEditingController? numOfWorkersTextController;
  String? Function(BuildContext, String?)? numOfWorkersTextControllerValidator;
  String? _numOfWorkersTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '6h5ylbrm' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for ShiftPrice widget.
  FocusNode? shiftPriceFocusNode;
  TextEditingController? shiftPriceTextController;
  String? Function(BuildContext, String?)? shiftPriceTextControllerValidator;
  String? _shiftPriceTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '5yusgnyb' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for diflict widget.
  FocusNode? diflictFocusNode;
  TextEditingController? diflictTextController;
  String? Function(BuildContext, String?)? diflictTextControllerValidator;
  String? _diflictTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'qg9i8cyf' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for contractDate widget.
  FocusNode? contractDateFocusNode;
  TextEditingController? contractDateTextController;
  String? Function(BuildContext, String?)? contractDateTextControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // State field(s) for DropDown widget.
  String? dropDownValue3;
  FormFieldController<String>? dropDownValueController3;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  AttendanceLogRecord? attendanceLog;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  ChecksRecord? checkRecord;

  @override
  void initState(BuildContext context) {
    firstNameTextControllerValidator = _firstNameTextControllerValidator;
    middleNameTextControllerValidator = _middleNameTextControllerValidator;
    lastNameTextControllerValidator = _lastNameTextControllerValidator;
    nickNameTextControllerValidator = _nickNameTextControllerValidator;
    birthdateTextControllerValidator = _birthdateTextControllerValidator;
    ageTextControllerValidator = _ageTextControllerValidator;
    natPlaceOfIssueTextControllerValidator =
        _natPlaceOfIssueTextControllerValidator;
    natIDDateTextControllerValidator = _natIDDateTextControllerValidator;
    expiryDateTextControllerValidator = _expiryDateTextControllerValidator;
    nationalityTextController2Validator = _nationalityTextController2Validator;
    passportNoTextControllerValidator = _passportNoTextControllerValidator;
    passportBirthdateTextControllerValidator =
        _passportBirthdateTextControllerValidator;
    passportPlaceOfIssueTextControllerValidator =
        _passportPlaceOfIssueTextControllerValidator;
    passportIssueDateTextControllerValidator =
        _passportIssueDateTextControllerValidator;
    passportExpDateTextControllerValidator =
        _passportExpDateTextControllerValidator;
    governmentTextControllerValidator = _governmentTextControllerValidator;
    cityTextControllerValidator = _cityTextControllerValidator;
    fullAddressTextControllerValidator = _fullAddressTextControllerValidator;
    phoneNumberTextControllerValidator = _phoneNumberTextControllerValidator;
    eduDataTextControllerValidator = _eduDataTextControllerValidator;
    contIDTextControllerValidator = _contIDTextControllerValidator;
    contNumOfWorkersTextControllerValidator =
        _contNumOfWorkersTextControllerValidator;
    numOfWorkersTextControllerValidator = _numOfWorkersTextControllerValidator;
    shiftPriceTextControllerValidator = _shiftPriceTextControllerValidator;
    diflictTextControllerValidator = _diflictTextControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    firstNameFocusNode?.dispose();
    firstNameTextController?.dispose();

    middleNameFocusNode?.dispose();
    middleNameTextController?.dispose();

    lastNameFocusNode?.dispose();
    lastNameTextController?.dispose();

    nickNameFocusNode?.dispose();
    nickNameTextController?.dispose();

    religionFocusNode?.dispose();
    religionTextController?.dispose();

    genderspFocusNode?.dispose();
    genderspTextController?.dispose();

    maritialstatusFocusNode?.dispose();
    maritialstatusTextController?.dispose();

    nationalityFocusNode1?.dispose();
    nationalityTextController1?.dispose();

    nationalidFocusNode?.dispose();
    nationalidTextController?.dispose();

    birthdateFocusNode?.dispose();
    birthdateTextController?.dispose();

    ageFocusNode?.dispose();
    ageTextController?.dispose();

    natPlaceOfIssueFocusNode?.dispose();
    natPlaceOfIssueTextController?.dispose();

    natIDDateFocusNode?.dispose();
    natIDDateTextController?.dispose();

    expiryDateFocusNode?.dispose();
    expiryDateTextController?.dispose();

    nationalityFocusNode2?.dispose();
    nationalityTextController2?.dispose();

    passportNoFocusNode?.dispose();
    passportNoTextController?.dispose();

    passportBirthdateFocusNode?.dispose();
    passportBirthdateTextController?.dispose();

    passportAgeFocusNode?.dispose();
    passportAgeTextController?.dispose();

    passportPlaceOfIssueFocusNode?.dispose();
    passportPlaceOfIssueTextController?.dispose();

    passportIssueDateFocusNode?.dispose();
    passportIssueDateTextController?.dispose();

    passportExpDateFocusNode?.dispose();
    passportExpDateTextController?.dispose();

    governmentFocusNode?.dispose();
    governmentTextController?.dispose();

    cityFocusNode?.dispose();
    cityTextController?.dispose();

    fullAddressFocusNode?.dispose();
    fullAddressTextController?.dispose();

    phoneNumberFocusNode?.dispose();
    phoneNumberTextController?.dispose();

    eduDataFocusNode?.dispose();
    eduDataTextController?.dispose();

    isempFocusNode?.dispose();
    isempTextController?.dispose();

    roleFocusNode?.dispose();
    roleTextController?.dispose();

    contractorNameFocusNode?.dispose();
    contractorNameTextController?.dispose();

    contIDFocusNode?.dispose();
    contIDTextController?.dispose();

    contNumOfWorkersFocusNode?.dispose();
    contNumOfWorkersTextController?.dispose();

    startingshiftFocusNode?.dispose();
    startingshiftTextController?.dispose();

    shifthoursFocusNode?.dispose();
    shifthoursTextController?.dispose();

    typeoflicFocusNode?.dispose();
    typeoflicTextController?.dispose();

    drivLicPlaceOfIssueFocusNode?.dispose();
    drivLicPlaceOfIssueTextController?.dispose();

    drivLicIssueDateFocusNode?.dispose();
    drivLicIssueDateTextController?.dispose();

    drivLicExpiryDateFocusNode?.dispose();
    drivLicExpiryDateTextController?.dispose();

    workingareaFocusNode?.dispose();
    workingareaTextController?.dispose();

    codeFocusNode?.dispose();
    codeTextController?.dispose();

    employmentDateFocusNode?.dispose();
    employmentDateTextController?.dispose();

    numOfWorkersFocusNode?.dispose();
    numOfWorkersTextController?.dispose();

    shiftPriceFocusNode?.dispose();
    shiftPriceTextController?.dispose();

    diflictFocusNode?.dispose();
    diflictTextController?.dispose();

    contractDateFocusNode?.dispose();
    contractDateTextController?.dispose();
  }
}
