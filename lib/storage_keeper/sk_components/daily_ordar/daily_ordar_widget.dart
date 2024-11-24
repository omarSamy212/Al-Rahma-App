import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:sticky_headers/sticky_headers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'daily_ordar_model.dart';
export 'daily_ordar_model.dart';

class DailyOrdarWidget extends StatefulWidget {
  const DailyOrdarWidget({super.key});

  @override
  State<DailyOrdarWidget> createState() => _DailyOrdarWidgetState();
}

class _DailyOrdarWidgetState extends State<DailyOrdarWidget> {
  late DailyOrdarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DailyOrdarModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          StickyHeader(
            overlapHeaders: false,
            header: Container(
              width: double.infinity,
              height: 80.0,
              constraints: const BoxConstraints(
                maxWidth: 430.0,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFFF1F4F8),
                borderRadius: BorderRadius.circular(0.0),
              ),
              alignment: const AlignmentDirectional(-1.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: const AlignmentDirectional(-1.0, 0.0),
                    child: Container(
                      decoration: const BoxDecoration(),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'bjbteacw' /* Today's Requests */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .titleLarge
                              .override(
                                fontFamily: 'Outfit',
                                color: const Color(0xFF15161E),
                                fontSize: 22.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w500,
                                useGoogleFonts:
                                    GoogleFonts.asMap().containsKey('Outfit'),
                              ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            content: Container(
              width: double.infinity,
              constraints: const BoxConstraints(
                maxWidth: 430.0,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(0.0),
              ),
              child: AuthUserStreamWidget(
                builder: (context) => StreamBuilder<List<ToolsRequestsRecord>>(
                  stream: queryToolsRequestsRecord(
                    queryBuilder: (toolsRequestsRecord) => toolsRequestsRecord
                        .where(
                          'storageKeeper',
                          isEqualTo: currentUserDocument?.userRefrence,
                        )
                        .where(
                          'date',
                          isEqualTo: functions.currentDate(),
                        )
                        .orderBy('created_at'),
                  ),
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
                    List<ToolsRequestsRecord> listViewToolsRequestsRecordList =
                        snapshot.data!;
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      primary: false,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewToolsRequestsRecordList.length,
                      itemBuilder: (context, listViewIndex) {
                        final listViewToolsRequestsRecord =
                            listViewToolsRequestsRecordList[listViewIndex];
                        return Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: StreamBuilder<UsersRecord>(
                            stream: UsersRecord.getDocument(
                                listViewToolsRequestsRecord.supervisor!),
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
                              final materialListItem4UsersRecord =
                                  snapshot.data!;
                              return InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'DAILY_ORDAR_materialList_Item_4_ON_TAP');
                                  logFirebaseEvent(
                                      'materialList_Item_4_navigate_to');

                                  context.pushNamed(
                                    'request_Details',
                                    queryParameters: {
                                      'supervisorRef': serializeParam(
                                        listViewToolsRequestsRecord.supervisor,
                                        ParamType.DocumentReference,
                                      ),
                                      'requestRef': serializeParam(
                                        listViewToolsRequestsRecord.reference,
                                        ParamType.DocumentReference,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: 90.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(6.0),
                                      bottomRight: Radius.circular(6.0),
                                      topLeft: Radius.circular(6.0),
                                      topRight: Radius.circular(6.0),
                                    ),
                                    border: Border.all(
                                      color: const Color(0xFFF1F4F8),
                                      width: 4.0,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 12.0, 16.0, 12.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'DAILY_ORDAR_COMP_Row_2nz2k4ey_ON_TAP');
                                        logFirebaseEvent('Row_navigate_to');

                                        context.pushNamed(
                                          'request_Details',
                                          queryParameters: {
                                            'supervisorRef': serializeParam(
                                              listViewToolsRequestsRecord
                                                  .supervisor,
                                              ParamType.DocumentReference,
                                            ),
                                            'requestRef': serializeParam(
                                              listViewToolsRequestsRecord
                                                  .reference,
                                              ParamType.DocumentReference,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 0.0, 0.0),
                                            child: Container(
                                              width: 44.0,
                                              height: 44.0,
                                              decoration: const BoxDecoration(
                                                color: Color(0xFF0CA256),
                                                shape: BoxShape.circle,
                                              ),
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Container(
                                                width: 120.0,
                                                height: 120.0,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Image.network(
                                                  materialListItem4UsersRecord
                                                      .photoUrl,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(-1.0, 0.0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 12.0, 0.0),
                                              child: Text(
                                                materialListItem4UsersRecord
                                                    .displayName,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyLarge
                                                    .override(
                                                      fontFamily:
                                                          'Plus Jakarta Sans',
                                                      color: const Color(0xFF15161E),
                                                      fontSize: 16.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      useGoogleFonts: GoogleFonts
                                                              .asMap()
                                                          .containsKey(
                                                              'Plus Jakarta Sans'),
                                                    ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Align(
                                              alignment: const AlignmentDirectional(
                                                  1.0, 0.0),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 12.0, 0.0),
                                                child: Text(
                                                  'ID: #${materialListItem4UsersRecord.userCode}',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily:
                                                            'Plus Jakarta Sans',
                                                        color:
                                                            const Color(0xFF15161E),
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                'Plus Jakarta Sans'),
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'DAILY_ORDAR_COMP_Icon_3kkvr8u7_ON_TAP');
                                              logFirebaseEvent(
                                                  'Icon_navigate_to');

                                              context.pushNamed(
                                                'request_Details',
                                                queryParameters: {
                                                  'supervisorRef':
                                                      serializeParam(
                                                    listViewToolsRequestsRecord
                                                        .supervisor,
                                                    ParamType.DocumentReference,
                                                  ),
                                                  'requestRef': serializeParam(
                                                    listViewToolsRequestsRecord
                                                        .reference,
                                                    ParamType.DocumentReference,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            },
                                            child: const Icon(
                                              Icons.chevron_right_rounded,
                                              color: Color(0xFF606A85),
                                              size: 24.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
