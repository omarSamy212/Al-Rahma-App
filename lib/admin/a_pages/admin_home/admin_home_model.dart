import '/components/empty_listsimple_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/shared/shared_components/our_side_nav/our_side_nav_widget.dart';
import 'admin_home_widget.dart' show AdminHomeWidget;
import 'package:flutter/material.dart';

class AdminHomeModel extends FlutterFlowModel<AdminHomeWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for our_SideNav component.
  late OurSideNavModel ourSideNavModel;
  // Model for EmptyListsimple component.
  late EmptyListsimpleModel emptyListsimpleModel;

  /// Initialization and disposal methods.

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

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
