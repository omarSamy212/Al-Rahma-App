import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dp_attennn_model.dart';
export 'dp_attennn_model.dart';

class DpAttennnWidget extends StatefulWidget {
  const DpAttennnWidget({super.key});

  @override
  State<DpAttennnWidget> createState() => _DpAttennnWidgetState();
}

class _DpAttennnWidgetState extends State<DpAttennnWidget> {
  late DpAttennnModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DpAttennnModel());

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
      alignment: const AlignmentDirectional(1.0, -1.0),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
        child: FlutterFlowDropDown<String>(
          controller: _model.dropDownValueController ??=
              FormFieldController<String>(null),
          options: [
            FFLocalizations.of(context).getText(
              '35o6mpj8' /* worker */,
            )
          ],
          onChanged: (val) => setState(() => _model.dropDownValue = val),
          width: 30.0,
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
