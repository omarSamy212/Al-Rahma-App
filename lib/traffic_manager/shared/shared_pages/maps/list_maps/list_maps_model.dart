import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'list_maps_widget.dart' show ListMapsWidget;
import 'package:flutter/material.dart';

class ListMapsModel extends FlutterFlowModel<ListMapsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in List_maps widget.
  List<SectorsRecord>? sectors;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
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
  // Stores action output result for [Firestore Query - Query a collection] action in DropDown widget.
  LeadersRecord? leaderRefrence;
  // Stores action output result for [Backend Call - Read Document] action in Icon widget.
  StreetsRecord? streetLocation;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
