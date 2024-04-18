import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'servicing_discription_widget.dart' show ServicingDiscriptionWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ServicingDiscriptionModel
    extends FlutterFlowModel<ServicingDiscriptionWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TheTruck widget.
  FocusNode? theTruckFocusNode;
  TextEditingController? theTruckTextController;
  String? Function(BuildContext, String?)? theTruckTextControllerValidator;
  // State field(s) for Mechanical widget.
  FocusNode? mechanicalFocusNode;
  TextEditingController? mechanicalTextController;
  String? Function(BuildContext, String?)? mechanicalTextControllerValidator;
  // State field(s) for tricycle widget.
  FocusNode? tricycleFocusNode;
  TextEditingController? tricycleTextController;
  String? Function(BuildContext, String?)? tricycleTextControllerValidator;
  // State field(s) for total_price widget.
  FocusNode? totalPriceFocusNode;
  TextEditingController? totalPriceTextController;
  String? Function(BuildContext, String?)? totalPriceTextControllerValidator;
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
    theTruckFocusNode?.dispose();
    theTruckTextController?.dispose();

    mechanicalFocusNode?.dispose();
    mechanicalTextController?.dispose();

    tricycleFocusNode?.dispose();
    tricycleTextController?.dispose();

    totalPriceFocusNode?.dispose();
    totalPriceTextController?.dispose();

    textualDetailsFocusNode?.dispose();
    textualDetailsTextController?.dispose();
  }
}
