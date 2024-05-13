import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'daily_report_widget.dart' show DailyReportWidget;
import 'package:flutter/material.dart';

class DailyReportModel extends FlutterFlowModel<DailyReportWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for TextualDetails widget.
  FocusNode? textualDetailsFocusNode1;
  TextEditingController? textualDetailsTextController1;
  String? Function(BuildContext, String?)?
      textualDetailsTextController1Validator;
  // State field(s) for TextualDetails widget.
  FocusNode? textualDetailsFocusNode2;
  TextEditingController? textualDetailsTextController2;
  String? Function(BuildContext, String?)?
      textualDetailsTextController2Validator;
  // State field(s) for TextualDetails widget.
  FocusNode? textualDetailsFocusNode3;
  TextEditingController? textualDetailsTextController3;
  String? Function(BuildContext, String?)?
      textualDetailsTextController3Validator;
  // State field(s) for TextualDetails widget.
  FocusNode? textualDetailsFocusNode4;
  TextEditingController? textualDetailsTextController4;
  String? Function(BuildContext, String?)?
      textualDetailsTextController4Validator;
  // State field(s) for TextualDetails widget.
  FocusNode? textualDetailsFocusNode5;
  TextEditingController? textualDetailsTextController5;
  String? Function(BuildContext, String?)?
      textualDetailsTextController5Validator;
  // Stores action output result for [Custom Action - createDailyReport] action in Button widget.
  bool? dailyreport3;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  LeadersRecord? leader2;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  SquaresRecord? square2;
  // Stores action output result for [Custom Action - createDailyReport] action in Button widget.
  bool? dailyreport2;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  LeadersRecord? leader1;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  SquaresRecord? square1;
  // Stores action output result for [Custom Action - createDailyReport] action in Button widget.
  bool? dailyreport1;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textualDetailsFocusNode1?.dispose();
    textualDetailsTextController1?.dispose();

    textualDetailsFocusNode2?.dispose();
    textualDetailsTextController2?.dispose();

    textualDetailsFocusNode3?.dispose();
    textualDetailsTextController3?.dispose();

    textualDetailsFocusNode4?.dispose();
    textualDetailsTextController4?.dispose();

    textualDetailsFocusNode5?.dispose();
    textualDetailsTextController5?.dispose();
  }
}
