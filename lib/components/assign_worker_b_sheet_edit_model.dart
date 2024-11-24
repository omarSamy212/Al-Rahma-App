import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'assign_worker_b_sheet_edit_widget.dart'
    show AssignWorkerBSheetEditWidget;
import 'package:flutter/material.dart';

class AssignWorkerBSheetEditModel
    extends FlutterFlowModel<AssignWorkerBSheetEditWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Street widget.
  FocusNode? streetFocusNode;
  TextEditingController? streetTextController;
  String? Function(BuildContext, String?)? streetTextControllerValidator;
  // State field(s) for workerName widget.
  FocusNode? workerNameFocusNode;
  TextEditingController? workerNameTextController;
  String? Function(BuildContext, String?)? workerNameTextControllerValidator;
  // State field(s) for toolsDD widget.
  String? toolsDDValue;
  FormFieldController<String>? toolsDDValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    streetFocusNode?.dispose();
    streetTextController?.dispose();

    workerNameFocusNode?.dispose();
    workerNameTextController?.dispose();
  }
}
