import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'missingtools_form_widget.dart' show MissingtoolsFormWidget;
import 'package:flutter/material.dart';
import 'package:record/record.dart';

class MissingtoolsFormModel extends FlutterFlowModel<MissingtoolsFormWidget> {
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
  // State field(s) for QunatityMissing widget.
  int? qunatityMissingValue;
  // State field(s) for TextualDetails widget.
  FocusNode? textualDetailsFocusNode;
  TextEditingController? textualDetailsController;
  String? Function(BuildContext, String?)? textualDetailsControllerValidator;
  AudioRecorder? audioRecorder;
  String? playComplainRecord;
  FFUploadedFile recordedFileBytes =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isDataUploading2 = false;
  List<FFUploadedFile> uploadedLocalFiles2 = [];
  List<String> uploadedFileUrls2 = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textualDetailsFocusNode?.dispose();
    textualDetailsController?.dispose();
  }
}
