import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'verify_o_t_pphone_widget.dart' show VerifyOTPphoneWidget;
import 'package:flutter/material.dart';

class VerifyOTPphoneModel extends FlutterFlowModel<VerifyOTPphoneWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  FocusNode? pinCodeFocusNode;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;
  // Stores action output result for [Custom Action - confirmOtpPhone] action in Button widget.
  bool? isVerified;

  @override
  void initState(BuildContext context) {
    pinCodeController = TextEditingController();
  }

  @override
  void dispose() {
    pinCodeFocusNode?.dispose();
    pinCodeController?.dispose();
  }
}
