import '/flutter_flow/flutter_flow_util.dart';
import '/traffic_manager/shared/shared_components/our_side_nav/our_side_nav_widget.dart';
import '/traffic_manager/tm_components/today_requests_tm/today_requests_tm_widget.dart';
import 'tm_home_widget.dart' show TmHomeWidget;
import 'package:flutter/material.dart';

class TmHomeModel extends FlutterFlowModel<TmHomeWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for today_requests_tm component.
  late TodayRequestsTmModel todayRequestsTmModel;
  // Model for our_SideNav component.
  late OurSideNavModel ourSideNavModel;

  @override
  void initState(BuildContext context) {
    todayRequestsTmModel = createModel(context, () => TodayRequestsTmModel());
    ourSideNavModel = createModel(context, () => OurSideNavModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    todayRequestsTmModel.dispose();
    ourSideNavModel.dispose();
  }
}
