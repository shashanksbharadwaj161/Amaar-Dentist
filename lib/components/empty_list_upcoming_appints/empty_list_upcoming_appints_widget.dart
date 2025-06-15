import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'empty_list_upcoming_appints_model.dart';
export 'empty_list_upcoming_appints_model.dart';

class EmptyListUpcomingAppintsWidget extends StatefulWidget {
  const EmptyListUpcomingAppintsWidget({super.key});

  @override
  State<EmptyListUpcomingAppintsWidget> createState() =>
      _EmptyListUpcomingAppintsWidgetState();
}

class _EmptyListUpcomingAppintsWidgetState
    extends State<EmptyListUpcomingAppintsWidget> {
  late EmptyListUpcomingAppintsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyListUpcomingAppintsModel());

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
          FaIcon(
            FontAwesomeIcons.bookMedical,
            color: FlutterFlowTheme.of(context).secondaryText,
            size: 30.0,
          ),
          Text(
            FFLocalizations.of(context).getText(
              'o4csr363' /* No appointments yet! */,
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
        ].divide(SizedBox(height: 10.0)),
      ),
    );
  }
}
