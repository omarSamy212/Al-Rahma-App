import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/storage_keeper/sk_components/tool_item/tool_item_widget.dart';
import 'transmission_select1_widget.dart' show TransmissionSelect1Widget;
import 'package:flutter/material.dart';

class TransmissionSelect1Model
    extends FlutterFlowModel<TransmissionSelect1Widget> {
  ///  Local state fields for this page.

  ArrayOfToolsStruct? selectedTools;
  void updateSelectedToolsStruct(Function(ArrayOfToolsStruct) updateFn) =>
      updateFn(selectedTools ??= ArrayOfToolsStruct());

  int? numOfItems = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Models for toolItem dynamic component.
  late FlutterFlowDynamicModels<ToolItemModel> toolItemModels;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    toolItemModels = FlutterFlowDynamicModels(() => ToolItemModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    toolItemModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
