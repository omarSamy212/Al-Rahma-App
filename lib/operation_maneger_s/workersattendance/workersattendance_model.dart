import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'workersattendance_widget.dart' show WorkersattendanceWidget;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class WorkersattendanceModel extends FlutterFlowModel<WorkersattendanceWidget> {
  ///  Local state fields for this page.

  dynamic samples;

  List<DocumentReference> checksLogs = [];
  void addToChecksLogs(DocumentReference item) => checksLogs.add(item);
  void removeFromChecksLogs(DocumentReference item) => checksLogs.remove(item);
  void removeAtIndexFromChecksLogs(int index) => checksLogs.removeAt(index);
  void insertAtIndexInChecksLogs(int index, DocumentReference item) =>
      checksLogs.insert(index, item);
  void updateChecksLogsAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      checksLogs[index] = updateFn(checksLogs[index]);

  int counter = 0;

  bool showAtten = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // Stores action output result for [Firestore Query - Query a collection] action in DropDown widget.
  SessionsRecord? shiftDoc;
  // State field(s) for DropDown widget.
  String? dropDownValue3;
  FormFieldController<String>? dropDownValueController3;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  UsersRecord? usRef;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  UsersRecord? userDoc;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  ChecksRecord? checkDoc;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  SessionsRecord? sessionDoc;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  SectorsRecord? sectorDoc;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  ContractorsRecord? contRef;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
