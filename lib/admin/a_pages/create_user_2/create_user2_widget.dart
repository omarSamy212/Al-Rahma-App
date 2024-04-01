import '/admin/a_components/user_created/user_created_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:url_launcher/url_launcher.dart';
import 'create_user2_model.dart';
export 'create_user2_model.dart';

class CreateUser2Widget extends StatefulWidget {
  const CreateUser2Widget({
    super.key,
    required this.nickName,
    required this.role,
    required this.nationalID,
    this.image,
    required this.phoneNumber,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.gender,
    required this.birthdate,
    required this.country,
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
  });

  final String? nickName;
  final String? role;
  final String? nationalID;
  final String? image;
  final int? phoneNumber;
  final String? firstName;
  final String? middleName;
  final String? lastName;
  final String? gender;
  final String? birthdate;
  final String? country;
  final String? government;
  final String? city;
  final String? fullAddress;
  final String? socialStatus;
  final DateTime? employmentDate;
  final String? frontNatImageUrl;
  final String? backNatImageUrl;
  final String? drugTestImageUrl;
  final String? frontDLic;
  final String? backDLic;
  final String? startingShift;
  final String? shiftPeriod;
  final String? userId;

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
      if (loggedIn && (currentUserDocument?.privileges.roleName == 'Admin')) {
        logFirebaseEvent('createUser_2_set_form_field');
        setState(() {
          _model.idController?.text = widget.userId!;
        });
        logFirebaseEvent('createUser_2_set_form_field');
        setState(() {
          _model.emailController?.text =
              functions.generateEmail(widget.userId!);
        });
        logFirebaseEvent('createUser_2_set_form_field');
        setState(() {
          _model.passwordController?.text = functions.generatePassword();
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

    _model.idController ??= TextEditingController();
    _model.idFocusNode ??= FocusNode();

    _model.emailController ??= TextEditingController();
    _model.emailFocusNode ??= FocusNode();

    _model.passwordController ??= TextEditingController();
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
    return StreamBuilder<List<RoleDefinitionsRecord>>(
      stream: queryRoleDefinitionsRecord(
        queryBuilder: (roleDefinitionsRecord) => roleDefinitionsRecord.where(
          'roleName',
          isEqualTo: widget.role,
        ),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
        List<RoleDefinitionsRecord> createUser2RoleDefinitionsRecordList =
            snapshot.data!;
        final createUser2RoleDefinitionsRecord =
            createUser2RoleDefinitionsRecordList.isNotEmpty
                ? createUser2RoleDefinitionsRecordList.first
                : null;
        return Title(
            title: 'createUser_2',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              appBar: PreferredSize(
                preferredSize: const Size.fromHeight(100.0),
                child: AppBar(
                  backgroundColor:
                      FlutterFlowTheme.of(context).secondaryBackground,
                  automaticallyImplyLeading: false,
                  actions: const [],
                  flexibleSpace: FlexibleSpaceBar(
                    title: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 14.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 0.0, 0.0),
                                  child: FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 30.0,
                                    borderWidth: 1.0,
                                    buttonSize: 50.0,
                                    icon: Icon(
                                      Icons.arrow_back_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 30.0,
                                    ),
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'CREATE_USER_2_arrow_back_rounded_ICN_ON_');
                                      logFirebaseEvent(
                                          'IconButton_navigate_back');
                                      context.safePop();
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 0.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                '1801r09g' /* Create Profile */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 22.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    centerTitle: true,
                    expandedTitleScale: 1.0,
                  ),
                  elevation: 0.0,
                ),
              ),
              body: SafeArea(
                top: true,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 16.0),
                      child: TextFormField(
                        controller: _model.idController,
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
                                  ),
                          hintStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    color: const Color(0xFF57636C),
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
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
                            ),
                        minLines: null,
                        validator:
                            _model.idControllerValidator.asValidator(context),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 16.0),
                      child: TextFormField(
                        controller: _model.emailController,
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
                                  ),
                          hintStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    color: const Color(0xFF57636C),
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
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
                            ),
                        minLines: null,
                        validator: _model.emailControllerValidator
                            .asValidator(context),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 16.0),
                      child: TextFormField(
                        controller: _model.passwordController,
                        focusNode: _model.passwordFocusNode,
                        onFieldSubmitted: (_) async {
                          logFirebaseEvent(
                              'CREATE_USER_2_Password_ON_TEXTFIELD_SUBM');
                          logFirebaseEvent('Password_set_form_field');
                          setState(() {
                            _model.passwordController?.text =
                                functions.generatePassword();
                          });
                        },
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
                                  ),
                          hintStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    color: const Color(0xFF57636C),
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
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
                            ),
                        minLines: null,
                        validator: _model.passwordControllerValidator
                            .asValidator(context),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.05),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'CREATE_USER_2_CREATE_USER_BTN_ON_TAP');
                            logFirebaseEvent('Button_custom_action');
                            _model.returnObject = await actions.createUser(
                              _model.emailController.text,
                              _model.passwordController.text,
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
                              widget.phoneNumber!.toString(),
                              widget.country!,
                              widget.government!,
                              widget.city!,
                              widget.fullAddress!,
                              widget.socialStatus!,
                              widget.nationalID!,
                              widget.image,
                              widget.employmentDate!,
                              random_data.randomInteger(0, 5).toString(),
                              'active',
                              widget.frontNatImageUrl!,
                              widget.backNatImageUrl!,
                              widget.drugTestImageUrl,
                              widget.role!,
                              ShiftStruct(
                                startingShift: widget.startingShift,
                                shiftPeriod: widget.shiftPeriod,
                              ),
                              'User_${widget.userId}',
                              UserPrivilegesStruct(
                                roleName:
                                    createUser2RoleDefinitionsRecord?.roleName,
                                roleTasks:
                                    createUser2RoleDefinitionsRecord?.roleTasks,
                              ),
                            );
                            if (_model.returnObject?.message == 'Success') {
                              logFirebaseEvent('Button_send_s_m_s');
                              if (isiOS) {
                                await launchUrl(Uri.parse(
                                    "sms:${widget.phoneNumber!.toString()}&body=${Uri.encodeComponent('ازيك يا ${widget.nickName}, ده الباسورد بتاعك ${_model.passwordController.text} احتفظ بيه في و أوعى تنساه.')}"));
                              } else {
                                await launchUrl(Uri(
                                  scheme: 'sms',
                                  path: widget.phoneNumber!.toString(),
                                  queryParameters: <String, String>{
                                    'body':
                                        'ازيك يا ${widget.nickName}, ده الباسورد بتاعك ${_model.passwordController.text} احتفظ بيه في و أوعى تنساه.',
                                  },
                                ));
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
                                      role: widget.role!,
                                      userObject: _model.returnObject!,
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));

                              logFirebaseEvent(
                                  'Button_clear_text_fields_pin_codes');
                              setState(() {
                                _model.idController?.clear();
                                _model.emailController?.clear();
                                _model.passwordController?.clear();
                              });
                            } else {
                              logFirebaseEvent('Button_alert_dialog');
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    title: const Text('error'),
                                    content: Text(_model.returnObject!.message),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(alertDialogContext),
                                        child: const Text('Ok'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }

                            setState(() {});
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
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
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
                  ],
                ),
              ),
            ));
      },
    );
  }
}
