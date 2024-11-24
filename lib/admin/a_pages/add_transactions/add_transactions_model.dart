import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'add_transactions_widget.dart' show AddTransactionsWidget;
import 'package:flutter/material.dart';

class AddTransactionsModel extends FlutterFlowModel<AddTransactionsWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for contName widget.
  FocusNode? contNameFocusNode;
  TextEditingController? contNameTextController;
  String? Function(BuildContext, String?)? contNameTextControllerValidator;
  // State field(s) for contID widget.
  FocusNode? contIDFocusNode;
  TextEditingController? contIDTextController;
  String? Function(BuildContext, String?)? contIDTextControllerValidator;
  // State field(s) for transType widget.
  String? transTypeValue;
  FormFieldController<String>? transTypeValueController;
  // State field(s) for value widget.
  FocusNode? valueFocusNode;
  TextEditingController? valueTextController;
  String? Function(BuildContext, String?)? valueTextControllerValidator;
  // State field(s) for TextualDetails widget.
  FocusNode? textualDetailsFocusNode;
  TextEditingController? textualDetailsTextController;
  String? Function(BuildContext, String?)?
      textualDetailsTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    contNameFocusNode?.dispose();
    contNameTextController?.dispose();

    contIDFocusNode?.dispose();
    contIDTextController?.dispose();

    valueFocusNode?.dispose();
    valueTextController?.dispose();

    textualDetailsFocusNode?.dispose();
    textualDetailsTextController?.dispose();
  }
}
