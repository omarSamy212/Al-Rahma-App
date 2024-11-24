import '/components/sucsses2_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'suc_widget.dart' show SucWidget;
import 'package:flutter/material.dart';

class SucModel extends FlutterFlowModel<SucWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for sucsses_2 component.
  late Sucsses2Model sucsses2Model;

  @override
  void initState(BuildContext context) {
    sucsses2Model = createModel(context, () => Sucsses2Model());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    sucsses2Model.dispose();
  }
}
