import '/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';

void showErrorSnackBar(BuildContext context, String errorMessage) {
  var messenger = ScaffoldMessenger.of(context);
  messenger.clearSnackBars();
  messenger.showSnackBar(
    SnackBar(
      content: Text(
        errorMessage,
        style: FlutterFlowTheme
            .of(context)
            .bodyMedium
            .override(
          fontFamily: 'Readex Pro',
          color:
          FlutterFlowTheme
              .of(context)
              .primaryText,
        ),
      ),
      duration: const Duration(milliseconds: 4000),
      backgroundColor: FlutterFlowTheme
          .of(context)
          .error,
    ),
  );
}
