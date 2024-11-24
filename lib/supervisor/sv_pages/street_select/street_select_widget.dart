import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'street_select_model.dart';
export 'street_select_model.dart';

class StreetSelectWidget extends StatefulWidget {
  const StreetSelectWidget({
    super.key,
    required this.selectStreet,
    required this.streets,
  });

  final Future Function(DocumentReference? streetRefrence)? selectStreet;
  final List<StreetsRecord>? streets;

  @override
  State<StreetSelectWidget> createState() => _StreetSelectWidgetState();
}

class _StreetSelectWidgetState extends State<StreetSelectWidget> {
  late StreetSelectModel _model;

  LatLng? currentUserLocationValue;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StreetSelectModel());

    getCurrentUserLocation(defaultLocation: const LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: const Center(
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: SpinKitDualRing(
              color: Color(0xFF0CA256),
              size: 50.0,
            ),
          ),
        ),
      );
    }

    return SizedBox(
      height: double.infinity,
      child: Stack(
        children: [
          FlutterFlowGoogleMap(
            controller: _model.googleMapsController,
            onCameraIdle: (latLng) =>
                setState(() => _model.googleMapsCenter = latLng),
            initialLocation: _model.googleMapsCenter ??=
                currentUserLocationValue!,
            markers: functions
                .convertGeoListToLatLon(widget.streets!.toList())
                .map(
                  (marker) => FlutterFlowMarker(
                    marker.serialize(),
                    marker,
                    () async {
                      logFirebaseEvent(
                          'STREET_SELECT_GoogleMap_awzocmoh_ON_MARK');
                      logFirebaseEvent('GoogleMap_custom_action');
                      await actions.logger(
                        'marker tapped',
                      );
                      logFirebaseEvent('GoogleMap_execute_callback');
                      await widget.selectStreet?.call(
                        widget.streets
                            ?.where((e) => functions.compareLatLng(
                                _model.googleMapsCenter!,
                                functions.convertGeoLocationToLatLon(
                                    e.streetLocation)))
                            .toList()
                            .first
                            .reference,
                      );
                    },
                  ),
                )
                .toList(),
            markerColor: GoogleMarkerColor.red,
            mapType: MapType.normal,
            style: GoogleMapStyle.standard,
            initialZoom: 14.0,
            allowInteraction: true,
            allowZoom: true,
            showZoomControls: false,
            showLocation: true,
            showCompass: false,
            showMapToolbar: true,
            showTraffic: false,
            centerMapOnMarkerTap: true,
          ),
        ],
      ),
    );
  }
}
