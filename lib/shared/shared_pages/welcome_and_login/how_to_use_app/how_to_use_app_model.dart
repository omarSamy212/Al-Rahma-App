import '/flutter_flow/flutter_flow_util.dart';
import 'how_to_use_app_widget.dart' show HowToUseAppWidget;
import 'package:flutter/material.dart';

class HowToUseAppModel extends FlutterFlowModel<HowToUseAppWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
