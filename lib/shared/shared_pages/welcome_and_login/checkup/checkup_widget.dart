import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
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

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 270.ms,
          duration: 1260.ms,
          begin: 1.0,
          end: 1.0,
        ),
      ],
    ),
    'imageOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 110.ms,
          duration: 2000.ms,
          begin: 1.0,
          end: 1.0,
        ),
        ShimmerEffect(
          curve: Curves.easeInOut,
          delay: 110.ms,
          duration: 2000.ms,
          color: const Color(0x80FFFFFF),
          angle: 0.524,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CheckupModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'checkup'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('CHECKUP_PAGE_checkup_ON_INIT_STATE');
      logFirebaseEvent('checkup_wait__delay');
      await Future.delayed(const Duration(milliseconds: 4000));
      if (loggedIn) {
        if (currentUserDocument?.privileges.roleName == 'Admin') {
          logFirebaseEvent('checkup_navigate_to');

          context.goNamedAuth('Admin_Home', context.mounted);

          return;
        } else {
          if (currentUserDocument?.privileges.roleName == 'Supervisor') {
            logFirebaseEvent('checkup_navigate_to');

            context.goNamedAuth('supervisor_home', context.mounted);

            return;
          } else {
            if (currentUserDocument?.privileges.roleName == 'Manager') {
              return;
            } else {
              if (currentUserDocument?.privileges.roleName ==
                  'Storage Keeper') {
                logFirebaseEvent('checkup_navigate_to');

                context.goNamedAuth('storekeeperHome', context.mounted);

                return;
              } else {
                if (currentUserDocument?.privileges.roleName == 'Worker') {
                  logFirebaseEvent('checkup_alert_dialog');
                  await showDialog(
                    context: context,
                    builder: (alertDialogContext) {
                      return AlertDialog(
                        title: const Text('Unauthorized'),
                        content: const Text(
                            'You dont have permisiosn to enter the system'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(alertDialogContext),
                            child: const Text('Ok'),
                          ),
                        ],
                      );
                    },
                  );
                  logFirebaseEvent('checkup_auth');
                  GoRouter.of(context).prepareAuthEvent();
                  await authManager.signOut();
                  GoRouter.of(context).clearRedirectLocation();

                  return;
                } else {
                  logFirebaseEvent('checkup_auth');
                  GoRouter.of(context).prepareAuthEvent();
                  await authManager.signOut();
                  GoRouter.of(context).clearRedirectLocation();

                  return;
                }
              }
            }
          }
        }
      } else {
        logFirebaseEvent('checkup_navigate_to');

        context.goNamedAuth('Login', context.mounted);

        return;
      }
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
    return Title(
        title: 'checkup',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: const Color(0xFF1E2429),
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
