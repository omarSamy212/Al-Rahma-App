import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'end_request_widget.dart' show EndRequestWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EndRequestModel extends FlutterFlowModel<EndRequestWidget> {
  ///  Local state fields for this component.

  List<ArrayOfToolsStruct> reqTools = [];
  void addToReqTools(ArrayOfToolsStruct item) => reqTools.add(item);
  void removeFromReqTools(ArrayOfToolsStruct item) => reqTools.remove(item);
  void removeAtIndexFromReqTools(int index) => reqTools.removeAt(index);
  void insertAtIndexInReqTools(int index, ArrayOfToolsStruct item) =>
      reqTools.insert(index, item);
  void updateReqToolsAtIndex(
          int index, Function(ArrayOfToolsStruct) updateFn) =>
      reqTools[index] = updateFn(reqTools[index]);

  int? counter = 0;

  ///  State fields for stateful widgets in this component.

  var scannedSupervsorID = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
