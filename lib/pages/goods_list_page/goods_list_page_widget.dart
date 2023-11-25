import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/empty_list/empty_list_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/backend/schema/structs/index.dart';
import 'dart:async';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'goods_list_page_model.dart';
export 'goods_list_page_model.dart';

class GoodsListPageWidget extends StatefulWidget {
  const GoodsListPageWidget({super.key});

  @override
  _GoodsListPageWidgetState createState() => _GoodsListPageWidgetState();
}

class _GoodsListPageWidgetState extends State<GoodsListPageWidget> {
  late GoodsListPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GoodsListPageModel());
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
              'ca6e60m4' /* Goods */,
            ),
            style: FlutterFlowTheme.of(context).headlineLarge,
          ),
          actions: const [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Align(
                alignment: const AlignmentDirectional(0.00, 0.00),
                child: FutureBuilder<ApiCallResponse>(
                  future: (_model
                          .apiRequestCompleter ??= Completer<ApiCallResponse>()
                        ..complete(HaulageCompanyAPIGroup.getAllGoodsCall.call(
                          bearerAuth: currentAuthenticationToken,
                        )))
                      .future,
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
                    final listViewGetAllGoodsResponse = snapshot.data!;
                    return Builder(
                      builder: (context) {
                        final goodsList = HaulageCompanyAPIGroup.getAllGoodsCall
                                .rootList(
                                  listViewGetAllGoodsResponse.jsonBody,
                                )
                                ?.map((e) => e != null && e != ''
                                    ? GoodDTOStruct.fromMap(e)
                                    : null)
                                .withoutNulls
                                .toList()
                                ?.toList() ??
                            [];
                        if (goodsList.isEmpty) {
                          return const Center(
                            child: EmptyListWidget(),
                          );
                        }
                        return RefreshIndicator(
                          onRefresh: () async {
                            setState(() => _model.apiRequestCompleter = null);
                            await _model.waitForApiRequestCompleted();
                          },
                          child: ListView.separated(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.vertical,
                            itemCount: goodsList.length,
                            separatorBuilder: (_, __) => const SizedBox(height: 10.0),
                            itemBuilder: (context, goodsListIndex) {
                              final goodsListItem = goodsList[goodsListIndex];
                              return Container(
                                decoration: const BoxDecoration(),
                                child: ExpandableNotifier(
                                  child: ExpandablePanel(
                                    header: Text(
                                      goodsListItem.name,
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge,
                                    ),
                                    collapsed: Container(),
                                    expanded: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'lps7u20d' /* Description */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .labelLarge
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                fontStyle: FontStyle.italic,
                                              ),
                                        ),
                                        Text(
                                          goodsListItem.description,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge,
                                        ),
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'va7bnt9b' /* Size */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .labelLarge
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                fontStyle: FontStyle.italic,
                                              ),
                                        ),
                                        Text(
                                          goodsListItem.size.toString(),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge,
                                        ),
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            '4l8ry766' /* Weight */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .labelLarge
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                fontStyle: FontStyle.italic,
                                              ),
                                        ),
                                        Text(
                                          goodsListItem.weight.toString(),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge,
                                        ),
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'pa793lkm' /* Quantity */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .labelLarge
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                fontStyle: FontStyle.italic,
                                              ),
                                        ),
                                        Text(
                                          goodsListItem.quantity.toString(),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 10.0, 10.0, 10.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              FlutterFlowIconButton(
                                                borderColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                borderRadius: 8.0,
                                                borderWidth: 1.0,
                                                buttonSize: 40.0,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .accent1,
                                                icon: Icon(
                                                  Icons.edit,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 24.0,
                                                ),
                                                onPressed: () async {
                                                  context.pushNamed(
                                                    'GoodForm',
                                                    queryParameters: {
                                                      'isExisting':
                                                          serializeParam(
                                                        true,
                                                        ParamType.bool,
                                                      ),
                                                      'goodJSON':
                                                          serializeParam(
                                                        goodsListItem.toMap(),
                                                        ParamType.JSON,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                },
                                              ),
                                              FlutterFlowIconButton(
                                                borderColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                borderRadius: 8.0,
                                                borderWidth: 1.0,
                                                buttonSize: 40.0,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .accent1,
                                                icon: Icon(
                                                  Icons.delete,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 24.0,
                                                ),
                                                onPressed: () async {
                                                  _model.deleteResult =
                                                      await HaulageCompanyAPIGroup
                                                          .deleteGoodCall
                                                          .call(
                                                    bearerAuth:
                                                        currentAuthenticationToken,
                                                    id: goodsListItem.id,
                                                  );
                                                  if ((_model.deleteResult
                                                          ?.succeeded ??
                                                      true)) {
                                                    setState(() => _model
                                                            .apiRequestCompleter =
                                                        null);
                                                    await _model
                                                        .waitForApiRequestCompleted();
                                                  } else {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'Failed to delete good',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                              ),
                                                        ),
                                                        duration: const Duration(
                                                            milliseconds: 4000),
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                      ),
                                                    );
                                                  }

                                                  setState(() {});
                                                },
                                              ),
                                            ].divide(const SizedBox(width: 10.0)),
                                          ),
                                        ),
                                      ],
                                    ),
                                    theme: ExpandableThemeData(
                                      tapHeaderToExpand: true,
                                      tapBodyToExpand: false,
                                      tapBodyToCollapse: false,
                                      headerAlignment:
                                          ExpandablePanelHeaderAlignment.center,
                                      hasIcon: true,
                                      iconColor: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(1.00, 1.00),
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                  child: FlutterFlowIconButton(
                    borderColor: FlutterFlowTheme.of(context).primary,
                    borderRadius: 8.0,
                    borderWidth: 1.0,
                    buttonSize: 40.0,
                    fillColor: FlutterFlowTheme.of(context).accent1,
                    icon: Icon(
                      Icons.add,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      context.pushNamed(
                        'GoodForm',
                        queryParameters: {
                          'isExisting': serializeParam(
                            false,
                            ParamType.bool,
                          ),
                        }.withoutNulls,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
