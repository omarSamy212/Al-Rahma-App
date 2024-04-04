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
import 'create_user_widget.dart' show CreateUserWidget;
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

class CreateUserModel extends FlutterFlowModel<CreateUserWidget> {
  ///  Local state fields for this page.

  String userID = '0000';

  String email = '';

  DocumentReference? contractorRef;

  int? age = 0;

  bool isNext = true;

  ///  State fields for stateful widgets in this page.

  final formKey9 = GlobalKey<FormState>();
  final formKey7 = GlobalKey<FormState>();
  final formKey5 = GlobalKey<FormState>();
  final formKey10 = GlobalKey<FormState>();
  final formKey4 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();
  final formKey8 = GlobalKey<FormState>();
  final formKey11 = GlobalKey<FormState>();
  final formKey12 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  final formKey13 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final formKey6 = GlobalKey<FormState>();
  // Stores action output result for [Firestore Query - Query a collection] action in createUser widget.
  int? numOfUsers;
  // State field(s) for firstName widget.
  FocusNode? firstNameFocusNode;
  TextEditingController? firstNameController;
  String? Function(BuildContext, String?)? firstNameControllerValidator;
  String? _firstNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ggodxj06' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for middleName widget.
  FocusNode? middleNameFocusNode;
  TextEditingController? middleNameController;
  String? Function(BuildContext, String?)? middleNameControllerValidator;
  String? _middleNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'vkrrbebk' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for lastName widget.
  FocusNode? lastNameFocusNode;
  TextEditingController? lastNameController;
  String? Function(BuildContext, String?)? lastNameControllerValidator;
  String? _lastNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '87jbrjhh' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for nickName widget.
  FocusNode? nickNameFocusNode;
  TextEditingController? nickNameController;
  String? Function(BuildContext, String?)? nickNameControllerValidator;
  String? _nickNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '4iue3yt2' /* Field is required */,
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
  TextEditingController? nationalIDController;
  String? Function(BuildContext, String?)? nationalIDControllerValidator;
  String? _nationalIDControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '3dsgsa6c' /* Field is required */,
      );
    }

    if (val.length < 14) {
      return 'Requires at least 14 characters.';
    }

    return null;
  }

  // State field(s) for Birthdate widget.
  FocusNode? birthdateFocusNode;
  TextEditingController? birthdateController;
  final birthdateMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? birthdateControllerValidator;
  String? _birthdateControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'xrl64zux' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for Age widget.
  FocusNode? ageFocusNode1;
  TextEditingController? ageController1;
  String? Function(BuildContext, String?)? ageController1Validator;
  String? _ageController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'xc4thabi' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for natPlaceOfIssue widget.
  FocusNode? natPlaceOfIssueFocusNode;
  TextEditingController? natPlaceOfIssueController;
  String? Function(BuildContext, String?)? natPlaceOfIssueControllerValidator;
  String? _natPlaceOfIssueControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'o6zikw1h' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for natIDDate widget.
  FocusNode? natIDDateFocusNode;
  TextEditingController? natIDDateController;
  final natIDDateMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? natIDDateControllerValidator;
  String? _natIDDateControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ep3xap2v' /* Field is required */,
      );
    }

    return null;
  }

  DateTime? datePicked1;
  // State field(s) for expiryDate widget.
  FocusNode? expiryDateFocusNode;
  TextEditingController? expiryDateController;
  String? Function(BuildContext, String?)? expiryDateControllerValidator;
  String? _expiryDateControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'cgj9gsqz' /* Field is required */,
      );
    }

    return null;
  }

  DateTime? datePicked2;
  // State field(s) for nationality widget.
  FocusNode? nationalityFocusNode;
  TextEditingController? nationalityController;
  String? Function(BuildContext, String?)? nationalityControllerValidator;
  String? _nationalityControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '1mn2cxty' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for passportNo widget.
  FocusNode? passportNoFocusNode;
  TextEditingController? passportNoController;
  String? Function(BuildContext, String?)? passportNoControllerValidator;
  String? _passportNoControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '8vbjnb37' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for passportBirthdate widget.
  FocusNode? passportBirthdateFocusNode;
  TextEditingController? passportBirthdateController;
  String? Function(BuildContext, String?)? passportBirthdateControllerValidator;
  String? _passportBirthdateControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'tr06y4hy' /* Field is required */,
      );
    }

    return null;
  }

  DateTime? datePicked3;
  // State field(s) for Age widget.
  FocusNode? ageFocusNode2;
  TextEditingController? ageController2;
  String? Function(BuildContext, String?)? ageController2Validator;
  String? _ageController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '3zkdeqja' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for passportPlaceOfIssue widget.
  FocusNode? passportPlaceOfIssueFocusNode;
  TextEditingController? passportPlaceOfIssueController;
  String? Function(BuildContext, String?)?
      passportPlaceOfIssueControllerValidator;
  String? _passportPlaceOfIssueControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'moe1hv4e' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for passportIssueDate widget.
  FocusNode? passportIssueDateFocusNode;
  TextEditingController? passportIssueDateController;
  String? Function(BuildContext, String?)? passportIssueDateControllerValidator;
  String? _passportIssueDateControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'agftcbph' /* Field is required */,
      );
    }

    return null;
  }

  DateTime? datePicked4;
  // State field(s) for passportExpDate widget.
  FocusNode? passportExpDateFocusNode;
  TextEditingController? passportExpDateController;
  String? Function(BuildContext, String?)? passportExpDateControllerValidator;
  String? _passportExpDateControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '82gx3o43' /* Field is required */,
      );
    }

    return null;
  }

  DateTime? datePicked5;
  // State field(s) for government widget.
  FocusNode? governmentFocusNode;
  TextEditingController? governmentController;
  String? Function(BuildContext, String?)? governmentControllerValidator;
  String? _governmentControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'kdw10inl' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for city widget.
  FocusNode? cityFocusNode;
  TextEditingController? cityController;
  String? Function(BuildContext, String?)? cityControllerValidator;
  String? _cityControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '9t4q9h1g' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for fullAddress widget.
  FocusNode? fullAddressFocusNode;
  TextEditingController? fullAddressController;
  String? Function(BuildContext, String?)? fullAddressControllerValidator;
  String? _fullAddressControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'a3gl1iij' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for phoneNumber widget.
  FocusNode? phoneNumberFocusNode;
  TextEditingController? phoneNumberController;
  String? Function(BuildContext, String?)? phoneNumberControllerValidator;
  String? _phoneNumberControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '412nn2e1' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for eduData widget.
  FocusNode? eduDataFocusNode;
  TextEditingController? eduDataController;
  String? Function(BuildContext, String?)? eduDataControllerValidator;
  String? _eduDataControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '4qxp6c30' /* Field is required */,
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
  // State field(s) for contractor widget.
  String? contractorValue;
  FormFieldController<String>? contractorValueController;
  // Stores action output result for [Custom Action - contractorPathStringToref] action in contractor widget.
  DocumentReference? contRef;
  // Stores action output result for [Backend Call - Read Document] action in contractor widget.
  ContractorsRecord? contDoc;
  // State field(s) for contID widget.
  FocusNode? contIDFocusNode;
  TextEditingController? contIDController;
  String? Function(BuildContext, String?)? contIDControllerValidator;
  String? _contIDControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'web7eexb' /* Please Select Contractor */,
      );
    }

    return null;
  }

  // State field(s) for contNumOfWorkers widget.
  FocusNode? contNumOfWorkersFocusNode;
  TextEditingController? contNumOfWorkersController;
  String? Function(BuildContext, String?)? contNumOfWorkersControllerValidator;
  String? _contNumOfWorkersControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'whid1iwc' /* Please Select Contractor */,
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
  // State field(s) for drivLicIssueDate widget.
  FocusNode? drivLicIssueDateFocusNode;
  TextEditingController? drivLicIssueDateController;
  String? Function(BuildContext, String?)? drivLicIssueDateControllerValidator;
  DateTime? datePicked6;
  // State field(s) for drivLicExpiryDate widget.
  FocusNode? drivLicExpiryDateFocusNode;
  TextEditingController? drivLicExpiryDateController;
  String? Function(BuildContext, String?)? drivLicExpiryDateControllerValidator;
  DateTime? datePicked7;
  // State field(s) for drivLicPlaceOfIssue widget.
  FocusNode? drivLicPlaceOfIssueFocusNode;
  TextEditingController? drivLicPlaceOfIssueController;
  String? Function(BuildContext, String?)?
      drivLicPlaceOfIssueControllerValidator;
  // State field(s) for Sv_workArea widget.
  String? svWorkAreaValue;
  FormFieldController<String>? svWorkAreaValueController;
  // State field(s) for roleCode widget.
  String? roleCodeValue;
  FormFieldController<String>? roleCodeValueController;
  // State field(s) for employmentDate widget.
  FocusNode? employmentDateFocusNode;
  TextEditingController? employmentDateController;
  String? Function(BuildContext, String?)? employmentDateControllerValidator;
  DateTime? datePicked8;
  // State field(s) for numOfWorkers widget.
  FocusNode? numOfWorkersFocusNode;
  TextEditingController? numOfWorkersController;
  String? Function(BuildContext, String?)? numOfWorkersControllerValidator;
  String? _numOfWorkersControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'tnens0ef' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for diflict widget.
  FocusNode? diflictFocusNode;
  TextEditingController? diflictController;
  String? Function(BuildContext, String?)? diflictControllerValidator;
  String? _diflictControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'mz8l2oaj' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for ShiftPrice widget.
  FocusNode? shiftPriceFocusNode;
  TextEditingController? shiftPriceController;
  String? Function(BuildContext, String?)? shiftPriceControllerValidator;
  String? _shiftPriceControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'bcfrlk3f' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for contractDate widget.
  FocusNode? contractDateFocusNode;
  TextEditingController? contractDateController;
  String? Function(BuildContext, String?)? contractDateControllerValidator;
  String? _contractDateControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'd9j235xq' /* Field is required */,
      );
    }

    return null;
  }

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

  // Stores action output result for [Custom Action - generateUserCode] action in Button widget.
  String? userIdd;

  @override
  void initState(BuildContext context) {
    firstNameControllerValidator = _firstNameControllerValidator;
    middleNameControllerValidator = _middleNameControllerValidator;
    lastNameControllerValidator = _lastNameControllerValidator;
    nickNameControllerValidator = _nickNameControllerValidator;
    nationalIDControllerValidator = _nationalIDControllerValidator;
    birthdateControllerValidator = _birthdateControllerValidator;
    ageController1Validator = _ageController1Validator;
    natPlaceOfIssueControllerValidator = _natPlaceOfIssueControllerValidator;
    natIDDateControllerValidator = _natIDDateControllerValidator;
    expiryDateControllerValidator = _expiryDateControllerValidator;
    nationalityControllerValidator = _nationalityControllerValidator;
    passportNoControllerValidator = _passportNoControllerValidator;
    passportBirthdateControllerValidator =
        _passportBirthdateControllerValidator;
    ageController2Validator = _ageController2Validator;
    passportPlaceOfIssueControllerValidator =
        _passportPlaceOfIssueControllerValidator;
    passportIssueDateControllerValidator =
        _passportIssueDateControllerValidator;
    passportExpDateControllerValidator = _passportExpDateControllerValidator;
    governmentControllerValidator = _governmentControllerValidator;
    cityControllerValidator = _cityControllerValidator;
    fullAddressControllerValidator = _fullAddressControllerValidator;
    phoneNumberControllerValidator = _phoneNumberControllerValidator;
    eduDataControllerValidator = _eduDataControllerValidator;
    contIDControllerValidator = _contIDControllerValidator;
    contNumOfWorkersControllerValidator = _contNumOfWorkersControllerValidator;
    numOfWorkersControllerValidator = _numOfWorkersControllerValidator;
    diflictControllerValidator = _diflictControllerValidator;
    shiftPriceControllerValidator = _shiftPriceControllerValidator;
    contractDateControllerValidator = _contractDateControllerValidator;
  }

  @override
  void dispose() {
    firstNameFocusNode?.dispose();
    firstNameController?.dispose();

    middleNameFocusNode?.dispose();
    middleNameController?.dispose();

    lastNameFocusNode?.dispose();
    lastNameController?.dispose();

    nickNameFocusNode?.dispose();
    nickNameController?.dispose();

    nationalIDFocusNode?.dispose();
    nationalIDController?.dispose();

    birthdateFocusNode?.dispose();
    birthdateController?.dispose();

    ageFocusNode1?.dispose();
    ageController1?.dispose();

    natPlaceOfIssueFocusNode?.dispose();
    natPlaceOfIssueController?.dispose();

    natIDDateFocusNode?.dispose();
    natIDDateController?.dispose();

    expiryDateFocusNode?.dispose();
    expiryDateController?.dispose();

    nationalityFocusNode?.dispose();
    nationalityController?.dispose();

    passportNoFocusNode?.dispose();
    passportNoController?.dispose();

    passportBirthdateFocusNode?.dispose();
    passportBirthdateController?.dispose();

    ageFocusNode2?.dispose();
    ageController2?.dispose();

    passportPlaceOfIssueFocusNode?.dispose();
    passportPlaceOfIssueController?.dispose();

    passportIssueDateFocusNode?.dispose();
    passportIssueDateController?.dispose();

    passportExpDateFocusNode?.dispose();
    passportExpDateController?.dispose();

    governmentFocusNode?.dispose();
    governmentController?.dispose();

    cityFocusNode?.dispose();
    cityController?.dispose();

    fullAddressFocusNode?.dispose();
    fullAddressController?.dispose();

    phoneNumberFocusNode?.dispose();
    phoneNumberController?.dispose();

    eduDataFocusNode?.dispose();
    eduDataController?.dispose();

    contIDFocusNode?.dispose();
    contIDController?.dispose();

    contNumOfWorkersFocusNode?.dispose();
    contNumOfWorkersController?.dispose();

    drivLicIssueDateFocusNode?.dispose();
    drivLicIssueDateController?.dispose();

    drivLicExpiryDateFocusNode?.dispose();
    drivLicExpiryDateController?.dispose();

    drivLicPlaceOfIssueFocusNode?.dispose();
    drivLicPlaceOfIssueController?.dispose();

    employmentDateFocusNode?.dispose();
    employmentDateController?.dispose();

    numOfWorkersFocusNode?.dispose();
    numOfWorkersController?.dispose();

    diflictFocusNode?.dispose();
    diflictController?.dispose();

    shiftPriceFocusNode?.dispose();
    shiftPriceController?.dispose();

    contractDateFocusNode?.dispose();
    contractDateController?.dispose();
  }
}
