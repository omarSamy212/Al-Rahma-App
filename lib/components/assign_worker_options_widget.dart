import '/backend/backend.dart';
import '/components/assign_worker_b_sheet_edit_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'assign_worker_options_model.dart';
export 'assign_worker_options_model.dart';

class AssignWorkerOptionsWidget extends StatefulWidget {
  const AssignWorkerOptionsWidget({
    super.key,
    required this.userRefrence,
    required this.leaderRef,
    required this.streeetRef,
    required this.intialTool,
    required this.assignedWorker,
  });

  final DocumentReference? userRefrence;
  final DocumentReference? leaderRef;
  final DocumentReference? streeetRef;
  final String? intialTool;
  final AssignWorkersStruct? assignedWorker;

  @override
  State<AssignWorkerOptionsWidget> createState() =>
      _AssignWorkerOptionsWidgetState();
}

class _AssignWorkerOptionsWidgetState extends State<AssignWorkerOptionsWidget> {
  late AssignWorkerOptionsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AssignWorkerOptionsModel());

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
          FFButtonWidget(
            onPressed: () async {
              logFirebaseEvent('ASSIGN_WORKER_OPTIONS_EDIT_BTN_ON_TAP');
              logFirebaseEvent('Button_bottom_sheet');
              await showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                enableDrag: false,
                context: context,
                builder: (context) {
                  return Padding(
                    padding: MediaQuery.viewInsetsOf(context),
                    child: AssignWorkerBSheetEditWidget(
                      streetRef: widget.streeetRef!,
                      leaderRef: widget.leaderRef!,
                      userRef: widget.userRefrence!,
                      intialTool: widget.intialTool!,
                      assignedWorker: widget.assignedWorker!,
                    ),
                  );
                },
              ).then((value) => safeSetState(() {}));
            },
            text: FFLocalizations.of(context).getText(
              '99o60cg5' /* Edit */,
            ),
            options: FFButtonOptions(
              width: double.infinity,
              height: 60.0,
              padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
              iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              color: FlutterFlowTheme.of(context).secondaryText,
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
              logFirebaseEvent('ASSIGN_WORKER_OPTIONS_REMOVE_BTN_ON_TAP');
              logFirebaseEvent('Button_backend_call');

              await widget.leaderRef!.update({
                ...mapToFirestore(
                  {
                    'availableWorkers':
                        FieldValue.arrayUnion([widget.userRefrence]),
                  },
                ),
              });
              logFirebaseEvent('Button_backend_call');

              await widget.streeetRef!.update({
                ...mapToFirestore(
                  {
                    'assignedWorkers': FieldValue.arrayRemove([
                      getAssignWorkersFirestoreData(
                        updateAssignWorkersStruct(
                          widget.assignedWorker,
                          clearUnsetFields: false,
                        ),
                        true,
                      )
                    ]),
                  },
                ),
              });
            },
            text: FFLocalizations.of(context).getText(
              'si86z3tb' /* Remove */,
            ),
            options: FFButtonOptions(
              width: double.infinity,
              height: 60.0,
              padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
              iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              color: FlutterFlowTheme.of(context).error,
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
