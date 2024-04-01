import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/shared/shared_components/our_side_nav/our_side_nav_widget.dart';
import '/storage_keeper/sk_components/todays_requests_dashboard/todays_requests_dashboard_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'storekeeper_home_widget.dart' show StorekeeperHomeWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class StorekeeperHomeModel extends FlutterFlowModel<StorekeeperHomeWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for TodaysRequests_Dashboard component.
  late TodaysRequestsDashboardModel todaysRequestsDashboardModel;
  // Model for our_SideNav component.
  late OurSideNavModel ourSideNavModel;

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
}
