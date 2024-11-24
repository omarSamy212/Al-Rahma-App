import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'o_m_list_work_orders_widget.dart' show OMListWorkOrdersWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class OMListWorkOrdersModel extends FlutterFlowModel<OMListWorkOrdersWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for reportType widget.
  String? reportTypeValue;
  FormFieldController<String>? reportTypeValueController;
  // State field(s) for carType widget.
  String? carTypeValue;
  FormFieldController<String>? carTypeValueController;
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

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    natIDDateFocusNode?.dispose();
    natIDDateTextController?.dispose();
  }
}
