import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'empty_listsimple_model.dart';
export 'empty_listsimple_model.dart';

class EmptyListsimpleWidget extends StatefulWidget {
  const EmptyListsimpleWidget({super.key});

  @override
  State<EmptyListsimpleWidget> createState() => _EmptyListsimpleWidgetState();
}

class _EmptyListsimpleWidgetState extends State<EmptyListsimpleWidget> {
  late EmptyListsimpleModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyListsimpleModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        const Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
          child: Icon(
            Icons.hourglass_empty,
            color: Color(0xFF606A85),
            size: 72.0,
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
          child: Text(
            FFLocalizations.of(context).getText(
              '5a8crhfe' /* Empty  */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: FlutterFlowTheme.of(context).secondaryText,
                  fontSize: 24.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.bold,
                  useGoogleFonts: GoogleFonts.asMap().containsKey('Outfit'),
                ),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
          child: Text(
            FFLocalizations.of(context).getText(
              'kpiw9w0t' /* It seems that you don't have a... */,
            ),
            style: FlutterFlowTheme.of(context).labelMedium.override(
                  fontFamily: 'Plus Jakarta Sans',
                  color: const Color(0xFF606A85),
                  fontSize: 14.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w500,
                  useGoogleFonts:
                      GoogleFonts.asMap().containsKey('Plus Jakarta Sans'),
                ),
          ),
        ),
      ],
    );
  }
}
