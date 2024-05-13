import '/flutter_flow/flutter_flow_util.dart';
import '/traffic_manager/shared/shared_components/our_side_nav/our_side_nav_widget.dart';
import 'worker_home_widget.dart' show WorkerHomeWidget;
import 'package:flutter/material.dart';

class WorkerHomeModel extends FlutterFlowModel<WorkerHomeWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for our_SideNav component.
  late OurSideNavModel ourSideNavModel;

  @override
  void initState(BuildContext context) {
    ourSideNavModel = createModel(context, () => OurSideNavModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    ourSideNavModel.dispose();
  }
}
