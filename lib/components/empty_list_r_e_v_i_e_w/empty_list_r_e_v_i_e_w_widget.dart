import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'empty_list_r_e_v_i_e_w_model.dart';
export 'empty_list_r_e_v_i_e_w_model.dart';

class EmptyListREVIEWWidget extends StatefulWidget {
  const EmptyListREVIEWWidget({super.key});

  @override
  State<EmptyListREVIEWWidget> createState() => _EmptyListREVIEWWidgetState();
}

class _EmptyListREVIEWWidgetState extends State<EmptyListREVIEWWidget> {
  late EmptyListREVIEWModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyListREVIEWModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.rate_review_outlined,
            color: FlutterFlowTheme.of(context).secondaryText,
            size: 30.0,
          ),
          Text(
            FFLocalizations.of(context).getText(
              'gsbtjg43' /* No reviews yet! */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: FlutterFlowTheme.of(context).headlineMediumFamily,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  fontSize: 16.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w500,
                  useGoogleFonts:
                      !FlutterFlowTheme.of(context).headlineMediumIsCustom,
                ),
          ),
        ],
      ),
    );
  }
}
