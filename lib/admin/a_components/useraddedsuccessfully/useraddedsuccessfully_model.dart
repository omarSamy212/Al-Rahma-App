import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'useraddedsuccessfully_widget.dart' show UseraddedsuccessfullyWidget;
import 'package:flutter/material.dart';

class UseraddedsuccessfullyModel
    extends FlutterFlowModel<UseraddedsuccessfullyWidget> {
  ///  Local state fields for this component.

  List<ArrayOfToolsStruct> reqTools = [];
  void addToReqTools(ArrayOfToolsStruct item) => reqTools.add(item);
  void removeFromReqTools(ArrayOfToolsStruct item) => reqTools.remove(item);
  void removeAtIndexFromReqTools(int index) => reqTools.removeAt(index);
  void insertAtIndexInReqTools(int index, ArrayOfToolsStruct item) =>
      reqTools.insert(index, item);
  void updateReqToolsAtIndex(
          int index, Function(ArrayOfToolsStruct) updateFn) =>
      reqTools[index] = updateFn(reqTools[index]);

  int? counter = 0;

  ///  State fields for stateful widgets in this component.

  // State field(s) for Name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameController;
  String? Function(BuildContext, String?)? nameControllerValidator;
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

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameController?.dispose();

    idFocusNode?.dispose();
    idController?.dispose();

    emailFocusNode?.dispose();
    emailController?.dispose();

    passwordFocusNode?.dispose();
    passwordController?.dispose();
  }
}
