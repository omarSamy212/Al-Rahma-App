import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'o_m_personal_orders_discription_widget.dart'
    show OMPersonalOrdersDiscriptionWidget;
import 'package:flutter/material.dart';

class OMPersonalOrdersDiscriptionModel
    extends FlutterFlowModel<OMPersonalOrdersDiscriptionWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextualDetails widget.
  FocusNode? textualDetailsFocusNode;
  TextEditingController? textualDetailsTextController;
  String? Function(BuildContext, String?)?
      textualDetailsTextControllerValidator;
  // Stores action output result for [Custom Action - acceptPersonalRequest] action in Button widget.
  List<PersonalRequestUserResponsStruct>? list;
  // Stores action output result for [Custom Action - declinePersonalRequest] action in Button widget.
  List<PersonalRequestUserResponsStruct>? rejectList;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textualDetailsFocusNode?.dispose();
    textualDetailsTextController?.dispose();
  }
}
