import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'movment_widget.dart' show MovmentWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MovmentModel extends FlutterFlowModel<MovmentWidget> {
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
  // State field(s) for motocycle widget.
  String? motocycleValue;
  FormFieldController<String>? motocycleValueController;
  // State field(s) for TextualDetails widget.
  FocusNode? textualDetailsFocusNode;
  TextEditingController? textualDetailsTextController;
  String? Function(BuildContext, String?)?
      textualDetailsTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textualDetailsFocusNode?.dispose();
    textualDetailsTextController?.dispose();
  }
}
