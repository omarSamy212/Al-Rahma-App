import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'location_picker_model.dart';
export 'location_picker_model.dart';

class LocationPickerWidget extends StatefulWidget {
  const LocationPickerWidget({
    super.key,
    required this.setLonLan,
  });

  final Future Function(String? lanLon)? setLonLan;

  @override
  State<LocationPickerWidget> createState() => _LocationPickerWidgetState();
}

class _LocationPickerWidgetState extends State<LocationPickerWidget> {
  late LocationPickerModel _model;

  LatLng? currentUserLocationValue;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LocationPickerModel());

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
          Align(
            alignment: const AlignmentDirectional(0.0, -0.05),
            child: PointerInterceptor(
              intercepting: isWeb,
              child: Icon(
                Icons.location_on,
                color: FlutterFlowTheme.of(context).primary,
                size: 50.0,
              ),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0.0, 0.9),
            child: PointerInterceptor(
              intercepting: isWeb,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 0.8,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).primary,
                          width: 2.0,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          _model.googleMapsCenter!.toString(),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                fontSize: 10.0,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                        ),
                      ),
                    ),
                  ),
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 50.0,
                    borderWidth: 1.0,
                    buttonSize: 70.0,
                    icon: Icon(
                      Icons.add_circle,
                      color: FlutterFlowTheme.of(context).primary,
                      size: 50.0,
                    ),
                    onPressed: () async {
                      logFirebaseEvent('LOCATION_PICKER_add_circle_ICN_ON_TAP');
                      logFirebaseEvent('IconButton_execute_callback');
                      await widget.setLonLan?.call(
                        functions.formatCoordinates(
                            _model.googleMapsCenter!.toString()),
                      );
                      logFirebaseEvent('IconButton_bottom_sheet');
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
