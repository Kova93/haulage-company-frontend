import 'package:format/format.dart';
import 'package:haulage_company/util/show_error_snack_bar.dart';
import 'package:haulage_company/util/string_capitalize.dart';

import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'vehicle_form_model.dart';
export 'vehicle_form_model.dart';

class VehicleFormWidget extends StatefulWidget {
  const VehicleFormWidget({
    super.key,
    required this.isExisting,
    this.vehicleJSON,
    this.locationID,
  });

  final bool? isExisting;
  final dynamic vehicleJSON;
  final int? locationID;

  @override
  _VehicleFormWidgetState createState() => _VehicleFormWidgetState();
}

class _VehicleFormWidgetState extends State<VehicleFormWidget> {
  late VehicleFormModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VehicleFormModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.vehicle = widget.vehicleJSON != null && widget.vehicleJSON != ''
          ? VehicleDTOStruct.fromMap(widget.vehicleJSON)
          : null;
      setState(() {
        _model.licensePlateFieldController?.text = _model.vehicle?.licensePlate ?? '';
      });
      setState(() {
        _model.sizeFieldController?.text = _model.vehicle?.size.toString() ?? '';
      });
      setState(() {
        _model.weightFieldController?.text =
            _model.vehicle?.maxWeight.toString() ?? '';
      });
    });

    _model.licensePlateFieldController ??= TextEditingController();
    _model.licensePlateFieldFocusNode ??= FocusNode();

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
                    'entities.vehicle'
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
                      controller: _model.licensePlateFieldController,
                      focusNode: _model.licensePlateFieldFocusNode,
                      autofocus: true,
                      textInputAction: TextInputAction.next,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: FFLocalizations.of(context).getText(
                          'attributes.vehicle.licensePlate',
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
                      validator: _model.licensePlateFieldControllerValidator
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
                          'attributes.vehicle.maxWeight',
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
                    Text(
                      FFLocalizations.of(context).getText(
                        'entities.location',
                      ).capitalize(),
                      style: FlutterFlowTheme.of(context).labelLarge.override(
                            fontFamily: 'Readex Pro',
                            fontStyle: FontStyle.italic,
                          ),
                    ),
                    FutureBuilder<ApiCallResponse>(
                      future: HaulageCompanyAPIGroup.getAllLocationsCall.call(
                        bearerAuth: currentAuthenticationToken,
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          );
                        }
                        final locationDropDownGetAllLocationsResponse =
                            snapshot.data!;
                        return FlutterFlowDropDown<int>(
                          controller: _model.locationDropDownValueController ??=
                              FormFieldController<int>(
                            _model.locationDropDownValue ??=
                                widget.locationID ?? _model.vehicle?.lorrySiteID,
                          ),
                          options: (HaulageCompanyAPIGroup
                              .getAllLocationsCall
                              .rootList(
                                locationDropDownGetAllLocationsResponse
                                    .jsonBody,
                              ) as List)
                              .map((e) => (!(e ?? '').isEmpty
                                      ? LorrySiteDTOStruct.fromMap(e)
                                      : null)
                                  ?.id)
                              .withoutNulls,
                          optionLabels: (HaulageCompanyAPIGroup
                                  .getAllLocationsCall
                                  .rootList(
                            locationDropDownGetAllLocationsResponse.jsonBody,
                          ) as List)
                              .map((e) => (e != ''
                                    ? LorrySiteDTOStruct.fromMap(e)
                                    : null)
                                  ?.name)
                              .withoutNulls
                              .toList(),
                          onChanged: (val) => setState(
                              () => _model.locationDropDownValue = val),
                          textStyle: FlutterFlowTheme.of(context).bodyLarge,
                          hintText: FFLocalizations.of(context).getText(
                            'widgets.common.dropdown.hint',
                          ).format(
                              FFLocalizations.of(context).getText(
                                  'entities.location'
                              )
                          ).capitalize(),
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          elevation: 2.0,
                          borderColor: FlutterFlowTheme.of(context).alternate,
                          borderWidth: 2.0,
                          borderRadius: 8.0,
                          margin: const EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 10.0, 0.0),
                          hidesUnderline: true,
                          disabled: widget.locationID != null,
                          isSearchable: false,
                          isMultiSelect: false,
                        );
                      },
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
                            if (_model.locationDropDownValue == null) {
                              showErrorSnackBar(context, FFLocalizations.of(context).getText(
                                  'errors.validation.dropdown.empty'
                              ).format(
                                  FFLocalizations.of(context).getText(
                                      'entities.location'
                                  )
                              ).capitalize());
                              return;
                            }
                            _model.updateVehicleStruct(
                              (e) => e
                                ..licensePlate =
                                    _model.licensePlateFieldController.text
                                ..size = double.tryParse(
                                    _model.sizeFieldController.text)
                                ..maxWeight = double.tryParse(
                                    _model.weightFieldController.text)
                                ..lorrySiteID = _model.locationDropDownValue,
                            );
                            if (widget.isExisting!) {
                              _model.updateResult = await HaulageCompanyAPIGroup
                                  .updateVehicleCall
                                  .call(
                                bearerAuth: currentAuthenticationToken,
                                id: _model.vehicle?.id,
                                vehicleJsonJson: _model.vehicle?.toMap(),
                              );
                              if ((_model.updateResult?.succeeded ?? true)) {
                                context.safePop();
                              } else {
                                showErrorSnackBar(context, FFLocalizations.of(context).getText(
                                    'errors.failure.update'
                                ).format(
                                    FFLocalizations.of(context).getText(
                                        'entities.vehicle'
                                    )
                                ).capitalize());
                              }
                            } else {
                              _model.createResult = await HaulageCompanyAPIGroup
                                  .createVehicleCall
                                  .call(
                                bearerAuth: currentAuthenticationToken,
                                vehicleJsonJson: _model.vehicle?.toMap(),
                              );
                              if ((_model.createResult?.succeeded ?? true)) {
                                context.safePop();
                              } else {
                                showErrorSnackBar(context, FFLocalizations.of(context).getText(
                                    'errors.failure.create'
                                ).format(
                                    FFLocalizations.of(context).getText(
                                        'entities.vehicle'
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
