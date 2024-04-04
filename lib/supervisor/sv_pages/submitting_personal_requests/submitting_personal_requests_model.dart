import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_audio_player.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'submitting_personal_requests_widget.dart'
    show SubmittingPersonalRequestsWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SubmittingPersonalRequestsModel
    extends FlutterFlowModel<SubmittingPersonalRequestsWidget> {
  ///  Local state fields for this page.

  bool isRecording = true;

  bool showPlayer = true;

  String? selectedToolRef;

  List<ArrayOfToolsStruct> requestTools = [];
  void addToRequestTools(ArrayOfToolsStruct item) => requestTools.add(item);
  void removeFromRequestTools(ArrayOfToolsStruct item) =>
      requestTools.remove(item);
  void removeAtIndexFromRequestTools(int index) => requestTools.removeAt(index);
  void insertAtIndexInRequestTools(int index, ArrayOfToolsStruct item) =>
      requestTools.insert(index, item);
  void updateRequestToolsAtIndex(
          int index, Function(ArrayOfToolsStruct) updateFn) =>
      requestTools[index] = updateFn(requestTools[index]);

  int? photoNumber;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for ToolsMenu widget.
  String? toolsMenuValue;
  FormFieldController<String>? toolsMenuValueController;
  // State field(s) for TextualDetails widget.
  FocusNode? textualDetailsFocusNode;
  TextEditingController? textualDetailsController;
  String? Function(BuildContext, String?)? textualDetailsControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textualDetailsFocusNode?.dispose();
    textualDetailsController?.dispose();
  }
}