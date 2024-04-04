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
  TextEditingController? theTruckController;
  String? Function(BuildContext, String?)? theTruckControllerValidator;
  // State field(s) for Mechanical widget.
  FocusNode? mechanicalFocusNode;
  TextEditingController? mechanicalController;
  String? Function(BuildContext, String?)? mechanicalControllerValidator;
  // State field(s) for tricycle widget.
  FocusNode? tricycleFocusNode;
  TextEditingController? tricycleController;
  String? Function(BuildContext, String?)? tricycleControllerValidator;
  // State field(s) for total_price widget.
  FocusNode? totalPriceFocusNode;
  TextEditingController? totalPriceController;
  String? Function(BuildContext, String?)? totalPriceControllerValidator;
  // State field(s) for TextualDetails widget.
  FocusNode? textualDetailsFocusNode;
  TextEditingController? textualDetailsController;
  String? Function(BuildContext, String?)? textualDetailsControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    theTruckFocusNode?.dispose();
    theTruckController?.dispose();

    mechanicalFocusNode?.dispose();
    mechanicalController?.dispose();

    tricycleFocusNode?.dispose();
    tricycleController?.dispose();

    totalPriceFocusNode?.dispose();
    totalPriceController?.dispose();

    textualDetailsFocusNode?.dispose();
    textualDetailsController?.dispose();
  }
}
