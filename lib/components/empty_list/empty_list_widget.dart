import 'package:haulage_company/util/string_capitalize.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'empty_list_model.dart';
export 'empty_list_model.dart';

class EmptyListWidget extends StatefulWidget {
  const EmptyListWidget({super.key});

  @override
  _EmptyListWidgetState createState() => _EmptyListWidgetState();
}

class _EmptyListWidgetState extends State<EmptyListWidget> {
  late EmptyListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyListModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      primary: true,
      scrollDirection: Axis.vertical,
      children: [
        Icon(
          Icons.list,
          color: FlutterFlowTheme.of(context).secondaryText,
          size: 60.0,
        ),
        Center(
          child: Text(
            FFLocalizations.of(context).getText(
              'widgets.common.emptyList',
            ).capitalize(),
            style: FlutterFlowTheme.of(context).displaySmall,
          ),
        ),
      ],
    );
  }
}
