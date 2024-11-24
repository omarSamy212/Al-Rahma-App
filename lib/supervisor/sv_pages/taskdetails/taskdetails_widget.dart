import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/street_workers_widget.dart';
import '/components/succses_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'taskdetails_model.dart';
export 'taskdetails_model.dart';

class TaskdetailsWidget extends StatefulWidget {
  const TaskdetailsWidget({
    super.key,
    required this.taskDetails,
  });

  final StreetsRecord? taskDetails;

  @override
  State<TaskdetailsWidget> createState() => _TaskdetailsWidgetState();
}

class _TaskdetailsWidgetState extends State<TaskdetailsWidget>
    with TickerProviderStateMixin {
  late TaskdetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TaskdetailsModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Taskdetails'});
    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        setState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

    _model.textualDetailsTextController ??= TextEditingController();
    _model.textualDetailsFocusNode ??= FocusNode();

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: const Offset(0.0, 20.0),
            end: const Offset(0.0, 0.0),
          ),
          TiltEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: const Offset(0.698, 0),
            end: const Offset(0, 0),
          ),
        ],
      ),
      'textOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(60.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'textOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 100.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 100.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 100.0.ms,
            duration: 600.0.ms,
            begin: const Offset(60.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<LeadersRecord>(
      stream: LeadersRecord.getDocument(widget.taskDetails!.leaderRefrence!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: const Center(
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
        final taskdetailsLeadersRecord = snapshot.data!;
        return Title(
            title: 'Taskdetails',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: GestureDetector(
              onTap: () => _model.unfocusNode.canRequestFocus
                  ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                  : FocusScope.of(context).unfocus(),
              child: Scaffold(
                key: scaffoldKey,
                resizeToAvoidBottomInset: false,
                backgroundColor:
                    FlutterFlowTheme.of(context).secondaryBackground,
                appBar: AppBar(
                  backgroundColor: FlutterFlowTheme.of(context).primary,
                  automaticallyImplyLeading: false,
                  leading: FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30.0,
                    borderWidth: 1.0,
                    buttonSize: 60.0,
                    icon: const Icon(
                      Icons.arrow_back_rounded,
                      color: Colors.white,
                      size: 30.0,
                    ),
                    onPressed: () async {
                      logFirebaseEvent(
                          'TASKDETAILS_arrow_back_rounded_ICN_ON_TA');
                      logFirebaseEvent('IconButton_navigate_back');
                      context.pop();
                    },
                  ),
                  title: Text(
                    FFLocalizations.of(context).getText(
                      'tr4gjg97' /* Task Details */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          fontSize: 20.0,
                          letterSpacing: 0.0,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodyMediumFamily),
                        ),
                  ),
                  actions: const [],
                  centerTitle: false,
                  elevation: 2.0,
                ),
                body: SafeArea(
                  top: true,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 4.0, 0.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'h2t8v2p7' /* Daily report on the state of g... */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .labelMediumFamily,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .labelMediumFamily),
                                ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 4.0, 0.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              '7hdqaaok' /* Daily report on the state of g... */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .labelMediumFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .labelMediumFamily),
                                ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: const AlignmentDirectional(0.0, -1.0),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 16.0, 0.0, 12.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              taskdetailsLeadersRecord
                                                  .leaderName,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleLargeFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLargeFamily),
                                                      ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 4.0, 0.0, 0.0),
                                            child: Text(
                                              taskdetailsLeadersRecord
                                                  .leaderOldName,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMediumFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMediumFamily),
                                                      ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(-1.0, 0.0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 4.0, 16.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Container(
                                                    height: 32.0,
                                                    constraints: const BoxConstraints(
                                                      maxHeight: 32.0,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30.0),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      0.0,
                                                                      8.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              FaIcon(
                                                                FontAwesomeIcons
                                                                    .mapPin,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                size: 20.0,
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '7jwop0dm' /* Tasks */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    height: 32.0,
                                                    constraints: const BoxConstraints(
                                                      maxHeight: 32.0,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30.0),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 12.0, 16.0, 0.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  image: DecorationImage(
                                                    fit: BoxFit.fitWidth,
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    image: Image.network(
                                                      '',
                                                    ).image,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    width: 1.0,
                                                  ),
                                                ),
                                                alignment: const AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: SizedBox(
                                                  height: 200.0,
                                                  child: Builder(
                                                      builder: (context) {
                                                    final googleMapMarker = functions
                                                        .convertGeoLocationToLatLon(
                                                            widget.taskDetails!
                                                                .streetLocation);
                                                    return FlutterFlowGoogleMap(
                                                      controller: _model
                                                          .googleMapsController,
                                                      onCameraIdle: (latLng) =>
                                                          _model.googleMapsCenter =
                                                              latLng,
                                                      initialLocation: _model
                                                              .googleMapsCenter ??=
                                                          functions.convertGeoLocationToLatLon(
                                                              widget
                                                                  .taskDetails!
                                                                  .streetLocation),
                                                      markers: [
                                                        FlutterFlowMarker(
                                                          googleMapMarker
                                                              .serialize(),
                                                          googleMapMarker,
                                                          () async {
                                                            logFirebaseEvent(
                                                                'TASKDETAILS_GoogleMap_l54y2gvx_ON_MARKER');
                                                            logFirebaseEvent(
                                                                'GoogleMap_launch_map');
                                                            await launchMap(
                                                              location: _model
                                                                  .googleMapsCenter,
                                                              title: 'الموقع',
                                                            );
                                                          },
                                                        ),
                                                      ],
                                                      markerColor:
                                                          GoogleMarkerColor.red,
                                                      mapType: MapType.normal,
                                                      style: GoogleMapStyle
                                                          .standard,
                                                      initialZoom: 14.0,
                                                      allowInteraction: true,
                                                      allowZoom: true,
                                                      showZoomControls: true,
                                                      showLocation: false,
                                                      showCompass: false,
                                                      showMapToolbar: false,
                                                      showTraffic: false,
                                                      centerMapOnMarkerTap:
                                                          true,
                                                    );
                                                  }),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ).animateOnPageLoad(animationsMap[
                                      'containerOnPageLoadAnimation']!),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 4.0, 0.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'nrty5alo' /* Description */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .labelMediumFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .labelMediumFamily),
                                          ),
                                    ).animateOnPageLoad(animationsMap[
                                        'textOnPageLoadAnimation1']!),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 4.0, 16.0, 20.0),
                                    child: Text(
                                      valueOrDefault<String>(
                                        widget.taskDetails?.streetDescription,
                                        'None',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                    ).animateOnPageLoad(animationsMap[
                                        'textOnPageLoadAnimation2']!),
                                  ),
                                  Divider(
                                    thickness: 1.0,
                                    color: FlutterFlowTheme.of(context).accent4,
                                  ),
                                  wrapWithModel(
                                    model: _model.streetWorkersModel,
                                    updateCallback: () => setState(() {}),
                                    child: StreetWorkersWidget(
                                      streetRef: widget.taskDetails!.reference,
                                      workersList: taskdetailsLeadersRecord
                                          .availableWorkers,
                                      leaderRef:
                                          taskdetailsLeadersRecord.reference,
                                    ),
                                  ),
                                  Divider(
                                    thickness: 1.0,
                                    color: FlutterFlowTheme.of(context).accent4,
                                  ),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(-1.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'TASKDETAILS_PAGE_imageBorder_ON_TAP');
                                              if ((FFAppState()
                                                      .oldImages
                                                      .isNotEmpty) &&
                                                  (functions.getOldImageIndex(
                                                          'taskImage1',
                                                          FFAppState()
                                                              .oldImages
                                                              .toList()) !=
                                                      -1)) {
                                                logFirebaseEvent(
                                                    'imageBorder_custom_action');
                                                await actions.loggerImage(
                                                  FFAppState()
                                                      .oldImages[functions
                                                          .getOldImageIndex(
                                                              'taskImage1',
                                                              FFAppState()
                                                                  .oldImages
                                                                  .toList())]
                                                      .imagePath,
                                                );
                                                logFirebaseEvent(
                                                    'imageBorder_custom_action');
                                                await actions.loggerImage(
                                                  _model.uploadedFileUrl1,
                                                );
                                                if (FFAppState()
                                                        .oldImages[functions
                                                            .getOldImageIndex(
                                                                'taskImage1',
                                                                FFAppState()
                                                                    .oldImages
                                                                    .toList())]
                                                        .imagePath !=
                                                    '') {
                                                  logFirebaseEvent(
                                                      'imageBorder_delete_data');
                                                  await FirebaseStorage.instance
                                                      .refFromURL(FFAppState()
                                                          .oldImages[functions
                                                              .getOldImageIndex(
                                                                  'taskImage1',
                                                                  FFAppState()
                                                                      .oldImages
                                                                      .toList())]
                                                          .imagePath)
                                                      .delete();
                                                }
                                                logFirebaseEvent(
                                                    'imageBorder_update_app_state');
                                                setState(() {
                                                  FFAppState()
                                                      .updateOldImagesAtIndex(
                                                    functions.getOldImageIndex(
                                                        'taskImage1',
                                                        FFAppState()
                                                            .oldImages
                                                            .toList()),
                                                    (e) => e
                                                      ..imagePath = _model
                                                          .uploadedFileUrl1,
                                                  );
                                                });
                                              } else {
                                                logFirebaseEvent(
                                                    'imageBorder_update_app_state');
                                                setState(() {
                                                  FFAppState().addToOldImages(
                                                      ImageOldPathsStruct(
                                                    imagePath:
                                                        _model.uploadedFileUrl1,
                                                    imageID: 'taskImage1',
                                                  ));
                                                });
                                              }

                                              logFirebaseEvent(
                                                  'imageBorder_upload_media_to_firebase');
                                              final selectedMedia =
                                                  await selectMediaWithSourceBottomSheet(
                                                context: context,
                                                allowPhoto: true,
                                              );
                                              if (selectedMedia != null &&
                                                  selectedMedia.every((m) =>
                                                      validateFileFormat(
                                                          m.storagePath,
                                                          context))) {
                                                setState(() => _model
                                                    .isDataUploading1 = true);
                                                var selectedUploadedFiles =
                                                    <FFUploadedFile>[];

                                                var downloadUrls = <String>[];
                                                try {
                                                  showUploadMessage(
                                                    context,
                                                    'Uploading file...',
                                                    showLoading: true,
                                                  );
                                                  selectedUploadedFiles =
                                                      selectedMedia
                                                          .map((m) =>
                                                              FFUploadedFile(
                                                                name: m
                                                                    .storagePath
                                                                    .split('/')
                                                                    .last,
                                                                bytes: m.bytes,
                                                                height: m
                                                                    .dimensions
                                                                    ?.height,
                                                                width: m
                                                                    .dimensions
                                                                    ?.width,
                                                                blurHash:
                                                                    m.blurHash,
                                                              ))
                                                          .toList();

                                                  downloadUrls =
                                                      (await Future.wait(
                                                    selectedMedia.map(
                                                      (m) async =>
                                                          await uploadData(
                                                              m.storagePath,
                                                              m.bytes),
                                                    ),
                                                  ))
                                                          .where(
                                                              (u) => u != null)
                                                          .map((u) => u!)
                                                          .toList();
                                                } finally {
                                                  ScaffoldMessenger.of(context)
                                                      .hideCurrentSnackBar();
                                                  _model.isDataUploading1 =
                                                      false;
                                                }
                                                if (selectedUploadedFiles
                                                            .length ==
                                                        selectedMedia.length &&
                                                    downloadUrls.length ==
                                                        selectedMedia.length) {
                                                  setState(() {
                                                    _model.uploadedLocalFile1 =
                                                        selectedUploadedFiles
                                                            .first;
                                                    _model.uploadedFileUrl1 =
                                                        downloadUrls.first;
                                                  });
                                                  showUploadMessage(
                                                      context, 'Success!');
                                                } else {
                                                  setState(() {});
                                                  showUploadMessage(context,
                                                      'Failed to upload data');
                                                  return;
                                                }
                                              }
                                            },
                                            child: Container(
                                              width: 100.0,
                                              height: 100.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent1,
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                                shape: BoxShape.rectangle,
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 2.0,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(2.0),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  child: Image.network(
                                                    _model.uploadedFileUrl1 !=
                                                                ''
                                                        ? _model
                                                            .uploadedFileUrl1
                                                        : 'https://picsum.photos/seed/123/600',
                                                    width: 300.0,
                                                    height: 200.0,
                                                    fit: BoxFit.cover,
                                                    alignment:
                                                        const Alignment(-1.0, -1.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(-1.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'TASKDETAILS_PAGE_imageBorder_ON_TAP');
                                              if ((FFAppState()
                                                      .oldImages
                                                      .isNotEmpty) &&
                                                  (functions.getOldImageIndex(
                                                          'taskImage2',
                                                          FFAppState()
                                                              .oldImages
                                                              .toList()) !=
                                                      -1)) {
                                                logFirebaseEvent(
                                                    'imageBorder_custom_action');
                                                await actions.loggerImage(
                                                  FFAppState()
                                                      .oldImages[functions
                                                          .getOldImageIndex(
                                                              'taskImage2',
                                                              FFAppState()
                                                                  .oldImages
                                                                  .toList())]
                                                      .imagePath,
                                                );
                                                logFirebaseEvent(
                                                    'imageBorder_custom_action');
                                                await actions.loggerImage(
                                                  _model.uploadedFileUrl2,
                                                );
                                                if (FFAppState()
                                                        .oldImages[functions
                                                            .getOldImageIndex(
                                                                'taskImage2',
                                                                FFAppState()
                                                                    .oldImages
                                                                    .toList())]
                                                        .imagePath !=
                                                    '') {
                                                  logFirebaseEvent(
                                                      'imageBorder_delete_data');
                                                  await FirebaseStorage.instance
                                                      .refFromURL(FFAppState()
                                                          .oldImages[functions
                                                              .getOldImageIndex(
                                                                  'taskImage2',
                                                                  FFAppState()
                                                                      .oldImages
                                                                      .toList())]
                                                          .imagePath)
                                                      .delete();
                                                }
                                                logFirebaseEvent(
                                                    'imageBorder_update_app_state');
                                                setState(() {
                                                  FFAppState()
                                                      .updateOldImagesAtIndex(
                                                    functions.getOldImageIndex(
                                                        'taskImage2',
                                                        FFAppState()
                                                            .oldImages
                                                            .toList()),
                                                    (e) => e
                                                      ..imagePath = _model
                                                          .uploadedFileUrl2,
                                                  );
                                                });
                                              } else {
                                                logFirebaseEvent(
                                                    'imageBorder_update_app_state');
                                                setState(() {
                                                  FFAppState().addToOldImages(
                                                      ImageOldPathsStruct(
                                                    imagePath:
                                                        _model.uploadedFileUrl2,
                                                    imageID: 'taskImage2',
                                                  ));
                                                });
                                              }

                                              logFirebaseEvent(
                                                  'imageBorder_upload_media_to_firebase');
                                              final selectedMedia =
                                                  await selectMediaWithSourceBottomSheet(
                                                context: context,
                                                allowPhoto: true,
                                              );
                                              if (selectedMedia != null &&
                                                  selectedMedia.every((m) =>
                                                      validateFileFormat(
                                                          m.storagePath,
                                                          context))) {
                                                setState(() => _model
                                                    .isDataUploading2 = true);
                                                var selectedUploadedFiles =
                                                    <FFUploadedFile>[];

                                                var downloadUrls = <String>[];
                                                try {
                                                  showUploadMessage(
                                                    context,
                                                    'Uploading file...',
                                                    showLoading: true,
                                                  );
                                                  selectedUploadedFiles =
                                                      selectedMedia
                                                          .map((m) =>
                                                              FFUploadedFile(
                                                                name: m
                                                                    .storagePath
                                                                    .split('/')
                                                                    .last,
                                                                bytes: m.bytes,
                                                                height: m
                                                                    .dimensions
                                                                    ?.height,
                                                                width: m
                                                                    .dimensions
                                                                    ?.width,
                                                                blurHash:
                                                                    m.blurHash,
                                                              ))
                                                          .toList();

                                                  downloadUrls =
                                                      (await Future.wait(
                                                    selectedMedia.map(
                                                      (m) async =>
                                                          await uploadData(
                                                              m.storagePath,
                                                              m.bytes),
                                                    ),
                                                  ))
                                                          .where(
                                                              (u) => u != null)
                                                          .map((u) => u!)
                                                          .toList();
                                                } finally {
                                                  ScaffoldMessenger.of(context)
                                                      .hideCurrentSnackBar();
                                                  _model.isDataUploading2 =
                                                      false;
                                                }
                                                if (selectedUploadedFiles
                                                            .length ==
                                                        selectedMedia.length &&
                                                    downloadUrls.length ==
                                                        selectedMedia.length) {
                                                  setState(() {
                                                    _model.uploadedLocalFile2 =
                                                        selectedUploadedFiles
                                                            .first;
                                                    _model.uploadedFileUrl2 =
                                                        downloadUrls.first;
                                                  });
                                                  showUploadMessage(
                                                      context, 'Success!');
                                                } else {
                                                  setState(() {});
                                                  showUploadMessage(context,
                                                      'Failed to upload data');
                                                  return;
                                                }
                                              }
                                            },
                                            child: Container(
                                              width: 100.0,
                                              height: 100.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent1,
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                                shape: BoxShape.rectangle,
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 2.0,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(2.0),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  child: Image.network(
                                                    _model.uploadedFileUrl2 !=
                                                                ''
                                                        ? _model
                                                            .uploadedFileUrl2
                                                        : 'https://picsum.photos/seed/123/600',
                                                    width: 300.0,
                                                    height: 200.0,
                                                    fit: BoxFit.cover,
                                                    alignment:
                                                        const Alignment(-1.0, -1.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(-1.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'TASKDETAILS_PAGE_imageBorder_ON_TAP');
                                              if ((FFAppState()
                                                      .oldImages
                                                      .isNotEmpty) &&
                                                  (functions.getOldImageIndex(
                                                          'taskImage3',
                                                          FFAppState()
                                                              .oldImages
                                                              .toList()) !=
                                                      -1)) {
                                                logFirebaseEvent(
                                                    'imageBorder_custom_action');
                                                await actions.loggerImage(
                                                  FFAppState()
                                                      .oldImages[functions
                                                          .getOldImageIndex(
                                                              'taskImage3',
                                                              FFAppState()
                                                                  .oldImages
                                                                  .toList())]
                                                      .imagePath,
                                                );
                                                logFirebaseEvent(
                                                    'imageBorder_custom_action');
                                                await actions.loggerImage(
                                                  _model.uploadedFileUrl3,
                                                );
                                                if (FFAppState()
                                                        .oldImages[functions
                                                            .getOldImageIndex(
                                                                'taskImage3',
                                                                FFAppState()
                                                                    .oldImages
                                                                    .toList())]
                                                        .imagePath !=
                                                    '') {
                                                  logFirebaseEvent(
                                                      'imageBorder_delete_data');
                                                  await FirebaseStorage.instance
                                                      .refFromURL(FFAppState()
                                                          .oldImages[functions
                                                              .getOldImageIndex(
                                                                  'taskImage3',
                                                                  FFAppState()
                                                                      .oldImages
                                                                      .toList())]
                                                          .imagePath)
                                                      .delete();
                                                }
                                                logFirebaseEvent(
                                                    'imageBorder_update_app_state');
                                                setState(() {
                                                  FFAppState()
                                                      .updateOldImagesAtIndex(
                                                    functions.getOldImageIndex(
                                                        'taskImage3',
                                                        FFAppState()
                                                            .oldImages
                                                            .toList()),
                                                    (e) => e
                                                      ..imagePath = _model
                                                          .uploadedFileUrl3,
                                                  );
                                                });
                                              } else {
                                                logFirebaseEvent(
                                                    'imageBorder_update_app_state');
                                                setState(() {
                                                  FFAppState().addToOldImages(
                                                      ImageOldPathsStruct(
                                                    imagePath:
                                                        _model.uploadedFileUrl3,
                                                    imageID: 'taskImage3',
                                                  ));
                                                });
                                              }

                                              logFirebaseEvent(
                                                  'imageBorder_upload_media_to_firebase');
                                              final selectedMedia =
                                                  await selectMediaWithSourceBottomSheet(
                                                context: context,
                                                allowPhoto: true,
                                              );
                                              if (selectedMedia != null &&
                                                  selectedMedia.every((m) =>
                                                      validateFileFormat(
                                                          m.storagePath,
                                                          context))) {
                                                setState(() => _model
                                                    .isDataUploading3 = true);
                                                var selectedUploadedFiles =
                                                    <FFUploadedFile>[];

                                                var downloadUrls = <String>[];
                                                try {
                                                  showUploadMessage(
                                                    context,
                                                    'Uploading file...',
                                                    showLoading: true,
                                                  );
                                                  selectedUploadedFiles =
                                                      selectedMedia
                                                          .map((m) =>
                                                              FFUploadedFile(
                                                                name: m
                                                                    .storagePath
                                                                    .split('/')
                                                                    .last,
                                                                bytes: m.bytes,
                                                                height: m
                                                                    .dimensions
                                                                    ?.height,
                                                                width: m
                                                                    .dimensions
                                                                    ?.width,
                                                                blurHash:
                                                                    m.blurHash,
                                                              ))
                                                          .toList();

                                                  downloadUrls =
                                                      (await Future.wait(
                                                    selectedMedia.map(
                                                      (m) async =>
                                                          await uploadData(
                                                              m.storagePath,
                                                              m.bytes),
                                                    ),
                                                  ))
                                                          .where(
                                                              (u) => u != null)
                                                          .map((u) => u!)
                                                          .toList();
                                                } finally {
                                                  ScaffoldMessenger.of(context)
                                                      .hideCurrentSnackBar();
                                                  _model.isDataUploading3 =
                                                      false;
                                                }
                                                if (selectedUploadedFiles
                                                            .length ==
                                                        selectedMedia.length &&
                                                    downloadUrls.length ==
                                                        selectedMedia.length) {
                                                  setState(() {
                                                    _model.uploadedLocalFile3 =
                                                        selectedUploadedFiles
                                                            .first;
                                                    _model.uploadedFileUrl3 =
                                                        downloadUrls.first;
                                                  });
                                                  showUploadMessage(
                                                      context, 'Success!');
                                                } else {
                                                  setState(() {});
                                                  showUploadMessage(context,
                                                      'Failed to upload data');
                                                  return;
                                                }
                                              }
                                            },
                                            child: Container(
                                              width: 100.0,
                                              height: 100.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent1,
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                                shape: BoxShape.rectangle,
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 2.0,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(2.0),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  child: Image.network(
                                                    _model.uploadedFileUrl3 !=
                                                                ''
                                                        ? _model
                                                            .uploadedFileUrl3
                                                        : 'https://picsum.photos/seed/123/600',
                                                    width: 300.0,
                                                    height: 200.0,
                                                    fit: BoxFit.cover,
                                                    alignment:
                                                        const Alignment(-1.0, -1.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]
                                          .divide(const SizedBox(width: 12.0))
                                          .addToStart(const SizedBox(width: 24.0))
                                          .addToEnd(const SizedBox(width: 24.0)),
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(1.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 4.0, 20.0, 0.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'fa6nvb27' /* Maximum 3 img/jpg */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
                                            ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        10.0, 17.0, 10.0, 12.0),
                                    child: TextFormField(
                                      controller:
                                          _model.textualDetailsTextController,
                                      focusNode: _model.textualDetailsFocusNode,
                                      autofocus: true,
                                      textCapitalization:
                                          TextCapitalization.sentences,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Plus Jakarta Sans',
                                              color: const Color(0xFF57636C),
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          'Plus Jakarta Sans'),
                                            ),
                                        hintText:
                                            FFLocalizations.of(context).getText(
                                          't3wwkofo' /* Details... */,
                                        ),
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Plus Jakarta Sans',
                                              color: const Color(0xFF57636C),
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          'Plus Jakarta Sans'),
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0xFFE0E3E7),
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0xFF4B39EF),
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0xFFFF5963),
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0xFFFF5963),
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        filled: true,
                                        fillColor: Colors.white,
                                        contentPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                20.0, 24.0, 0.0, 24.0),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .labelLargeFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .labelLargeFamily),
                                          ),
                                      textAlign: TextAlign.start,
                                      maxLines: 3,
                                      maxLength: 500,
                                      maxLengthEnforcement:
                                          MaxLengthEnforcement.enforced,
                                      validator: _model
                                          .textualDetailsTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                  if (!(isWeb
                                      ? MediaQuery.viewInsetsOf(context)
                                              .bottom >
                                          0
                                      : _isKeyboardVisible))
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 30.0, 16.0, 60.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'TASKDETAILS_PAGE_SUBMIT_BTN_ON_TAP');
                                          var shouldSetState = false;
                                          await Future.wait([
                                            Future(() async {
                                              if ((FFAppState()
                                                      .oldImages
                                                      .isNotEmpty) &&
                                                  (functions
                                                          .getOldImageIndex(
                                                              'taskImage1',
                                                              FFAppState()
                                                                  .oldImages
                                                                  .toList())
                                                          .toString() !=
                                                      '-1')) {
                                                if (FFAppState()
                                                        .oldImages[functions
                                                            .getOldImageIndex(
                                                                'taskImage1',
                                                                FFAppState()
                                                                    .oldImages
                                                                    .toList())]
                                                        .imagePath !=
                                                    '') {
                                                  logFirebaseEvent(
                                                      'Button_delete_data');
                                                  await FirebaseStorage.instance
                                                      .refFromURL(FFAppState()
                                                          .oldImages[functions
                                                              .getOldImageIndex(
                                                                  'taskImage1',
                                                                  FFAppState()
                                                                      .oldImages
                                                                      .toList())]
                                                          .imagePath)
                                                      .delete();
                                                }
                                              }
                                            }),
                                            Future(() async {
                                              if ((FFAppState()
                                                      .oldImages
                                                      .isNotEmpty) &&
                                                  (functions
                                                          .getOldImageIndex(
                                                              'taskImage2',
                                                              FFAppState()
                                                                  .oldImages
                                                                  .toList())
                                                          .toString() !=
                                                      '-1')) {
                                                if (FFAppState()
                                                        .oldImages[functions
                                                            .getOldImageIndex(
                                                                'taskImage2',
                                                                FFAppState()
                                                                    .oldImages
                                                                    .toList())]
                                                        .imagePath !=
                                                    '') {
                                                  logFirebaseEvent(
                                                      'Button_delete_data');
                                                  await FirebaseStorage.instance
                                                      .refFromURL(FFAppState()
                                                          .oldImages[functions
                                                              .getOldImageIndex(
                                                                  'taskImage2',
                                                                  FFAppState()
                                                                      .oldImages
                                                                      .toList())]
                                                          .imagePath)
                                                      .delete();
                                                }
                                              }
                                            }),
                                            Future(() async {
                                              if ((FFAppState()
                                                      .oldImages
                                                      .isNotEmpty) &&
                                                  (functions
                                                          .getOldImageIndex(
                                                              'taskImage3',
                                                              FFAppState()
                                                                  .oldImages
                                                                  .toList())
                                                          .toString() !=
                                                      '-1')) {
                                                if (FFAppState()
                                                        .oldImages[functions
                                                            .getOldImageIndex(
                                                                'taskImage3',
                                                                FFAppState()
                                                                    .oldImages
                                                                    .toList())]
                                                        .imagePath !=
                                                    '') {
                                                  logFirebaseEvent(
                                                      'Button_delete_data');
                                                  await FirebaseStorage.instance
                                                      .refFromURL(FFAppState()
                                                          .oldImages[functions
                                                              .getOldImageIndex(
                                                                  'taskImage3',
                                                                  FFAppState()
                                                                      .oldImages
                                                                      .toList())]
                                                          .imagePath)
                                                      .delete();
                                                }
                                              }
                                            }),
                                          ]);
                                          logFirebaseEvent(
                                              'Button_custom_action');
                                          _model.streetTaskCreation =
                                              await actions.createStreetTask(
                                            currentUserDocument!.userRefrence!,
                                            widget.taskDetails!.reference,
                                            _model.textualDetailsTextController
                                                .text,
                                            _model.uploadedFileUrl1,
                                            _model.uploadedFileUrl2,
                                            _model.uploadedFileUrl3,
                                          );
                                          shouldSetState = true;
                                          if (_model.streetTaskCreation!) {
                                            logFirebaseEvent(
                                                'Button_bottom_sheet');
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              isDismissible: false,
                                              enableDrag: false,
                                              context: context,
                                              builder: (context) {
                                                return GestureDetector(
                                                  onTap: () => _model
                                                          .unfocusNode
                                                          .canRequestFocus
                                                      ? FocusScope.of(context)
                                                          .requestFocus(_model
                                                              .unfocusNode)
                                                      : FocusScope.of(context)
                                                          .unfocus(),
                                                  child: Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child: SizedBox(
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          1.0,
                                                      child: SuccsesWidget(
                                                        successesMessage:
                                                            'تم بنجاح تقديم المهمه',
                                                        yesButtonText:
                                                            'رفع مهمه اخري',
                                                        cancelButtonText: 'تم',
                                                        yesButtonAction:
                                                            () async {
                                                          logFirebaseEvent(
                                                              '_navigate_to');

                                                          context.pushNamed(
                                                              'tasksTracker');
                                                        },
                                                        cancelButtonAction:
                                                            () async {
                                                          logFirebaseEvent(
                                                              '_navigate_to');

                                                          context.pushNamed(
                                                              'supervisor_home');
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));

                                            if (shouldSetState) {
                                              setState(() {});
                                            }
                                            return;
                                          } else {
                                            if (shouldSetState) {
                                              setState(() {});
                                            }
                                            return;
                                          }

                                          if (shouldSetState) setState(() {});
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'pk9qzrbg' /* submit */,
                                        ),
                                        options: FFButtonOptions(
                                          width: double.infinity,
                                          height: 60.0,
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleMedium
                                                  .override(
                                                    fontFamily:
                                                        'Plus Jakarta Sans',
                                                    color: Colors.white,
                                                    fontSize: 18.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    useGoogleFonts: GoogleFonts
                                                            .asMap()
                                                        .containsKey(
                                                            'Plus Jakarta Sans'),
                                                  ),
                                          elevation: 4.0,
                                          borderSide: const BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }
}
