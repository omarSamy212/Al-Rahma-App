import '/backend/backend.dart';
import '/components/empty_listsimple_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/shared/shared_components/our_side_nav/our_side_nav_widget.dart';
import 'admin_home_widget.dart' show AdminHomeWidget;
import 'package:badges/badges.dart' as badges;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class AdminHomeModel extends FlutterFlowModel<AdminHomeWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for our_SideNav component.
  late OurSideNavModel ourSideNavModel;
  // Model for EmptyListsimple component.
  late EmptyListsimpleModel emptyListsimpleModel;

  @override
  void initState(BuildContext context) {
    ourSideNavModel = createModel(context, () => OurSideNavModel());
    emptyListsimpleModel = createModel(context, () => EmptyListsimpleModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    ourSideNavModel.dispose();
    emptyListsimpleModel.dispose();
  }
}
