import '/backend/backend.dart';
import '/components/error_component_widget.dart';
import '/components/info_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'set_street_supervisor_model.dart';
export 'set_street_supervisor_model.dart';

class SetStreetSupervisorWidget extends StatefulWidget {
  const SetStreetSupervisorWidget({super.key});

  @override
  State<SetStreetSupervisorWidget> createState() =>
      _SetStreetSupervisorWidgetState();
}

class _SetStreetSupervisorWidgetState extends State<SetStreetSupervisorWidget>
    with TickerProviderStateMixin {
  late SetStreetSupervisorModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SetStreetSupervisorModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'set_street_supervisor'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('SET_STREET_SUPERVISOR_set_street_supervi');
      logFirebaseEvent('set_street_supervisor_firestore_query');
      _model.sectors = await querySectorsRecordOnce();
      logFirebaseEvent('set_street_supervisor_update_app_state');
      setState(() {});
    });

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 100.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

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
        title: 'set_street_supervisor',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
                logFirebaseEvent('SET_STREET_SUPERVISOR_arrow_back_rounded');
                logFirebaseEvent('IconButton_navigate_back');
                context.pop();
              },
            ),
            title: Text(
              FFLocalizations.of(context).getText(
                'u8l5pdd2' /* Assign supervisor */,
              ),
              style: FlutterFlowTheme.of(context).headlineSmall.override(
                    fontFamily:
                        FlutterFlowTheme.of(context).headlineSmallFamily,
                    color: FlutterFlowTheme.of(context).info,
                    letterSpacing: 0.0,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).headlineSmallFamily),
                  ),
            ),
            actions: const [],
            centerTitle: true,
            elevation: 2.0,
          ),
          body: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: 80.0,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            FlutterFlowTheme.of(context).secondaryBackground,
                            FlutterFlowTheme.of(context).accent4
                          ],
                          stops: const [0.0, 1.0],
                          begin: const AlignmentDirectional(0.0, -1.0),
                          end: const AlignmentDirectional(0, 1.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 8.0, 16.0, 12.0),
                        child: Container(
                          width: double.infinity,
                          height: 60.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 3.0,
                                color: Color(0x33000000),
                                offset: Offset(
                                  0.0,
                                  1.0,
                                ),
                              )
                            ],
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).alternate,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              FlutterFlowDropDown<String>(
                                controller: _model.dropDownValueController1 ??=
                                    FormFieldController<String>(
                                  _model.dropDownValue1 ??=
                                      _model.sectors != null &&
                                              (_model.sectors)!.isNotEmpty
                                          ? _model.sectors?.first.sectorID
                                          : 'لا يوجد',
                                ),
                                options: List<String>.from(
                                    _model.sectors != null &&
                                            (_model.sectors)!.isNotEmpty
                                        ? _model.sectors!
                                            .map((e) => e.sectorID)
                                            .toList()
                                        : (["لا يوجد"])),
                                optionLabels: _model.sectors != null &&
                                        (_model.sectors)!.isNotEmpty
                                    ? _model.sectors!
                                        .map((e) => e.sectorName)
                                        .toList()
                                    : (["لا يوجد"]),
                                onChanged: (val) async {
                                  setState(() => _model.dropDownValue1 = val);
                                  logFirebaseEvent(
                                      'SET_STREET_SUPERVISOR_DropDown_eylbupqv_');
                                  logFirebaseEvent('DropDown_firestore_query');
                                  _model.sectorChosen =
                                      await querySectorsRecordOnce(
                                    queryBuilder: (sectorsRecord) =>
                                        sectorsRecord.where(
                                      'sectorID',
                                      isEqualTo: _model.dropDownValue1,
                                    ),
                                    singleRecord: true,
                                  ).then((s) => s.firstOrNull);
                                  logFirebaseEvent('DropDown_firestore_query');
                                  _model.sectorSquares =
                                      await querySquaresRecordOnce(
                                    queryBuilder: (squaresRecord) =>
                                        squaresRecord.where(
                                      'sectorRefrence',
                                      isEqualTo: _model.sectorChosen?.reference,
                                    ),
                                  );

                                  setState(() {});
                                },
                                width: 113.0,
                                height: 56.0,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                                hintText: FFLocalizations.of(context).getText(
                                  'xntr6q3o' /* Sector */,
                                ),
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                elevation: 2.0,
                                borderColor: Colors.transparent,
                                borderWidth: 2.0,
                                borderRadius: 8.0,
                                margin: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 4.0, 16.0, 4.0),
                                hidesUnderline: true,
                                isOverButton: true,
                                isSearchable: false,
                                isMultiSelect: false,
                              ),
                              FlutterFlowDropDown<String>(
                                controller: _model.dropDownValueController2 ??=
                                    FormFieldController<String>(
                                  _model.dropDownValue2 ??=
                                      _model.sectorSquares != null &&
                                              (_model.sectorSquares)!.isNotEmpty
                                          ? _model
                                              .sectorSquares?.first.squareID
                                          : 'لا يوجد',
                                ),
                                options: List<String>.from(
                                    _model.sectorSquares != null &&
                                            (_model.sectorSquares)!.isNotEmpty
                                        ? _model.sectorSquares!
                                            .map((e) => e.squareID)
                                            .toList()
                                        : (["لا يوجد"])),
                                optionLabels: _model.sectorSquares != null &&
                                        (_model.sectorSquares)!.isNotEmpty
                                    ? _model.sectorSquares!
                                        .map((e) => e.squareName)
                                        .toList()
                                    : (["لا يوجد"]),
                                onChanged: (val) async {
                                  setState(() => _model.dropDownValue2 = val);
                                  logFirebaseEvent(
                                      'SET_STREET_SUPERVISOR_DropDown_jswbod5g_');
                                  logFirebaseEvent('DropDown_firestore_query');
                                  _model.squareChosen =
                                      await querySquaresRecordOnce(
                                    queryBuilder: (squaresRecord) =>
                                        squaresRecord.where(
                                      'squareID',
                                      isEqualTo: _model.dropDownValue2,
                                    ),
                                    singleRecord: true,
                                  ).then((s) => s.firstOrNull);
                                  logFirebaseEvent('DropDown_firestore_query');
                                  _model.leadersSquare =
                                      await queryLeadersRecordOnce(
                                    queryBuilder: (leadersRecord) =>
                                        leadersRecord.where(
                                      'squareRefrence',
                                      isEqualTo: _model.squareChosen?.reference,
                                    ),
                                  );

                                  setState(() {});
                                },
                                width: 113.0,
                                height: 56.0,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                                hintText: FFLocalizations.of(context).getText(
                                  '899zvq24' /* Square */,
                                ),
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                                elevation: 2.0,
                                borderColor: Colors.transparent,
                                borderWidth: 2.0,
                                borderRadius: 8.0,
                                margin: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 4.0, 16.0, 4.0),
                                hidesUnderline: true,
                                isOverButton: true,
                                isSearchable: false,
                                isMultiSelect: false,
                              ),
                              FlutterFlowDropDown<String>(
                                controller: _model.dropDownValueController3 ??=
                                    FormFieldController<String>(
                                  _model.dropDownValue3 ??=
                                      _model.sectorSquares != null &&
                                              (_model.sectorSquares)!.isNotEmpty
                                          ? _model
                                              .leadersSquare?.first.leaderID
                                          : 'لا يوجد',
                                ),
                                options: List<String>.from(
                                    _model.leadersSquare != null &&
                                            (_model.leadersSquare)!.isNotEmpty
                                        ? _model.leadersSquare!
                                            .map((e) => e.leaderID)
                                            .toList()
                                        : (["لا يوجد"])),
                                optionLabels: _model.leadersSquare != null &&
                                        (_model.leadersSquare)!.isNotEmpty
                                    ? _model.leadersSquare!
                                        .map((e) => e.leaderName)
                                        .toList()
                                    : (["لا يوجد"]),
                                onChanged: (val) async {
                                  setState(() => _model.dropDownValue3 = val);
                                  logFirebaseEvent(
                                      'SET_STREET_SUPERVISOR_DropDown_wqr5cpgb_');
                                  logFirebaseEvent('DropDown_custom_action');
                                  _model.leader =
                                      await actions.getLeaderDocumentFromID(
                                    _model.dropDownValue3!,
                                  );
                                  if (_model.leader?.reference != null) {
                                    if (_model.leader?.supervisorMain != null) {
                                      logFirebaseEvent('DropDown_backend_call');
                                      _model.superMain =
                                          await UsersRecord.getDocumentOnce(
                                              _model.leader!.supervisorMain!);
                                      logFirebaseEvent(
                                          'DropDown_set_form_field');
                                      setState(() {
                                        _model.dropDownValueController4?.value =
                                            _model.superMain!.userCode;
                                      });
                                    }
                                  }

                                  setState(() {});
                                },
                                width: 113.0,
                                height: 56.0,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                                hintText: FFLocalizations.of(context).getText(
                                  'ypud8avd' /* Leader */,
                                ),
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                elevation: 2.0,
                                borderColor: Colors.transparent,
                                borderWidth: 2.0,
                                borderRadius: 8.0,
                                margin: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 4.0, 16.0, 4.0),
                                hidesUnderline: true,
                                isOverButton: true,
                                isSearchable: false,
                                isMultiSelect: false,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 40.0),
                child: StreamBuilder<List<UsersRecord>>(
                  stream: queryUsersRecord(
                    queryBuilder: (usersRecord) => usersRecord.where(
                      'privileges.role_name',
                      isEqualTo: 'مشرف',
                    ),
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
                    List<UsersRecord> proPlanUsersRecordList = snapshot.data!;
                    return Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 7.0,
                            color: Color(0x32171717),
                            offset: Offset(
                              0.0,
                              3.0,
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 10.0, 16.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 20.0, 0.0, 20.0),
                                      child: FlutterFlowDropDown<String>(
                                        controller:
                                            _model.dropDownValueController4 ??=
                                                FormFieldController<String>(
                                          _model.dropDownValue4 ??= '',
                                        ),
                                        options: List<String>.from(
                                            proPlanUsersRecordList
                                                .map((e) => e.userCode)
                                                .toList()),
                                        optionLabels: proPlanUsersRecordList
                                            .map((e) => e.displayName)
                                            .toList(),
                                        onChanged: (val) async {
                                          setState(() =>
                                              _model.dropDownValue4 = val);
                                          logFirebaseEvent(
                                              'SET_STREET_SUPERVISOR_DropDown_7qadbbds_');
                                          logFirebaseEvent(
                                              'DropDown_custom_action');
                                          _model.secondarySupervisorOutput =
                                              await actions.removeUserFromList(
                                            proPlanUsersRecordList.toList(),
                                            _model.dropDownValue4!,
                                          );

                                          setState(() {});
                                        },
                                        width: double.infinity,
                                        height: 56.0,
                                        searchHintTextStyle:
                                            FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMediumFamily,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMediumFamily),
                                                ),
                                        searchTextStyle: FlutterFlowTheme.of(
                                                context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
                                            ),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
                                            ),
                                        hintText:
                                            FFLocalizations.of(context).getText(
                                          'a210atl7' /* Main supervisor */,
                                        ),
                                        searchHintText:
                                            FFLocalizations.of(context).getText(
                                          'jkq83rnz' /* Search for an item... */,
                                        ),
                                        icon: Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 24.0,
                                        ),
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        elevation: 2.0,
                                        borderColor: Colors.transparent,
                                        borderWidth: 2.0,
                                        borderRadius: 8.0,
                                        margin: const EdgeInsetsDirectional.fromSTEB(
                                            16.0, 4.0, 16.0, 4.0),
                                        hidesUnderline: true,
                                        isOverButton: true,
                                        isSearchable: true,
                                        isMultiSelect: false,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ).animateOnPageLoad(
                        animationsMap['containerOnPageLoadAnimation']!);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent(
                        'SET_STREET_SUPERVISOR_Button-Login_ON_TA');
                    var shouldSetState = false;
                    if ((_model.dropDownValue4 != 'لا يوجد') &&
                        (_model.dropDownValue4 != '')) {
                      logFirebaseEvent('Button-Login_custom_action');
                      _model.mainUser = await actions.getUserDocumentFromID(
                        'User_${_model.dropDownValue4}',
                      );
                      shouldSetState = true;
                      if (_model.mainUser?.reference != null) {
                        logFirebaseEvent('Button-Login_update_page_state');
                        setState(() {
                          _model.mainLeaderRefrence =
                              _model.mainUser?.leaderAreaRefrence1;
                        });
                        if (_model.mainUser?.leaderAreaRefrence1 != null) {
                          logFirebaseEvent('Button-Login_backend_call');
                          _model.oldLeaderRefrence =
                              await LeadersRecord.getDocumentOnce(
                                  _model.mainUser!.leaderAreaRefrence1!);
                          shouldSetState = true;
                          logFirebaseEvent('Button-Login_backend_call');
                          _model.oldSquare =
                              await SquaresRecord.getDocumentOnce(
                                  _model.oldLeaderRefrence!.squareRefrence!);
                          shouldSetState = true;
                          logFirebaseEvent('Button-Login_update_page_state');
                          setState(() {
                            _model.oldSectorRefrence =
                                _model.oldSquare?.sectorRefrence;
                          });
                        }
                      }
                      logFirebaseEvent('Button-Login_custom_action');
                      _model.supervisorAssignOutput =
                          await actions.assignSupervisorToLeader(
                        _model.dropDownValue3!,
                        _model.dropDownValue1!,
                        _model.dropDownValue4!,
                        _model.oldSectorRefrence,
                        _model.mainLeaderRefrence,
                      );
                      shouldSetState = true;
                      if (_model.supervisorAssignOutput!) {
                        logFirebaseEvent('Button-Login_bottom_sheet');
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          isDismissible: false,
                          enableDrag: false,
                          context: context,
                          builder: (context) {
                            return Padding(
                              padding: MediaQuery.viewInsetsOf(context),
                              child: SizedBox(
                                height: MediaQuery.sizeOf(context).height * 1.0,
                                child: InfoWidget(
                                  headerName: 'تم التعين',
                                  infoMessage: 'تم تعيين المشرف بنجاح',
                                  cancelButtonText: 'تم',
                                  cancelButtonAction: () async {
                                    logFirebaseEvent('_bottom_sheet');
                                    Navigator.pop(context);
                                    logFirebaseEvent('_update_app_state');
                                    setState(() {});
                                  },
                                ),
                              ),
                            );
                          },
                        ).then((value) => safeSetState(() {}));

                        if (shouldSetState) setState(() {});
                        return;
                      } else {
                        if (shouldSetState) setState(() {});
                        return;
                      }
                    } else {
                      logFirebaseEvent('Button-Login_bottom_sheet');
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        isDismissible: false,
                        enableDrag: false,
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: MediaQuery.viewInsetsOf(context),
                            child: SizedBox(
                              height: MediaQuery.sizeOf(context).height * 1.0,
                              child: ErrorComponentWidget(
                                errorMessage:
                                    'يرجي ادخال جميع المعلومات حتي تتمكن من الاستمرار',
                                cancelButtonText: 'تم',
                                errorHeader: 'فشل تعين المشرف',
                                cancelButtonAction: () async {
                                  logFirebaseEvent('_bottom_sheet');
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          );
                        },
                      ).then((value) => safeSetState(() {}));

                      if (shouldSetState) setState(() {});
                      return;
                    }

                    if (shouldSetState) setState(() {});
                  },
                  text: FFLocalizations.of(context).getText(
                    '9qe97jtv' /* Assign supervisor  */,
                  ),
                  options: FFButtonOptions(
                    width: 190.0,
                    height: 50.0,
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).titleSmallFamily,
                          color: Colors.white,
                          letterSpacing: 0.0,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).titleSmallFamily),
                        ),
                    elevation: 3.0,
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
