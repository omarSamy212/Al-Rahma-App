import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'assigned_workers_d_d_model.dart';
export 'assigned_workers_d_d_model.dart';

class AssignedWorkersDDWidget extends StatefulWidget {
  const AssignedWorkersDDWidget({super.key});

  @override
  State<AssignedWorkersDDWidget> createState() =>
      _AssignedWorkersDDWidgetState();
}

class _AssignedWorkersDDWidgetState extends State<AssignedWorkersDDWidget> {
  late AssignedWorkersDDModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AssignedWorkersDDModel());

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
      alignment: const AlignmentDirectional(-1.0, 0.0),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
        child: FutureBuilder<List<WorkerToolsRecord>>(
          future: queryWorkerToolsRecordOnce(),
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
            List<WorkerToolsRecord> dropDownWorkerToolsRecordList =
                snapshot.data!;
            return FlutterFlowDropDown<String>(
              controller: _model.dropDownValueController ??=
                  FormFieldController<String>(null),
              options: dropDownWorkerToolsRecordList
                  .map((e) => valueOrDefault<String>(
                        e.name,
                        'tool name',
                      ))
                  .toList(),
              onChanged: (val) => setState(() => _model.dropDownValue = val),
              width: 30.0,
              height: 49.0,
              textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                    letterSpacing: 0.0,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).bodyMediumFamily),
                  ),
              icon: Icon(
                Icons.arrow_drop_down,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 30.0,
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
            );
          },
        ),
      ),
    );
  }
}
