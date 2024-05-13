import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'add_maps_widget.dart' show AddMapsWidget;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class AddMapsModel extends FlutterFlowModel<AddMapsWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in Add_maps widget.
  List<SectorsRecord>? sectors;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
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
  // State field(s) for TextualDetails widget.
  FocusNode? textualDetailsFocusNode1;
  TextEditingController? textualDetailsTextController1;
  String? Function(BuildContext, String?)?
      textualDetailsTextController1Validator;
  // State field(s) for TextualDetails widget.
  FocusNode? textualDetailsFocusNode2;
  TextEditingController? textualDetailsTextController2;
  String? Function(BuildContext, String?)?
      textualDetailsTextController2Validator;
  // State field(s) for TextualDetails widget.
  FocusNode? textualDetailsFocusNode3;
  TextEditingController? textualDetailsTextController3;
  String? Function(BuildContext, String?)?
      textualDetailsTextController3Validator;
  // State field(s) for TextualDetails widget.
  FocusNode? textualDetailsFocusNode4;
  TextEditingController? textualDetailsTextController4;
  String? Function(BuildContext, String?)?
      textualDetailsTextController4Validator;
  // State field(s) for CountController widget.
  int? countControllerValue;
  // Stores action output result for [Custom Action - createSector] action in Button-Login widget.
  bool? sectorCreation;
  // Stores action output result for [Custom Action - createSquare] action in Button-Login widget.
  bool? squareCreation;
  // Stores action output result for [Custom Action - createLeader] action in Button-Login widget.
  bool? leaderCreation;
  // Stores action output result for [Custom Action - createStreet] action in Button-Login widget.
  String? streetCreation;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textualDetailsFocusNode1?.dispose();
    textualDetailsTextController1?.dispose();

    textualDetailsFocusNode2?.dispose();
    textualDetailsTextController2?.dispose();

    textualDetailsFocusNode3?.dispose();
    textualDetailsTextController3?.dispose();

    textualDetailsFocusNode4?.dispose();
    textualDetailsTextController4?.dispose();
  }
}
