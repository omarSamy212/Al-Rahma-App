import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/shared/shared_components/our_side_nav/our_side_nav_widget.dart';
import '/storage_keeper/sk_components/daily_ordar/daily_ordar_widget.dart';
import '/storage_keeper/sk_components/todays_requests_dashboard/todays_requests_dashboard_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'day_contract_list_model.dart';
export 'day_contract_list_model.dart';

class DayContractListWidget extends StatefulWidget {
  const DayContractListWidget({super.key});

  @override
  State<DayContractListWidget> createState() => _DayContractListWidgetState();
}

class _DayContractListWidgetState extends State<DayContractListWidget>
    with TickerProviderStateMixin {
  late DayContractListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'textOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 10.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'iconOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1000.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DayContractListModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'day_Contract_List'});

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
        title: 'day_Contract_List',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Color(0xFFF1F4F8),
            drawer: Drawer(
              elevation: 16.0,
              child: wrapWithModel(
                model: _model.ourSideNavModel,
                updateCallback: () => setState(() {}),
                child: OurSideNavWidget(),
              ),
            ),
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(70.0),
              child: AppBar(
                backgroundColor: Color(0xFF0CA256),
                automaticallyImplyLeading: false,
                title: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 0.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'DAY_CONTRACT_LIST_PAGE_menu_ON_TAP');
                              logFirebaseEvent('menu_drawer');
                              scaffoldKey.currentState!.openDrawer();
                            },
                            child: Icon(
                              Icons.menu,
                              color: Color(0xFFE0E3E7),
                              size: 24.0,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              'lsecgnf2' /* Al Rahma */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .displaySmall
                                .override(
                                  fontFamily: 'Outfit',
                                  color: Colors.white,
                                  fontSize: 36.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ).animateOnPageLoad(
                              animationsMap['textOnPageLoadAnimation']!),
                          FaIcon(
                            FontAwesomeIcons.leaf,
                            color: FlutterFlowTheme.of(context).alternate,
                            size: 24.0,
                          ).animateOnPageLoad(
                              animationsMap['iconOnPageLoadAnimation']!),
                        ],
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 24.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'DAY_CONTRACT_LIST_Icon_dbnfk9gh_ON_TAP');
                              logFirebaseEvent('Icon_navigate_to');

                              context.pushNamed(
                                'welcome',
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.fade,
                                  ),
                                },
                              );
                            },
                            child: Icon(
                              Icons.notifications,
                              color: FlutterFlowTheme.of(context).alternate,
                              size: 24.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                actions: [],
                centerTitle: false,
                elevation: 0.0,
              ),
            ),
            body: SafeArea(
              top: true,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      height: 250.0,
                      child: Stack(
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Container(
                                    height: 233.0,
                                    child: Stack(
                                      children: [
                                        Container(
                                          width: double.infinity,
                                          height: 87.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFF0CA256),
                                          ),
                                        ),
                                        wrapWithModel(
                                          model: _model
                                              .todaysRequestsDashboardModel,
                                          updateCallback: () => setState(() {}),
                                          child: Hero(
                                            tag: 'requestCounter',
                                            transitionOnUserGestures: true,
                                            child: Material(
                                              color: Colors.transparent,
                                              child:
                                                  TodaysRequestsDashboardWidget(),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    ListView(
                      padding: EdgeInsets.zero,
                      primary: false,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 0.0),
                          child: wrapWithModel(
                            model: _model.dailyOrdarModel,
                            updateCallback: () => setState(() {}),
                            child: DailyOrdarWidget(),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
