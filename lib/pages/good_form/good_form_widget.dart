import 'package:format/format.dart';
import 'package:haulage_company/util/show_error_snack_bar.dart';
import 'package:haulage_company/util/string_capitalize.dart';

import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'good_form_model.dart';
export 'good_form_model.dart';

class GoodFormWidget extends StatefulWidget {
  const GoodFormWidget({
    super.key,
    required this.isExisting,
    this.goodJSON,
  });

  final bool? isExisting;
  final dynamic goodJSON;

  @override
  _GoodFormWidgetState createState() => _GoodFormWidgetState();
}

class _GoodFormWidgetState extends State<GoodFormWidget> {
  late GoodFormModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GoodFormModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.good = widget.goodJSON != null && widget.goodJSON != ''
          ? GoodDTOStruct.fromMap(widget.goodJSON)
          : null;
      setState(() {
        _model.nameFieldController?.text = _model.good?.name ?? '';
      });
      setState(() {
        _model.descriptionFieldController?.text = _model.good?.description ?? '';
      });
      setState(() {
        _model.sizeFieldController?.text = _model.good?.size.toString() ?? '';
      });
      setState(() {
        _model.weightFieldController?.text = _model.good?.weight.toString() ?? '';
      });
    });

    _model.nameFieldController ??= TextEditingController();
    _model.nameFieldFocusNode ??= FocusNode();

    _model.descriptionFieldController ??= TextEditingController();
    _model.descriptionFieldFocusNode ??= FocusNode();

    _model.sizeFieldController ??= TextEditingController();
    _model.sizeFieldFocusNode ??= FocusNode();

    _model.weightFieldController ??= TextEditingController();
    _model.weightFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).info,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
              FFLocalizations.of(context).getText(
                  widget.isExisting! ? 'forms.edit.title' : 'forms.add.title'
                ).format(
                  FFLocalizations.of(context).getText(
                    'entities.good'
                  )
                ).capitalize(),
            style: FlutterFlowTheme.of(context).headlineLarge,
          ),
          actions: const [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Form(
            key: _model.formKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: _model.nameFieldController,
                      focusNode: _model.nameFieldFocusNode,
                      autofocus: true,
                      textInputAction: TextInputAction.next,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: FFLocalizations.of(context).getText(
                          'attributes.common.name',
                        ).capitalize(),
                        labelStyle: FlutterFlowTheme.of(context).labelLarge,
                        hintStyle: FlutterFlowTheme.of(context).labelMedium,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).alternate,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primary,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        filled: true,
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      style: FlutterFlowTheme.of(context).bodyLarge,
                      validator: _model.nameFieldControllerValidator
                          .asValidator(context),
                    ),
                    TextFormField(
                      controller: _model.descriptionFieldController,
                      focusNode: _model.descriptionFieldFocusNode,
                      autofocus: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: FFLocalizations.of(context).getText(
                          'attributes.good.description',
                        ).capitalize(),
                        labelStyle: FlutterFlowTheme.of(context).labelLarge,
                        hintStyle: FlutterFlowTheme.of(context).labelMedium,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).alternate,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primary,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        filled: true,
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      style: FlutterFlowTheme.of(context).bodyLarge,
                      keyboardType: TextInputType.multiline,
                      validator: _model.descriptionFieldControllerValidator
                          .asValidator(context),
                    ),
                    TextFormField(
                      controller: _model.sizeFieldController,
                      focusNode: _model.sizeFieldFocusNode,
                      autofocus: true,
                      textInputAction: TextInputAction.next,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: FFLocalizations.of(context).getText(
                          'attributes.common.size',
                        ).capitalize(),
                        labelStyle: FlutterFlowTheme.of(context).labelLarge,
                        hintStyle: FlutterFlowTheme.of(context).labelMedium,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).alternate,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primary,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        filled: true,
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      style: FlutterFlowTheme.of(context).bodyLarge,
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      validator: _model.sizeFieldControllerValidator
                          .asValidator(context),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp('(\\d|\\.)'))
                      ],
                    ),
                    TextFormField(
                      controller: _model.weightFieldController,
                      focusNode: _model.weightFieldFocusNode,
                      autofocus: true,
                      textInputAction: TextInputAction.next,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: FFLocalizations.of(context).getText(
                          'attributes.good.weight',
                        ).capitalize(),
                        labelStyle: FlutterFlowTheme.of(context).labelLarge,
                        hintStyle: FlutterFlowTheme.of(context).labelMedium,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).alternate,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primary,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        filled: true,
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      style: FlutterFlowTheme.of(context).bodyLarge,
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      validator: _model.weightFieldControllerValidator
                          .asValidator(context),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp('(\\d|\\.)'))
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FFButtonWidget(
                          onPressed: () async {
                            context.safePop();
                          },
                          text: FFLocalizations.of(context).getText(
                            'widgets.common.cancel',
                          ).capitalize(),
                          options: FFButtonOptions(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 24.0, 24.0, 24.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle:
                                FlutterFlowTheme.of(context).headlineMedium,
                            elevation: 3.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            if (_model.formKey.currentState == null ||
                                !_model.formKey.currentState!.validate()) {
                              return;
                            }
                            _model.updateGoodStruct(
                              (e) => e
                                ..name = _model.nameFieldController.text
                                ..description =
                                    _model.descriptionFieldController.text
                                ..size = double.tryParse(
                                    _model.sizeFieldController.text)
                                ..weight = double.tryParse(
                                    _model.weightFieldController.text),
                            );
                            if (widget.isExisting!) {
                              _model.updateResult = await HaulageCompanyAPIGroup
                                  .updateGoodCall
                                  .call(
                                bearerAuth: currentAuthenticationToken,
                                id: _model.good?.id,
                                goodJsonJson: _model.good?.toMap(),
                              );
                              if ((_model.updateResult?.succeeded ?? true)) {
                                context.safePop();
                              } else {
                                showErrorSnackBar(context, FFLocalizations.of(context).getText(
                                  'errors.failure.update'
                                ).format(
                                  FFLocalizations.of(context).getText(
                                    'entities.good'
                                  )
                                ).capitalize());
                              }
                            } else {
                              _model.createResult = await HaulageCompanyAPIGroup
                                  .createGoodCall
                                  .call(
                                bearerAuth: currentAuthenticationToken,
                                goodJsonJson: _model.good?.toMap(),
                              );
                              if ((_model.createResult?.succeeded ?? true)) {
                                context.safePop();
                              } else {
                                showErrorSnackBar(context, FFLocalizations.of(context).getText(
                                    'errors.failure.create'
                                ).format(
                                    FFLocalizations.of(context).getText(
                                        'entities.good'
                                    )
                                ).capitalize());
                              }
                            }

                            setState(() {});
                          },
                          text: FFLocalizations.of(context).getText(
                            'widgets.common.confirm',
                          ).capitalize(),
                          options: FFButtonOptions(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 24.0, 24.0, 24.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle:
                                FlutterFlowTheme.of(context).headlineMedium,
                            elevation: 3.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ].divide(const SizedBox(width: 10.0)),
                    ),
                  ].divide(const SizedBox(height: 10.0)),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
