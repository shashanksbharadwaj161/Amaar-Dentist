import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'explore_doctors_widget.dart' show ExploreDoctorsWidget;
import 'package:flutter/material.dart';

class ExploreDoctorsModel extends FlutterFlowModel<ExploreDoctorsWidget> {
  ///  Local state fields for this page.

  String? searchFilter;

  ///  State fields for stateful widgets in this page.

  // State field(s) for inputSearch widget.
  FocusNode? inputSearchFocusNode;
  TextEditingController? inputSearchTextController;
  String? Function(BuildContext, String?)? inputSearchTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    inputSearchFocusNode?.dispose();
    inputSearchTextController?.dispose();
  }
}
