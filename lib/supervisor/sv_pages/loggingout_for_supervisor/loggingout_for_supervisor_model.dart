import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'loggingout_for_supervisor_widget.dart'
    show LoggingoutForSupervisorWidget;
import 'package:flutter/material.dart';

class LoggingoutForSupervisorModel
    extends FlutterFlowModel<LoggingoutForSupervisorWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  var scanSupValue = '';
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  UsersRecord? userRef;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  ChecksRecord? check;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
