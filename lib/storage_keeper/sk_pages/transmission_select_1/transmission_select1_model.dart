import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/storage_keeper/sk_components/tool_item/tool_item_widget.dart';
import 'package:badges/badges.dart' as badges;
import 'transmission_select1_widget.dart' show TransmissionSelect1Widget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
}
