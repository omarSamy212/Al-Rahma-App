import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'manualattendance_widget.dart' show ManualattendanceWidget;
import 'package:flutter/material.dart';

class ManualattendanceModel extends FlutterFlowModel<ManualattendanceWidget> {
  ///  Local state fields for this page.

  bool isFullList = true;

  bool refreshPage = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  List<SectorsRecord>? manualattendancePreviousSnapshot;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  ChecksRecord? createCheck;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
