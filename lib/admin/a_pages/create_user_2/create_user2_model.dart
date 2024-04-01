import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'create_user2_widget.dart' show CreateUser2Widget;
import 'package:flutter/material.dart';

class CreateUser2Model extends FlutterFlowModel<CreateUser2Widget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for ID widget.
  FocusNode? idFocusNode;
  TextEditingController? idController;
  String? Function(BuildContext, String?)? idControllerValidator;
  // State field(s) for Email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailController;
  String? Function(BuildContext, String?)? emailControllerValidator;
  // State field(s) for Password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordController;
  String? Function(BuildContext, String?)? passwordControllerValidator;
  // Stores action output result for [Custom Action - createUser] action in Button widget.
  UserCreationObjectStruct? returnObject;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    idFocusNode?.dispose();
    idController?.dispose();

    emailFocusNode?.dispose();
    emailController?.dispose();

    passwordFocusNode?.dispose();
    passwordController?.dispose();
  }
}
