import '/flutter_flow/flutter_flow_util.dart';
import '/shared/shared_components/our_side_nav/our_side_nav_widget.dart';
import '/storage_keeper/sk_components/daily_ordar/daily_ordar_widget.dart';
import '/storage_keeper/sk_components/todays_requests_dashboard/todays_requests_dashboard_widget.dart';
import 'day_contract_list_widget.dart' show DayContractListWidget;
import 'package:flutter/material.dart';

class DayContractListModel extends FlutterFlowModel<DayContractListWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for TodaysRequests_Dashboard component.
  late TodaysRequestsDashboardModel todaysRequestsDashboardModel;
  // Model for DAILY_ORDAR component.
  late DailyOrdarModel dailyOrdarModel;
  // Model for our_SideNav component.
  late OurSideNavModel ourSideNavModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    todaysRequestsDashboardModel =
        createModel(context, () => TodaysRequestsDashboardModel());
    dailyOrdarModel = createModel(context, () => DailyOrdarModel());
    ourSideNavModel = createModel(context, () => OurSideNavModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    todaysRequestsDashboardModel.dispose();
    dailyOrdarModel.dispose();
    ourSideNavModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
