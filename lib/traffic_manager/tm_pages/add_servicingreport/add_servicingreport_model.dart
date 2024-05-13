import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'add_servicingreport_widget.dart' show AddServicingreportWidget;
import 'package:flutter/material.dart';

class AddServicingreportModel
    extends FlutterFlowModel<AddServicingreportWidget> {
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
  // State field(s) for total_price widget.
  FocusNode? totalPriceFocusNode;
  TextEditingController? totalPriceTextController;
  String? Function(BuildContext, String?)? totalPriceTextControllerValidator;
  // State field(s) for TextualDetails widget.
  FocusNode? textualDetailsFocusNode;
  TextEditingController? textualDetailsTextController;
  String? Function(BuildContext, String?)?
      textualDetailsTextControllerValidator;
  // Stores action output result for [Custom Action - createServiceRequest] action in done_button widget.
  bool? serviceRequest;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    totalPriceFocusNode?.dispose();
    totalPriceTextController?.dispose();

    textualDetailsFocusNode?.dispose();
    textualDetailsTextController?.dispose();
  }
}
