import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'todays_requests_dashboard_model.dart';
export 'todays_requests_dashboard_model.dart';

class TodaysRequestsDashboardWidget extends StatefulWidget {
  const TodaysRequestsDashboardWidget({super.key});

  @override
  State<TodaysRequestsDashboardWidget> createState() =>
      _TodaysRequestsDashboardWidgetState();
}

class _TodaysRequestsDashboardWidgetState
    extends State<TodaysRequestsDashboardWidget> {
  late TodaysRequestsDashboardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TodaysRequestsDashboardModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 5.0,
              color: Color(0x230E151B),
              offset: Offset(
                0.0,
                2.0,
              ),
            )
          ],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 0.0, 0.0),
              child: Text(
                FFLocalizations.of(context).getText(
                  'fplbb8lh' /* Today's Requests */,
                ),
                style: FlutterFlowTheme.of(context).titleLarge.override(
                      fontFamily: 'Outfit',
                      letterSpacing: 0.0,
                    ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.work_history,
                              color: Color(0xFF0CA256),
                              size: 44.0,
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 12.0, 0.0, 4.0),
                              child: FutureBuilder<int>(
                                future: queryToolsRequestsRecordCount(
                                  queryBuilder: (toolsRequestsRecord) =>
                                      toolsRequestsRecord
                                          .where(
                                            'date',
                                            isEqualTo: functions.currentDate(),
                                          )
                                          .where(
                                            'status',
                                            isEqualTo: 'Active',
                                          ),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
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
                                  int textCount = snapshot.data!;
                                  return Text(
                                    valueOrDefault<String>(
                                      textCount.toString(),
                                      '0',
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .displaySmall
                                        .override(
                                          fontFamily: 'Outfit',
                                          fontSize: 27.0,
                                          letterSpacing: 0.0,
                                        ),
                                  );
                                },
                              ),
                            ),
                            Text(
                              FFLocalizations.of(context).getText(
                                '6ngoonw0' /* Active Requests */,
                              ),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ].divide(SizedBox(height: 0.0)),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.work,
                              color: Color(0xFF232323),
                              size: 44.0,
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 12.0, 0.0, 4.0),
                              child: FutureBuilder<int>(
                                future: queryToolsRequestsRecordCount(
                                  queryBuilder: (toolsRequestsRecord) =>
                                      toolsRequestsRecord.where(
                                    'date',
                                    isEqualTo: functions.currentDate(),
                                  ),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
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
                                  int textCount = snapshot.data!;
                                  return Text(
                                    valueOrDefault<String>(
                                      textCount.toString(),
                                      '0',
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .displaySmall
                                        .override(
                                          fontFamily: 'Outfit',
                                          fontSize: 27.0,
                                          letterSpacing: 0.0,
                                        ),
                                  );
                                },
                              ),
                            ),
                            Text(
                              FFLocalizations.of(context).getText(
                                'b9coa6u8' /* Total Requests */,
                              ),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
