import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/yes_no_question_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'loggingout_for_supervisor_model.dart';
export 'loggingout_for_supervisor_model.dart';

class LoggingoutForSupervisorWidget extends StatefulWidget {
  const LoggingoutForSupervisorWidget({super.key});

  @override
  State<LoggingoutForSupervisorWidget> createState() =>
      _LoggingoutForSupervisorWidgetState();
}

class _LoggingoutForSupervisorWidgetState
    extends State<LoggingoutForSupervisorWidget> {
  late LoggingoutForSupervisorModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoggingoutForSupervisorModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'loggingout_for_supervisor'});
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
        title: 'loggingout_for_supervisor',
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
                  logFirebaseEvent('LOGGINGOUT_FOR_SUPERVISOR_arrow_back_rou');
                  logFirebaseEvent('IconButton_navigate_back');
                  context.pop();
                },
              ),
              title: Text(
                FFLocalizations.of(context).getText(
                  '0jzyuw1b' /* Loggingout For Supervisor */,
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
              actions: const [],
              centerTitle: true,
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
                            child: FaIcon(
                              FontAwesomeIcons.walking,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 200.0,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 180.0, 0.0, 0.0),
                            child: Icon(
                              Icons.qr_code_scanner,
                              color: FlutterFlowTheme.of(context).primaryText,
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
                                'LOGGINGOUT_FOR_SUPERVISOR_CAMERA_SCAN_BT');
                            logFirebaseEvent('Button_bottom_sheet');
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              enableDrag: false,
                              context: context,
                              builder: (context) {
                                return GestureDetector(
                                  onTap: () =>
                                      _model.unfocusNode.canRequestFocus
                                          ? FocusScope.of(context)
                                              .requestFocus(_model.unfocusNode)
                                          : FocusScope.of(context).unfocus(),
                                  child: Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: YesNoQuestionWidget(
                                      headerName: 'رسالة تأكيد',
                                      infoMessage:
                                          'هل قمت بتسجيل  انصراف  العمال ؟',
                                      yesButtonText: 'نعم',
                                      noButtonText: 'لا',
                                      yesButtonAction: () async {
                                        var shouldSetState = false;
                                        logFirebaseEvent(
                                            '_scan_barcode_q_r_code');
                                        _model.scanSupValue =
                                            await FlutterBarcodeScanner
                                                .scanBarcode(
                                          '#C62828', // scanning line color
                                          FFLocalizations.of(context).getText(
                                            '2sba32ve' /* Cancel */,
                                          ), // cancel button text
                                          true, // whether to show the flash icon
                                          ScanMode.QR,
                                        );

                                        shouldSetState = true;
                                        if (_model.scanSupValue ==
                                            'kaloonInSefoon') {
                                          logFirebaseEvent('_backend_call');
                                          _model.userRef =
                                              await UsersRecord.getDocumentOnce(
                                                  currentUserDocument!
                                                      .userRefrence!);
                                          shouldSetState = true;
                                          logFirebaseEvent('_backend_call');
                                          _model.check = await ChecksRecord
                                              .getDocumentOnce(_model.userRef!
                                                  .attendance.checkRef!);
                                          shouldSetState = true;
                                          logFirebaseEvent('_backend_call');
                                          unawaited(
                                            () async {
                                              await _model.check!.reference
                                                  .update(
                                                      createChecksRecordData(
                                                checkOut: updateChecksStruct(
                                                  ChecksStruct(
                                                    time:
                                                        functions.getTimeNow(),
                                                    date:
                                                        functions.currentDate(),
                                                  ),
                                                  clearUnsetFields: false,
                                                ),
                                              ));
                                            }(),
                                          );
                                          logFirebaseEvent('_backend_call');

                                          await functions
                                              .getAttendanceLogRef(
                                                  currentUserDocument!
                                                      .userRefrence!.id)!
                                              .update({
                                            ...mapToFirestore(
                                              {
                                                'user_checks':
                                                    FieldValue.arrayUnion([
                                                  _model.check?.reference
                                                ]),
                                              },
                                            ),
                                          });
                                          logFirebaseEvent('_backend_call');

                                          await currentUserDocument!
                                              .userRefrence!
                                              .update(createUsersRecordData(
                                            attendance: updateAttendacneStruct(
                                              AttendacneStruct(
                                                attendanceState:
                                                    AttedanceState.waiting,
                                              ),
                                              clearUnsetFields: true,
                                            ),
                                          ));
                                          logFirebaseEvent('_backend_call');
                                          unawaited(
                                            () async {}(),
                                          );
                                          logFirebaseEvent('_backend_call');

                                          await FFAppState()
                                              .sessionInfo
                                              .sessionDocRef!
                                              .update({
                                            ...mapToFirestore(
                                              {
                                                'supervisor_attended':
                                                    FieldValue.arrayRemove([
                                                  currentUserDocument
                                                      ?.userRefrence
                                                ]),
                                              },
                                            ),
                                          });
                                          logFirebaseEvent('_backend_call');

                                          await _model.check!.sector!.update({
                                            ...mapToFirestore(
                                              {
                                                'supervisors':
                                                    FieldValue.arrayRemove([
                                                  _model.userRef?.reference
                                                ]),
                                              },
                                            ),
                                          });
                                          logFirebaseEvent('_show_snack_bar');
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Sucess',
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                              ),
                                              duration:
                                                  const Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                            ),
                                          );
                                          logFirebaseEvent('_navigate_to');

                                          context.pushNamed('supervisor_home');

                                          return;
                                        } else {
                                          logFirebaseEvent('_show_snack_bar');
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Error Checking Out',
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                              ),
                                              duration:
                                                  const Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                            ),
                                          );
                                          return;
                                        }
                                      },
                                      noButtonAction: () async {
                                        logFirebaseEvent('_navigate_to');

                                        context.pushNamed('Manualattendance');
                                      },
                                    ),
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));

                            setState(() {});
                          },
                          text: FFLocalizations.of(context).getText(
                            '0qe72sby' /* camera scan */,
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
                            '98y2lu2a' /* Please scan the code to logout... */,
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
