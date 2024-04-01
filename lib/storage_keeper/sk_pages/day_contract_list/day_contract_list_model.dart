import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/shared/shared_components/our_side_nav/our_side_nav_widget.dart';
import '/storage_keeper/sk_components/daily_ordar/daily_ordar_widget.dart';
import '/storage_keeper/sk_components/todays_requests_dashboard/todays_requests_dashboard_widget.dart';
import 'day_contract_list_widget.dart' show DayContractListWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DayContractListModel extends FlutterFlowModel<DayContractListWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for TodaysRequests_Dashboard component.
  late TodaysRequestsDashboardModel todaysRequestsDashboardModel;
  // Model for DAILY_ORDAR component.
  late DailyOrdarModel dailyOrdarModel;
  // Model for our_SideNav component.
  late OurSideNavModel ourSideNavModel;

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
}
