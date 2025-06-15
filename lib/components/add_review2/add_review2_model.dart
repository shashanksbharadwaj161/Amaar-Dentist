import '/flutter_flow/flutter_flow_util.dart';
import 'add_review2_widget.dart' show AddReview2Widget;
import 'package:flutter/material.dart';

class AddReview2Model extends FlutterFlowModel<AddReview2Widget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for RatingBar widget.
  double? ratingBarValue;
  // State field(s) for shortBio widget.
  FocusNode? shortBioFocusNode;
  TextEditingController? shortBioTextController;
  String? Function(BuildContext, String?)? shortBioTextControllerValidator;
  String? _shortBioTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '3vkt2c4t' /* Field is required */,
      );
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    shortBioTextControllerValidator = _shortBioTextControllerValidator;
  }

  @override
  void dispose() {
    shortBioFocusNode?.dispose();
    shortBioTextController?.dispose();
  }
}
