import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/backend/schema/structs/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'user_page_model.dart';
export 'user_page_model.dart';

class UserPageWidget extends StatefulWidget {
  const UserPageWidget({super.key});

  @override
  _UserPageWidgetState createState() => _UserPageWidgetState();
}

class _UserPageWidgetState extends State<UserPageWidget> {
  late UserPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserPageModel());
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

    return FutureBuilder<ApiCallResponse>(
      future: HaulageCompanyAPIGroup.getUserByIDCall.call(
        bearerAuth: currentAuthenticationToken,
        id: int.parse(currentUserUid),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        final userPageGetUserByIDResponse = snapshot.data!;
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
                valueOrDefault<String>(
                  (userPageGetUserByIDResponse.jsonBody != null &&
                              userPageGetUserByIDResponse.jsonBody != ''
                          ? UserDTOStruct.fromMap(
                              userPageGetUserByIDResponse.jsonBody)
                          : null)
                      ?.username,
                  'User',
                ),
                style: FlutterFlowTheme.of(context).headlineLarge,
              ),
              actions: const [],
              centerTitle: true,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        '23ga16pi' /* Name */,
                      ),
                      style: FlutterFlowTheme.of(context).labelLarge.override(
                            fontFamily: 'Readex Pro',
                            fontStyle: FontStyle.italic,
                          ),
                    ),
                    Text(
                      UserDTOStruct.fromMap(
                              userPageGetUserByIDResponse.jsonBody)
                          .name,
                      style: FlutterFlowTheme.of(context).bodyLarge,
                    ),
                    Text(
                      FFLocalizations.of(context).getText(
                        'l3suxdvh' /* Roles */,
                      ),
                      style: FlutterFlowTheme.of(context).labelLarge.override(
                            fontFamily: 'Readex Pro',
                            fontStyle: FontStyle.italic,
                          ),
                    ),
                    Builder(
                      builder: (context) {
                        final rolesList = (userPageGetUserByIDResponse
                                                .jsonBody !=
                                            null &&
                                        userPageGetUserByIDResponse.jsonBody !=
                                            ''
                                    ? UserDTOStruct.fromMap(
                                        userPageGetUserByIDResponse.jsonBody)
                                    : null)
                                ?.roles
                                .toList() ??
                            [];
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: rolesList.length,
                          itemBuilder: (context, rolesListIndex) {
                            final rolesListItem = rolesList[rolesListIndex];
                            return Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                              ),
                              child: Text(
                                rolesListItem,
                                style: FlutterFlowTheme.of(context).bodyLarge,
                              ),
                            );
                          },
                        );
                      },
                    ),
                    Text(
                      FFLocalizations.of(context).getText(
                        'h17zb47k' /* Last login */,
                      ),
                      style: FlutterFlowTheme.of(context).labelLarge.override(
                            fontFamily: 'Readex Pro',
                            fontStyle: FontStyle.italic,
                          ),
                    ),
                    Text(
                      dateTimeFormat(
                        'd/M H:mm',
                        UserDTOStruct.fromMap(
                                userPageGetUserByIDResponse.jsonBody)
                            .entryDate!,
                        locale: FFLocalizations.of(context).languageCode,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                    FFButtonWidget(
                      onPressed: () async {
                        GoRouter.of(context).prepareAuthEvent();
                        await authManager.signOut();
                        GoRouter.of(context).clearRedirectLocation();

                        context.goNamedAuth('LoginPage', context.mounted);
                      },
                      text: FFLocalizations.of(context).getText(
                        'hivvvhex' /* Log out */,
                      ),
                      options: FFButtonOptions(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 24.0, 24.0, 24.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle: FlutterFlowTheme.of(context).headlineMedium,
                        elevation: 3.0,
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ].divide(const SizedBox(height: 10.0)),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
