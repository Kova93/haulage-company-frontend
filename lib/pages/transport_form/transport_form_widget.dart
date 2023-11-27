import 'package:haulage_company/util/show_error_snack_bar.dart';

import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/add_vehicle_to_transport_dialog/add_vehicle_to_transport_dialog_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'transport_form_model.dart';
export 'transport_form_model.dart';

class TransportFormWidget extends StatefulWidget {
  const TransportFormWidget({
    super.key,
    required this.isExisting,
    this.transportOperationJSON,
  });

  final bool isExisting;
  final dynamic transportOperationJSON;

  @override
  _TransportFormWidgetState createState() => _TransportFormWidgetState();
}

class _TransportFormWidgetState extends State<TransportFormWidget> {
  late TransportFormModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TransportFormModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.transportOperation = widget.transportOperationJSON != null &&
            widget.transportOperationJSON != ''
            ? TransportOperationDTOStruct.fromMap(widget.transportOperationJSON)
            : TransportOperationDTOStruct();

        _model.datePicked ??= widget.isExisting ? _model.transportOperation?.date : null;
      });
    });
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
            widget.isExisting ? 'Edit transport' : 'Add transport',
            style: FlutterFlowTheme.of(context).headlineLarge,
          ),
          actions: const [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: FutureBuilder<ApiCallResponse>(
            future: HaulageCompanyAPIGroup.getAllOrdersCall.call(
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
              final formGetAllOrdersResponse = snapshot.data!;
              return Form(
                key: _model.formKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            'b1qnk99j' /* Date */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).labelLarge.override(
                                    fontFamily: 'Readex Pro',
                                    fontStyle: FontStyle.italic,
                                  ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            final datePickedDate = await showDatePicker(
                              context: context,
                              initialDate: getCurrentTimestamp,
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2050),
                              builder: (context, child) {
                                return wrapInMaterialDatePickerTheme(
                                  context,
                                  child!,
                                  headerBackgroundColor:
                                      FlutterFlowTheme.of(context).primary,
                                  headerForegroundColor:
                                      FlutterFlowTheme.of(context).info,
                                  headerTextStyle: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .override(
                                        fontFamily: 'Outfit',
                                        fontSize: 32.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                  pickerBackgroundColor:
                                      FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                  pickerForegroundColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  selectedDateTimeBackgroundColor:
                                      FlutterFlowTheme.of(context).primary,
                                  selectedDateTimeForegroundColor:
                                      FlutterFlowTheme.of(context).info,
                                  actionButtonForegroundColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  iconSize: 24.0,
                                );
                              },
                            );

                            if (datePickedDate != null) {
                              safeSetState(() {
                                _model.datePicked = DateTime(
                                  datePickedDate.year,
                                  datePickedDate.month,
                                  datePickedDate.day,
                                );
                              });
                            }
                            setState(() {
                              _model.updateTransportOperationStruct(
                                (e) => e..date = _model.datePicked,
                              );
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).alternate,
                                width: 2.0,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  10.0, 10.0, 10.0, 10.0),
                              child: Text(
                                dateTimeFormat(
                                  'yMMMd',
                                  _model.datePicked,
                                  locale:
                                      FFLocalizations.of(context).languageCode,
                                ),
                                style: FlutterFlowTheme.of(context).bodyLarge,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          FFLocalizations.of(context).getText(
                            '0ekth3pl' /* Order */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).labelLarge.override(
                                    fontFamily: 'Readex Pro',
                                    fontStyle: FontStyle.italic,
                                  ),
                        ),
                        FlutterFlowDropDown<int>(
                          controller: _model.orderDropDownValueController ??=
                              FormFieldController<int>(
                            _model.orderDropDownValue ??=
                                widget.isExisting ? _model.transportOperation?.orderDTO.id : null,
                          ),
                          options: (HaulageCompanyAPIGroup
                              .getAllOrdersCall
                              .rootList(
                                formGetAllOrdersResponse.jsonBody,
                              ) as List?)
                              ?.map((e) => (e != null && e != ''
                                      ? GetOrderDTOStruct.fromMap(e)
                                      : null)
                                  ?.id)
                              .withoutNulls ?? [],
                          optionLabels: (HaulageCompanyAPIGroup.getAllOrdersCall
                                  .rootList(
                                    formGetAllOrdersResponse.jsonBody,
                                  ) as List?)
                                  ?.map((e) => (e != null && e != ''
                                          ? GetOrderDTOStruct.fromMap(e)
                                          : null)
                                      ?.id.toString())
                                  .withoutNulls,
                          onChanged: (val) =>
                              setState(() => _model.orderDropDownValue = val),
                          textStyle: FlutterFlowTheme.of(context).bodyLarge,
                          hintText: FFLocalizations.of(context).getText(
                            'bxu7vwpj' /* Select order... */,
                          ),
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
                          isSearchable: false,
                          isMultiSelect: false,
                        ),
                        Text(
                          FFLocalizations.of(context).getText(
                            'au7srnr6' /* Vehicles */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).labelLarge.override(
                                    fontFamily: 'Readex Pro',
                                    fontStyle: FontStyle.italic,
                                  ),
                        ),
                        Builder(
                          builder: (context) {
                            final vehiclesList = _model
                                    .transportOperation?.usedVehicleDTOs
                                    .toList() ??
                                [];
                            return ListView.separated(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: vehiclesList.length,
                              separatorBuilder: (_, __) =>
                                  const SizedBox(height: 10.0),
                              itemBuilder: (context, vehiclesListIndex) {
                                final vehiclesListItem =
                                    vehiclesList[vehiclesListIndex];
                                return Container(
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        vehiclesListItem.licensePlate,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge,
                                      ),
                                      FlutterFlowIconButton(
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        borderRadius: 8.0,
                                        borderWidth: 1.0,
                                        buttonSize: 40.0,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .accent1,
                                        icon: Icon(
                                          Icons.delete,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 24.0,
                                        ),
                                        onPressed: () => setState(() => _model.transportOperation?.usedVehicleDTOs.removeAt(vehiclesListIndex)),
                                      ),
                                    ].divide(const SizedBox(width: 10.0)),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                        Builder(
                          builder: (context) => FutureBuilder<ApiCallResponse>(
                            future:
                                HaulageCompanyAPIGroup.getAllVehiclesCall.call(
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
                              final buttonGetAllVehiclesResponse =
                                  snapshot.data!;
                              return FFButtonWidget(
                                onPressed: () async {
                                  await showAlignedDialog(
                                    barrierColor:
                                        FlutterFlowTheme.of(context).accent4,
                                    context: context,
                                    isGlobal: true,
                                    avoidOverflow: false,
                                    targetAnchor: const AlignmentDirectional(0.0, 0.0)
                                        .resolve(Directionality.of(context)),
                                    followerAnchor: const AlignmentDirectional(
                                            0.0, 0.0)
                                        .resolve(Directionality.of(context)),
                                    builder: (dialogContext) => ScaffoldMessenger(
                                      child: Builder(
                                        builder: (dialogContext) => Scaffold(
                                          backgroundColor: Colors.transparent,
                                          body: GestureDetector(
                                            onTap: () => _model
                                                    .unfocusNode.canRequestFocus
                                                ? FocusScope.of(context)
                                                    .requestFocus(
                                                        _model.unfocusNode)
                                                : FocusScope.of(context)
                                                    .unfocus(),
                                            child:
                                                AddVehicleToTransportDialogWidget(
                                              transportParam:
                                                  _model.transportOperation!,
                                              vehicles: (HaulageCompanyAPIGroup
                                                  .getAllVehiclesCall
                                                  .rootList(
                                                    buttonGetAllVehiclesResponse
                                                        .jsonBody,
                                                  ) as List?)
                                                  ?.map((e) => e != null && e != ''
                                                      ? VehicleDTOStruct.fromMap(
                                                          e)
                                                      : null)
                                                  .withoutNulls ?? [],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ).then((value) => setState(() {}));
                                },
                                text: FFLocalizations.of(context).getText(
                                  'm0xzz2di' /* Add vehicle */,
                                ),
                                icon: Icon(
                                  Icons.add,
                                  color: FlutterFlowTheme.of(context).info,
                                  size: 20.0,
                                ),
                                options: FFButtonOptions(
                                  height: 40.0,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      12.0, 12.0, 12.0, 12.0),
                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .headlineSmall,
                                  elevation: 3.0,
                                  borderSide: const BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              );
                            },
                          ),
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
                                '1kjmf0s9' /* Cancel */,
                              ),
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
                                if (_model.datePicked == null) {
                                  showErrorSnackBar(context, 'No date picked');
                                  return;
                                }
                                if (_model.orderDropDownValue == null) {
                                  showErrorSnackBar(context, 'No order selected');
                                  return;
                                }
                                if (_model.transportOperation?.usedVehicleDTOs.isEmpty ?? true) {
                                  showErrorSnackBar(context, 'No vehicles added');
                                  return;
                                }
                                _model.updateTransportOperationStruct(
                                  (e) => e
                                    ..orderDTO = HaulageCompanyAPIGroup
                                                    .getAllOrdersCall
                                                    .rootList(
                                                      formGetAllOrdersResponse
                                                          .jsonBody,
                                                    )
                                                    .where((e) =>
                                                        (e != null && e != ''
                                                                ? GetOrderDTOStruct.fromMap(
                                                                    e)
                                                                : null)
                                                            ?.id ==
                                                        _model
                                                            .orderDropDownValue)
                                                    .toList()
                                                    .first !=
                                                null &&
                                            HaulageCompanyAPIGroup
                                                    .getAllOrdersCall
                                                    .rootList(
                                                      formGetAllOrdersResponse
                                                          .jsonBody,
                                                    )
                                                    .where((e) =>
                                                        (e != null && e != ''
                                                                ? GetOrderDTOStruct.fromMap(
                                                                    e)
                                                                : null)
                                                            ?.id ==
                                                        _model
                                                            .orderDropDownValue)
                                                    .toList()
                                                    .first !=
                                                ''
                                        ? GetOrderDTOStruct.fromMap(HaulageCompanyAPIGroup
                                            .getAllOrdersCall
                                            .rootList(
                                              formGetAllOrdersResponse.jsonBody,
                                            )
                                            .where((e) =>
                                                (e != null && e != ''
                                                        ? GetOrderDTOStruct.fromMap(e)
                                                        : null)
                                                    ?.id ==
                                                _model.orderDropDownValue)
                                            .toList()
                                            .first)
                                        : null,
                                );
                                if (widget.isExisting) {
                                  _model.updateResult =
                                      await HaulageCompanyAPIGroup
                                          .updateTransportOperationCall
                                          .call(
                                    bearerAuth: currentAuthenticationToken,
                                    id: _model.transportOperation?.id,
                                    transportJsonJson:
                                        _model.transportOperation?.toMap(),
                                  );
                                  if ((_model.updateResult?.succeeded ??
                                      true)) {
                                    context.safePop();
                                  } else {
                                    showErrorSnackBar(context, 'Failed to update transport operation');
                                  }
                                } else {
                                  _model.createResult =
                                      await HaulageCompanyAPIGroup
                                          .createTransportOperationCall
                                          .call(
                                    bearerAuth: currentAuthenticationToken,
                                    transportJsonJson:
                                        _model.transportOperation?.toMap(),
                                  );
                                  if ((_model.createResult?.succeeded ??
                                      true)) {
                                    context.safePop();
                                  } else {
                                    showErrorSnackBar(context, 'Failed to create transport operation');
                                  }
                                }

                                setState(() {});
                              },
                              text: FFLocalizations.of(context).getText(
                                '6vah3i9r' /* Confirm */,
                              ),
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
              );
            },
          ),
        ),
      ),
    );
  }
}
