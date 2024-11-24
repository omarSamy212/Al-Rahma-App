import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/succses_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'submitting_complaints_model.dart';
export 'submitting_complaints_model.dart';

class SubmittingComplaintsWidget extends StatefulWidget {
  const SubmittingComplaintsWidget({
    super.key,
    required this.userReported,
  });

  final DocumentReference? userReported;

  @override
  State<SubmittingComplaintsWidget> createState() =>
      _SubmittingComplaintsWidgetState();
}

class _SubmittingComplaintsWidgetState
    extends State<SubmittingComplaintsWidget> {
  late SubmittingComplaintsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SubmittingComplaintsModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'Submitting_complaints'});
    _model.textualDetailsTextController ??= TextEditingController();
    _model.textualDetailsFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(widget.userReported!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
        final submittingComplaintsUsersRecord = snapshot.data!;
        return Title(
            title: 'Submitting_complaints',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: GestureDetector(
              onTap: () => _model.unfocusNode.canRequestFocus
                  ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                  : FocusScope.of(context).unfocus(),
              child: Scaffold(
                key: scaffoldKey,
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
                          'SUBMITTING_COMPLAINTS_arrow_back_rounded');
                      logFirebaseEvent('IconButton_navigate_to');

                      context.pushNamed('supervisor_home');
                    },
                  ),
                  title: Text(
                    FFLocalizations.of(context).getText(
                      'uqcv56iy' /* Submitting complaints */,
                    ),
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).headlineMediumFamily,
                          color: Colors.white,
                          fontSize: 22.0,
                          letterSpacing: 0.0,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context)
                                  .headlineMediumFamily),
                        ),
                  ),
                  actions: const [],
                  centerTitle: false,
                  elevation: 2.0,
                ),
                body: SafeArea(
                  top: true,
                  child: StreamBuilder<ContractorsRecord>(
                    stream: ContractorsRecord.getDocument(
                        submittingComplaintsUsersRecord.contractorRef!),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return const Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: SpinKitDualRing(
                              color: Color(0xFF0CA256),
                              size: 50.0,
                            ),
                          ),
                        );
                      }
                      final columnContractorsRecord = snapshot.data!;
                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 16.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 8.0, 20.0, 0.0),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              boxShadow: const [
                                                BoxShadow(
                                                  blurRadius: 3.0,
                                                  color: Color(0x20000000),
                                                  offset: Offset(
                                                    0.0,
                                                    1.0,
                                                  ),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      8.0, 8.0, 12.0, 8.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: CachedNetworkImage(
                                                      fadeInDuration: const Duration(
                                                          milliseconds: 500),
                                                      fadeOutDuration: const Duration(
                                                          milliseconds: 500),
                                                      imageUrl: valueOrDefault<
                                                          String>(
                                                        submittingComplaintsUsersRecord
                                                                    .photoUrl !=
                                                                ''
                                                            ? submittingComplaintsUsersRecord
                                                                .photoUrl
                                                            : 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/al-rahma-paufng/assets/nyfyk3dm1q65/unknown-user-image.jpg',
                                                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/al-rahma-paufng/assets/nyfyk3dm1q65/unknown-user-image.jpg',
                                                      ),
                                                      width: 120.0,
                                                      height: 120.0,
                                                      fit: BoxFit.cover,
                                                      errorWidget: (context,
                                                              error,
                                                              stackTrace) =>
                                                          Image.asset(
                                                        'assets/images/error_image.png',
                                                        width: 120.0,
                                                        height: 120.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              submittingComplaintsUsersRecord
                                                                  .displayName,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Plus Jakarta Sans',
                                                                    color: const Color(
                                                                        0xFF14181B),
                                                                    fontSize:
                                                                        16.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            'Plus Jakarta Sans'),
                                                                  ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    -1.0, 0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          4.0,
                                                                          20.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      '1vmenqku' /* Worker */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Plus Jakarta Sans',
                                                                          color:
                                                                              const Color(0xFF57636C),
                                                                          fontSize:
                                                                              14.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey('Plus Jakarta Sans'),
                                                                        ),
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          -1.0,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      'ID: #${submittingComplaintsUsersRecord.userCode}',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Plus Jakarta Sans',
                                                                            color:
                                                                                const Color(0xFF57636C),
                                                                            fontSize:
                                                                                14.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey('Plus Jakarta Sans'),
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    -1.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          4.0,
                                                                          20.0,
                                                                          0.0),
                                                              child: Text(
                                                                FFAppState()
                                                                    .sessionInfo
                                                                    .sessionName,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Plus Jakarta Sans',
                                                                      color: const Color(
                                                                          0xFF57636C),
                                                                      fontSize:
                                                                          14.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              'Plus Jakarta Sans'),
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
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
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 20.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 0.0, 20.0, 0.0),
                                          child: FlutterFlowDropDown<String>(
                                            controller: _model
                                                    .dropDownValueController ??=
                                                FormFieldController<String>(
                                                    null),
                                            options: [
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'sbn6rj2y' /* Leaving Work */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'lr60dler' /* Negligence at Work */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'ykblzrmg' /* Insult and Slander */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'l8benbiz' /* Assault by beating */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'bn3k4bym' /* Negligence in the tools */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'j01hmmfv' /* Unclean uniform */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'ryhv0qfm' /* Being late */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '13hnl6we' /* doesn't obligate to distributi... */,
                                              )
                                            ],
                                            onChanged: (val) => setState(() =>
                                                _model.dropDownValue = val),
                                            height: 56.0,
                                            textStyle:
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
                                            hintText:
                                                FFLocalizations.of(context)
                                                    .getText(
                                              'di1h86r1' /* Reason.. */,
                                            ),
                                            icon: Icon(
                                              Icons.keyboard_arrow_down_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 24.0,
                                            ),
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            elevation: 2.0,
                                            borderColor:
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                            borderWidth: 2.0,
                                            borderRadius: 8.0,
                                            margin:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 4.0, 16.0, 4.0),
                                            hidesUnderline: true,
                                            isOverButton: true,
                                            isSearchable: false,
                                            isMultiSelect: false,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 20.0, 12.0),
                                  child: TextFormField(
                                    controller:
                                        _model.textualDetailsTextController,
                                    focusNode: _model.textualDetailsFocusNode,
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
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    'Plus Jakarta Sans'),
                                          ),
                                      hintText:
                                          FFLocalizations.of(context).getText(
                                        'dkdcu4hu' /* Details */,
                                      ),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Plus Jakarta Sans',
                                            color: const Color(0xFF57636C),
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                            useGoogleFonts: GoogleFonts.asMap()
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
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Plus Jakarta Sans',
                                          color: const Color(0xFF14181B),
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey('Plus Jakarta Sans'),
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
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 20.0, 0.0),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
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
                                                  'SUBMITTING_COMPLAINTS_imageBorder_ON_TAP');
                                              if ((FFAppState()
                                                      .oldImages
                                                      .isNotEmpty) &&
                                                  (functions.getOldImageIndex(
                                                          'complaintImageUrl1',
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
                                                              'complaintImageUrl1',
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
                                                                'complaintImageUrl1',
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
                                                                  'complaintImageUrl1',
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
                                                        'complaintImageUrl1',
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
                                                    imageID:
                                                        'complaintImageUrl1',
                                                  ));
                                                });
                                              }

                                              logFirebaseEvent(
                                                  'imageBorder_upload_media_to_firebase');
                                              final selectedMedia =
                                                  await selectMedia(
                                                multiImage: false,
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
                                                    valueOrDefault<String>(
                                                      _model.uploadedFileUrl1 !=
                                                                  ''
                                                          ? _model
                                                              .uploadedFileUrl1
                                                          : 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/al-rahma-paufng/assets/uv6zeuo9j79d/Screenshot_2024-05-07_223116.png',
                                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/al-rahma-paufng/assets/uv6zeuo9j79d/Screenshot_2024-05-07_223116.png',
                                                    ),
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
                                                  'SUBMITTING_COMPLAINTS_imageBorder_ON_TAP');
                                              if ((FFAppState()
                                                      .oldImages
                                                      .isNotEmpty) &&
                                                  (functions.getOldImageIndex(
                                                          'complaintImageUrl2',
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
                                                              'complaintImageUrl2',
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
                                                                'complaintImageUrl2',
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
                                                                  'complaintImageUrl2',
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
                                                        'complaintImageUrl2',
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
                                                    imageID:
                                                        'complaintImageUrl2',
                                                  ));
                                                });
                                              }

                                              logFirebaseEvent(
                                                  'imageBorder_upload_media_to_firebase');
                                              final selectedMedia =
                                                  await selectMedia(
                                                multiImage: false,
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
                                                    valueOrDefault<String>(
                                                      _model.uploadedFileUrl2 !=
                                                                  ''
                                                          ? _model
                                                              .uploadedFileUrl2
                                                          : 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/al-rahma-paufng/assets/uv6zeuo9j79d/Screenshot_2024-05-07_223116.png',
                                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/al-rahma-paufng/assets/uv6zeuo9j79d/Screenshot_2024-05-07_223116.png',
                                                    ),
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
                                                  'SUBMITTING_COMPLAINTS_imageBorder_ON_TAP');
                                              if ((FFAppState()
                                                      .oldImages
                                                      .isNotEmpty) &&
                                                  (functions.getOldImageIndex(
                                                          'complaintImageUrl3',
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
                                                              'complaintImageUrl3',
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
                                                                'complaintImageUrl3',
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
                                                                  'complaintImageUrl3',
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
                                                        'complaintImageUrl3',
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
                                                    imageID:
                                                        'complaintImageUrl3',
                                                  ));
                                                });
                                              }

                                              logFirebaseEvent(
                                                  'imageBorder_upload_media_to_firebase');
                                              final selectedMedia =
                                                  await selectMedia(
                                                multiImage: false,
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
                                                    valueOrDefault<String>(
                                                      _model.uploadedFileUrl3 !=
                                                                  ''
                                                          ? _model
                                                              .uploadedFileUrl3
                                                          : 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/al-rahma-paufng/assets/uv6zeuo9j79d/Screenshot_2024-05-07_223116.png',
                                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/al-rahma-paufng/assets/uv6zeuo9j79d/Screenshot_2024-05-07_223116.png',
                                                    ),
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
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(1.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 4.0, 20.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        '3lr7t518' /* Maximum 3 img/jpg */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 50.0, 0.0, 17.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'SUBMITTING_COMPLAINTS_MAKE_COMPLAIN_BTN_');
                                      var shouldSetState = false;
                                      await Future.wait([
                                        Future(() async {
                                          if ((FFAppState()
                                                  .oldImages
                                                  .isNotEmpty) &&
                                              (functions
                                                      .getOldImageIndex(
                                                          'complaintImageUrl1',
                                                          FFAppState()
                                                              .oldImages
                                                              .toList())
                                                      .toString() !=
                                                  '-1')) {
                                            if (FFAppState()
                                                    .oldImages[functions
                                                        .getOldImageIndex(
                                                            'complaintImageUrl1',
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
                                                              'complaintImageUrl1',
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
                                                          'complaintImageUrl2',
                                                          FFAppState()
                                                              .oldImages
                                                              .toList())
                                                      .toString() !=
                                                  '-1')) {
                                            if (FFAppState()
                                                    .oldImages[functions
                                                        .getOldImageIndex(
                                                            'complaintImageUrl2',
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
                                                              'complaintImageUrl2',
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
                                                          'complaintImageUrl3',
                                                          FFAppState()
                                                              .oldImages
                                                              .toList())
                                                      .toString() !=
                                                  '-1')) {
                                            if (FFAppState()
                                                    .oldImages[functions
                                                        .getOldImageIndex(
                                                            'complaintImageUrl3',
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
                                                              'complaintImageUrl3',
                                                              FFAppState()
                                                                  .oldImages
                                                                  .toList())]
                                                      .imagePath)
                                                  .delete();
                                            }
                                          }
                                        }),
                                      ]);
                                      logFirebaseEvent('Button_custom_action');
                                      _model.complaintCreation =
                                          await actions.createComaplaint(
                                        _model.dropDownValue!,
                                        _model
                                            .textualDetailsTextController.text,
                                        currentUserDocument!.userRefrence!,
                                        _model.uploadedFileUrl1,
                                        _model.uploadedFileUrl2,
                                        _model.uploadedFileUrl3,
                                        widget.userReported!,
                                        columnContractorsRecord.userRef!,
                                      );
                                      shouldSetState = true;
                                      if (_model.complaintCreation!) {
                                        logFirebaseEvent('Button_bottom_sheet');
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          isDismissible: false,
                                          enableDrag: false,
                                          context: context,
                                          builder: (context) {
                                            return GestureDetector(
                                              onTap: () => _model.unfocusNode
                                                      .canRequestFocus
                                                  ? FocusScope.of(context)
                                                      .requestFocus(
                                                          _model.unfocusNode)
                                                  : FocusScope.of(context)
                                                      .unfocus(),
                                              child: Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child: SizedBox(
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          1.0,
                                                  child: SuccsesWidget(
                                                    successesMessage:
                                                        'تم تقديم الشكوي بنجاح',
                                                    yesButtonText:
                                                        'جميع الشكاوي',
                                                    cancelButtonText: 'تم',
                                                    yesButtonAction: () async {
                                                      logFirebaseEvent(
                                                          '_navigate_to');

                                                      context.pushNamed(
                                                          'List_complaints');
                                                    },
                                                    cancelButtonAction:
                                                        () async {
                                                      logFirebaseEvent(
                                                          '_bottom_sheet');
                                                      Navigator.pop(context);
                                                      logFirebaseEvent(
                                                          '_navigate_back');
                                                      context.safePop();
                                                    },
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(() {}));

                                        if (shouldSetState) setState(() {});
                                        return;
                                      } else {
                                        if (shouldSetState) setState(() {});
                                        return;
                                      }

                                      if (shouldSetState) setState(() {});
                                    },
                                    text: FFLocalizations.of(context).getText(
                                      '2xu9ygjm' /* Make Complain */,
                                    ),
                                    options: FFButtonOptions(
                                      width: 270.0,
                                      height: 50.0,
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: const Color(0xFF0CA256),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily: 'Plus Jakarta Sans',
                                            color: Colors.white,
                                            fontSize: 18.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    'Plus Jakarta Sans'),
                                          ),
                                      elevation: 2.0,
                                      borderSide: const BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ));
      },
    );
  }
}
