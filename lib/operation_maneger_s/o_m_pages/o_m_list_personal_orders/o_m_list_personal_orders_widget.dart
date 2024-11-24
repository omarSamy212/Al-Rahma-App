import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/under_test/components_under_test/empty_listsimple/empty_listsimple_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'o_m_list_personal_orders_model.dart';
export 'o_m_list_personal_orders_model.dart';

class OMListPersonalOrdersWidget extends StatefulWidget {
  const OMListPersonalOrdersWidget({super.key});

  @override
  State<OMListPersonalOrdersWidget> createState() =>
      _OMListPersonalOrdersWidgetState();
}

class _OMListPersonalOrdersWidgetState extends State<OMListPersonalOrdersWidget>
    with TickerProviderStateMixin {
  late OMListPersonalOrdersModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OMListPersonalOrdersModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'OM_List_Personal_orders'});
    _model.natIDDateTextController ??= TextEditingController();
    _model.natIDDateFocusNode ??= FocusNode();

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
            begin: const Offset(0.0, 40.0),
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

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {
          _model.natIDDateTextController?.text =
              FFLocalizations.of(context).getText(
            'ij2wa0hz' /*  */,
          );
        }));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<PersonalRequestsRecord>>(
      stream: queryPersonalRequestsRecord(
        queryBuilder: (personalRequestsRecord) =>
            personalRequestsRecord.orderBy('createdTime', descending: true),
      ),
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
        List<PersonalRequestsRecord>
            oMListPersonalOrdersPersonalRequestsRecordList = snapshot.data!;
        return Title(
            title: 'OM_List_Personal_orders',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: GestureDetector(
              onTap: () => _model.unfocusNode.canRequestFocus
                  ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                  : FocusScope.of(context).unfocus(),
              child: Scaffold(
                key: scaffoldKey,
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
                      logFirebaseEvent(
                          'O_M_LIST_PERSONAL_ORDERS_arrow_back_roun');
                      if ((FFAppState().authenticatedUser.privileges.roleName ==
                              'رئيس مجلس الإدارة') ||
                          (FFAppState().authenticatedUser.privileges.roleName ==
                              'مدير المكتب')) {
                        logFirebaseEvent('IconButton_navigate_to');

                        context.goNamedAuth('New_Admin_Home', context.mounted);

                        return;
                      } else if ((FFAppState()
                                  .authenticatedUser
                                  .privileges
                                  .roleName ==
                              'نائب مدير التشغيل') ||
                          (FFAppState().authenticatedUser.privileges.roleName ==
                              'مدير التشغيل') ||
                          (FFAppState().authenticatedUser.privileges.roleName ==
                              'مدير العمليات')) {
                        logFirebaseEvent('IconButton_navigate_to');

                        context.pushNamedAuth('OM_Home', context.mounted);

                        return;
                      } else if ((FFAppState()
                                  .authenticatedUser
                                  .privileges
                                  .roleName ==
                              'مشرف') ||
                          (FFAppState().authenticatedUser.privileges.roleName ==
                              'مسؤول إداريين القطاعات') ||
                          (FFAppState().authenticatedUser.privileges.roleName ==
                              'مسؤول إداري قطاع')) {
                        logFirebaseEvent('IconButton_navigate_to');

                        context.goNamedAuth('supervisor_home', context.mounted);

                        return;
                      } else if (FFAppState()
                              .authenticatedUser
                              .privileges
                              .roleName ==
                          'مسؤول الحركة') {
                        logFirebaseEvent('IconButton_navigate_to');

                        context.pushNamedAuth('New_Tm_Home', context.mounted);

                        return;
                      } else if (FFAppState()
                              .authenticatedUser
                              .privileges
                              .roleName ==
                          'أمين مخزن') {
                        logFirebaseEvent('IconButton_navigate_to');

                        context.goNamedAuth('storekeeperHome', context.mounted);

                        return;
                      } else if (FFAppState()
                              .authenticatedUser
                              .privileges
                              .roleName ==
                          'مهندس برمجيات') {
                        logFirebaseEvent('IconButton_navigate_to');

                        context.pushNamedAuth('Eng_Home', context.mounted);

                        return;
                      } else if (FFAppState()
                              .authenticatedUser
                              .privileges
                              .roleName ==
                          'عامل') {
                        logFirebaseEvent('IconButton_navigate_to');

                        context.pushNamedAuth('worker_Home', context.mounted);

                        return;
                      } else if ((FFAppState()
                                  .authenticatedUser
                                  .privileges
                                  .roleName ==
                              'محاسب') ||
                          (FFAppState().authenticatedUser.privileges.roleName ==
                              'مسؤول حصر') ||
                          (FFAppState().authenticatedUser.privileges.roleName ==
                              'مدير حصر')) {
                        logFirebaseEvent('IconButton_navigate_to');

                        context.pushNamedAuth(
                            'AccountantHome', context.mounted);

                        return;
                      } else if (FFAppState()
                              .authenticatedUser
                              .privileges
                              .roleName ==
                          'مورد') {
                        logFirebaseEvent('IconButton_navigate_to');

                        context.pushNamedAuth('supllierHome', context.mounted);

                        return;
                      } else {
                        logFirebaseEvent('IconButton_auth');
                        GoRouter.of(context).prepareAuthEvent();
                        await authManager.signOut();
                        GoRouter.of(context).clearRedirectLocation();

                        logFirebaseEvent('IconButton_update_app_state');
                        setState(() {
                          FFAppState().authenticatedUser =
                              AuthorizedUserStruct();
                        });
                        logFirebaseEvent('IconButton_navigate_to');

                        context.pushNamedAuth('Login', context.mounted);

                        return;
                      }
                    },
                  ),
                  title: Text(
                    FFLocalizations.of(context).getText(
                      '1zbz8vgt' /* Personal orders */,
                    ),
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).headlineMediumFamily,
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
                ),
                body: SafeArea(
                  top: true,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: double.infinity,
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
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                FlutterFlowTheme.of(context).accent4
                              ],
                              stops: const [0.0, 1.0],
                              begin: const AlignmentDirectional(0.0, -1.0),
                              end: const AlignmentDirectional(0, 1.0),
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
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
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 0.0, 0.0),
                                        child: FlutterFlowDropDown<String>(
                                          controller:
                                              _model.dropDownValueController ??=
                                                  FormFieldController<String>(
                                            _model.dropDownValue ??=
                                                FFLocalizations.of(context)
                                                    .getText(
                                              'fip8qqf6' /* All */,
                                            ),
                                          ),
                                          options: [
                                            FFLocalizations.of(context).getText(
                                              'cwe42tzh' /* Loan */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              'zl8fya9p' /* All */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              'si2yx8xh' /* leaving early */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              'dgjmz0np' /* Other */,
                                            )
                                          ],
                                          onChanged: (val) => setState(
                                              () => _model.dropDownValue = val),
                                          width: 113.0,
                                          height: 56.0,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
                                              ),
                                          hintText: FFLocalizations.of(context)
                                              .getText(
                                            '1tyc90wp' /* Type */,
                                          ),
                                          icon: Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ),
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          elevation: 2.0,
                                          borderColor: Colors.white,
                                          borderWidth: 2.0,
                                          borderRadius: 8.0,
                                          margin:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 4.0, 16.0, 4.0),
                                          hidesUnderline: true,
                                          isOverButton: true,
                                          isSearchable: false,
                                          isMultiSelect: false,
                                        ),
                                      ),
                                      Opacity(
                                        opacity: 0.5,
                                        child: SizedBox(
                                          height: 30.0,
                                          child: VerticalDivider(
                                            thickness: 1.0,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 0.0, 20.0, 0.0),
                                          child: SizedBox(
                                            width: 100.0,
                                            child: TextFormField(
                                              controller: _model
                                                  .natIDDateTextController,
                                              focusNode:
                                                  _model.natIDDateFocusNode,
                                              textCapitalization:
                                                  TextCapitalization.none,
                                              readOnly: true,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelText:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'k8o9j4nx' /* Date  */,
                                                ),
                                                labelStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily:
                                                          'Plus Jakarta Sans',
                                                      color: const Color(0xFF57636C),
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      useGoogleFonts: GoogleFonts
                                                              .asMap()
                                                          .containsKey(
                                                              'Plus Jakarta Sans'),
                                                    ),
                                                hintText:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'kyhiedjn' /*  */,
                                                ),
                                                hintStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily:
                                                          'Plus Jakarta Sans',
                                                      color: const Color(0xFF57636C),
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      useGoogleFonts: GoogleFonts
                                                              .asMap()
                                                          .containsKey(
                                                              'Plus Jakarta Sans'),
                                                    ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0xFF4B39EF),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0xFFFF5963),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0xFFFF5963),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                filled: true,
                                                fillColor: Colors.white,
                                                contentPadding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(20.0, 24.0,
                                                            0.0, 24.0),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Plus Jakarta Sans',
                                                        color:
                                                            const Color(0xFF14181B),
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                'Plus Jakarta Sans'),
                                                      ),
                                              keyboardType:
                                                  TextInputType.datetime,
                                              validator: _model
                                                  .natIDDateTextControllerValidator
                                                  .asValidator(context),
                                              inputFormatters: [
                                                _model.natIDDateMask
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 16.0, 0.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'O_M_LIST_PERSONAL_ORDERS__BTN_ON_TAP');
                                              logFirebaseEvent(
                                                  'Button_date_time_picker');
                                              final datePickedDate =
                                                  await showDatePicker(
                                                context: context,
                                                initialDate:
                                                    getCurrentTimestamp,
                                                firstDate: DateTime(1900),
                                                lastDate: getCurrentTimestamp,
                                                builder: (context, child) {
                                                  return wrapInMaterialDatePickerTheme(
                                                    context,
                                                    child!,
                                                    headerBackgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    headerForegroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .info,
                                                    headerTextStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .headlineLarge
                                                            .override(
                                                              fontFamily:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineLargeFamily,
                                                              fontSize: 32.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              useGoogleFonts: GoogleFonts
                                                                      .asMap()
                                                                  .containsKey(
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineLargeFamily),
                                                            ),
                                                    pickerBackgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryBackground,
                                                    pickerForegroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    selectedDateTimeBackgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    selectedDateTimeForegroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .info,
                                                    actionButtonForegroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    iconSize: 24.0,
                                                  );
                                                },
                                              );

                                              if (datePickedDate != null) {
                                                safeSetState(() {
                                                  _model.datePicked = DateTime(
                                                    datePickedDate.year,
                                                    datePickedDate.month,
                                                    datePickedDate.day,
                                                  );
                                                });
                                              }
                                              logFirebaseEvent(
                                                  'Button_set_form_field');
                                              setState(() {
                                                _model.natIDDateTextController
                                                    ?.text = dateTimeFormat(
                                                  'd/M',
                                                  _model.datePicked,
                                                  locale: FFLocalizations.of(
                                                          context)
                                                      .languageCode,
                                                );
                                              });
                                            },
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              'jhr7yw54' /*  */,
                                            ),
                                            icon: const Icon(
                                              Icons.calendar_month,
                                              size: 15.0,
                                            ),
                                            options: FFButtonOptions(
                                              width: 36.0,
                                              height: 39.0,
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: const EdgeInsetsDirectional
                                                  .fromSTEB(6.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmallFamily,
                                                        color: Colors.white,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily),
                                                      ),
                                              elevation: 3.0,
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 10.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            16.0, 8.0, 16.0, 8.0),
                                        child: FlutterFlowChoiceChips(
                                          options: [
                                            ChipData(FFLocalizations.of(context)
                                                .getText(
                                              'yr5qws8k' /* All */,
                                            )),
                                            ChipData(FFLocalizations.of(context)
                                                .getText(
                                              'sjoz3rqq' /* Approved */,
                                            )),
                                            ChipData(FFLocalizations.of(context)
                                                .getText(
                                              '7onu4hnd' /* Rejected */,
                                            )),
                                            ChipData(FFLocalizations.of(context)
                                                .getText(
                                              'mxjsxmrn' /* In progress */,
                                            )),
                                            ChipData(FFLocalizations.of(context)
                                                .getText(
                                              'kc9ik6nb' /* For you */,
                                            ))
                                          ],
                                          onChanged: (val) => setState(() =>
                                              _model.choiceChipsValue =
                                                  val?.firstOrNull),
                                          selectedChipStyle: ChipStyle(
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts: GoogleFonts
                                                              .asMap()
                                                          .containsKey(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily),
                                                    ),
                                            iconColor:
                                                FlutterFlowTheme.of(context)
                                                    .info,
                                            iconSize: 18.0,
                                            elevation: 2.0,
                                            borderColor:
                                                FlutterFlowTheme.of(context)
                                                    .accent1,
                                            borderWidth: 1.0,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          unselectedChipStyle: ChipStyle(
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts: GoogleFonts
                                                              .asMap()
                                                          .containsKey(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily),
                                                    ),
                                            iconColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                            iconSize: 18.0,
                                            elevation: 0.0,
                                            borderColor:
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                            borderWidth: 1.0,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          chipSpacing: 8.0,
                                          rowSpacing: 12.0,
                                          multiselect: false,
                                          initialized:
                                              _model.choiceChipsValue != null,
                                          alignment: WrapAlignment.center,
                                          controller: _model
                                                  .choiceChipsValueController ??=
                                              FormFieldController<List<String>>(
                                            [
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'ea7u0zaz' /* All */,
                                              )
                                            ],
                                          ),
                                          wrapped: true,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      StreamBuilder<List<ReportsRecord>>(
                        stream: queryReportsRecord(
                          queryBuilder: (reportsRecord) => reportsRecord.where(
                            'reportName',
                            isEqualTo: 'personal request',
                          ),
                          singleRecord: true,
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
                          List<ReportsRecord> containerReportsRecordList =
                              snapshot.data!;
                          // Return an empty Container when the item does not exist.
                          if (snapshot.data!.isEmpty) {
                            return Container();
                          }
                          final containerReportsRecord =
                              containerReportsRecordList.isNotEmpty
                                  ? containerReportsRecordList.first
                                  : null;
                          return Container(
                            width: double.infinity,
                            height: MediaQuery.sizeOf(context).height * 0.7,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 12.0, 16.0, 12.0),
                              child: Builder(
                                builder: (context) {
                                  final personalOrders =
                                      oMListPersonalOrdersPersonalRequestsRecordList
                                          .toList();
                                  if (personalOrders.isEmpty) {
                                    return const Center(
                                      child: EmptyListsimpleWidget(),
                                    );
                                  }
                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: personalOrders.length,
                                    itemBuilder:
                                        (context, personalOrdersIndex) {
                                      final personalOrdersItem =
                                          personalOrders[personalOrdersIndex];
                                      return Visibility(
                                        visible: (functions.checkRoleInMap(personalOrdersItem.userRespons.toList(), FFAppState().authenticatedUser.privileges.roleName) ||
                                                functions.checkStringInList(
                                                    containerReportsRecord?.reportViews
                                                        .toList(),
                                                    FFAppState()
                                                        .authenticatedUser
                                                        .privileges
                                                        .roleName) ||
                                                (personalOrdersItem.createdBy ==
                                                    currentUserDocument
                                                        ?.userRefrence)) &&
                                            ((_model.dropDownValue == 'الجميع') ||
                                                ((_model.dropDownValue != 'الجميع') &&
                                                    (_model.dropDownValue ==
                                                        personalOrdersItem
                                                            .reportReason))) &&
                                            ((dateTimeFormat(
                                                      'd/M',
                                                      _model.datePicked,
                                                      locale:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                    ) ==
                                                    '') ||
                                                ((dateTimeFormat(
                                                          'd/M',
                                                          _model.datePicked,
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        ) !=
                                                        '') &&
                                                    (dateTimeFormat(
                                                          'd/M',
                                                          _model.datePicked,
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        ) ==
                                                        dateTimeFormat(
                                                          'd/M',
                                                          personalOrdersItem
                                                              .createdTime,
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        )))) &&
                                            ((_model.choiceChipsValue == 'الجميع') ||
                                                ((_model.choiceChipsValue == 'مقبول') &&
                                                    personalOrdersItem
                                                        .isCompleted &&
                                                    personalOrdersItem
                                                        .reportAcceptanceState) ||
                                                ((_model.choiceChipsValue == 'مرفوض') &&
                                                    personalOrdersItem
                                                        .isCompleted &&
                                                    !personalOrdersItem
                                                        .reportAcceptanceState) ||
                                                ((_model.choiceChipsValue == 'قيد الانتظار') &&
                                                    !personalOrdersItem
                                                        .isCompleted) ||
                                                ((_model.choiceChipsValue == 'مطلوب منك') &&
                                                    !personalOrdersItem
                                                        .isCompleted &&
                                                    (functions.checkRoleResponse(
                                                            personalOrdersItem.userRespons.toList(), FFAppState().authenticatedUser.privileges.roleName) ==
                                                        'Pending'))),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 12.0),
                                          child: AuthUserStreamWidget(
                                            builder: (context) =>
                                                StreamBuilder<UsersRecord>(
                                              stream: UsersRecord.getDocument(
                                                  personalOrdersItem
                                                      .createdBy!),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return const Center(
                                                    child: SizedBox(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child: SpinKitDualRing(
                                                        color:
                                                            Color(0xFF0CA256),
                                                        size: 50.0,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                final containerUsersRecord =
                                                    snapshot.data!;
                                                return Container(
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    boxShadow: const [
                                                      BoxShadow(
                                                        blurRadius: 3.0,
                                                        color:
                                                            Color(0x25090F13),
                                                        offset: Offset(
                                                          0.0,
                                                          2.0,
                                                        ),
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 8.0,
                                                                12.0, 12.0),
                                                    child: StreamBuilder<
                                                        LeadersRecord>(
                                                      stream: LeadersRecord
                                                          .getDocument(
                                                              containerUsersRecord
                                                                  .leaderAreaRefrence1!),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return const Center(
                                                            child: SizedBox(
                                                              width: 50.0,
                                                              height: 50.0,
                                                              child:
                                                                  SpinKitDualRing(
                                                                color: Color(
                                                                    0xFF0CA256),
                                                                size: 50.0,
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        final columnLeadersRecord =
                                                            snapshot.data!;
                                                        return Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          5.0),
                                                                  child: Text(
                                                                    containerUsersRecord
                                                                        .displayName,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).headlineSmallFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                        ),
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          -1.0,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            10.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        FFButtonWidget(
                                                                      onPressed:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'O_M_LIST_PERSONAL_ORDERS_VIEW_BTN_ON_TAP');
                                                                        logFirebaseEvent(
                                                                            'Button_navigate_to');

                                                                        context
                                                                            .pushNamed(
                                                                          'OM_Personal_Orders_discription',
                                                                          queryParameters:
                                                                              {
                                                                            'personalOrder':
                                                                                serializeParam(
                                                                              personalOrdersItem.reference,
                                                                              ParamType.DocumentReference,
                                                                            ),
                                                                          }.withoutNulls,
                                                                        );
                                                                      },
                                                                      text: FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        '2sodr5jg' /* View */,
                                                                      ),
                                                                      options:
                                                                          FFButtonOptions(
                                                                        height:
                                                                            36.0,
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            16.0,
                                                                            0.0),
                                                                        iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                            ),
                                                                        elevation:
                                                                            0.0,
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).alternate,
                                                                          width:
                                                                              2.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(12.0),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Text(
                                                              columnLeadersRecord
                                                                  .leaderName,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelMediumFamily,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).labelMediumFamily),
                                                                  ),
                                                            ),
                                                            const Divider(
                                                              height: 24.0,
                                                              thickness: 1.0,
                                                              color: Color(
                                                                  0xFFF1F4F8),
                                                            ),
                                                            Text(
                                                              personalOrdersItem
                                                                  .reportDetails,
                                                              maxLines: 1,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                  ),
                                                            ),
                                                            const Divider(
                                                              height: 24.0,
                                                              thickness: 1.0,
                                                              color: Color(
                                                                  0xFFF1F4F8),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      1.0, 0.0),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            5.0,
                                                                            5.0),
                                                                child: Text(
                                                                  functions.getRoleRejection(
                                                                      personalOrdersItem
                                                                          .userRespons
                                                                          .toList()),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      '${dateTimeFormat(
                                                                        'EEEE',
                                                                        personalOrdersItem
                                                                            .createdTime,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      )}, ${dateTimeFormat(
                                                                        'jm',
                                                                        personalOrdersItem
                                                                            .createdTime,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      )}',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Plus Jakarta Sans',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            fontSize:
                                                                                14.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey('Plus Jakarta Sans'),
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  width: 100.0,
                                                                  height: 32.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: const Color(
                                                                        0xFFF1F4F8),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            32.0),
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: valueOrDefault<
                                                                          Color>(
                                                                        () {
                                                                          if (personalOrdersItem.isCompleted &&
                                                                              personalOrdersItem
                                                                                  .reportAcceptanceState) {
                                                                            return FlutterFlowTheme.of(context).primary;
                                                                          } else if (personalOrdersItem.isCompleted &&
                                                                              !personalOrdersItem.reportAcceptanceState) {
                                                                            return FlutterFlowTheme.of(context).error;
                                                                          } else {
                                                                            return FlutterFlowTheme.of(context).warning;
                                                                          }
                                                                        }(),
                                                                        FlutterFlowTheme.of(context)
                                                                            .warning,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      () {
                                                                        if (personalOrdersItem.isCompleted &&
                                                                            personalOrdersItem
                                                                                .reportAcceptanceState) {
                                                                          return 'مقبول';
                                                                        } else if (personalOrdersItem.isCompleted &&
                                                                            !personalOrdersItem.reportAcceptanceState) {
                                                                          return 'مرفوض';
                                                                        } else {
                                                                          return 'قيد الانتظار';
                                                                        }
                                                                      }(),
                                                                      'قيد الانتظار',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Plus Jakarta Sans',
                                                                          color:
                                                                              valueOrDefault<Color>(
                                                                            () {
                                                                              if (personalOrdersItem.isCompleted && personalOrdersItem.reportAcceptanceState) {
                                                                                return FlutterFlowTheme.of(context).primary;
                                                                              } else if (personalOrdersItem.isCompleted && !personalOrdersItem.reportAcceptanceState) {
                                                                                return FlutterFlowTheme.of(context).error;
                                                                              } else {
                                                                                return FlutterFlowTheme.of(context).primaryText;
                                                                              }
                                                                            }(),
                                                                            FlutterFlowTheme.of(context).primaryText,
                                                                          ),
                                                                          fontSize:
                                                                              14.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey('Plus Jakarta Sans'),
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Divider(
                                                              thickness: 1.0,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .accent4,
                                                            ),
                                                            if (!personalOrdersItem
                                                                    .isCompleted &&
                                                                functions.checkRoleInMap(
                                                                    personalOrdersItem
                                                                        .userRespons
                                                                        .toList(),
                                                                    FFAppState()
                                                                        .authenticatedUser
                                                                        .privileges
                                                                        .roleName) &&
                                                                (functions.checkRoleResponse(
                                                                        personalOrdersItem
                                                                            .userRespons
                                                                            .toList(),
                                                                        FFAppState()
                                                                            .authenticatedUser
                                                                            .privileges
                                                                            .roleName) !=
                                                                    '') &&
                                                                (functions.checkRoleResponse(
                                                                        personalOrdersItem
                                                                            .userRespons
                                                                            .toList(),
                                                                        FFAppState()
                                                                            .authenticatedUser
                                                                            .privileges
                                                                            .roleName) ==
                                                                    'Pending'))
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                children: [
                                                                  FFButtonWidget(
                                                                    onPressed:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'O_M_LIST_PERSONAL_ORDERS_ACCEPT_BTN_ON_T');
                                                                      var shouldSetState =
                                                                          false;
                                                                      logFirebaseEvent(
                                                                          'Button_custom_action');
                                                                      _model.list =
                                                                          await actions
                                                                              .acceptPersonalRequest(
                                                                        personalOrdersItem
                                                                            .reference,
                                                                        FFAppState()
                                                                            .authenticatedUser
                                                                            .privileges
                                                                            .roleName,
                                                                      );
                                                                      shouldSetState =
                                                                          true;
                                                                      if (_model.list !=
                                                                              null &&
                                                                          (_model.list)!
                                                                              .isNotEmpty) {
                                                                        logFirebaseEvent(
                                                                            'Button_backend_call');

                                                                        await personalOrdersItem
                                                                            .reference
                                                                            .update({
                                                                          ...mapToFirestore(
                                                                            {
                                                                              'userRespons': getPersonalRequestUserResponsListFirestoreData(
                                                                                _model.list,
                                                                              ),
                                                                            },
                                                                          ),
                                                                        });
                                                                        if (shouldSetState) {
                                                                          setState(
                                                                              () {});
                                                                        }
                                                                        return;
                                                                      } else {
                                                                        if (shouldSetState) {
                                                                          setState(
                                                                              () {});
                                                                        }
                                                                        return;
                                                                      }

                                                                      if (shouldSetState) {
                                                                        setState(
                                                                            () {});
                                                                      }
                                                                    },
                                                                    text: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'tiwmpiie' /* Accept */,
                                                                    ),
                                                                    options:
                                                                        FFButtonOptions(
                                                                      width:
                                                                          135.0,
                                                                      height:
                                                                          50.0,
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      color: const Color(
                                                                          0xFF0CA256),
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Plus Jakarta Sans',
                                                                            color:
                                                                                Colors.white,
                                                                            fontSize:
                                                                                18.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey('Plus Jakarta Sans'),
                                                                          ),
                                                                      elevation:
                                                                          2.0,
                                                                      borderSide:
                                                                          const BorderSide(
                                                                        color: Colors
                                                                            .transparent,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12.0),
                                                                    ),
                                                                  ),
                                                                  FFButtonWidget(
                                                                    onPressed:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'O_M_LIST_PERSONAL_ORDERS_REJECT_BTN_ON_T');
                                                                      var shouldSetState =
                                                                          false;
                                                                      logFirebaseEvent(
                                                                          'Button_custom_action');
                                                                      _model.rejectList =
                                                                          await actions
                                                                              .declinePersonalRequest(
                                                                        personalOrdersItem
                                                                            .reference,
                                                                        FFAppState()
                                                                            .authenticatedUser
                                                                            .privileges
                                                                            .roleName,
                                                                      );
                                                                      shouldSetState =
                                                                          true;
                                                                      if (_model.rejectList !=
                                                                              null &&
                                                                          (_model.rejectList)!
                                                                              .isNotEmpty) {
                                                                        logFirebaseEvent(
                                                                            'Button_backend_call');

                                                                        await personalOrdersItem
                                                                            .reference
                                                                            .update({
                                                                          ...mapToFirestore(
                                                                            {
                                                                              'userRespons': getPersonalRequestUserResponsListFirestoreData(
                                                                                _model.rejectList,
                                                                              ),
                                                                            },
                                                                          ),
                                                                        });
                                                                        if (shouldSetState) {
                                                                          setState(
                                                                              () {});
                                                                        }
                                                                        return;
                                                                      } else {
                                                                        if (shouldSetState) {
                                                                          setState(
                                                                              () {});
                                                                        }
                                                                        return;
                                                                      }

                                                                      if (shouldSetState) {
                                                                        setState(
                                                                            () {});
                                                                      }
                                                                    },
                                                                    text: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'cjdtbmsj' /* Reject */,
                                                                    ),
                                                                    options:
                                                                        FFButtonOptions(
                                                                      width:
                                                                          135.0,
                                                                      height:
                                                                          50.0,
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      color: const Color(
                                                                          0xFFED0E2E),
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Plus Jakarta Sans',
                                                                            color:
                                                                                Colors.white,
                                                                            fontSize:
                                                                                18.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey('Plus Jakarta Sans'),
                                                                          ),
                                                                      elevation:
                                                                          2.0,
                                                                      borderSide:
                                                                          const BorderSide(
                                                                        color: Colors
                                                                            .transparent,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12.0),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                          ],
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ).animateOnPageLoad(animationsMap[
                                                    'containerOnPageLoadAnimation']!);
                                              },
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }
}
