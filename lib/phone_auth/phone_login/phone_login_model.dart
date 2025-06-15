import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'phone_login_widget.dart' show PhoneLoginWidget;
import 'package:flutter/material.dart';

class PhoneLoginModel extends FlutterFlowModel<PhoneLoginWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for phone widget.
  FocusNode? phoneFocusNode;
  TextEditingController? phoneTextController;
  String? Function(BuildContext, String?)? phoneTextControllerValidator;
  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  // Stores action output result for [Custom Action - signInWithPhone] action in Button widget.
  String? error;

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
  }

  @override
  void dispose() {
    phoneFocusNode?.dispose();
    phoneTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();
  }
}
