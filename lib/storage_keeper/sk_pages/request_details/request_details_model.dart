import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'request_details_widget.dart' show RequestDetailsWidget;
import 'package:flutter/material.dart';

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
