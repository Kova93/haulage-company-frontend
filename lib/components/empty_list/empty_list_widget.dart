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
      padding: EdgeInsets.zero,
      scrollDirection: Axis.vertical,
      children: [
        Icon(
          Icons.list,
          color: FlutterFlowTheme.of(context).secondaryText,
          size: 60.0,
        ),
        Align(
          alignment: const AlignmentDirectional(0.00, 0.00),
          child: Text(
            FFLocalizations.of(context).getText(
              '40a1wgot' /* No entries found */,
            ),
            style: FlutterFlowTheme.of(context).displaySmall,
          ),
        ),
      ],
    );
  }
}
