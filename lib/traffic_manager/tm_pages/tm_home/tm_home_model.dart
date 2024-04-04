import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/shared/shared_components/our_side_nav/our_side_nav_widget.dart';
import '/traffic_manager/tm_components/today_requests_tm/today_requests_tm_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'tm_home_widget.dart' show TmHomeWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
