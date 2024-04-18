import '/admin/a_components/user_created/user_created_widget.dart';
import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
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
  }) : this.isDriver = isDriver ?? true;

  final String? nickName;
  final String? image;
  final int? phoneNumber;
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
      if (loggedIn && (currentUserDocument?.privileges?.roleName == 'Admin')) {
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
              title: Text('Error'),
              content: Text('Access Not Granted'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: Text('Ok'),
                ),
              ],
            );
          },
        );
        logFirebaseEvent('createUser_2_navigate_back');
        context.safePop();
      }
    });

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
              icon: Icon(
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
              padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
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
            actions: [],
            centerTitle: true,
            elevation: 2.0,
          ),
          body: SafeArea(
            top: true,
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 70.0, 0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 16.0),
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
                                  color: Color(0xFF57636C),
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey('Plus Jakarta Sans'),
                                ),
                        hintStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Plus Jakarta Sans',
                                  color: Color(0xFF57636C),
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey('Plus Jakarta Sans'),
                                ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFE0E3E7),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF4B39EF),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFFF5963),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFFF5963),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 24.0, 0.0, 24.0),
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Plus Jakarta Sans',
                            color: Color(0xFF14181B),
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
                            useGoogleFonts: GoogleFonts.asMap()
                                .containsKey('Plus Jakarta Sans'),
                          ),
                      validator:
                          _model.idTextControllerValidator.asValidator(context),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 16.0),
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
                                  color: Color(0xFF57636C),
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey('Plus Jakarta Sans'),
                                ),
                        hintStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Plus Jakarta Sans',
                                  color: Color(0xFF57636C),
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey('Plus Jakarta Sans'),
                                ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFE0E3E7),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF4B39EF),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFFF5963),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFFF5963),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 24.0, 0.0, 24.0),
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Plus Jakarta Sans',
                            color: Color(0xFF14181B),
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
                            useGoogleFonts: GoogleFonts.asMap()
                                .containsKey('Plus Jakarta Sans'),
                          ),
                      validator: _model.emailTextControllerValidator
                          .asValidator(context),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 16.0),
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
                                  color: Color(0xFF57636C),
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey('Plus Jakarta Sans'),
                                ),
                        hintStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Plus Jakarta Sans',
                                  color: Color(0xFF57636C),
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey('Plus Jakarta Sans'),
                                ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFE0E3E7),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF4B39EF),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFFF5963),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFFF5963),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 24.0, 0.0, 24.0),
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Plus Jakarta Sans',
                            color: Color(0xFF14181B),
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
                            useGoogleFonts: GoogleFonts.asMap()
                                .containsKey('Plus Jakarta Sans'),
                          ),
                      validator: _model.passwordTextControllerValidator
                          .asValidator(context),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.05),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent(
                              'CREATE_USER_2_CREATE_USER_BTN_ON_TAP');
                          var _shouldSetState = false;
                          logFirebaseEvent('Button_backend_call');
                          _model.userRoleOutput =
                              await RolesRecord.getDocumentOnce(widget.role!);
                          _shouldSetState = true;
                          logFirebaseEvent('Button_custom_action');
                          _model.returnObject = await actions.createUser(
                            _model.emailTextController.text,
                            _model.passwordTextController.text,
                            random_data.randomString(
                              10,
                              25,
                              true,
                              true,
                              true,
                            ),
                            widget.nickName!,
                            widget.firstName!,
                            widget.middleName!,
                            widget.lastName!,
                            widget.gender!,
                            widget.birthdate!,
                            widget.educationData!,
                            widget.isEmployed!,
                            widget.relegion!,
                            widget.phoneNumber!.toString(),
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
                            'User_${widget.userId}',
                            widget.contractorRef,
                            widget.totalDebit,
                            widget.totalCredit,
                            widget.diflictPercentage,
                            widget.shiftPrice,
                            widget.contractDate?.toString(),
                            _model.userRoleOutput!.roleName,
                            widget.isDriver,
                            _model.userRoleOutput!.roleID,
                            _model.userRoleOutput!.roleName,
                            '${valueOrDefault(currentUserDocument?.firstName, '')} ${valueOrDefault(currentUserDocument?.middleName, '')} ${valueOrDefault(currentUserDocument?.lastName, '')}',
                          );
                          _shouldSetState = true;
                          if (_model.returnObject?.message == 'Success') {
                            if ((_model.userRoleOutput?.roleName == 'Worker') ||
                                (_model.userRoleOutput?.roleName == 'عامل')) {
                              logFirebaseEvent('Button_backend_call');

                              await widget.contractorRef!.update({
                                ...mapToFirestore(
                                  {
                                    'workersList': FieldValue.arrayUnion(
                                        [_model.returnObject?.userRef]),
                                  },
                                ),
                              });
                            }
                            logFirebaseEvent('Button_bottom_sheet');
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: UserCreatedWidget(
                                    name: widget.nickName!,
                                    id: widget.userId!,
                                    role: _model.userRoleOutput!.roleName,
                                    userObject: _model.returnObject!,
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));

                            logFirebaseEvent(
                                'Button_clear_text_fields_pin_codes');
                            setState(() {
                              _model.idTextController?.clear();
                              _model.emailTextController?.clear();
                              _model.passwordTextController?.clear();
                            });
                            if (_shouldSetState) setState(() {});
                            return;
                          } else {
                            logFirebaseEvent('Button_alert_dialog');
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text('error'),
                                  content: Text(_model.returnObject!.message),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(alertDialogContext),
                                      child: Text('Ok'),
                                    ),
                                  ],
                                );
                              },
                            );
                            if (_shouldSetState) setState(() {});
                            return;
                          }

                          if (_shouldSetState) setState(() {});
                        },
                        text: FFLocalizations.of(context).getText(
                          'l29zl71c' /* Create User */,
                        ),
                        options: FFButtonOptions(
                          width: 270.0,
                          height: 50.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: Color(0xFF0CA256),
                          textStyle: FlutterFlowTheme.of(context)
                              .titleMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .titleMediumFamily,
                                color: Colors.white,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .titleMediumFamily),
                              ),
                          elevation: 2.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
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
