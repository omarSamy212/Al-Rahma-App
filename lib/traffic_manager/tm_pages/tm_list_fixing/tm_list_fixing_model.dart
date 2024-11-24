import '/flutter_flow/flutter_flow_util.dart';
import 'tm_list_fixing_widget.dart' show TmListFixingWidget;
import 'package:flutter/material.dart';

class TmListFixingModel extends FlutterFlowModel<TmListFixingWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
