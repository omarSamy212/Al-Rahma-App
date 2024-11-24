import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/error_component_widget.dart';
import '/components/succses_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'create_user2_model.dart';
export 'create_user2_model.dart';

class CreateUser2Widget extends StatefulWidget {
  const CreateUser2Widget({
    super.key,
    required this.nickName,
    this.image,
    required this.phoneNumber,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.gender,
    required this.birthdate,
    required this.government,
    required this.city,
    required this.fullAddress,
    this.socialStatus,
    this.employmentDate,
    this.frontNatImageUrl,
    this.backNatImageUrl,
    this.drugTestImageUrl,
    this.frontDLic,
    required this.backDLic,
    this.startingShift,
    this.shiftPeriod,
    required this.userId,
    this.contractorRef,
    required this.nationalId,
    required this.natIssuePlace,
    required this.natIssueDate,
    required this.natExpireDate,
    required this.nationality,
    this.drLicType,
    this.drLicIssuePlace,
    this.drLicIssueDate,
    this.drLicExpiryDate,
    this.totalDebit,
    this.totalCredit,
    this.diflictPercentage,
    this.shiftPrice,
    this.contractDate,
    bool? isDriver,
    required this.role,
    required this.educationData,
    required this.isEmployed,
    required this.relegion,
    this.jobCode,
    this.sectorID,
  }) : isDriver = isDriver ?? true;

  final String? nickName;
  final String? image;
  final String? phoneNumber;
  final String? firstName;
  final String? middleName;
  final String? lastName;
  final String? gender;
  final String? birthdate;
  final String? government;
  final String? city;
  final String? fullAddress;
  final String? socialStatus;
  final String? employmentDate;
  final String? frontNatImageUrl;
  final String? backNatImageUrl;
  final String? drugTestImageUrl;
  final String? frontDLic;
  final String? backDLic;
  final String? startingShift;
  final String? shiftPeriod;
  final String? userId;
  final DocumentReference? contractorRef;
  final String? nationalId;
  final String? natIssuePlace;
  final String? natIssueDate;
  final String? natExpireDate;
  final String? nationality;
  final String? drLicType;
  final String? drLicIssuePlace;
  final String? drLicIssueDate;
  final String? drLicExpiryDate;
  final double? totalDebit;
  final double? totalCredit;
  final double? diflictPercentage;
  final double? shiftPrice;
  final DateTime? contractDate;
  final bool isDriver;
  final DocumentReference? role;
  final String? educationData;
  final String? isEmployed;
  final String? relegion;
  final String? jobCode;
  final String? sectorID;

  @override
  State<CreateUser2Widget> createState() => _CreateUser2WidgetState();
}

class _CreateUser2WidgetState extends State<CreateUser2Widget> {
  late CreateUser2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateUser2Model());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'createUser_2'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('CREATE_USER_2_createUser_2_ON_INIT_STATE');
      if (loggedIn) {
        logFirebaseEvent('createUser_2_set_form_field');
        setState(() {
          _model.nameTextController?.text =
              '${widget.firstName} ${widget.middleName} ${widget.lastName} ';
        });
        logFirebaseEvent('createUser_2_set_form_field');
        setState(() {
          _model.idTextController?.text = widget.userId!;
        });
        logFirebaseEvent('createUser_2_set_form_field');
        setState(() {
          _model.emailTextController?.text =
              functions.generateEmail(widget.userId!);
        });
        logFirebaseEvent('createUser_2_set_form_field');
        setState(() {
          _model.passwordTextController?.text = functions.generatePassword();
        });
      } else {
        logFirebaseEvent('createUser_2_alert_dialog');
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              title: const Text('Error'),
              content: const Text('Access Not Granted'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: const Text('Ok'),
                ),
              ],
            );
          },
        );
        logFirebaseEvent('createUser_2_navigate_back');
        context.safePop();
      }
    });

    _model.nameTextController ??= TextEditingController();
    _model.nameFocusNode ??= FocusNode();

    _model.idTextController ??= TextEditingController();
    _model.idFocusNode ??= FocusNode();

    _model.emailTextController ??= TextEditingController();
    _model.emailFocusNode ??= FocusNode();

    _model.passwordTextController ??= TextEditingController();
    _model.passwordFocusNode ??= FocusNode();

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
        title: 'createUser_2',
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
                logFirebaseEvent('CREATE_USER_2_arrow_back_rounded_ICN_ON_');
                logFirebaseEvent('IconButton_navigate_back');
                context.pop();
              },
            ),
            title: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
              child: Text(
                FFLocalizations.of(context).getText(
                  'uvudahlw' /* Create Profile */,
                ),
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily:
                          FlutterFlowTheme.of(context).headlineMediumFamily,
                      color: FlutterFlowTheme.of(context).info,
                      fontSize: 22.0,
                      letterSpacing: 0.0,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).headlineMediumFamily),
                    ),
              ),
            ),
            actions: const [],
            centerTitle: true,
            elevation: 2.0,
          ),
          body: SafeArea(
            top: true,
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 70.0, 0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 16.0),
                    child: TextFormField(
                      controller: _model.nameTextController,
                      focusNode: _model.nameFocusNode,
                      textCapitalization: TextCapitalization.words,
                      readOnly: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: FFLocalizations.of(context).getText(
                          'mrxazj43' /* ID */,
                        ),
                        labelStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Plus Jakarta Sans',
                                  color: const Color(0xFF57636C),
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey('Plus Jakarta Sans'),
                                ),
                        hintStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Plus Jakarta Sans',
                                  color: const Color(0xFF57636C),
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey('Plus Jakarta Sans'),
                                ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFFE0E3E7),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFF4B39EF),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFFFF5963),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFFFF5963),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsetsDirectional.fromSTEB(
                            20.0, 24.0, 0.0, 24.0),
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Plus Jakarta Sans',
                            color: const Color(0xFF14181B),
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
                            useGoogleFonts: GoogleFonts.asMap()
                                .containsKey('Plus Jakarta Sans'),
                          ),
                      textAlign: TextAlign.end,
                      validator: _model.nameTextControllerValidator
                          .asValidator(context),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 16.0),
                    child: TextFormField(
                      controller: _model.idTextController,
                      focusNode: _model.idFocusNode,
                      textCapitalization: TextCapitalization.words,
                      readOnly: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: FFLocalizations.of(context).getText(
                          'yf8l2oet' /* ID */,
                        ),
                        labelStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Plus Jakarta Sans',
                                  color: const Color(0xFF57636C),
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey('Plus Jakarta Sans'),
                                ),
                        hintStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Plus Jakarta Sans',
                                  color: const Color(0xFF57636C),
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey('Plus Jakarta Sans'),
                                ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFFE0E3E7),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFF4B39EF),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFFFF5963),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFFFF5963),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsetsDirectional.fromSTEB(
                            20.0, 24.0, 0.0, 24.0),
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Plus Jakarta Sans',
                            color: const Color(0xFF14181B),
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
                            useGoogleFonts: GoogleFonts.asMap()
                                .containsKey('Plus Jakarta Sans'),
                          ),
                      textAlign: TextAlign.end,
                      validator:
                          _model.idTextControllerValidator.asValidator(context),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 16.0),
                    child: TextFormField(
                      controller: _model.emailTextController,
                      focusNode: _model.emailFocusNode,
                      textCapitalization: TextCapitalization.words,
                      readOnly: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: FFLocalizations.of(context).getText(
                          'kv4tuiot' /* Email */,
                        ),
                        labelStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Plus Jakarta Sans',
                                  color: const Color(0xFF57636C),
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey('Plus Jakarta Sans'),
                                ),
                        hintStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Plus Jakarta Sans',
                                  color: const Color(0xFF57636C),
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey('Plus Jakarta Sans'),
                                ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFFE0E3E7),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFF4B39EF),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFFFF5963),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFFFF5963),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsetsDirectional.fromSTEB(
                            20.0, 24.0, 0.0, 24.0),
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Plus Jakarta Sans',
                            color: const Color(0xFF14181B),
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
                            useGoogleFonts: GoogleFonts.asMap()
                                .containsKey('Plus Jakarta Sans'),
                          ),
                      textAlign: TextAlign.end,
                      validator: _model.emailTextControllerValidator
                          .asValidator(context),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 16.0),
                    child: TextFormField(
                      controller: _model.passwordTextController,
                      focusNode: _model.passwordFocusNode,
                      textCapitalization: TextCapitalization.words,
                      readOnly: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: FFLocalizations.of(context).getText(
                          'oya55ado' /* Password */,
                        ),
                        labelStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Plus Jakarta Sans',
                                  color: const Color(0xFF57636C),
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey('Plus Jakarta Sans'),
                                ),
                        hintStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Plus Jakarta Sans',
                                  color: const Color(0xFF57636C),
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey('Plus Jakarta Sans'),
                                ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFFE0E3E7),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFF4B39EF),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFFFF5963),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFFFF5963),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsetsDirectional.fromSTEB(
                            20.0, 24.0, 0.0, 24.0),
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Plus Jakarta Sans',
                            color: const Color(0xFF14181B),
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
                            useGoogleFonts: GoogleFonts.asMap()
                                .containsKey('Plus Jakarta Sans'),
                          ),
                      textAlign: TextAlign.end,
                      validator: _model.passwordTextControllerValidator
                          .asValidator(context),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, 0.05),
                    child: Builder(
                      builder: (context) => Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'CREATE_USER_2_CREATE_USER_BTN_ON_TAP');
                            var shouldSetState = false;
                            logFirebaseEvent('Button_backend_call');
                            _model.userRoleOutput =
                                await RolesRecord.getDocumentOnce(widget.role!);
                            shouldSetState = true;
                            logFirebaseEvent('Button_custom_action');
                            _model.returnObject = await actions.createUser(
                              'User_${widget.userId}',
                              _model.emailTextController.text,
                              _model.passwordTextController.text,
                              widget.nickName!,
                              widget.firstName!,
                              widget.middleName!,
                              widget.lastName!,
                              widget.gender!,
                              widget.birthdate!,
                              widget.educationData!,
                              random_data.randomString(
                                10,
                                25,
                                true,
                                true,
                                true,
                              ),
                              widget.isEmployed!,
                              widget.relegion!,
                              widget.government!,
                              widget.city!,
                              widget.fullAddress!,
                              widget.socialStatus!,
                              widget.nationality!,
                              widget.nationalId!,
                              widget.natIssuePlace!,
                              widget.natIssueDate!,
                              widget.natExpireDate!,
                              NationalInformationStruct(
                                nationality: widget.nationality,
                                nationalId: widget.nationalId,
                                issuePlace: widget.natIssuePlace,
                                issueDate: widget.natIssueDate,
                                expiryDate: widget.natExpireDate,
                              ),
                              DrivingInformationStruct(
                                licsenceType: widget.drLicType,
                                expiryDate: widget.drLicExpiryDate,
                                issueDate: widget.drLicIssueDate,
                                issuePlace: widget.drLicIssuePlace,
                              ),
                              widget.image,
                              widget.employmentDate,
                              _model.idTextController.text,
                              'active',
                              widget.frontNatImageUrl,
                              widget.backNatImageUrl,
                              widget.drugTestImageUrl,
                              ShiftStruct(
                                shiftPeriod: widget.shiftPeriod,
                                startShift: widget.startingShift,
                              ),
                              widget.contractorRef,
                              widget.totalDebit,
                              widget.totalCredit,
                              widget.diflictPercentage,
                              widget.shiftPrice,
                              widget.contractDate,
                              _model.userRoleOutput!.roleName,
                              widget.jobCode,
                              widget.isDriver,
                              _model.userRoleOutput!.roleID,
                              _model.userRoleOutput!.roleName,
                              FFAppState().authenticatedUser.displayName,
                              widget.phoneNumber!,
                            );
                            shouldSetState = true;
                            if (_model.returnObject?.message == 'Success') {
                              await Future.wait([
                                Future(() async {
                                  logFirebaseEvent('Button_backend_call');

                                  await _model.returnObject!.userRef!
                                      .update(createUsersRecordData(
                                    attendance: updateAttendacneStruct(
                                      AttendacneStruct(
                                        attendanceState: AttedanceState.waiting,
                                      ),
                                      clearUnsetFields: false,
                                    ),
                                  ));
                                  logFirebaseEvent('Button_backend_call');

                                  await AttendanceLogRecord.collection
                                      .doc(_model.returnObject!.userRef!.id)
                                      .set(createAttendanceLogRecordData());
                                }),
                                Future(() async {
                                  if ((_model.userRoleOutput?.roleName ==
                                          'Worker') ||
                                      (_model.userRoleOutput?.roleName ==
                                          'عامل')) {
                                    logFirebaseEvent('Button_backend_call');

                                    await widget.contractorRef!.update({
                                      ...mapToFirestore(
                                        {
                                          'workersList': FieldValue.arrayUnion(
                                              [_model.returnObject?.userRef]),
                                        },
                                      ),
                                    });
                                  } else {
                                    if (valueOrDefault<bool>(
                                      ((_model.userRoleOutput?.roleName ==
                                                  'Supervisor') ||
                                              (_model.userRoleOutput
                                                      ?.roleName ==
                                                  'مشرف')) ||
                                          (_model.userRoleOutput?.roleName ==
                                              'مسؤول إداري قطاع') ||
                                          (_model.userRoleOutput?.roleName ==
                                              'مسؤول إداريين القطاعات'),
                                      false,
                                    )) {
                                      logFirebaseEvent('Button_backend_call');

                                      await functions
                                          .getSectorRef(widget.sectorID)!
                                          .update({
                                        ...mapToFirestore(
                                          {
                                            'supervisors':
                                                FieldValue.arrayUnion([
                                              _model.returnObject?.userRef
                                            ]),
                                          },
                                        ),
                                      });
                                      logFirebaseEvent('Button_custom_action');
                                      await actions.logger(
                                        'sup added to the sector',
                                      );
                                    }
                                  }
                                }),
                              ]);
                            } else {
                              logFirebaseEvent('Button_bottom_sheet');
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                enableDrag: false,
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: SizedBox(
                                      height: double.infinity,
                                      child: ErrorComponentWidget(
                                        errorMessage: 'فشل في انشاء المستخدم',
                                        cancelButtonText: 'رجوع',
                                        errorHeader: 'خطأ',
                                        cancelButtonAction: () async {
                                          logFirebaseEvent('_navigate_to');

                                          context.pushNamed('createUser');
                                        },
                                      ),
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));

                              if (shouldSetState) setState(() {});
                              return;
                            }

                            logFirebaseEvent('Button_bottom_sheet');
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
                                    height: double.infinity,
                                    child: SuccsesWidget(
                                      successesMessage:
                                          'تم انشاء المستخدم  ${_model.idTextController.text}  بنجاح',
                                      yesButtonText: 'مشاركة البيانات',
                                      cancelButtonText: 'صفحة المستخدم',
                                      yesButtonAction: () async {
                                        logFirebaseEvent('_share');
                                        await Share.share(
                                          'نظام شركة الرحمة${'\n'}${'\n'}${_model.nameTextController.text}${'\n'}${_model.idTextController.text}${'\n'}${_model.emailTextController.text}${'\n'}${_model.passwordTextController.text}',
                                          sharePositionOrigin:
                                              getWidgetBoundingBox(context),
                                        );
                                        logFirebaseEvent(
                                            '_clear_text_fields_pin_codes');
                                        setState(() {
                                          _model.idTextController?.clear();
                                          _model.emailTextController?.clear();
                                          _model.passwordTextController
                                              ?.clear();
                                          _model.nameTextController?.clear();
                                        });
                                        logFirebaseEvent('_navigate_to');

                                        context.goNamed('New_Admin_Home');
                                      },
                                      cancelButtonAction: () async {
                                        logFirebaseEvent(
                                            '_clear_text_fields_pin_codes');
                                        setState(() {
                                          _model.idTextController?.clear();
                                          _model.emailTextController?.clear();
                                          _model.passwordTextController
                                              ?.clear();
                                          _model.nameTextController?.clear();
                                        });
                                        logFirebaseEvent('_navigate_to');
                                        if (Navigator.of(context).canPop()) {
                                          context.pop();
                                        }
                                        context.pushNamed(
                                          'user_Profile',
                                          queryParameters: {
                                            'userDoc': serializeParam(
                                              _model.returnObject?.userRef,
                                              ParamType.DocumentReference,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                    ),
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));

                            if (shouldSetState) setState(() {});
                          },
                          text: FFLocalizations.of(context).getText(
                            'l29zl71c' /* Create User */,
                          ),
                          options: FFButtonOptions(
                            width: 270.0,
                            height: 50.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: const Color(0xFF0CA256),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleMediumFamily,
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .titleMediumFamily),
                                ),
                            elevation: 2.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
