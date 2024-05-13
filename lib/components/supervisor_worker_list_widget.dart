import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'supervisor_worker_list_model.dart';
export 'supervisor_worker_list_model.dart';

class SupervisorWorkerListWidget extends StatefulWidget {
  const SupervisorWorkerListWidget({
    super.key,
    required this.userRefrence,
  });

  final DocumentReference? userRefrence;

  @override
  State<SupervisorWorkerListWidget> createState() =>
      _SupervisorWorkerListWidgetState();
}

class _SupervisorWorkerListWidgetState
    extends State<SupervisorWorkerListWidget> {
  late SupervisorWorkerListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SupervisorWorkerListModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 1.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Align(
            alignment: const AlignmentDirectional(0.0, 1.0),
            child: StreamBuilder<UsersRecord>(
              stream: UsersRecord.getDocument(widget.userRefrence!),
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
                final containerUsersRecord = snapshot.data!;
                return Container(
                  width: double.infinity,
                  height: 60.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(0.0),
                      bottomRight: Radius.circular(0.0),
                      topLeft: Radius.circular(8.0),
                      topRight: Radius.circular(8.0),
                    ),
                  ),
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Text(
                    'عامل رقم: ${containerUsersRecord.userCode} ,الاسم: ${containerUsersRecord.displayName}',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          letterSpacing: 0.0,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodyMediumFamily),
                        ),
                  ),
                );
              },
            ),
          ),
          FFButtonWidget(
            onPressed: () async {
              logFirebaseEvent('SUPERVISOR_WORKER_LIST_MAKE_COMPLAINT_BT');
              logFirebaseEvent('Button_navigate_to');

              context.pushNamed(
                'Submitting_complaints',
                queryParameters: {
                  'userReported': serializeParam(
                    widget.userRefrence,
                    ParamType.DocumentReference,
                  ),
                }.withoutNulls,
              );
            },
            text: FFLocalizations.of(context).getText(
              '6oo4e1x8' /* Make complaint */,
            ),
            options: FFButtonOptions(
              width: double.infinity,
              height: 60.0,
              padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
              iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              color: FlutterFlowTheme.of(context).primaryBackground,
              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                    fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                    color: FlutterFlowTheme.of(context).primaryText,
                    letterSpacing: 0.0,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).titleSmallFamily),
                  ),
              elevation: 3.0,
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).secondaryText,
                width: 1.0,
              ),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(0.0),
                bottomRight: Radius.circular(0.0),
                topLeft: Radius.circular(0.0),
                topRight: Radius.circular(0.0),
              ),
            ),
          ),
          FFButtonWidget(
            onPressed: () async {
              logFirebaseEvent('SUPERVISOR_WORKER_LIST_WORKER_RATING_BTN');
              logFirebaseEvent('Button_navigate_to');

              context.pushNamed(
                'workers_review',
                queryParameters: {
                  'userReviewed': serializeParam(
                    widget.userRefrence,
                    ParamType.DocumentReference,
                  ),
                }.withoutNulls,
              );
            },
            text: FFLocalizations.of(context).getText(
              'g3pn8mgs' /* Worker rating */,
            ),
            options: FFButtonOptions(
              width: double.infinity,
              height: 60.0,
              padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
              iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              color: FlutterFlowTheme.of(context).primaryBackground,
              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                    fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                    color: FlutterFlowTheme.of(context).primaryText,
                    letterSpacing: 0.0,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).titleSmallFamily),
                  ),
              elevation: 3.0,
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).secondaryText,
                width: 1.0,
              ),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(0.0),
                bottomRight: Radius.circular(0.0),
                topLeft: Radius.circular(0.0),
                topRight: Radius.circular(0.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
