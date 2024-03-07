import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'transmission_scan2_widget.dart' show TransmissionScan2Widget;
import 'package:flutter/material.dart';

class TransmissionScan2Model extends FlutterFlowModel<TransmissionScan2Widget> {
  ///  Local state fields for this page.

  int? countCart = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  var supervisorDocId = '';
  // Stores action output result for [Custom Action - getUserRef] action in Button widget.
  DocumentReference? supRef;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  UsersRecord? supervisorRef;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ToolsRequestsRecord? returnedRequestRef;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
