import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/storage_keeper/sk_components/end_request/end_request_widget.dart';
import 'request_details_widget.dart' show RequestDetailsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class RequestDetailsModel extends FlutterFlowModel<RequestDetailsWidget> {
  ///  Local state fields for this page.

  bool isRequestActive = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Read Document] action in request_Details widget.
  ToolsRequestsRecord? request;
  // State field(s) for Checkbox widget.

  Map<ArrayOfToolsStruct, bool> checkboxValueMap1 = {};
  List<ArrayOfToolsStruct> get checkboxCheckedItems1 =>
      checkboxValueMap1.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  // State field(s) for Checkbox widget.

  Map<ArrayOfToolsStruct, bool> checkboxValueMap2 = {};
  List<ArrayOfToolsStruct> get checkboxCheckedItems2 =>
      checkboxValueMap2.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  // State field(s) for Checkbox widget.

  Map<ArrayOfToolsStruct, bool> checkboxValueMap3 = {};
  List<ArrayOfToolsStruct> get checkboxCheckedItems3 =>
      checkboxValueMap3.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  // State field(s) for Checkbox widget.

  Map<ArrayOfToolsStruct, bool> checkboxValueMap4 = {};
  List<ArrayOfToolsStruct> get checkboxCheckedItems4 =>
      checkboxValueMap4.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  // State field(s) for Checkbox widget.

  Map<ArrayOfToolsStruct, bool> checkboxValueMap5 = {};
  List<ArrayOfToolsStruct> get checkboxCheckedItems5 =>
      checkboxValueMap5.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
