import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'transmission_scan2_widget.dart' show TransmissionScan2Widget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
