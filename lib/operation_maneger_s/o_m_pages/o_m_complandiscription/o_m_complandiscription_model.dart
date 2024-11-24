import '/flutter_flow/flutter_flow_util.dart';
import 'o_m_complandiscription_widget.dart' show OMComplandiscriptionWidget;
import 'package:flutter/material.dart';

class OMComplandiscriptionModel
    extends FlutterFlowModel<OMComplandiscriptionWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
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
  // Stores action output result for [Custom Action - acceptComplaint] action in Button widget.
  bool? infoMessage;
  // Stores action output result for [Custom Action - declineComplaint] action in Button widget.
  bool? declineResult;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textualDetailsFocusNode1?.dispose();
    textualDetailsTextController1?.dispose();

    textualDetailsFocusNode2?.dispose();
    textualDetailsTextController2?.dispose();

    textualDetailsFocusNode3?.dispose();
    textualDetailsTextController3?.dispose();
  }
}
