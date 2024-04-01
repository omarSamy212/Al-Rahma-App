import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'tool_item_model.dart';
export 'tool_item_model.dart';

class ToolItemWidget extends StatefulWidget {
  const ToolItemWidget({
    super.key,
    this.imageUrl,
    this.toolName,
    this.availableQuantity,
    this.toolDocRef,
    this.index,
  });

  final String? imageUrl;
  final String? toolName;
  final int? availableQuantity;
  final DocumentReference? toolDocRef;
  final int? index;

  @override
  State<ToolItemWidget> createState() => _ToolItemWidgetState();
}

class _ToolItemWidgetState extends State<ToolItemWidget>
    with TickerProviderStateMixin {
  late ToolItemModel _model;

  final animationsMap = {
    'containerOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        ScaleEffect(
          curve: Curves.elasticOut,
          delay: 190.ms,
          duration: 600.ms,
          begin: const Offset(1.0, 1.0),
          end: const Offset(1.0, 1.0),
        ),
      ],
    ),
    'iconButtonOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1070.ms,
          begin: const Offset(1.0, 1.0),
          end: const Offset(1.0, 1.0),
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ToolItemModel());

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
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 0.0),
      child: Container(
        width: double.infinity,
        height: 100.0,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              blurRadius: 4.0,
              color: Color(0x320E151B),
              offset: Offset(
                0.0,
                1.0,
              ),
            )
          ],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 8.0, 8.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Hero(
                tag: widget.imageUrl!,
                transitionOnUserGestures: true,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.network(
                    widget.imageUrl!,
                    width: 80.0,
                    height: 80.0,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                        child: Text(
                          widget.toolName!,
                          style:
                              FlutterFlowTheme.of(context).titleLarge.override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    color: const Color(0xFF0F1113),
                                    fontSize: 15.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                        child: Text(
                          widget.availableQuantity!.toString(),
                          style:
                              FlutterFlowTheme.of(context).labelSmall.override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    color: const Color(0xFF57636C),
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (_model.isCountControllerVisible)
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                  child: Container(
                    width: 106.0,
                    height: 29.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(8.0),
                      shape: BoxShape.rectangle,
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).alternate,
                        width: 2.0,
                      ),
                    ),
                    child: FlutterFlowCountController(
                      decrementIconBuilder: (enabled) => FaIcon(
                        FontAwesomeIcons.minus,
                        color: enabled
                            ? FlutterFlowTheme.of(context).secondaryText
                            : FlutterFlowTheme.of(context).alternate,
                        size: 15.0,
                      ),
                      incrementIconBuilder: (enabled) => FaIcon(
                        FontAwesomeIcons.plus,
                        color: enabled
                            ? const Color(0xFF0CA256)
                            : FlutterFlowTheme.of(context).alternate,
                        size: 15.0,
                      ),
                      countBuilder: (count) => Text(
                        count.toString(),
                        style: FlutterFlowTheme.of(context).titleLarge.override(
                              fontFamily: 'Outfit',
                              fontSize: 15.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                      count: _model.countControllerValue ??= 0,
                      updateCount: (count) async {
                        setState(() => _model.countControllerValue = count);
                        logFirebaseEvent(
                            'TOOL_ITEM_CountController_d4i4llun_ON_FO');
                        if (_model.countControllerValue ==
                            widget.availableQuantity) {
                          logFirebaseEvent(
                              'CountController_update_component_state');
                          setState(() {
                            _model.isCountControllerVisible =
                                !_model.isCountControllerVisible;
                          });
                          logFirebaseEvent('CountController_show_snack_bar');
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'You have reached the max quantity for this item',
                                style: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              duration: const Duration(milliseconds: 4000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).secondary,
                            ),
                          );
                        }
                      },
                      stepSize: 1,
                      minimum: 0,
                    ),
                  ),
                ),
              if (valueOrDefault<bool>(
                _model.countControllerValue! > 0,
                false,
              ))
                FlutterFlowIconButton(
                  borderColor: FlutterFlowTheme.of(context).success,
                  borderRadius: 20.0,
                  borderWidth: 1.0,
                  buttonSize: 40.0,
                  fillColor: const Color(0xFF0CA256),
                  icon: Icon(
                    Icons.add_task,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 24.0,
                  ),
                  onPressed: () async {
                    logFirebaseEvent('TOOL_ITEM_COMP_add_task_ICN_ON_TAP');
                    if (functions
                            .updateAppstateCart(
                                FFAppState().toolsCart.toList(),
                                ArrayOfToolsStruct(
                                  toolId: widget.toolDocRef,
                                ))
                            .toString() !=
                        '-1') {
                      logFirebaseEvent('IconButton_update_app_state');
                      setState(() {
                        FFAppState().updateToolsCartAtIndex(
                          functions.updateAppstateCart(
                              FFAppState().toolsCart.toList(),
                              ArrayOfToolsStruct(
                                toolId: widget.toolDocRef,
                              )),
                          (e) => e
                            ..selectedQuantity = _model.countControllerValue
                            ..name = widget.toolName
                            ..toolImage = widget.imageUrl
                            ..quantity = widget.availableQuantity
                            ..toolId = widget.toolDocRef,
                        );
                      });
                    } else {
                      logFirebaseEvent('IconButton_update_app_state');
                      setState(() {
                        FFAppState().addToToolsCart(ArrayOfToolsStruct(
                          toolId: widget.toolDocRef,
                          quantity: widget.availableQuantity,
                          toolImage: widget.imageUrl,
                          selectedQuantity: _model.countControllerValue,
                          name: widget.toolName,
                        ));
                      });
                    }

                    logFirebaseEvent('IconButton_widget_animation');
                    if (animationsMap['iconButtonOnActionTriggerAnimation'] !=
                        null) {
                      await animationsMap['iconButtonOnActionTriggerAnimation']!
                          .controller
                          .forward(from: 0.0);
                    }
                    logFirebaseEvent('IconButton_show_snack_bar');
                    ScaffoldMessenger.of(context).clearSnackBars();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Added To Cart !',
                          style: FlutterFlowTheme.of(context)
                              .titleMedium
                              .override(
                                fontFamily: 'Readex Pro',
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                              ),
                        ),
                        duration: const Duration(milliseconds: 4000),
                        backgroundColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                      ),
                    );
                  },
                ).animateOnActionTrigger(
                  animationsMap['iconButtonOnActionTriggerAnimation']!,
                ),
            ],
          ),
        ),
      ).animateOnActionTrigger(
        animationsMap['containerOnActionTriggerAnimation']!,
      ),
    );
  }
}
