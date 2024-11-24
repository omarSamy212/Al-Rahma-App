import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'set_street_supervisor_widget.dart' show SetStreetSupervisorWidget;
import 'package:flutter/material.dart';

class SetStreetSupervisorModel
    extends FlutterFlowModel<SetStreetSupervisorWidget> {
  ///  Local state fields for this page.

  DocumentReference? oldSectorRefrence;

  DocumentReference? mainLeaderRefrence;

  DocumentReference? secondLeaderRefrence;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in set_street_supervisor widget.
  List<SectorsRecord>? sectors;
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // Stores action output result for [Firestore Query - Query a collection] action in DropDown widget.
  SectorsRecord? sectorChosen;
  // Stores action output result for [Firestore Query - Query a collection] action in DropDown widget.
  List<SquaresRecord>? sectorSquares;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // Stores action output result for [Firestore Query - Query a collection] action in DropDown widget.
  SquaresRecord? squareChosen;
  // Stores action output result for [Firestore Query - Query a collection] action in DropDown widget.
  List<LeadersRecord>? leadersSquare;
  // State field(s) for DropDown widget.
  String? dropDownValue3;
  FormFieldController<String>? dropDownValueController3;
  // Stores action output result for [Custom Action - getLeaderDocumentFromID] action in DropDown widget.
  LeadersRecord? leader;
  // Stores action output result for [Backend Call - Read Document] action in DropDown widget.
  UsersRecord? superMain;
  // State field(s) for DropDown widget.
  String? dropDownValue4;
  FormFieldController<String>? dropDownValueController4;
  // Stores action output result for [Custom Action - removeUserFromList] action in DropDown widget.
  List<UsersRecord>? secondarySupervisorOutput;
  // Stores action output result for [Custom Action - getUserDocumentFromID] action in Button-Login widget.
  UsersRecord? mainUser;
  // Stores action output result for [Backend Call - Read Document] action in Button-Login widget.
  LeadersRecord? oldLeaderRefrence;
  // Stores action output result for [Backend Call - Read Document] action in Button-Login widget.
  SquaresRecord? oldSquare;
  // Stores action output result for [Custom Action - assignSupervisorToLeader] action in Button-Login widget.
  bool? supervisorAssignOutput;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
