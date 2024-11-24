import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'assign_worker_b_sheet_widget.dart' show AssignWorkerBSheetWidget;
import 'package:flutter/material.dart';

class AssignWorkerBSheetModel
    extends FlutterFlowModel<AssignWorkerBSheetWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - getDocsFromRefs] action in AssignWorkerBSheet widget.
  List<UsersRecord>? workersList;
  // State field(s) for Age widget.
  FocusNode? ageFocusNode;
  TextEditingController? ageTextController;
  String? Function(BuildContext, String?)? ageTextControllerValidator;
  // State field(s) for wokersDD widget.
  String? wokersDDValue;
  FormFieldController<String>? wokersDDValueController;
  // State field(s) for toolsDD widget.
  String? toolsDDValue;
  FormFieldController<String>? toolsDDValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    ageFocusNode?.dispose();
    ageTextController?.dispose();
  }
}
