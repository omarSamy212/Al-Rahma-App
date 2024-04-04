import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'tm_task_discription_widget.dart' show TmTaskDiscriptionWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TmTaskDiscriptionModel extends FlutterFlowModel<TmTaskDiscriptionWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for the_truck widget.
  String? theTruckValue;
  FormFieldController<String>? theTruckValueController;
  // State field(s) for the_driver widget.
  String? theDriverValue;
  FormFieldController<String>? theDriverValueController;
  // State field(s) for tricycle widget.
  String? tricycleValue;
  FormFieldController<String>? tricycleValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
