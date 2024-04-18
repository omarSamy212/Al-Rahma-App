import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'update_user_widget.dart' show UpdateUserWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';

class UpdateUserModel extends FlutterFlowModel<UpdateUserWidget> {
  ///  Local state fields for this page.

  String userID = '0000';

  String email = '';

  DocumentReference? contractorRef;

  int? age = 0;

  bool isNext = true;

  bool isError = true;

  bool isDriver = true;

  ///  State fields for stateful widgets in this page.

  final formKey7 = GlobalKey<FormState>();
  final formKey9 = GlobalKey<FormState>();
  final formKey6 = GlobalKey<FormState>();
  final formKey11 = GlobalKey<FormState>();
  final formKey12 = GlobalKey<FormState>();
  final formKey8 = GlobalKey<FormState>();
  final formKey13 = GlobalKey<FormState>();
  final formKey4 = GlobalKey<FormState>();
  final formKey10 = GlobalKey<FormState>();
  final formKey5 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // State field(s) for firstName widget.
  FocusNode? firstNameFocusNode;
  TextEditingController? firstNameTextController;
  String? Function(BuildContext, String?)? firstNameTextControllerValidator;
  String? _firstNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'enfyho2b' /* Field is required */,
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
        'tzhb6rj4' /* Field is required */,
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
        'avc5ehen' /* Field is required */,
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
        'pngdvivk' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for religion widget.
  String? religionValue;
  FormFieldController<String>? religionValueController;
  // State field(s) for gender widget.
  String? genderValue;
  FormFieldController<String>? genderValueController;
  // State field(s) for maritalStatus widget.
  String? maritalStatusValue;
  FormFieldController<String>? maritalStatusValueController;
  // State field(s) for country widget.
  String? countryValue;
  FormFieldController<String>? countryValueController;
  // State field(s) for nationalID widget.
  FocusNode? nationalIDFocusNode;
  TextEditingController? nationalIDTextController;
  String? Function(BuildContext, String?)? nationalIDTextControllerValidator;
  String? _nationalIDTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'wa1ynn8k' /* Field is required */,
      );
    }

    if (val.length < 14) {
      return 'Requires at least 14 characters.';
    }

    return null;
  }

  // State field(s) for Birthdate widget.
  FocusNode? birthdateFocusNode;
  TextEditingController? birthdateTextController;
  final birthdateMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? birthdateTextControllerValidator;
  String? _birthdateTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ixl2pk2j' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for Age widget.
  FocusNode? ageFocusNode1;
  TextEditingController? ageTextController1;
  String? Function(BuildContext, String?)? ageTextController1Validator;
  String? _ageTextController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'opi0uzff' /* Field is required */,
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
        'ohp4cx1x' /* Field is required */,
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
        'sp9k95fb' /* Field is required */,
      );
    }

    return null;
  }

  DateTime? datePicked1;
  // State field(s) for expiryDate widget.
  FocusNode? expiryDateFocusNode;
  TextEditingController? expiryDateTextController;
  String? Function(BuildContext, String?)? expiryDateTextControllerValidator;
  String? _expiryDateTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'gwck1nvk' /* Field is required */,
      );
    }

    return null;
  }

  DateTime? datePicked2;
  // State field(s) for nationality widget.
  FocusNode? nationalityFocusNode;
  TextEditingController? nationalityTextController;
  String? Function(BuildContext, String?)? nationalityTextControllerValidator;
  String? _nationalityTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'hnkgms9m' /* Field is required */,
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
        'dlh4j6fx' /* Field is required */,
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
        'ghahtwl6' /* Field is required */,
      );
    }

    return null;
  }

  DateTime? datePicked3;
  // State field(s) for Age widget.
  FocusNode? ageFocusNode2;
  TextEditingController? ageTextController2;
  String? Function(BuildContext, String?)? ageTextController2Validator;
  String? _ageTextController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '14qepzq2' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for passportPlaceOfIssue widget.
  FocusNode? passportPlaceOfIssueFocusNode;
  TextEditingController? passportPlaceOfIssueTextController;
  String? Function(BuildContext, String?)?
      passportPlaceOfIssueTextControllerValidator;
  String? _passportPlaceOfIssueTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'lozh12lu' /* Field is required */,
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
        '0ljutgzs' /* Field is required */,
      );
    }

    return null;
  }

  DateTime? datePicked4;
  // State field(s) for passportExpDate widget.
  FocusNode? passportExpDateFocusNode;
  TextEditingController? passportExpDateTextController;
  String? Function(BuildContext, String?)?
      passportExpDateTextControllerValidator;
  String? _passportExpDateTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ii8sufu6' /* Field is required */,
      );
    }

    return null;
  }

  DateTime? datePicked5;
  // State field(s) for government widget.
  FocusNode? governmentFocusNode;
  TextEditingController? governmentTextController;
  String? Function(BuildContext, String?)? governmentTextControllerValidator;
  String? _governmentTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'w7zsdmbv' /* Field is required */,
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
        'cauc26jv' /* Field is required */,
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
        'k70pcnn3' /* Field is required */,
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
        'f8gdqhod' /* Field is required */,
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
        '9c5lzbik' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for isEmployeed widget.
  String? isEmployeedValue;
  FormFieldController<String>? isEmployeedValueController;
  // State field(s) for userRole widget.
  String? userRoleValue;
  FormFieldController<String>? userRoleValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in userRole widget.
  RolesRecord? userRoleOutput;
  // State field(s) for contractor widget.
  String? contractorValue;
  FormFieldController<String>? contractorValueController;
  // Stores action output result for [Custom Action - contractorPathStringToref] action in contractor widget.
  DocumentReference? contRef;
  // Stores action output result for [Backend Call - Read Document] action in contractor widget.
  ContractorsRecord? contDoc;
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

  // State field(s) for OtherStartingShift widget.
  String? otherStartingShiftValue;
  FormFieldController<String>? otherStartingShiftValueController;
  // State field(s) for otherShiftPeriod widget.
  String? otherShiftPeriodValue;
  FormFieldController<String>? otherShiftPeriodValueController;
  // State field(s) for workerStartingShift widget.
  String? workerStartingShiftValue;
  FormFieldController<String>? workerStartingShiftValueController;
  // State field(s) for workerShiftPeriod widget.
  String? workerShiftPeriodValue;
  FormFieldController<String>? workerShiftPeriodValueController;
  // State field(s) for isDriver widget.
  String? isDriverValue;
  FormFieldController<String>? isDriverValueController;
  // State field(s) for drivingLicType widget.
  String? drivingLicTypeValue;
  FormFieldController<String>? drivingLicTypeValueController;
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
  DateTime? datePicked6;
  // State field(s) for drivLicExpiryDate widget.
  FocusNode? drivLicExpiryDateFocusNode;
  TextEditingController? drivLicExpiryDateTextController;
  String? Function(BuildContext, String?)?
      drivLicExpiryDateTextControllerValidator;
  DateTime? datePicked7;
  // State field(s) for Sv_workArea widget.
  String? svWorkAreaValue;
  FormFieldController<String>? svWorkAreaValueController;
  // State field(s) for roleCode widget.
  String? roleCodeValue;
  FormFieldController<String>? roleCodeValueController;
  // State field(s) for employmentDate widget.
  FocusNode? employmentDateFocusNode;
  TextEditingController? employmentDateTextController;
  String? Function(BuildContext, String?)?
      employmentDateTextControllerValidator;
  DateTime? datePicked8;
  // State field(s) for numOfWorkers widget.
  FocusNode? numOfWorkersFocusNode;
  TextEditingController? numOfWorkersTextController;
  String? Function(BuildContext, String?)? numOfWorkersTextControllerValidator;
  // State field(s) for ShiftPrice widget.
  FocusNode? shiftPriceFocusNode;
  TextEditingController? shiftPriceTextController;
  String? Function(BuildContext, String?)? shiftPriceTextControllerValidator;
  // State field(s) for diflict widget.
  FocusNode? diflictFocusNode;
  TextEditingController? diflictTextController;
  String? Function(BuildContext, String?)? diflictTextControllerValidator;
  String? _diflictTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'qmqs7lc9' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for contractDate widget.
  FocusNode? contractDateFocusNode;
  TextEditingController? contractDateTextController;
  String? Function(BuildContext, String?)? contractDateTextControllerValidator;
  DateTime? datePicked9;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  bool isDataUploading3 = false;
  FFUploadedFile uploadedLocalFile3 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl3 = '';

  bool isDataUploading4 = false;
  FFUploadedFile uploadedLocalFile4 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl4 = '';

  bool isDataUploading5 = false;
  FFUploadedFile uploadedLocalFile5 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl5 = '';

  bool isDataUploading6 = false;
  FFUploadedFile uploadedLocalFile6 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl6 = '';

  @override
  void initState(BuildContext context) {
    firstNameTextControllerValidator = _firstNameTextControllerValidator;
    middleNameTextControllerValidator = _middleNameTextControllerValidator;
    lastNameTextControllerValidator = _lastNameTextControllerValidator;
    nickNameTextControllerValidator = _nickNameTextControllerValidator;
    nationalIDTextControllerValidator = _nationalIDTextControllerValidator;
    birthdateTextControllerValidator = _birthdateTextControllerValidator;
    ageTextController1Validator = _ageTextController1Validator;
    natPlaceOfIssueTextControllerValidator =
        _natPlaceOfIssueTextControllerValidator;
    natIDDateTextControllerValidator = _natIDDateTextControllerValidator;
    expiryDateTextControllerValidator = _expiryDateTextControllerValidator;
    nationalityTextControllerValidator = _nationalityTextControllerValidator;
    passportNoTextControllerValidator = _passportNoTextControllerValidator;
    passportBirthdateTextControllerValidator =
        _passportBirthdateTextControllerValidator;
    ageTextController2Validator = _ageTextController2Validator;
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
    diflictTextControllerValidator = _diflictTextControllerValidator;
  }

  @override
  void dispose() {
    firstNameFocusNode?.dispose();
    firstNameTextController?.dispose();

    middleNameFocusNode?.dispose();
    middleNameTextController?.dispose();

    lastNameFocusNode?.dispose();
    lastNameTextController?.dispose();

    nickNameFocusNode?.dispose();
    nickNameTextController?.dispose();

    nationalIDFocusNode?.dispose();
    nationalIDTextController?.dispose();

    birthdateFocusNode?.dispose();
    birthdateTextController?.dispose();

    ageFocusNode1?.dispose();
    ageTextController1?.dispose();

    natPlaceOfIssueFocusNode?.dispose();
    natPlaceOfIssueTextController?.dispose();

    natIDDateFocusNode?.dispose();
    natIDDateTextController?.dispose();

    expiryDateFocusNode?.dispose();
    expiryDateTextController?.dispose();

    nationalityFocusNode?.dispose();
    nationalityTextController?.dispose();

    passportNoFocusNode?.dispose();
    passportNoTextController?.dispose();

    passportBirthdateFocusNode?.dispose();
    passportBirthdateTextController?.dispose();

    ageFocusNode2?.dispose();
    ageTextController2?.dispose();

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

    contIDFocusNode?.dispose();
    contIDTextController?.dispose();

    contNumOfWorkersFocusNode?.dispose();
    contNumOfWorkersTextController?.dispose();

    drivLicPlaceOfIssueFocusNode?.dispose();
    drivLicPlaceOfIssueTextController?.dispose();

    drivLicIssueDateFocusNode?.dispose();
    drivLicIssueDateTextController?.dispose();

    drivLicExpiryDateFocusNode?.dispose();
    drivLicExpiryDateTextController?.dispose();

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
