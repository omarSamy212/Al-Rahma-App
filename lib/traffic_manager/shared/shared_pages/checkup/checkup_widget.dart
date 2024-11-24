import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'checkup_model.dart';
export 'checkup_model.dart';

class CheckupWidget extends StatefulWidget {
  const CheckupWidget({super.key});

  @override
  State<CheckupWidget> createState() => _CheckupWidgetState();
}

class _CheckupWidgetState extends State<CheckupWidget>
    with TickerProviderStateMixin {
  late CheckupModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CheckupModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'checkup'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('CHECKUP_PAGE_checkup_ON_INIT_STATE');
      logFirebaseEvent('checkup_set_app_language');
      setAppLanguage(context, 'ar');
      logFirebaseEvent('checkup_set_dark_mode_settings');
      setDarkModeSetting(context, ThemeMode.light);
      logFirebaseEvent('checkup_custom_action');
      _model.currentSession = await actions.checkCurrentSession();
      logFirebaseEvent('checkup_update_app_state');
      setState(() {
        FFAppState().sessionInfo = CurrentShiftInfoStruct(
          sessionName: _model.currentSession?.sessionName,
          sessionDocRef: _model.currentSession?.sessionDocRef,
        );
      });
      logFirebaseEvent('checkup_wait__delay');
      await Future.delayed(const Duration(milliseconds: 8000));
      if (loggedIn) {
        if (FFAppState().authUser != null) {
          logFirebaseEvent('checkup_backend_call');
          _model.user =
              await UsersRecord.getDocumentOnce(FFAppState().authUser!);
          logFirebaseEvent('checkup_update_app_state');
          setState(() {
            FFAppState().authenticatedUser = AuthorizedUserStruct(
              accountStatus: _model.user?.accountStatus,
              birthdate: _model.user?.birthdate,
              city: _model.user?.city,
              createdBy: _model.user?.createdBy,
              createdTime: _model.user?.createdTime,
              displayName: _model.user?.displayName,
              drugTestImageUrl: _model.user?.drugTestImageUrl,
              backNatImageUrl: _model.user?.backNatImageUrl,
              educationData: _model.user?.educationData,
              email: _model.user?.email,
              employmentDate: _model.user?.employmentDate,
              firstName: _model.user?.firstName,
              frontNatImageUrl: _model.user?.frontNatImageUrl,
              fullAddress: _model.user?.fullAddress,
              gender: _model.user?.gender,
              government: _model.user?.government,
              isEmployed: _model.user?.isEmployed,
              isDriver: _model.user?.isDriver,
              lastName: _model.user?.lastName,
              leaderAreaRefrence1: _model.user?.leaderAreaRefrence1,
              leaderAreaRefrence2: _model.user?.leaderAreaRefrence2,
              middleName: _model.user?.middleName,
              nationalInformation: _model.user?.nationalInformation,
              photoUrl: _model.user?.photoUrl,
              privileges: _model.user?.privileges,
              shift: _model.user?.shift,
              socialStatus: _model.user?.socialStatus,
              uid: _model.user?.uid,
              userCode: _model.user?.userCode,
            );
          });
        } else {
          logFirebaseEvent('checkup_custom_action');
          _model.userOldRefrence =
              actions.gettingUserRefrenceFromOldLoginData(
            currentUserEmail,
          );
          logFirebaseEvent('checkup_backend_call');
          _model.userOldData =
              await UsersRecord.getDocumentOnce(_model.userOldRefrence!);
          logFirebaseEvent('checkup_update_app_state');
          setState(() {
            FFAppState().authenticatedUser = AuthorizedUserStruct(
              accountStatus: _model.userOldData?.accountStatus,
              birthdate: _model.userOldData?.birthdate,
              city: _model.userOldData?.city,
              createdBy: _model.userOldData?.createdBy,
              createdTime: _model.userOldData?.createdTime,
              displayName: _model.userOldData?.displayName,
              drugTestImageUrl: _model.userOldData?.drugTestImageUrl,
              backNatImageUrl: _model.userOldData?.backNatImageUrl,
              educationData: _model.userOldData?.educationData,
              email: _model.userOldData?.email,
              employmentDate: _model.userOldData?.employmentDate,
              firstName: _model.userOldData?.firstName,
              frontNatImageUrl: _model.userOldData?.frontNatImageUrl,
              fullAddress: _model.userOldData?.fullAddress,
              gender: _model.userOldData?.gender,
              government: _model.userOldData?.government,
              isEmployed: _model.userOldData?.isEmployed,
              isDriver: _model.userOldData?.isDriver,
              lastName: _model.userOldData?.lastName,
              leaderAreaRefrence1: _model.userOldData?.leaderAreaRefrence1,
              leaderAreaRefrence2: _model.userOldData?.leaderAreaRefrence2,
              middleName: _model.userOldData?.middleName,
              nationalInformation: _model.userOldData?.nationalInformation,
              photoUrl: _model.userOldData?.photoUrl,
              privileges: _model.userOldData?.privileges,
              shift: _model.userOldData?.shift,
              socialStatus: _model.userOldData?.socialStatus,
              uid: _model.userOldData?.uid,
              userCode: _model.userOldData?.userCode,
            );
          });
        }

        if ((FFAppState().authenticatedUser.privileges.roleName ==
                'رئيس مجلس الإدارة') ||
            (FFAppState().authenticatedUser.privileges.roleName ==
                'مدير المكتب')) {
          logFirebaseEvent('checkup_navigate_to');

          context.goNamedAuth('New_Admin_Home', context.mounted);

          return;
        } else if ((FFAppState().authenticatedUser.privileges.roleName ==
                'نائب مدير التشغيل') ||
            (FFAppState().authenticatedUser.privileges.roleName ==
                'مدير التشغيل') ||
            (FFAppState().authenticatedUser.privileges.roleName ==
                'مدير العمليات')) {
          logFirebaseEvent('checkup_navigate_to');

          context.pushNamedAuth('OM_Home', context.mounted);

          return;
        } else if ((FFAppState().authenticatedUser.privileges.roleName ==
                'مشرف') ||
            (FFAppState().authenticatedUser.privileges.roleName ==
                'مسؤول إداريين القطاعات') ||
            (FFAppState().authenticatedUser.privileges.roleName ==
                'مسؤول إداري قطاع')) {
          logFirebaseEvent('checkup_navigate_to');

          context.goNamedAuth('supervisor_home', context.mounted);

          return;
        } else if (FFAppState().authenticatedUser.privileges.roleName ==
            'مسؤول الحركة') {
          logFirebaseEvent('checkup_navigate_to');

          context.pushNamedAuth('New_Tm_Home', context.mounted);

          return;
        } else if (FFAppState().authenticatedUser.privileges.roleName ==
            'أمين مخزن') {
          logFirebaseEvent('checkup_navigate_to');

          context.goNamedAuth('storekeeperHome', context.mounted);

          return;
        } else if (FFAppState().authenticatedUser.privileges.roleName ==
            'مهندس برمجيات') {
          logFirebaseEvent('checkup_navigate_to');

          context.pushNamedAuth('Eng_Home', context.mounted);

          return;
        } else if (FFAppState().authenticatedUser.privileges.roleName ==
            'عامل') {
          logFirebaseEvent('checkup_navigate_to');

          context.pushNamedAuth('worker_Home', context.mounted);

          return;
        } else if ((FFAppState().authenticatedUser.privileges.roleName ==
                'محاسب') ||
            (FFAppState().authenticatedUser.privileges.roleName ==
                'مسؤول حصر') ||
            (FFAppState().authenticatedUser.privileges.roleName ==
                'مدير حصر')) {
          logFirebaseEvent('checkup_navigate_to');

          context.pushNamedAuth('AccountantHome', context.mounted);

          return;
        } else if (FFAppState().authenticatedUser.privileges.roleName ==
            'مورد') {
          logFirebaseEvent('checkup_navigate_to');

          context.pushNamedAuth('supllierHome', context.mounted);

          return;
        } else {
          logFirebaseEvent('checkup_auth');
          GoRouter.of(context).prepareAuthEvent();
          await authManager.signOut();
          GoRouter.of(context).clearRedirectLocation();

          logFirebaseEvent('checkup_update_app_state');
          setState(() {
            FFAppState().authenticatedUser = AuthorizedUserStruct();
          });
          logFirebaseEvent('checkup_navigate_to');

          context.pushNamedAuth('Login', context.mounted);

          return;
        }
      } else {
        logFirebaseEvent('checkup_navigate_to');

        context.goNamedAuth('Login', context.mounted);

        return;
      }
    });

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 270.0.ms,
            duration: 1260.0.ms,
            begin: 1.0,
            end: 1.0,
          ),
        ],
      ),
      'imageOnPageLoadAnimation': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 110.0.ms,
            duration: 2000.0.ms,
            begin: 1.0,
            end: 1.0,
          ),
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 110.0.ms,
            duration: 2000.0.ms,
            color: const Color(0x80FFFFFF),
            angle: 0.524,
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
        title: 'checkup',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primary,
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  FlutterFlowTheme.of(context).secondaryBackground,
                  const Color(0xFF0D8A49)
                ],
                stops: const [0.35, 1.0],
                begin: const AlignmentDirectional(1.0, -1.0),
                end: const AlignmentDirectional(-1.0, 1.0),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/El_Rahma_Logo.png',
                  width: 190.0,
                  height: 204.0,
                  fit: BoxFit.fitHeight,
                ).animateOnPageLoad(animationsMap['imageOnPageLoadAnimation']!),
              ],
            ),
          ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
        ));
  }
}
