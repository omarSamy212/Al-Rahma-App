import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'show_full_map_model.dart';
export 'show_full_map_model.dart';

class ShowFullMapWidget extends StatefulWidget {
  const ShowFullMapWidget({
    super.key,
    required this.locations,
  });

  final List<LatLng>? locations;

  @override
  State<ShowFullMapWidget> createState() => _ShowFullMapWidgetState();
}

class _ShowFullMapWidgetState extends State<ShowFullMapWidget> {
  late ShowFullMapModel _model;

  LatLng? currentUserLocationValue;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ShowFullMapModel());

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
            markers: (widget.locations ?? [])
                .map(
                  (marker) => FlutterFlowMarker(
                    marker.serialize(),
                    marker,
                  ),
                )
                .toList(),
            markerColor: GoogleMarkerColor.green,
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
          Align(
            alignment: const AlignmentDirectional(1.0, -1.0),
            child: PointerInterceptor(
              intercepting: isWeb,
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(25.0, 25.0, 25.0, 25.0),
                child: FlutterFlowIconButton(
                  borderColor: FlutterFlowTheme.of(context).secondaryText,
                  borderRadius: 8.0,
                  borderWidth: 1.0,
                  buttonSize: 40.0,
                  fillColor: FlutterFlowTheme.of(context).alternate,
                  icon: Icon(
                    Icons.clear,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 24.0,
                  ),
                  onPressed: () async {
                    logFirebaseEvent('SHOW_FULL_MAP_COMP_ADD_trans_ON_TAP');
                    logFirebaseEvent('ADD_trans_bottom_sheet');
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
