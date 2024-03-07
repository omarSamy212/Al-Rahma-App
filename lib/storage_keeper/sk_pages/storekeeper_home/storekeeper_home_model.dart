import '/flutter_flow/flutter_flow_util.dart';
import '/shared/shared_components/our_side_nav/our_side_nav_widget.dart';
import '/storage_keeper/sk_components/todays_requests_dashboard/todays_requests_dashboard_widget.dart';
import 'storekeeper_home_widget.dart' show StorekeeperHomeWidget;
import 'package:flutter/material.dart';

class StorekeeperHomeModel extends FlutterFlowModel<StorekeeperHomeWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for TodaysRequests_Dashboard component.
  late TodaysRequestsDashboardModel todaysRequestsDashboardModel;
  // Model for our_SideNav component.
  late OurSideNavModel ourSideNavModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    todaysRequestsDashboardModel =
        createModel(context, () => TodaysRequestsDashboardModel());
    ourSideNavModel = createModel(context, () => OurSideNavModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    todaysRequestsDashboardModel.dispose();
    ourSideNavModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
