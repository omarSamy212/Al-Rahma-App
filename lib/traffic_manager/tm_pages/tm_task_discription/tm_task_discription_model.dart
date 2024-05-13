import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'tm_task_discription_widget.dart' show TmTaskDiscriptionWidget;
import 'package:flutter/material.dart';

class TmTaskDiscriptionModel extends FlutterFlowModel<TmTaskDiscriptionWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // State field(s) for TextualDetails widget.
  FocusNode? textualDetailsFocusNode;
  TextEditingController? textualDetailsTextController;
  String? Function(BuildContext, String?)?
      textualDetailsTextControllerValidator;
  // State field(s) for the_truck widget.
  String? theTruckValue;
  FormFieldController<String>? theTruckValueController;
  // State field(s) for the_driver widget.
  String? theDriverValue;
  FormFieldController<String>? theDriverValueController;
  // State field(s) for tricycle widget.
  String? tricycleValue;
  FormFieldController<String>? tricycleValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textualDetailsFocusNode?.dispose();
    textualDetailsTextController?.dispose();
  }
}
