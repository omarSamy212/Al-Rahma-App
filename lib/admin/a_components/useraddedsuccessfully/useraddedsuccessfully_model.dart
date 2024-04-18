import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'useraddedsuccessfully_widget.dart' show UseraddedsuccessfullyWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
