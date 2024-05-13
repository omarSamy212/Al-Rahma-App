import '/flutter_flow/flutter_flow_util.dart';
import 'supplier_dashboard_widget.dart' show SupplierDashboardWidget;
import 'package:flutter/material.dart';

class SupplierDashboardModel extends FlutterFlowModel<SupplierDashboardWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
