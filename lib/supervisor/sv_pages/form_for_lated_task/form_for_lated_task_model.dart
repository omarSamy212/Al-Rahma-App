import '/flutter_flow/flutter_flow_util.dart';
import 'form_for_lated_task_widget.dart' show FormForLatedTaskWidget;
import 'package:flutter/material.dart';

class FormForLatedTaskModel extends FlutterFlowModel<FormForLatedTaskWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextualDetails widget.
  FocusNode? textualDetailsFocusNode;
  TextEditingController? textualDetailsTextController;
  String? Function(BuildContext, String?)?
      textualDetailsTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textualDetailsFocusNode?.dispose();
    textualDetailsTextController?.dispose();
  }
}
