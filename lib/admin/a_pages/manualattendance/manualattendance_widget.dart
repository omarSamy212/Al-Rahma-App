import '/admin/a_components/dial/dial_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/yes_no_question_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/under_test/components_under_test/empty_listsimple/empty_listsimple_widget.dart';
import 'dart:async';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'manualattendance_model.dart';
export 'manualattendance_model.dart';

class ManualattendanceWidget extends StatefulWidget {
  const ManualattendanceWidget({super.key});

  @override
  State<ManualattendanceWidget> createState() => _ManualattendanceWidgetState();
}

class _ManualattendanceWidgetState extends State<ManualattendanceWidget> {
  late ManualattendanceModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ManualattendanceModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'Manualattendance'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('MANUALATTENDANCE_Manualattendance_ON_INI');
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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

    return AuthUserStreamWidget(
      builder: (context) => StreamBuilder<List<SectorsRecord>>(
        stream: querySectorsRecord(
          queryBuilder: (sectorsRecord) => sectorsRecord.where(
            'supervisors',
            arrayContains: currentUserDocument?.userRefrence,
          ),
          singleRecord: true,
        )..listen((snapshot) async {
            List<SectorsRecord> manualattendanceSectorsRecordList = snapshot;
            final manualattendanceSectorsRecord =
                manualattendanceSectorsRecordList.isNotEmpty
                    ? manualattendanceSectorsRecordList.first
                    : null;
            if (_model.manualattendancePreviousSnapshot != null &&
                !const ListEquality(SectorsRecordDocumentEquality()).equals(
                    manualattendanceSectorsRecordList,
                    _model.manualattendancePreviousSnapshot)) {
              logFirebaseEvent('MANUALATTENDANCE_Manualattendance_ON_DAT');

              setState(() {});
            }
            _model.manualattendancePreviousSnapshot = snapshot;
          }),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Scaffold(
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              body: const Center(
                child: SizedBox(
                  width: 50.0,
                  height: 50.0,
                  child: SpinKitDualRing(
                    color: Color(0xFF0CA256),
                    size: 50.0,
                  ),
                ),
              ),
            );
          }
          List<SectorsRecord> manualattendanceSectorsRecordList =
              snapshot.data!;
          final manualattendanceSectorsRecord =
              manualattendanceSectorsRecordList.isNotEmpty
                  ? manualattendanceSectorsRecordList.first
                  : null;
          return Title(
              title: 'Manualattendance',
              color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
              child: GestureDetector(
                onTap: () => _model.unfocusNode.canRequestFocus
                    ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                    : FocusScope.of(context).unfocus(),
                child: Scaffold(
                  key: scaffoldKey,
                  backgroundColor:
                      FlutterFlowTheme.of(context).primaryBackground,
                  body: NestedScrollView(
                    floatHeaderSlivers: true,
                    headerSliverBuilder: (context, _) => [
                      SliverAppBar(
                        pinned: false,
                        floating: true,
                        snap: false,
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
                            logFirebaseEvent(
                                'MANUALATTENDANCE_arrow_back_rounded_ICN_');
                            logFirebaseEvent('IconButton_navigate_back');
                            context.pop();
                          },
                        ),
                        title: Text(
                          FFLocalizations.of(context).getText(
                            'fuyt1sww' /* Manual Attendance */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .headlineMediumFamily,
                                color: Colors.white,
                                fontSize: 22.0,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .headlineMediumFamily),
                              ),
                        ),
                        actions: const [],
                        centerTitle: true,
                        elevation: 2.0,
                      )
                    ],
                    body: Builder(
                      builder: (context) {
                        return StreamBuilder<List<UsersRecord>>(
                          stream: queryUsersRecord(
                            queryBuilder: (usersRecord) => usersRecord
                                .where(
                                  'accountStatus',
                                  isEqualTo: 'active',
                                )
                                .where(
                                  'privileges.role_name',
                                  isEqualTo: 'عامل',
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
                            List<UsersRecord> containerUsersRecordList =
                                snapshot.data!;
                            return Container(
                              decoration: const BoxDecoration(),
                              child: Container(
                                decoration: const BoxDecoration(),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    5.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          height: 80.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            gradient:
                                                                LinearGradient(
                                                              colors: [
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent4
                                                              ],
                                                              stops: const [0.0, 1.0],
                                                              begin:
                                                                  const AlignmentDirectional(
                                                                      0.0,
                                                                      -1.0),
                                                              end:
                                                                  const AlignmentDirectional(
                                                                      0, 1.0),
                                                            ),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        8.0,
                                                                        16.0,
                                                                        12.0),
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              height: 60.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                boxShadow: const [
                                                                  BoxShadow(
                                                                    blurRadius:
                                                                        3.0,
                                                                    color: Color(
                                                                        0x33000000),
                                                                    offset:
                                                                        Offset(
                                                                      0.0,
                                                                      1.0,
                                                                    ),
                                                                  )
                                                                ],
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12.0),
                                                                border:
                                                                    Border.all(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                ),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .search_rounded,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            4.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              200.0,
                                                                          child:
                                                                              TextFormField(
                                                                            controller:
                                                                                _model.textController,
                                                                            focusNode:
                                                                                _model.textFieldFocusNode,
                                                                            onChanged: (_) =>
                                                                                EasyDebounce.debounce(
                                                                              '_model.textController',
                                                                              const Duration(milliseconds: 2000),
                                                                              () async {
                                                                                logFirebaseEvent('MANUALATTENDANCE_TextField_55p2csss_ON_T');
                                                                              },
                                                                            ),
                                                                            autofocus:
                                                                                false,
                                                                            obscureText:
                                                                                false,
                                                                            decoration:
                                                                                InputDecoration(
                                                                              labelText: FFLocalizations.of(context).getText(
                                                                                '4c1qqsgt' /* Search listings... */,
                                                                              ),
                                                                              labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                  ),
                                                                              hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                  ),
                                                                              enabledBorder: InputBorder.none,
                                                                              focusedBorder: InputBorder.none,
                                                                              errorBorder: InputBorder.none,
                                                                              focusedErrorBorder: InputBorder.none,
                                                                              filled: true,
                                                                              fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                ),
                                                                            cursorColor:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            validator:
                                                                                _model.textControllerValidator.asValidator(context),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    FlutterFlowIconButton(
                                                                      borderColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .alternate,
                                                                      borderRadius:
                                                                          10.0,
                                                                      borderWidth:
                                                                          1.0,
                                                                      buttonSize:
                                                                          40.0,
                                                                      fillColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .close,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                      onPressed:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'MANUALATTENDANCE_PAGE_close_ICN_ON_TAP');
                                                                        logFirebaseEvent(
                                                                            'IconButton_clear_text_fields_pin_codes');
                                                                        setState(
                                                                            () {
                                                                          _model
                                                                              .textController
                                                                              ?.clear();
                                                                        });
                                                                      },
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Divider(
                                                          thickness: 1.0,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .accent4,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  18.0,
                                                                  0.0),
                                                      child: Text(
                                                        valueOrDefault<String>(
                                                          FFAppState()
                                                              .sessionInfo
                                                              .sessionName,
                                                          'session name',
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                width: double.infinity,
                                                constraints: const BoxConstraints(
                                                  maxWidth: 1270.0,
                                                ),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Builder(
                                              builder: (context) {
                                                final fullUsers =
                                                    containerUsersRecordList
                                                        .map((e) => e)
                                                        .toList();
                                                if (fullUsers.isEmpty) {
                                                  return const Center(
                                                    child:
                                                        EmptyListsimpleWidget(),
                                                  );
                                                }
                                                return ListView.builder(
                                                  padding: EdgeInsets.zero,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount: fullUsers.length,
                                                  itemBuilder: (context,
                                                      fullUsersIndex) {
                                                    final fullUsersItem =
                                                        fullUsers[
                                                            fullUsersIndex];
                                                    return Visibility(
                                                      visible: (_model.textController.text == '') ||
                                                          (((_model.textController.text != '') &&
                                                                  functions.checkNameRegex(
                                                                      _model
                                                                          .textController
                                                                          .text,
                                                                      '${fullUsersItem.firstName} ${fullUsersItem.middleName} ${fullUsersItem.lastName}')!) ||
                                                              ((_model.textController.text != '') &&
                                                                  functions.checkNameRegex(
                                                                      _model
                                                                          .textController
                                                                          .text,
                                                                      fullUsersItem
                                                                          .displayName)!) ||
                                                              ((_model.textController.text != '') &&
                                                                  functions.checkNameRegex(
                                                                      _model
                                                                          .textController
                                                                          .text,
                                                                      fullUsersItem.userCode)!)),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    8.0,
                                                                    16.0,
                                                                    0.0),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            boxShadow: const [
                                                              BoxShadow(
                                                                blurRadius: 3.0,
                                                                color: Color(
                                                                    0x20000000),
                                                                offset: Offset(
                                                                  0.0,
                                                                  1.0,
                                                                ),
                                                              )
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        10.0,
                                                                        12.0,
                                                                        10.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                  child: Image
                                                                      .network(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      fullUsersItem
                                                                          .photoUrl,
                                                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/al-rahma-paufng/assets/nyfyk3dm1q65/unknown-user-image.jpg',
                                                                    ),
                                                                    width: 70.0,
                                                                    height:
                                                                        70.0,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            '${fullUsersItem.firstName} ${fullUsersItem.middleName} ${fullUsersItem.lastName}',
                                                                            'Full Name',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyLarge
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            16.0,
                                                                            4.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            fullUsersItem.privileges.roleName,
                                                                            'Role',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            16.0,
                                                                            4.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'whtbf36g' /* #ID */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Builder(
                                                                      builder:
                                                                          (context) {
                                                                        if (fullUsersItem.attendance.attendanceState ==
                                                                            AttedanceState
                                                                                .waiting) {
                                                                          return Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'tgs80qt7' /* Attend */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                      letterSpacing: 0.0,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                    ),
                                                                              ),
                                                                              FlutterFlowIconButton(
                                                                                borderRadius: 20.0,
                                                                                borderWidth: 1.0,
                                                                                icon: Icon(
                                                                                  Icons.login_outlined,
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  size: 25.0,
                                                                                ),
                                                                                showLoadingIndicator: true,
                                                                                onPressed: () async {
                                                                                  logFirebaseEvent('MANUALATTENDANCE_login_outlined_ICN_ON_T');
                                                                                  logFirebaseEvent('IconButton_bottom_sheet');
                                                                                  await showModalBottomSheet(
                                                                                    isScrollControlled: true,
                                                                                    backgroundColor: Colors.transparent,
                                                                                    isDismissible: false,
                                                                                    enableDrag: false,
                                                                                    context: context,
                                                                                    builder: (context) {
                                                                                      return GestureDetector(
                                                                                        onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                        child: Padding(
                                                                                          padding: MediaQuery.viewInsetsOf(context),
                                                                                          child: YesNoQuestionWidget(
                                                                                            headerName: 'رسالة تأكيد',
                                                                                            infoMessage: 'هل انت متأكد من تحضير  هذا العامل ؟',
                                                                                            yesButtonText: 'نعم',
                                                                                            noButtonText: 'لا',
                                                                                            yesButtonAction: () async {
                                                                                              logFirebaseEvent('_backend_call');

                                                                                              var checksRecordReference = ChecksRecord.collection.doc('${fullUsersItem.userCode}_${functions.currentDate()}');
                                                                                              await checksRecordReference.set(createChecksRecordData(
                                                                                                sessionId: FFAppState().sessionInfo.sessionDocRef,
                                                                                                checkIn: createChecksStruct(
                                                                                                  time: functions.getTimeNow(),
                                                                                                  date: functions.currentDate(),
                                                                                                  clearUnsetFields: false,
                                                                                                  create: true,
                                                                                                ),
                                                                                                sector: manualattendanceSectorsRecord?.reference,
                                                                                                userRef: fullUsersItem.reference,
                                                                                                attendedBy: currentUserDocument?.userRefrence,
                                                                                                userRole: fullUsersItem.privileges.roleName,
                                                                                              ));
                                                                                              _model.createCheck = ChecksRecord.getDocumentFromData(
                                                                                                  createChecksRecordData(
                                                                                                    sessionId: FFAppState().sessionInfo.sessionDocRef,
                                                                                                    checkIn: createChecksStruct(
                                                                                                      time: functions.getTimeNow(),
                                                                                                      date: functions.currentDate(),
                                                                                                      clearUnsetFields: false,
                                                                                                      create: true,
                                                                                                    ),
                                                                                                    sector: manualattendanceSectorsRecord?.reference,
                                                                                                    userRef: fullUsersItem.reference,
                                                                                                    attendedBy: currentUserDocument?.userRefrence,
                                                                                                    userRole: fullUsersItem.privileges.roleName,
                                                                                                  ),
                                                                                                  checksRecordReference);
                                                                                              if (fullUsersItem.privileges.roleName == 'عامل') {
                                                                                                logFirebaseEvent('_backend_call');

                                                                                                await FFAppState().sessionInfo.sessionDocRef!.update({
                                                                                                  ...mapToFirestore(
                                                                                                    {
                                                                                                      'workers_attended': FieldValue.arrayUnion([
                                                                                                        fullUsersItem.reference
                                                                                                      ]),
                                                                                                    },
                                                                                                  ),
                                                                                                });
                                                                                                logFirebaseEvent('_backend_call');

                                                                                                await manualattendanceSectorsRecord!.reference.update({
                                                                                                  ...mapToFirestore(
                                                                                                    {
                                                                                                      'streetWorkersList': FieldValue.arrayUnion([
                                                                                                        fullUsersItem.reference
                                                                                                      ]),
                                                                                                    },
                                                                                                  ),
                                                                                                });
                                                                                              } else {
                                                                                                logFirebaseEvent('_backend_call');

                                                                                                await FFAppState().sessionInfo.sessionDocRef!.update({
                                                                                                  ...mapToFirestore(
                                                                                                    {
                                                                                                      'other_attended': FieldValue.arrayUnion([
                                                                                                        fullUsersItem.reference
                                                                                                      ]),
                                                                                                    },
                                                                                                  ),
                                                                                                });
                                                                                              }

                                                                                              logFirebaseEvent('_backend_call');
                                                                                              unawaited(
                                                                                                () async {
                                                                                                  await fullUsersItem.reference.update(createUsersRecordData(
                                                                                                    attendance: updateAttendacneStruct(
                                                                                                      AttendacneStruct(
                                                                                                        attendanceState: AttedanceState.attend,
                                                                                                        checkRef: _model.createCheck?.reference,
                                                                                                      ),
                                                                                                      clearUnsetFields: false,
                                                                                                    ),
                                                                                                  ));
                                                                                                }(),
                                                                                              );
                                                                                              logFirebaseEvent('_show_snack_bar');
                                                                                              ScaffoldMessenger.of(context).clearSnackBars();
                                                                                              ScaffoldMessenger.of(context).showSnackBar(
                                                                                                SnackBar(
                                                                                                  content: Text(
                                                                                                    'تم التحضير',
                                                                                                    style: TextStyle(
                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                    ),
                                                                                                  ),
                                                                                                  duration: const Duration(milliseconds: 4000),
                                                                                                  backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                                ),
                                                                                              );
                                                                                              logFirebaseEvent('_bottom_sheet');
                                                                                              Navigator.pop(context);
                                                                                            },
                                                                                            noButtonAction: () async {
                                                                                              logFirebaseEvent('_bottom_sheet');
                                                                                              Navigator.pop(context);
                                                                                            },
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                  ).then((value) => safeSetState(() {}));

                                                                                  setState(() {});
                                                                                },
                                                                              ),
                                                                            ],
                                                                          );
                                                                        } else if (fullUsersItem.attendance.attendanceState ==
                                                                            AttedanceState
                                                                                .attend) {
                                                                          return Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'wtx6frbe' /* Attend */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                      color: FlutterFlowTheme.of(context).error,
                                                                                      letterSpacing: 0.0,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                    ),
                                                                              ),
                                                                              Builder(
                                                                                builder: (context) => FlutterFlowIconButton(
                                                                                  borderRadius: 20.0,
                                                                                  borderWidth: 1.0,
                                                                                  buttonSize: 40.0,
                                                                                  icon: Icon(
                                                                                    Icons.logout_rounded,
                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                    size: 24.0,
                                                                                  ),
                                                                                  showLoadingIndicator: true,
                                                                                  onPressed: () async {
                                                                                    logFirebaseEvent('MANUALATTENDANCE_logout_rounded_ICN_ON_T');
                                                                                    logFirebaseEvent('IconButton_alert_dialog');
                                                                                    await showDialog(
                                                                                      context: context,
                                                                                      builder: (dialogContext) {
                                                                                        return Dialog(
                                                                                          elevation: 0,
                                                                                          insetPadding: EdgeInsets.zero,
                                                                                          backgroundColor: Colors.transparent,
                                                                                          alignment: const AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                          child: GestureDetector(
                                                                                            onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                            child: DialWidget(
                                                                                              session: FFAppState().sessionInfo.sessionDocRef!,
                                                                                              attednDetails: fullUsersItem.attendance,
                                                                                              userRef: fullUsersItem.reference,
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                    ).then((value) => setState(() {}));

                                                                                    logFirebaseEvent('IconButton_bottom_sheet');
                                                                                    await showModalBottomSheet(
                                                                                      isScrollControlled: true,
                                                                                      backgroundColor: Colors.transparent,
                                                                                      enableDrag: false,
                                                                                      context: context,
                                                                                      builder: (context) {
                                                                                        return GestureDetector(
                                                                                          onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                          child: Padding(
                                                                                            padding: MediaQuery.viewInsetsOf(context),
                                                                                            child: YesNoQuestionWidget(
                                                                                              headerName: 'رسالة تأكيد',
                                                                                              infoMessage: 'هل انت متأكد من تسجيل خروج العامل؟',
                                                                                              yesButtonText: 'نعم',
                                                                                              noButtonText: 'لا',
                                                                                              yesButtonAction: () async {
                                                                                                logFirebaseEvent('_backend_call');
                                                                                                unawaited(
                                                                                                  () async {
                                                                                                    await fullUsersItem.attendance.checkRef!.update(createChecksRecordData(
                                                                                                      checkOut: updateChecksStruct(
                                                                                                        ChecksStruct(
                                                                                                          time: functions.getTimeNow(),
                                                                                                          date: functions.currentDate(),
                                                                                                        ),
                                                                                                        clearUnsetFields: false,
                                                                                                      ),
                                                                                                    ));
                                                                                                  }(),
                                                                                                );
                                                                                                logFirebaseEvent('_backend_call');
                                                                                                unawaited(
                                                                                                  () async {
                                                                                                    await fullUsersItem.reference.update(createUsersRecordData(
                                                                                                      attendance: createAttendacneStruct(
                                                                                                        attendanceState: AttedanceState.left,
                                                                                                        checkRef: fullUsersItem.attendance.checkRef,
                                                                                                        clearUnsetFields: false,
                                                                                                      ),
                                                                                                    ));
                                                                                                  }(),
                                                                                                );
                                                                                                logFirebaseEvent('_backend_call');
                                                                                                unawaited(
                                                                                                  () async {
                                                                                                    await functions.getAttendanceLogRef(fullUsersItem.reference.id)!.update({
                                                                                                      ...mapToFirestore(
                                                                                                        {
                                                                                                          'user_checks': FieldValue.arrayUnion([
                                                                                                            fullUsersItem.attendance.checkRef
                                                                                                          ]),
                                                                                                        },
                                                                                                      ),
                                                                                                    });
                                                                                                  }(),
                                                                                                );
                                                                                                logFirebaseEvent('_backend_call');

                                                                                                await fullUsersItem.contractorRef!.update({
                                                                                                  ...mapToFirestore(
                                                                                                    {
                                                                                                      'wokersAttendCount': FieldValue.increment(1),
                                                                                                    },
                                                                                                  ),
                                                                                                });
                                                                                                logFirebaseEvent('_show_snack_bar');
                                                                                                ScaffoldMessenger.of(context).showSnackBar(
                                                                                                  SnackBar(
                                                                                                    content: Text(
                                                                                                      'تم تسجيل خروج العامل',
                                                                                                      style: TextStyle(
                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                      ),
                                                                                                    ),
                                                                                                    duration: const Duration(milliseconds: 4000),
                                                                                                    backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                                  ),
                                                                                                );
                                                                                              },
                                                                                              noButtonAction: () async {
                                                                                                logFirebaseEvent('_bottom_sheet');
                                                                                                Navigator.pop(context);
                                                                                              },
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                    ).then((value) => safeSetState(() {}));
                                                                                  },
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          );
                                                                        } else if (fullUsersItem.attendance.attendanceState ==
                                                                            AttedanceState.left) {
                                                                          return Icon(
                                                                            Icons.done_all,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            size:
                                                                                24.0,
                                                                          );
                                                                        } else {
                                                                          return Icon(
                                                                            Icons.error,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).error,
                                                                            size:
                                                                                24.0,
                                                                          );
                                                                        }
                                                                      },
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              ));
        },
      ),
    );
  }
}
