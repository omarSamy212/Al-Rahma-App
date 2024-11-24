import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'sv_map_widget.dart' show SvMapWidget;
import 'package:flutter/material.dart';

class SvMapModel extends FlutterFlowModel<SvMapWidget> {
  ///  Local state fields for this page.

  List<DocumentReference> availableWorkers = [];
  void addToAvailableWorkers(DocumentReference item) =>
      availableWorkers.add(item);
  void removeFromAvailableWorkers(DocumentReference item) =>
      availableWorkers.remove(item);
  void removeAtIndexFromAvailableWorkers(int index) =>
      availableWorkers.removeAt(index);
  void insertAtIndexInAvailableWorkers(int index, DocumentReference item) =>
      availableWorkers.insert(index, item);
  void updateAvailableWorkersAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      availableWorkers[index] = updateFn(availableWorkers[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
