import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'daily_report_widget.dart' show DailyReportWidget;
import 'package:styled_divider/styled_divider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DailyReportModel extends FlutterFlowModel<DailyReportWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for TextualDetails widget.
  FocusNode? textualDetailsFocusNode1;
  TextEditingController? textualDetailsController1;
  String? Function(BuildContext, String?)? textualDetailsController1Validator;
  // State field(s) for TextualDetails widget.
  FocusNode? textualDetailsFocusNode2;
  TextEditingController? textualDetailsController2;
  String? Function(BuildContext, String?)? textualDetailsController2Validator;
  // State field(s) for TextualDetails widget.
  FocusNode? textualDetailsFocusNode3;
  TextEditingController? textualDetailsController3;
  String? Function(BuildContext, String?)? textualDetailsController3Validator;
  // State field(s) for TextualDetails widget.
  FocusNode? textualDetailsFocusNode4;
  TextEditingController? textualDetailsController4;
  String? Function(BuildContext, String?)? textualDetailsController4Validator;
  // State field(s) for TextualDetails widget.
  FocusNode? textualDetailsFocusNode5;
  TextEditingController? textualDetailsController5;
  String? Function(BuildContext, String?)? textualDetailsController5Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textualDetailsFocusNode1?.dispose();
    textualDetailsController1?.dispose();

    textualDetailsFocusNode2?.dispose();
    textualDetailsController2?.dispose();

    textualDetailsFocusNode3?.dispose();
    textualDetailsController3?.dispose();

    textualDetailsFocusNode4?.dispose();
    textualDetailsController4?.dispose();

    textualDetailsFocusNode5?.dispose();
    textualDetailsController5?.dispose();
  }
}
