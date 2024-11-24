import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'sv_work_requests_widget.dart' show SvWorkRequestsWidget;
import 'package:flutter/material.dart';

class SvWorkRequestsModel extends FlutterFlowModel<SvWorkRequestsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for number widget.
  FocusNode? numberFocusNode;
  TextEditingController? numberTextController;
  String? Function(BuildContext, String?)? numberTextControllerValidator;
  String? _numberTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'klg1bd61' /* Please enter an age for the pa... */,
      );
    }

    return null;
  }

  // State field(s) for Location widget.
  String? locationValue;
  FormFieldController<String>? locationValueController;
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  // Stores action output result for [Custom Action - createVehicleRequest] action in Button widget.
  bool? vehicleOutput;
  // Stores action output result for [Custom Action - createWorkerRequest] action in Button widget.
  bool? workerRequest;

  @override
  void initState(BuildContext context) {
    numberTextControllerValidator = _numberTextControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    numberFocusNode?.dispose();
    numberTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();
  }
}
