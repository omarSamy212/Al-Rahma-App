import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'o_m_work_orders_discription_widget.dart'
    show OMWorkOrdersDiscriptionWidget;
import 'package:flutter/material.dart';

class OMWorkOrdersDiscriptionModel
    extends FlutterFlowModel<OMWorkOrdersDiscriptionWidget> {
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

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textualDetailsFocusNode?.dispose();
    textualDetailsTextController?.dispose();
  }
}
