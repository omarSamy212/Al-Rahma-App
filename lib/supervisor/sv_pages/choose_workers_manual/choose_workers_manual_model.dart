import '/flutter_flow/flutter_flow_util.dart';
import 'choose_workers_manual_widget.dart' show ChooseWorkersManualWidget;
import 'package:flutter/material.dart';

class ChooseWorkersManualModel
    extends FlutterFlowModel<ChooseWorkersManualWidget> {
  ///  Local state fields for this page.

  bool isFullList = true;

  bool refreshPage = true;

  int? neededWorkers = 0;

  int? counter = 0;

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
