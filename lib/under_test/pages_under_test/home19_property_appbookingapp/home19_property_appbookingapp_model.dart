import '/flutter_flow/flutter_flow_util.dart';
import 'home19_property_appbookingapp_widget.dart'
    show Home19PropertyAppbookingappWidget;
import 'package:flutter/material.dart';

class Home19PropertyAppbookingappModel
    extends FlutterFlowModel<Home19PropertyAppbookingappWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
