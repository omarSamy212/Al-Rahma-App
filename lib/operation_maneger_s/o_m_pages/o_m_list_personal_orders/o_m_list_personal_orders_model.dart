import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'o_m_list_personal_orders_widget.dart' show OMListPersonalOrdersWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class OMListPersonalOrdersModel
    extends FlutterFlowModel<OMListPersonalOrdersWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for natIDDate widget.
  FocusNode? natIDDateFocusNode;
  TextEditingController? natIDDateTextController;
  final natIDDateMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? natIDDateTextControllerValidator;
  DateTime? datePicked;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // Stores action output result for [Custom Action - acceptPersonalRequest] action in Button widget.
  List<PersonalRequestUserResponsStruct>? list;
  // Stores action output result for [Custom Action - declinePersonalRequest] action in Button widget.
  List<PersonalRequestUserResponsStruct>? rejectList;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    natIDDateFocusNode?.dispose();
    natIDDateTextController?.dispose();
  }
}
