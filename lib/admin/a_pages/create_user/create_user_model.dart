import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'create_user_widget.dart' show CreateUserWidget;
import 'package:flutter/material.dart';

class CreateUserModel extends FlutterFlowModel<CreateUserWidget> {
  ///  Local state fields for this page.

  String userID = '0000';

  String email = '';

  DocumentReference? contractorRef;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Firestore Query - Query a collection] action in createUser widget.
  int? numOfUsers;
  // State field(s) for firstName widget.
  FocusNode? firstNameFocusNode;
  TextEditingController? firstNameController;
  String? Function(BuildContext, String?)? firstNameControllerValidator;
  String? _firstNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'uqp1cu71' /* Field is required */,
      );
    }

    if (!RegExp(kTextValidatorUsernameRegex).hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'bprukhag' /* Name Error */,
      );
    }
    return null;
  }

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
  // State field(s) for nationalID widget.
  FocusNode? nationalIDFocusNode;
  TextEditingController? nationalIDController;
  String? Function(BuildContext, String?)? nationalIDControllerValidator;
  String? _nationalIDControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'vkrrbebk' /* Field is required */,
      );
    }

    if (val.length < 14) {
      return FFLocalizations.of(context).getText(
        'xsc23mr6' /* Wrong NatID */,
      );
    }
    if (val.length > 14) {
      return FFLocalizations.of(context).getText(
        'db1rwex8' /* Wrong NatID */,
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
        '87jbrjhh' /* Field is required */,
      );
    }

    if (val.length < 11) {
      return FFLocalizations.of(context).getText(
        'u7tjd6ab' /* Wrong Number */,
      );
    }
    if (val.length > 11) {
      return FFLocalizations.of(context).getText(
        'pcug1wnh' /* Wrong Number */,
      );
    }

    return null;
  }

  // State field(s) for userRole widget.
  String? userRoleValue;
  FormFieldController<String>? userRoleValueController;
  // State field(s) for gender widget.
  String? genderValue;
  FormFieldController<String>? genderValueController;
  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for country widget.
  String? countryValue;
  FormFieldController<String>? countryValueController;
  // State field(s) for socialStatus widget.
  String? socialStatusValue;
  FormFieldController<String>? socialStatusValueController;
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
  // State field(s) for shiftPeriod widget.
  String? shiftPeriodValue;
  FormFieldController<String>? shiftPeriodValueController;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    firstNameControllerValidator = _firstNameControllerValidator;
    nationalIDControllerValidator = _nationalIDControllerValidator;
    phoneNumberControllerValidator = _phoneNumberControllerValidator;
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

    phoneNumberFocusNode?.dispose();
    phoneNumberController?.dispose();

    governmentFocusNode?.dispose();
    governmentController?.dispose();

    cityFocusNode?.dispose();
    cityController?.dispose();

    fullAddressFocusNode?.dispose();
    fullAddressController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
