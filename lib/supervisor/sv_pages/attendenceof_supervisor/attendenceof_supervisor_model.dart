import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'attendenceof_supervisor_widget.dart' show AttendenceofSupervisorWidget;
import 'package:flutter/material.dart';

class AttendenceofSupervisorModel
    extends FlutterFlowModel<AttendenceofSupervisorWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  var scanSupValue = '';
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  UsersRecord? userRef;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  SectorsRecord? supSec;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ChecksRecord? checkDoc;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
