import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'add_movement_widget.dart' show AddMovementWidget;
import 'package:flutter/material.dart';

class AddMovementModel extends FlutterFlowModel<AddMovementWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for the_truck widget.
  String? theTruckValue;
  FormFieldController<String>? theTruckValueController;
  // State field(s) for the_driver widget.
  String? theDriverValue;
  FormFieldController<String>? theDriverValueController;
  // State field(s) for tricycle widget.
  String? tricycleValue;
  FormFieldController<String>? tricycleValueController;
  // State field(s) for TextualDetails widget.
  FocusNode? textualDetailsFocusNode;
  TextEditingController? textualDetailsTextController;
  String? Function(BuildContext, String?)?
      textualDetailsTextControllerValidator;
  // Stores action output result for [Custom Action - createMovmentRequest] action in done_button widget.
  bool? movmentRequest;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textualDetailsFocusNode?.dispose();
    textualDetailsTextController?.dispose();
  }
}
