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
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'o_m_list_work_orders_model.dart';
export 'o_m_list_work_orders_model.dart';

class OMListWorkOrdersWidget extends StatefulWidget {
  const OMListWorkOrdersWidget({super.key});

  @override
  State<OMListWorkOrdersWidget> createState() => _OMListWorkOrdersWidgetState();
}

class _OMListWorkOrdersWidgetState extends State<OMListWorkOrdersWidget>
    with TickerProviderStateMixin {
  late OMListWorkOrdersModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OMListWorkOrdersModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'OM_List_work_orders'});
    _model.natIDDateTextController ??= TextEditingController();
    _model.natIDDateFocusNode ??= FocusNode();

    animationsMap.addAll({
      'containerOnPageLoadAnimation1': AnimationInfo(
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
      'containerOnPageLoadAnimation2': AnimationInfo(
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
            '5sxgj8rk' /*  */,
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

    return StreamBuilder<List<VehicleRequestRecord>>(
      stream: queryVehicleRequestRecord(),
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
        List<VehicleRequestRecord> oMListWorkOrdersVehicleRequestRecordList =
            snapshot.data!;
        return Title(
            title: 'OM_List_work_orders',
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
                          'O_M_LIST_WORK_ORDERS_arrow_back_rounded_');
                      logFirebaseEvent('IconButton_navigate_back');
                      context.pop();
                    },
                  ),
                  title: Text(
                    FFLocalizations.of(context).getText(
                      'qe75adpc' /* Work orders */,
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
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 8.0, 16.0, 12.0),
                              child: Container(
                                width: double.infinity,
                                height: 120.0,
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
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                                ),
                                child: Wrap(
                                  spacing: 0.0,
                                  runSpacing: 0.0,
                                  alignment: WrapAlignment.spaceAround,
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  direction: Axis.horizontal,
                                  runAlignment: WrapAlignment.center,
                                  verticalDirection: VerticalDirection.down,
                                  clipBehavior: Clip.none,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 0.0, 0.0),
                                      child: FlutterFlowDropDown<String>(
                                        controller:
                                            _model.reportTypeValueController ??=
                                                FormFieldController<String>(
                                          _model.reportTypeValue ??=
                                              FFLocalizations.of(context)
                                                  .getText(
                                            '6j872p50' /* All */,
                                          ),
                                        ),
                                        options: [
                                          FFLocalizations.of(context).getText(
                                            'da4tx373' /* All */,
                                          ),
                                          FFLocalizations.of(context).getText(
                                            'to288cxg' /* Van */,
                                          ),
                                          FFLocalizations.of(context).getText(
                                            'utc8oa3d' /* Extra workers */,
                                          ),
                                          FFLocalizations.of(context).getText(
                                            'thjcw72o' /* New tools */,
                                          )
                                        ],
                                        onChanged: (val) async {
                                          setState(() =>
                                              _model.reportTypeValue = val);
                                          logFirebaseEvent(
                                              'O_M_LIST_WORK_ORDERS_reportType_ON_FORM_');
                                          logFirebaseEvent(
                                              'reportType_set_form_field');
                                          setState(() {
                                            _model.carTypeValueController
                                                ?.value = 'الجميع';
                                          });
                                        },
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.4,
                                        height: 56.0,
                                        textStyle: FlutterFlowTheme.of(context)
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
                                        hintText:
                                            FFLocalizations.of(context).getText(
                                          '6lvfxgzf' /* Type */,
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
                                        borderColor: Colors.white,
                                        borderWidth: 2.0,
                                        borderRadius: 8.0,
                                        margin: const EdgeInsetsDirectional.fromSTEB(
                                            16.0, 4.0, 16.0, 4.0),
                                        hidesUnderline: true,
                                        isOverButton: true,
                                        isSearchable: false,
                                        isMultiSelect: false,
                                      ),
                                    ),
                                    if (_model.reportTypeValue == 'نقل مخلفات')
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 0.0, 0.0),
                                        child: FlutterFlowDropDown<String>(
                                          controller:
                                              _model.carTypeValueController ??=
                                                  FormFieldController<String>(
                                            _model.carTypeValue ??=
                                                FFLocalizations.of(context)
                                                    .getText(
                                              '93qs551o' /* All */,
                                            ),
                                          ),
                                          options: [
                                            FFLocalizations.of(context).getText(
                                              'vvi7ptlr' /* All */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              '0nvbjq45' /* bock */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              'c7edf1py' /* 2 ton */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              'fxko5ea8' /* 4 ton */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              '1gvoo5fi' /* 44 rescue transfers */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              '3d68xsrq' /* Tricycle */,
                                            )
                                          ],
                                          onChanged: (val) => setState(
                                              () => _model.carTypeValue = val),
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.4,
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
                                            '6lvfxgzf' /* Type */,
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
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 0.0, 20.0, 20.0),
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
                                                  labelText: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    '10r47b0q' /* Date  */,
                                                  ),
                                                  labelStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Plus Jakarta Sans',
                                                        color:
                                                            const Color(0xFF57636C),
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                'Plus Jakarta Sans'),
                                                      ),
                                                  hintStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Plus Jakarta Sans',
                                                        color:
                                                            const Color(0xFF57636C),
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
                                                  errorBorder:
                                                      OutlineInputBorder(
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
                                                              0.0, 2.0),
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          'Plus Jakarta Sans',
                                                      color: const Color(0xFF14181B),
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
                                                    'O_M_LIST_WORK_ORDERS_PAGE__BTN_ON_TAP');
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
                                                                fontFamily: FlutterFlowTheme.of(
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
                                                                        FlutterFlowTheme.of(context)
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
                                                    _model.datePicked =
                                                        DateTime(
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
                                                'jdahn9ju' /*  */,
                                              ),
                                              icon: const Icon(
                                                Icons.calendar_month,
                                                size: 15.0,
                                              ),
                                              options: FFButtonOptions(
                                                width: 36.0,
                                                height: 39.0,
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 0.0),
                                                iconPadding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            6.0, 0.0, 0.0, 0.0),
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
                                            'yx1oqnmj' /* All */,
                                          )),
                                          ChipData(FFLocalizations.of(context)
                                              .getText(
                                            'wus1zjjh' /* Approved */,
                                          )),
                                          ChipData(FFLocalizations.of(context)
                                              .getText(
                                            'xlfjp873' /* Rejected */,
                                          )),
                                          ChipData(FFLocalizations.of(context)
                                              .getText(
                                            '8274xypj' /* In progress */,
                                          )),
                                          ChipData(FFLocalizations.of(context)
                                              .getText(
                                            'lp7q6put' /* For you */,
                                          ))
                                        ],
                                        onChanged: (val) => setState(() =>
                                            _model.choiceChipsValue =
                                                val?.firstOrNull),
                                        selectedChipStyle: ChipStyle(
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                              FlutterFlowTheme.of(context).info,
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
                                            FFLocalizations.of(context).getText(
                                              'mccr4mh0' /* All */,
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
                        StreamBuilder<List<ReportsRecord>>(
                          stream: queryReportsRecord(
                            queryBuilder: (reportsRecord) =>
                                reportsRecord.where(
                              'reportName',
                              isEqualTo: 'vehicle request',
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
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 12.0, 16.0, 12.0),
                                child: Builder(
                                  builder: (context) {
                                    final vehicleRequest =
                                        oMListWorkOrdersVehicleRequestRecordList
                                            .toList();
                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: vehicleRequest.length,
                                      itemBuilder:
                                          (context, vehicleRequestIndex) {
                                        final vehicleRequestItem =
                                            vehicleRequest[vehicleRequestIndex];
                                        return Visibility(
                                          visible: (functions.checkStringInList(containerReportsRecord?.reportStages.toList(), FFAppState().authenticatedUser.privileges.roleName) ||
                                                  functions.checkStringInList(
                                                      containerReportsRecord
                                                          ?.reportViews
                                                          .toList(),
                                                      FFAppState()
                                                          .authenticatedUser
                                                          .privileges
                                                          .roleName) ||
                                                  (vehicleRequestItem.createdBy ==
                                                      currentUserDocument
                                                          ?.userRefrence)) &&
                                              ((_model.reportTypeValue == 'الجميع') ||
                                                  ((_model.reportTypeValue != 'الجميع') &&
                                                      (_model.reportTypeValue ==
                                                          vehicleRequestItem
                                                              .requestType))) &&
                                              ((_model.reportTypeValue != 'نقل مخلفات') ||
                                                  ((_model.carTypeValue == 'الجميع') ||
                                                      ((_model.carTypeValue != 'الجميع') &&
                                                          (_model.carTypeValue ==
                                                              vehicleRequestItem
                                                                  .carType)))) &&
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
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          ) !=
                                                          '') &&
                                                      (dateTimeFormat(
                                                            'd/M',
                                                            _model.datePicked,
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          ) ==
                                                          dateTimeFormat(
                                                            'd/M',
                                                            vehicleRequestItem
                                                                .createdTime,
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          )))) &&
                                              ((_model.choiceChipsValue == 'الجميع') ||
                                                  ((_model.choiceChipsValue == 'مقبول') &&
                                                      vehicleRequestItem
                                                          .isCompleted &&
                                                      vehicleRequestItem
                                                          .reportAcceptanceState) ||
                                                  ((_model.choiceChipsValue == 'مرفوض') && vehicleRequestItem.isCompleted && !vehicleRequestItem.reportAcceptanceState) ||
                                                  ((_model.choiceChipsValue == 'قيد الانتظار') && !vehicleRequestItem.isCompleted) ||
                                                  ((_model.choiceChipsValue == 'مطلوب منك') && !vehicleRequestItem.isCompleted && ((containerReportsRecord?.reportStages[vehicleRequestItem.currentReportStage]) == FFAppState().authenticatedUser.privileges.roleName))),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 4.0, 5.0, 8.0),
                                            child: AuthUserStreamWidget(
                                              builder: (context) =>
                                                  StreamBuilder<UsersRecord>(
                                                stream: UsersRecord.getDocument(
                                                    vehicleRequestItem
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
                                                  final taskCardUsersRecord =
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
                                                          spreadRadius: 2.0,
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  8.0,
                                                                  12.0,
                                                                  12.0),
                                                      child: StreamBuilder<
                                                          LeadersRecord>(
                                                        stream: LeadersRecord
                                                            .getDocument(
                                                                taskCardUsersRecord
                                                                    .leaderAreaRefrence1!),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
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
                                                                MainAxisSize
                                                                    .max,
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
                                                                      taskCardUsersRecord
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
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          FFButtonWidget(
                                                                        onPressed:
                                                                            () async {
                                                                          logFirebaseEvent(
                                                                              'O_M_LIST_WORK_ORDERS_VIEW_BTN_ON_TAP');
                                                                          logFirebaseEvent(
                                                                              'Button_navigate_to');

                                                                          context
                                                                              .pushNamed(
                                                                            'OM_Cars_Orders_discription',
                                                                            queryParameters:
                                                                                {
                                                                              'vehicleRequest': serializeParam(
                                                                                vehicleRequestItem.reference,
                                                                                ParamType.DocumentReference,
                                                                              ),
                                                                            }.withoutNulls,
                                                                          );
                                                                        },
                                                                        text: FFLocalizations.of(context)
                                                                            .getText(
                                                                          'u7ivogvc' /* View */,
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
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
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
                                                                style: FlutterFlowTheme.of(
                                                                        context)
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
                                                                vehicleRequestItem
                                                                    .requestDescription,
                                                                maxLines: 1,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
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
                                                                        1.0,
                                                                        0.0),
                                                                child: Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          5.0),
                                                                  child: Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      containerReportsRecord
                                                                              ?.reportStages[
                                                                          vehicleRequestItem
                                                                              .currentReportStage],
                                                                      '0',
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .end,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).error,
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
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        '${dateTimeFormat(
                                                                          'EEEE',
                                                                          vehicleRequestItem
                                                                              .createdTime,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        )}, ${dateTimeFormat(
                                                                          'jm',
                                                                          vehicleRequestItem
                                                                              .createdTime,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        )}',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Plus Jakarta Sans',
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              fontSize: 14.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.normal,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey('Plus Jakarta Sans'),
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    width:
                                                                        100.0,
                                                                    height:
                                                                        32.0,
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
                                                                            if (vehicleRequestItem.isCompleted &&
                                                                                vehicleRequestItem.reportAcceptanceState) {
                                                                              return FlutterFlowTheme.of(context).primary;
                                                                            } else if (vehicleRequestItem.isCompleted && !vehicleRequestItem.reportAcceptanceState) {
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
                                                                          if (vehicleRequestItem.isCompleted &&
                                                                              vehicleRequestItem
                                                                                  .reportAcceptanceState) {
                                                                            return 'مقبول';
                                                                          } else if (vehicleRequestItem.isCompleted &&
                                                                              !vehicleRequestItem.reportAcceptanceState) {
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
                                                                                if (vehicleRequestItem.isCompleted && vehicleRequestItem.reportAcceptanceState) {
                                                                                  return FlutterFlowTheme.of(context).primary;
                                                                                } else if (vehicleRequestItem.isCompleted && !vehicleRequestItem.reportAcceptanceState) {
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
                                                              const Divider(
                                                                height: 24.0,
                                                                thickness: 1.0,
                                                                color: Color(
                                                                    0xFFF1F4F8),
                                                              ),
                                                              if (!vehicleRequestItem
                                                                      .isCompleted &&
                                                                  ((containerReportsRecord
                                                                              ?.reportStages[
                                                                          vehicleRequestItem
                                                                              .currentReportStage]) ==
                                                                      FFAppState()
                                                                          .authenticatedUser
                                                                          .privileges
                                                                          .roleName))
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
                                                                            'O_M_LIST_WORK_ORDERS_ACCEPT_BTN_ON_TAP');
                                                                        logFirebaseEvent(
                                                                            'Button_custom_action');
                                                                        await actions
                                                                            .acceptVehicleRequest(
                                                                          vehicleRequestItem
                                                                              .reference,
                                                                          '',
                                                                        );
                                                                      },
                                                                      text: FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'g1iabjm6' /* Accept */,
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
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .titleMedium
                                                                            .override(
                                                                              fontFamily: 'Plus Jakarta Sans',
                                                                              color: Colors.white,
                                                                              fontSize: 18.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.normal,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey('Plus Jakarta Sans'),
                                                                            ),
                                                                        elevation:
                                                                            2.0,
                                                                        borderSide:
                                                                            const BorderSide(
                                                                          color:
                                                                              Colors.transparent,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(12.0),
                                                                      ),
                                                                    ),
                                                                    FFButtonWidget(
                                                                      onPressed:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'O_M_LIST_WORK_ORDERS_REJECT_BTN_ON_TAP');
                                                                        logFirebaseEvent(
                                                                            'Button_custom_action');
                                                                        await actions
                                                                            .declineVehicleRequest(
                                                                          vehicleRequestItem
                                                                              .reference,
                                                                          '',
                                                                        );
                                                                      },
                                                                      text: FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'u72tqe6x' /* Reject */,
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
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .titleMedium
                                                                            .override(
                                                                              fontFamily: 'Plus Jakarta Sans',
                                                                              color: Colors.white,
                                                                              fontSize: 18.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.normal,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey('Plus Jakarta Sans'),
                                                                            ),
                                                                        elevation:
                                                                            2.0,
                                                                        borderSide:
                                                                            const BorderSide(
                                                                          color:
                                                                              Colors.transparent,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(12.0),
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
                                                      'containerOnPageLoadAnimation1']!);
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
                        StreamBuilder<List<ReportsRecord>>(
                          stream: queryReportsRecord(
                            queryBuilder: (reportsRecord) =>
                                reportsRecord.where(
                              'reportName',
                              isEqualTo: 'worker request',
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
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 12.0, 16.0, 12.0),
                                child: StreamBuilder<List<WorkerRequestRecord>>(
                                  stream: queryWorkerRequestRecord(),
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
                                    List<WorkerRequestRecord>
                                        listViewWorkerRequestRecordList =
                                        snapshot.data!;
                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: listViewWorkerRequestRecordList
                                          .length,
                                      itemBuilder: (context, listViewIndex) {
                                        final listViewWorkerRequestRecord =
                                            listViewWorkerRequestRecordList[
                                                listViewIndex];
                                        return Visibility(
                                          visible: (functions.checkStringInList(containerReportsRecord?.reportStages.toList(), FFAppState().authenticatedUser.privileges.roleName) ||
                                                  functions.checkStringInList(
                                                      containerReportsRecord?.reportViews
                                                          .toList(),
                                                      FFAppState()
                                                          .authenticatedUser
                                                          .privileges
                                                          .roleName) ||
                                                  (listViewWorkerRequestRecord.createdBy ==
                                                      currentUserDocument
                                                          ?.userRefrence)) &&
                                              ((_model.reportTypeValue == 'الجميع') ||
                                                  ((_model.reportTypeValue != 'الجميع') &&
                                                      (_model.reportTypeValue ==
                                                          listViewWorkerRequestRecord
                                                              .requestType))) &&
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
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          ) !=
                                                          '') &&
                                                      (dateTimeFormat(
                                                            'd/M',
                                                            _model.datePicked,
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          ) ==
                                                          dateTimeFormat(
                                                            'd/M',
                                                            listViewWorkerRequestRecord
                                                                .createdTime,
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          )))) &&
                                              ((_model.choiceChipsValue == 'الجميع') ||
                                                  ((_model.choiceChipsValue == 'مقبول') &&
                                                      listViewWorkerRequestRecord
                                                          .isCompleted &&
                                                      listViewWorkerRequestRecord
                                                          .reportAcceptanceState) ||
                                                  ((_model.choiceChipsValue == 'مرفوض') &&
                                                      listViewWorkerRequestRecord
                                                          .isCompleted &&
                                                      !listViewWorkerRequestRecord
                                                          .reportAcceptanceState) ||
                                                  ((_model.choiceChipsValue ==
                                                          'قيد الانتظار') &&
                                                      !listViewWorkerRequestRecord
                                                          .isCompleted) ||
                                                  ((_model.choiceChipsValue == 'مطلوب منك') &&
                                                      !listViewWorkerRequestRecord.isCompleted &&
                                                      ((containerReportsRecord?.reportStages[listViewWorkerRequestRecord.currentReportStage]) == FFAppState().authenticatedUser.privileges.roleName))),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 4.0, 5.0, 8.0),
                                            child: AuthUserStreamWidget(
                                              builder: (context) =>
                                                  StreamBuilder<UsersRecord>(
                                                stream: UsersRecord.getDocument(
                                                    listViewWorkerRequestRecord
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
                                                  final taskCardUsersRecord =
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
                                                          spreadRadius: 2.0,
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  8.0,
                                                                  12.0,
                                                                  12.0),
                                                      child: StreamBuilder<
                                                          LeadersRecord>(
                                                        stream: LeadersRecord
                                                            .getDocument(
                                                                taskCardUsersRecord
                                                                    .leaderAreaRefrence1!),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
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
                                                                MainAxisSize
                                                                    .max,
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
                                                                      taskCardUsersRecord
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
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          FFButtonWidget(
                                                                        onPressed:
                                                                            () async {
                                                                          logFirebaseEvent(
                                                                              'O_M_LIST_WORK_ORDERS_VIEW_BTN_ON_TAP');
                                                                          logFirebaseEvent(
                                                                              'Button_navigate_to');

                                                                          context
                                                                              .pushNamed(
                                                                            'OM_work_Orders_discription',
                                                                            queryParameters:
                                                                                {
                                                                              'workerRequest': serializeParam(
                                                                                listViewWorkerRequestRecord.reference,
                                                                                ParamType.DocumentReference,
                                                                              ),
                                                                            }.withoutNulls,
                                                                          );
                                                                        },
                                                                        text: FFLocalizations.of(context)
                                                                            .getText(
                                                                          'ume75mu0' /* View */,
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
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
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
                                                                style: FlutterFlowTheme.of(
                                                                        context)
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
                                                                listViewWorkerRequestRecord
                                                                    .requestDescription,
                                                                maxLines: 1,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
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
                                                                        1.0,
                                                                        0.0),
                                                                child: Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          5.0),
                                                                  child: Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      containerReportsRecord
                                                                              ?.reportStages[
                                                                          listViewWorkerRequestRecord
                                                                              .currentReportStage],
                                                                      '0',
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .end,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).error,
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
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        '${dateTimeFormat(
                                                                          'EEEE',
                                                                          taskCardUsersRecord
                                                                              .createdTime,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        )}, ${dateTimeFormat(
                                                                          'jm',
                                                                          taskCardUsersRecord
                                                                              .createdTime,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        )}',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Plus Jakarta Sans',
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              fontSize: 14.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.normal,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey('Plus Jakarta Sans'),
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    width:
                                                                        100.0,
                                                                    height:
                                                                        32.0,
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
                                                                            if (listViewWorkerRequestRecord.isCompleted &&
                                                                                listViewWorkerRequestRecord.reportAcceptanceState) {
                                                                              return FlutterFlowTheme.of(context).primary;
                                                                            } else if (listViewWorkerRequestRecord.isCompleted && !listViewWorkerRequestRecord.reportAcceptanceState) {
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
                                                                          if (listViewWorkerRequestRecord.isCompleted &&
                                                                              listViewWorkerRequestRecord
                                                                                  .reportAcceptanceState) {
                                                                            return 'مقبول';
                                                                          } else if (listViewWorkerRequestRecord.isCompleted &&
                                                                              !listViewWorkerRequestRecord.reportAcceptanceState) {
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
                                                                                if (listViewWorkerRequestRecord.isCompleted && listViewWorkerRequestRecord.reportAcceptanceState) {
                                                                                  return FlutterFlowTheme.of(context).primary;
                                                                                } else if (listViewWorkerRequestRecord.isCompleted && !listViewWorkerRequestRecord.reportAcceptanceState) {
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
                                                              const Divider(
                                                                height: 24.0,
                                                                thickness: 1.0,
                                                                color: Color(
                                                                    0xFFF1F4F8),
                                                              ),
                                                              if (!listViewWorkerRequestRecord
                                                                      .isCompleted &&
                                                                  ((containerReportsRecord
                                                                              ?.reportStages[
                                                                          listViewWorkerRequestRecord
                                                                              .currentReportStage]) ==
                                                                      FFAppState()
                                                                          .authenticatedUser
                                                                          .privileges
                                                                          .roleName))
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
                                                                            'O_M_LIST_WORK_ORDERS_ACCEPT_BTN_ON_TAP');
                                                                        logFirebaseEvent(
                                                                            'Button_custom_action');
                                                                        await actions
                                                                            .acceptWorkerRequest(
                                                                          listViewWorkerRequestRecord
                                                                              .reference,
                                                                          '',
                                                                        );
                                                                      },
                                                                      text: FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        '715wvb1g' /* Accept */,
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
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .titleMedium
                                                                            .override(
                                                                              fontFamily: 'Plus Jakarta Sans',
                                                                              color: Colors.white,
                                                                              fontSize: 18.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.normal,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey('Plus Jakarta Sans'),
                                                                            ),
                                                                        elevation:
                                                                            2.0,
                                                                        borderSide:
                                                                            const BorderSide(
                                                                          color:
                                                                              Colors.transparent,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(12.0),
                                                                      ),
                                                                    ),
                                                                    FFButtonWidget(
                                                                      onPressed:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'O_M_LIST_WORK_ORDERS_REJECT_BTN_ON_TAP');
                                                                        logFirebaseEvent(
                                                                            'Button_custom_action');
                                                                        await actions
                                                                            .declineWorkerRequest(
                                                                          listViewWorkerRequestRecord
                                                                              .reference,
                                                                          '',
                                                                        );
                                                                      },
                                                                      text: FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'o55pvfnb' /* Reject */,
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
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .titleMedium
                                                                            .override(
                                                                              fontFamily: 'Plus Jakarta Sans',
                                                                              color: Colors.white,
                                                                              fontSize: 18.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.normal,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey('Plus Jakarta Sans'),
                                                                            ),
                                                                        elevation:
                                                                            2.0,
                                                                        borderSide:
                                                                            const BorderSide(
                                                                          color:
                                                                              Colors.transparent,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(12.0),
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
                                                      'containerOnPageLoadAnimation2']!);
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
              ),
            ));
      },
    );
  }
}
