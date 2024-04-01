import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'update_user_widget.dart' show UpdateUserWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class UpdateUserModel extends FlutterFlowModel<UpdateUserWidget> {
  ///  Local state fields for this page.

  String userID = '0000';

  String email = '';

  DocumentReference? contractorRef;

  int? age = 0;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Firestore Query - Query a collection] action in updateUser widget.
  int? numOfUsers;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  // State field(s) for firstName widget.
  FocusNode? firstNameFocusNode;
  TextEditingController? firstNameController;
  String? Function(BuildContext, String?)? firstNameControllerValidator;
  // State field(s) for middleName widget.
  FocusNode? middleNameFocusNode;
  TextEditingController? middleNameController;
  String? Function(BuildContext, String?)? middleNameControllerValidator;
  // State field(s) for lastName widget.
  FocusNode? lastNameFocusNode;
  TextEditingController? lastNameController;
  String? Function(BuildContext, String?)? lastNameControllerValidator;
  // State field(s) for nickName widget.
  FocusNode? nickNameFocusNode;
  TextEditingController? nickNameController;
  String? Function(BuildContext, String?)? nickNameControllerValidator;
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
  // State field(s) for Birthdate widget.
  FocusNode? birthdateFocusNode;
  TextEditingController? birthdateController;
  final birthdateMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? birthdateControllerValidator;
  // State field(s) for Age widget.
  FocusNode? ageFocusNode1;
  TextEditingController? ageController1;
  String? Function(BuildContext, String?)? ageController1Validator;
  // State field(s) for eduData widget.
  FocusNode? eduDataFocusNode1;
  TextEditingController? eduDataController1;
  String? Function(BuildContext, String?)? eduDataController1Validator;
  // State field(s) for natIDDate widget.
  FocusNode? natIDDateFocusNode;
  TextEditingController? natIDDateController;
  String? Function(BuildContext, String?)? natIDDateControllerValidator;
  DateTime? datePicked1;
  // State field(s) for employmentDate widget.
  FocusNode? employmentDateFocusNode1;
  TextEditingController? employmentDateController1;
  String? Function(BuildContext, String?)? employmentDateController1Validator;
  DateTime? datePicked2;
  // State field(s) for nationality widget.
  FocusNode? nationalityFocusNode;
  TextEditingController? nationalityController;
  String? Function(BuildContext, String?)? nationalityControllerValidator;
  String? _nationalityControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '607thgj8' /* Field is required */,
      );
    }

    if (val.length < 11) {
      return FFLocalizations.of(context).getText(
        '4juznio2' /* Wrong Number */,
      );
    }
    if (val.length > 11) {
      return FFLocalizations.of(context).getText(
        '6yo311zh' /* Wrong Number */,
      );
    }

    return null;
  }

  // State field(s) for passportNo widget.
  FocusNode? passportNoFocusNode;
  TextEditingController? passportNoController;
  String? Function(BuildContext, String?)? passportNoControllerValidator;
  // State field(s) for passportBirthdate widget.
  FocusNode? passportBirthdateFocusNode;
  TextEditingController? passportBirthdateController;
  String? Function(BuildContext, String?)? passportBirthdateControllerValidator;
  DateTime? datePicked3;
  // State field(s) for Age widget.
  FocusNode? ageFocusNode2;
  TextEditingController? ageController2;
  String? Function(BuildContext, String?)? ageController2Validator;
  // State field(s) for eduData widget.
  FocusNode? eduDataFocusNode2;
  TextEditingController? eduDataController2;
  String? Function(BuildContext, String?)? eduDataController2Validator;
  // State field(s) for dateOfCivilId widget.
  FocusNode? dateOfCivilIdFocusNode;
  TextEditingController? dateOfCivilIdController;
  String? Function(BuildContext, String?)? dateOfCivilIdControllerValidator;
  DateTime? datePicked4;
  // State field(s) for expiredate widget.
  FocusNode? expiredateFocusNode;
  TextEditingController? expiredateController;
  String? Function(BuildContext, String?)? expiredateControllerValidator;
  DateTime? datePicked5;
  // State field(s) for government widget.
  FocusNode? governmentFocusNode;
  TextEditingController? governmentController;
  String? Function(BuildContext, String?)? governmentControllerValidator;
  // State field(s) for city widget.
  FocusNode? cityFocusNode;
  TextEditingController? cityController;
  String? Function(BuildContext, String?)? cityControllerValidator;
  // State field(s) for fullAddress widget.
  FocusNode? fullAddressFocusNode;
  TextEditingController? fullAddressController;
  String? Function(BuildContext, String?)? fullAddressControllerValidator;
  // State field(s) for phoneNumber widget.
  FocusNode? phoneNumberFocusNode;
  TextEditingController? phoneNumberController;
  String? Function(BuildContext, String?)? phoneNumberControllerValidator;
  // State field(s) for eduData widget.
  FocusNode? eduDataFocusNode3;
  TextEditingController? eduDataController3;
  String? Function(BuildContext, String?)? eduDataController3Validator;
  // State field(s) for isEmployeed widget.
  String? isEmployeedValue;
  FormFieldController<String>? isEmployeedValueController;
  // State field(s) for userRole widget.
  String? userRoleValue;
  FormFieldController<String>? userRoleValueController;
  // State field(s) for contractor widget.
  String? contractorValue;
  FormFieldController<String>? contractorValueController;
  // State field(s) for isDriver widget.
  String? isDriverValue;
  FormFieldController<String>? isDriverValueController;
  // State field(s) for drivingLicType widget.
  String? drivingLicTypeValue;
  FormFieldController<String>? drivingLicTypeValueController;
  // State field(s) for Sv_workArea widget.
  String? svWorkAreaValue;
  FormFieldController<String>? svWorkAreaValueController;
  // State field(s) for roleCode widget.
  String? roleCodeValue;
  FormFieldController<String>? roleCodeValueController;
  // State field(s) for workerStartingShift widget.
  String? workerStartingShiftValue;
  FormFieldController<String>? workerStartingShiftValueController;
  // State field(s) for workerShiftPeriod widget.
  String? workerShiftPeriodValue;
  FormFieldController<String>? workerShiftPeriodValueController;
  // State field(s) for OtherStartingShift widget.
  String? otherStartingShiftValue;
  FormFieldController<String>? otherStartingShiftValueController;
  // State field(s) for otherShiftPeriod widget.
  String? otherShiftPeriodValue;
  FormFieldController<String>? otherShiftPeriodValueController;
  // State field(s) for employmentDate widget.
  FocusNode? employmentDateFocusNode2;
  TextEditingController? employmentDateController2;
  String? Function(BuildContext, String?)? employmentDateController2Validator;
  DateTime? datePicked6;
  // State field(s) for Age widget.
  FocusNode? ageFocusNode3;
  TextEditingController? ageController3;
  String? Function(BuildContext, String?)? ageController3Validator;
  // State field(s) for diflict widget.
  FocusNode? diflictFocusNode;
  TextEditingController? diflictController;
  String? Function(BuildContext, String?)? diflictControllerValidator;
  // State field(s) for ShiftPrice widget.
  FocusNode? shiftPriceFocusNode;
  TextEditingController? shiftPriceController;
  String? Function(BuildContext, String?)? shiftPriceControllerValidator;
  // State field(s) for contractDate widget.
  FocusNode? contractDateFocusNode;
  TextEditingController? contractDateController;
  String? Function(BuildContext, String?)? contractDateControllerValidator;
  DateTime? datePicked7;
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
    nationalityControllerValidator = _nationalityControllerValidator;
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

    eduDataFocusNode1?.dispose();
    eduDataController1?.dispose();

    natIDDateFocusNode?.dispose();
    natIDDateController?.dispose();

    employmentDateFocusNode1?.dispose();
    employmentDateController1?.dispose();

    nationalityFocusNode?.dispose();
    nationalityController?.dispose();

    passportNoFocusNode?.dispose();
    passportNoController?.dispose();

    passportBirthdateFocusNode?.dispose();
    passportBirthdateController?.dispose();

    ageFocusNode2?.dispose();
    ageController2?.dispose();

    eduDataFocusNode2?.dispose();
    eduDataController2?.dispose();

    dateOfCivilIdFocusNode?.dispose();
    dateOfCivilIdController?.dispose();

    expiredateFocusNode?.dispose();
    expiredateController?.dispose();

    governmentFocusNode?.dispose();
    governmentController?.dispose();

    cityFocusNode?.dispose();
    cityController?.dispose();

    fullAddressFocusNode?.dispose();
    fullAddressController?.dispose();

    phoneNumberFocusNode?.dispose();
    phoneNumberController?.dispose();

    eduDataFocusNode3?.dispose();
    eduDataController3?.dispose();

    employmentDateFocusNode2?.dispose();
    employmentDateController2?.dispose();

    ageFocusNode3?.dispose();
    ageController3?.dispose();

    diflictFocusNode?.dispose();
    diflictController?.dispose();

    shiftPriceFocusNode?.dispose();
    shiftPriceController?.dispose();

    contractDateFocusNode?.dispose();
    contractDateController?.dispose();
  }
}
