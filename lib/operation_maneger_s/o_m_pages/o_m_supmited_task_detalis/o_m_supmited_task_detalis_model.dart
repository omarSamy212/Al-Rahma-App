import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'o_m_supmited_task_detalis_widget.dart' show OMSupmitedTaskDetalisWidget;
import 'package:flutter/material.dart';

class OMSupmitedTaskDetalisModel
    extends FlutterFlowModel<OMSupmitedTaskDetalisWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // State field(s) for TextualDetails widget.
  FocusNode? textualDetailsFocusNode;
  TextEditingController? textualDetailsTextController;
  String? Function(BuildContext, String?)?
      textualDetailsTextControllerValidator;
  // Stores action output result for [Custom Action - addStreetTaskToBookMark] action in IconButton widget.
  bool? bookmarkOutput;
  // Stores action output result for [Custom Action - completeStreetTaskReview] action in Button widget.
  bool? taskReview;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textualDetailsFocusNode?.dispose();
    textualDetailsTextController?.dispose();
  }
}
