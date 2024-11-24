import '/flutter_flow/flutter_flow_util.dart';
import 'dash2_widget.dart' show Dash2Widget;
import 'package:flutter/material.dart';

class Dash2Model extends FlutterFlowModel<Dash2Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
