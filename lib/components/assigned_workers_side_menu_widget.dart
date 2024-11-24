import '/backend/backend.dart';
import '/components/assign_worker_b_sheet_edit_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'assigned_workers_side_menu_model.dart';
export 'assigned_workers_side_menu_model.dart';

class AssignedWorkersSideMenuWidget extends StatefulWidget {
  const AssignedWorkersSideMenuWidget({
    super.key,
    required this.streetRef,
    required this.leaderRef,
    required this.userRef,
    required this.intialTool,
    required this.assignedWorker,
  });

  final DocumentReference? streetRef;
  final DocumentReference? leaderRef;
  final DocumentReference? userRef;
  final String? intialTool;
  final AssignWorkersStruct? assignedWorker;

  @override
  State<AssignedWorkersSideMenuWidget> createState() =>
      _AssignedWorkersSideMenuWidgetState();
}

class _AssignedWorkersSideMenuWidgetState
    extends State<AssignedWorkersSideMenuWidget> {
  late AssignedWorkersSideMenuModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AssignedWorkersSideMenuModel());

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
      alignment: const AlignmentDirectional(1.0, 0.0),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
        child: FlutterFlowDropDown<String>(
          controller: _model.dropDownValueController ??=
              FormFieldController<String>(
            _model.dropDownValue ??= '',
          ),
          options: List<String>.from(['1', '2']),
          optionLabels: [
            FFLocalizations.of(context).getText(
              'ezgrd9to' /* Edit */,
            ),
            FFLocalizations.of(context).getText(
              '2dj0qvoz' /* Delete */,
            )
          ],
          onChanged: (val) async {
            setState(() => _model.dropDownValue = val);
            logFirebaseEvent('ASSIGNED_WORKERS_SIDE_MENU_DropDown_eiad');
            if (_model.dropDownValue == '1') {
              logFirebaseEvent('DropDown_bottom_sheet');
              await showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                enableDrag: false,
                context: context,
                builder: (context) {
                  return Padding(
                    padding: MediaQuery.viewInsetsOf(context),
                    child: AssignWorkerBSheetEditWidget(
                      streetRef: widget.streetRef!,
                      leaderRef: widget.leaderRef!,
                      userRef: widget.userRef!,
                      intialTool: widget.intialTool!,
                      assignedWorker: widget.assignedWorker!,
                    ),
                  );
                },
              ).then((value) => safeSetState(() {}));

              return;
            } else if (_model.dropDownValue == '2') {
              logFirebaseEvent('DropDown_backend_call');

              await widget.leaderRef!.update({
                ...mapToFirestore(
                  {
                    'availableWorkers': FieldValue.arrayUnion([widget.userRef]),
                  },
                ),
              });
              logFirebaseEvent('DropDown_backend_call');

              await widget.streetRef!.update({
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
            } else {
              return;
            }

            logFirebaseEvent('DropDown_show_snack_bar');
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Deleted',
                  style: TextStyle(
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
                ),
                duration: const Duration(milliseconds: 4000),
                backgroundColor: FlutterFlowTheme.of(context).secondary,
              ),
            );
          },
          width: double.infinity,
          height: 47.0,
          textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                letterSpacing: 0.0,
                useGoogleFonts: GoogleFonts.asMap()
                    .containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
              ),
          icon: Icon(
            Icons.more_vert,
            color: FlutterFlowTheme.of(context).secondaryText,
            size: 24.0,
          ),
          elevation: 2.0,
          borderColor: Colors.transparent,
          borderWidth: 0.0,
          borderRadius: 0.0,
          margin: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
          hidesUnderline: true,
          isOverButton: true,
          isSearchable: false,
          isMultiSelect: false,
        ),
      ),
    );
  }
}
