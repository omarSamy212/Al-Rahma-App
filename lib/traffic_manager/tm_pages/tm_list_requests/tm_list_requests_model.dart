import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'tm_list_requests_widget.dart' show TmListRequestsWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class TmListRequestsModel extends FlutterFlowModel<TmListRequestsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
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
