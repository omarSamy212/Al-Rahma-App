import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'attendenceof_supervisor_model.dart';
export 'attendenceof_supervisor_model.dart';

class AttendenceofSupervisorWidget extends StatefulWidget {
  const AttendenceofSupervisorWidget({super.key});

  @override
  State<AttendenceofSupervisorWidget> createState() =>
      _AttendenceofSupervisorWidgetState();
}

class _AttendenceofSupervisorWidgetState
    extends State<AttendenceofSupervisorWidget> {
  late AttendenceofSupervisorModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AttendenceofSupervisorModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'AttendenceofSupervisor'});
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

    return Title(
        title: 'AttendenceofSupervisor',
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
              title: Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'd1io63q4' /* Attendence of supervisor */,
                  ),
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).headlineMediumFamily,
                        color: Colors.white,
                        fontSize: 22.0,
                        letterSpacing: 0.0,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).headlineMediumFamily),
                      ),
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
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 180.0, 0.0, 0.0),
                            child: Icon(
                              Icons.qr_code_scanner,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 200.0,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 180.0, 0.0, 0.0),
                            child: FaIcon(
                              FontAwesomeIcons.walking,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 200.0,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 80.0, 0.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'ATTENDENCEOF_SUPERVISOR_CAMERA_SCAN_BTN_');
                            var shouldSetState = false;
                            logFirebaseEvent('Button_scan_barcode_q_r_code');
                            _model.scanSupValue =
                                await FlutterBarcodeScanner.scanBarcode(
                              '#C62828', // scanning line color
                              FFLocalizations.of(context).getText(
                                'da6g837y' /* Cancel */,
                              ), // cancel button text
                              true, // whether to show the flash icon
                              ScanMode.QR,
                            );

                            shouldSetState = true;
                            if (_model.scanSupValue == 'kaloonInSefoon') {
                              logFirebaseEvent('Button_backend_call');
                              _model.userRef =
                                  await UsersRecord.getDocumentOnce(
                                      currentUserDocument!.userRefrence!);
                              shouldSetState = true;
                              logFirebaseEvent('Button_firestore_query');
                              _model.supSec = await querySectorsRecordOnce(
                                queryBuilder: (sectorsRecord) =>
                                    sectorsRecord.where(
                                  'supervisors',
                                  arrayContains:
                                      currentUserDocument?.userRefrence,
                                ),
                                singleRecord: true,
                              ).then((s) => s.firstOrNull);
                              shouldSetState = true;
                              logFirebaseEvent('Button_custom_action');
                              await actions.logger(
                                'sector found: ${_model.supSec?.sectorName}',
                              );
                              logFirebaseEvent('Button_backend_call');

                              var checksRecordReference =
                                  ChecksRecord.collection.doc(
                                      '${_model.userRef?.userCode}_${functions.currentDate()}');
                              await checksRecordReference
                                  .set(createChecksRecordData(
                                sessionId:
                                    FFAppState().sessionInfo.sessionDocRef,
                                checkIn: updateChecksStruct(
                                  ChecksStruct(
                                    time: functions.getTimeNow(),
                                    date: functions.currentDate(),
                                  ),
                                  clearUnsetFields: false,
                                  create: true,
                                ),
                                userRef: currentUserDocument?.userRefrence,
                                attendedBy: currentUserDocument?.userRefrence,
                                userRole: _model.userRef?.privileges.roleName,
                                sector: _model.supSec?.reference,
                              ));
                              _model.checkDoc =
                                  ChecksRecord.getDocumentFromData(
                                      createChecksRecordData(
                                        sessionId: FFAppState()
                                            .sessionInfo
                                            .sessionDocRef,
                                        checkIn: updateChecksStruct(
                                          ChecksStruct(
                                            time: functions.getTimeNow(),
                                            date: functions.currentDate(),
                                          ),
                                          clearUnsetFields: false,
                                          create: true,
                                        ),
                                        userRef:
                                            currentUserDocument?.userRefrence,
                                        attendedBy:
                                            currentUserDocument?.userRefrence,
                                        userRole: _model
                                            .userRef?.privileges.roleName,
                                        sector: _model.supSec?.reference,
                                      ),
                                      checksRecordReference);
                              shouldSetState = true;
                              logFirebaseEvent('Button_backend_call');

                              await currentUserDocument!.userRefrence!
                                  .update(createUsersRecordData(
                                attendance: updateAttendacneStruct(
                                  AttendacneStruct(
                                    attendanceState: AttedanceState.attend,
                                    checkRef: _model.checkDoc?.reference,
                                  ),
                                  clearUnsetFields: false,
                                ),
                              ));
                              logFirebaseEvent('Button_backend_call');

                              await FFAppState()
                                  .sessionInfo
                                  .sessionDocRef!
                                  .update({
                                ...mapToFirestore(
                                  {
                                    'supervisor_attended':
                                        FieldValue.arrayUnion([
                                      currentUserDocument?.userRefrence
                                    ]),
                                  },
                                ),
                              });
                              logFirebaseEvent('Button_show_snack_bar');
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Sucess',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: const Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).secondary,
                                ),
                              );
                              logFirebaseEvent('Button_navigate_to');

                              context.pushNamed('supervisor_home');

                              if (shouldSetState) setState(() {});
                              return;
                            } else {
                              logFirebaseEvent('Button_show_snack_bar');
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Error Checking IN',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: const Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).error,
                                ),
                              );
                              if (shouldSetState) setState(() {});
                              return;
                            }

                            if (shouldSetState) setState(() {});
                          },
                          text: FFLocalizations.of(context).getText(
                            'un5c2em0' /* camera scan */,
                          ),
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleSmallFamily,
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .titleSmallFamily),
                                ),
                            elevation: 3.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 60.0, 0.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            '1mncq6a6' /* Please scan the code to enter ... */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
