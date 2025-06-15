import '/flutter_flow/flutter_flow_util.dart';
import 'o_t_pfor_login_email_widget.dart' show OTPforLoginEmailWidget;
import 'package:flutter/material.dart';

class OTPforLoginEmailModel extends FlutterFlowModel<OTPforLoginEmailWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  FocusNode? pinCodeFocusNode;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;
  // Stores action output result for [Custom Action - confirmOtpEmail] action in Button widget.
  bool? isSuccessful;

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
