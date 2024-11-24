import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'create_user2_widget.dart' show CreateUser2Widget;
import 'package:flutter/material.dart';

class CreateUser2Model extends FlutterFlowModel<CreateUser2Widget> {
  ///  Local state fields for this page.

  bool isShare = true;

  ///  State fields for stateful widgets in this page.

  // State field(s) for Name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  // State field(s) for ID widget.
  FocusNode? idFocusNode;
  TextEditingController? idTextController;
  String? Function(BuildContext, String?)? idTextControllerValidator;
  // State field(s) for Email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // State field(s) for Password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  RolesRecord? userRoleOutput;
  // Stores action output result for [Custom Action - createUser] action in Button widget.
  UserCreationObjectStruct? returnObject;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    idFocusNode?.dispose();
    idTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();
  }
}
