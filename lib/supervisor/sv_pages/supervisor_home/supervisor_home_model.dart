import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/traffic_manager/shared/shared_components/our_side_nav/our_side_nav_widget.dart';
import 'supervisor_home_widget.dart' show SupervisorHomeWidget;
import 'package:flutter/material.dart';

class SupervisorHomeModel extends FlutterFlowModel<SupervisorHomeWidget> {
  ///  Local state fields for this page.

  int? count = 0;

  List<StreetsRecord> streets = [];
  void addToStreets(StreetsRecord item) => streets.add(item);
  void removeFromStreets(StreetsRecord item) => streets.remove(item);
  void removeAtIndexFromStreets(int index) => streets.removeAt(index);
  void insertAtIndexInStreets(int index, StreetsRecord item) =>
      streets.insert(index, item);
  void updateStreetsAtIndex(int index, Function(StreetsRecord) updateFn) =>
      streets[index] = updateFn(streets[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Read Document] action in supervisor_home widget.
  UsersRecord? userDoc;
  // Stores action output result for [Backend Call - Read Document] action in supervisor_home widget.
  LeadersRecord? supervisorLeader;
  // Stores action output result for [Backend Call - Read Document] action in supervisor_home widget.
  StreetsRecord? street;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
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
