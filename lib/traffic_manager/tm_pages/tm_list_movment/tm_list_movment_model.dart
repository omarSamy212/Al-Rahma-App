import '/flutter_flow/flutter_flow_util.dart';
import 'tm_list_movment_widget.dart' show TmListMovmentWidget;
import 'package:flutter/material.dart';

class TmListMovmentModel extends FlutterFlowModel<TmListMovmentWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
