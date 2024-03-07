import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

import '/auth/base_auth_user_provider.dart';

import '/index.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? const CheckupWidget() : const LoginWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? const CheckupWidget() : const LoginWidget(),
        ),
        FFRoute(
          name: 'welcome',
          path: '/welcome',
          builder: (context, params) => const WelcomeWidget(),
        ),
        FFRoute(
          name: 'Login',
          path: '/login',
          builder: (context, params) => const LoginWidget(),
        ),
        FFRoute(
          name: 'storekeeperHome',
          path: '/storekeeperHome',
          requireAuth: true,
          builder: (context, params) => const StorekeeperHomeWidget(),
        ),
        FFRoute(
          name: 'Home01CompanyList',
          path: '/home01CompanyList',
          builder: (context, params) => const Home01CompanyListWidget(),
        ),
        FFRoute(
          name: 'createUser',
          path: '/createUser',
          requireAuth: true,
          builder: (context, params) => const CreateUserWidget(),
        ),
        FFRoute(
          name: 'Missingtools_form',
          path: '/missingtoolsForm',
          requireAuth: true,
          asyncParams: {
            'supervisorDoc': getDoc(['users'], UsersRecord.fromSnapshot),
            'requestDec':
                getDoc(['Tools_Requests'], ToolsRequestsRecord.fromSnapshot),
          },
          builder: (context, params) => MissingtoolsFormWidget(
            supervisorDoc: params.getParam('supervisorDoc', ParamType.Document),
            requestDec: params.getParam('requestDec', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'day_Contract_List',
          path: '/dayContractList',
          requireAuth: true,
          builder: (context, params) => const DayContractListWidget(),
        ),
        FFRoute(
          name: 'request_Details',
          path: '/request_Details',
          requireAuth: true,
          builder: (context, params) => RequestDetailsWidget(
            supervisorRef: params.getParam(
                'supervisorRef', ParamType.DocumentReference, false, ['users']),
            requestRef: params.getParam('requestRef',
                ParamType.DocumentReference, false, ['Tools_Requests']),
          ),
        ),
        FFRoute(
          name: 'createUser_2',
          path: '/createUser2',
          builder: (context, params) => CreateUser2Widget(
            nickName: params.getParam('nickName', ParamType.String),
            role: params.getParam('role', ParamType.String),
            shift: params.getParam('shift', ParamType.String),
            nationalID: params.getParam('nationalID', ParamType.String),
            userNum: params.getParam('userNum', ParamType.int),
            image: params.getParam('image', ParamType.String),
            phoneNumber: params.getParam('phoneNumber', ParamType.int),
            firstName: params.getParam('firstName', ParamType.String),
            middleName: params.getParam('middleName', ParamType.String),
            lastName: params.getParam('lastName', ParamType.String),
            gender: params.getParam('gender', ParamType.String),
            birthdate: params.getParam('birthdate', ParamType.DateTime),
            country: params.getParam('country', ParamType.String),
            government: params.getParam('government', ParamType.String),
            city: params.getParam('city', ParamType.String),
            fullAddress: params.getParam('fullAddress', ParamType.String),
            socialStatus: params.getParam('socialStatus', ParamType.String),
            employmentDate:
                params.getParam('employmentDate', ParamType.DateTime),
          ),
        ),
        FFRoute(
          name: 'supervisor_home',
          path: '/supervisorHome',
          requireAuth: true,
          builder: (context, params) => const SupervisorHomeWidget(),
        ),
        FFRoute(
          name: 'Admin_Home',
          path: '/adminHome',
          requireAuth: true,
          builder: (context, params) => const AdminHomeWidget(),
        ),
        FFRoute(
          name: 'profile_Detals_WIth_QR',
          path: '/my_profile',
          requireAuth: true,
          builder: (context, params) => const ProfileDetalsWIthQRWidget(),
        ),
        FFRoute(
          name: 'worker_Home',
          path: '/workerHome',
          requireAuth: true,
          builder: (context, params) => const WorkerHomeWidget(),
        ),
        FFRoute(
          name: 'transmission_Select_1',
          path: '/transmission_Select_1',
          requireAuth: true,
          builder: (context, params) => const TransmissionSelect1Widget(),
        ),
        FFRoute(
          name: 'transmission_Scan_2',
          path: '/transmission_Scan_2',
          requireAuth: true,
          builder: (context, params) => const TransmissionScan2Widget(),
        ),
        FFRoute(
          name: 'HowToUseApp',
          path: '/howToUseApp',
          builder: (context, params) => const HowToUseAppWidget(),
        ),
        FFRoute(
          name: 'checkup',
          path: '/checkup',
          requireAuth: true,
          builder: (context, params) => const CheckupWidget(),
        ),
        FFRoute(
          name: 'supplierDashboard',
          path: '/supplierDashboard',
          requireAuth: true,
          builder: (context, params) => const SupplierDashboardWidget(),
        ),
        FFRoute(
          name: 'applyforjob',
          path: '/applyforjob',
          builder: (context, params) => const ApplyforjobWidget(),
        ),
        FFRoute(
          name: 'Onboarding04',
          path: '/onboarding04',
          builder: (context, params) => const Onboarding04Widget(),
        ),
        FFRoute(
          name: 'hintBeforeapplyjob',
          path: '/hintBeforeapplyjob',
          builder: (context, params) => const HintBeforeapplyjobWidget(),
        ),
        FFRoute(
          name: 'Home13Productivity',
          path: '/home13Productivity',
          builder: (context, params) => const Home13ProductivityWidget(),
        ),
        FFRoute(
          name: 'tasksTracker',
          path: '/tasksTracker',
          builder: (context, params) => const TasksTrackerWidget(),
        ),
        FFRoute(
          name: 'complain_formCopy',
          path: '/complainFormCopy',
          requireAuth: true,
          asyncParams: {
            'supervisorDoc': getDoc(['users'], UsersRecord.fromSnapshot),
            'requestDec':
                getDoc(['Tools_Requests'], ToolsRequestsRecord.fromSnapshot),
          },
          builder: (context, params) => ComplainFormCopyWidget(
            supervisorDoc: params.getParam('supervisorDoc', ParamType.Document),
            requestDec: params.getParam('requestDec', ParamType.Document),
          ),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
    List<String>? collectionNamePath,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(param, type, isList,
        collectionNamePath: collectionNamePath);
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/login';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? const Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: SpinKitDualRing(
                      color: Color(0xFF0CA256),
                      size: 50.0,
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => const TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouter.of(context).location;
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}