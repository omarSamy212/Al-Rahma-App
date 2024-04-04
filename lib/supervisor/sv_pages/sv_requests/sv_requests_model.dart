import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'sv_requests_widget.dart' show SvRequestsWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SvRequestsModel extends FlutterFlowModel<SvRequestsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for age widget.
  FocusNode? ageFocusNode1;
  TextEditingController? ageController1;
  String? Function(BuildContext, String?)? ageController1Validator;
  String? _ageController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'klg1bd61' /* Please enter an age for the pa... */,
      );
    }

    return null;
  }

  // State field(s) for age widget.
  FocusNode? ageFocusNode2;
  TextEditingController? ageController2;
  String? Function(BuildContext, String?)? ageController2Validator;
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionController;
  String? Function(BuildContext, String?)? descriptionControllerValidator;

  @override
  void initState(BuildContext context) {
    ageController1Validator = _ageController1Validator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    ageFocusNode1?.dispose();
    ageController1?.dispose();

    ageFocusNode2?.dispose();
    ageController2?.dispose();

    descriptionFocusNode?.dispose();
    descriptionController?.dispose();
  }
}
