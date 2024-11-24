import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'checkup_widget.dart' show CheckupWidget;
import 'package:flutter/material.dart';

class CheckupModel extends FlutterFlowModel<CheckupWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - checkCurrentSession] action in checkup widget.
  CurrentShiftInfoStruct? currentSession;
  // Stores action output result for [Backend Call - Read Document] action in checkup widget.
  UsersRecord? user;
  // Stores action output result for [Custom Action - gettingUserRefrenceFromOldLoginData] action in checkup widget.
  DocumentReference? userOldRefrence;
  // Stores action output result for [Backend Call - Read Document] action in checkup widget.
  UsersRecord? userOldData;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
