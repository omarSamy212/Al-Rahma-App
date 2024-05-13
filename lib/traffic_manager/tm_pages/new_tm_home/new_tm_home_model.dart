import '/flutter_flow/flutter_flow_util.dart';
import '/traffic_manager/shared/shared_components/our_side_nav/our_side_nav_widget.dart';
import 'new_tm_home_widget.dart' show NewTmHomeWidget;
import 'package:flutter/material.dart';

class NewTmHomeModel extends FlutterFlowModel<NewTmHomeWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
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