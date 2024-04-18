import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'o_m_complandiscription_widget.dart' show OMComplandiscriptionWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OMComplandiscriptionModel
    extends FlutterFlowModel<OMComplandiscriptionWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
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
  }
}
