import '/flutter_flow/flutter_flow_util.dart';
import 'e_shop_widget.dart' show EShopWidget;
import 'package:flutter/material.dart';

class EShopModel extends FlutterFlowModel<EShopWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
