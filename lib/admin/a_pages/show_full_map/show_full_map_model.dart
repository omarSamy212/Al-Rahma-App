import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'show_full_map_widget.dart' show ShowFullMapWidget;
import 'package:flutter/material.dart';

class ShowFullMapModel extends FlutterFlowModel<ShowFullMapWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}