import '/flutter_flow/flutter_flow_util.dart';
import 'modal16_create_company_widget.dart' show Modal16CreateCompanyWidget;
import 'package:flutter/material.dart';

class Modal16CreateCompanyModel
    extends FlutterFlowModel<Modal16CreateCompanyWidget> {
  ///  Local state fields for this component.

  int? photoNumber;

  ///  State fields for stateful widgets in this component.

  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode;
  TextEditingController? yourNameController;
  String? Function(BuildContext, String?)? yourNameControllerValidator;
  // State field(s) for city widget.
  FocusNode? cityFocusNode;
  TextEditingController? cityController;
  String? Function(BuildContext, String?)? cityControllerValidator;
  // State field(s) for myBio widget.
  FocusNode? myBioFocusNode;
  TextEditingController? myBioController;
  String? Function(BuildContext, String?)? myBioControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    yourNameFocusNode?.dispose();
    yourNameController?.dispose();

    cityFocusNode?.dispose();
    cityController?.dispose();

    myBioFocusNode?.dispose();
    myBioController?.dispose();
  }
}
