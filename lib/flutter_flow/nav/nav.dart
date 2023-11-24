import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '/index.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  bool showSplashImage = true;

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) => const HomePageWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => const HomePageWidget(),
        ),
        FFRoute(
          name: 'HomePage',
          path: '/homePage',
          builder: (context, params) => const HomePageWidget(),
        ),
        FFRoute(
          name: 'LocationsListPage',
          path: '/locationsListPage',
          builder: (context, params) => const LocationsListPageWidget(),
        ),
        FFRoute(
          name: 'VehiclesListPage',
          path: '/vehiclesListPage',
          builder: (context, params) => const VehiclesListPageWidget(),
        ),
        FFRoute(
          name: 'ShopsListPage',
          path: '/shopsListPage',
          builder: (context, params) => const ShopsListPageWidget(),
        ),
        FFRoute(
          name: 'GoodsListPage',
          path: '/goodsListPage',
          builder: (context, params) => const GoodsListPageWidget(),
        ),
        FFRoute(
          name: 'SettingsPage',
          path: '/settingsPage',
          builder: (context, params) => const SettingsPageWidget(),
        ),
        FFRoute(
          name: 'GoodForm',
          path: '/goodForm',
          builder: (context, params) => GoodFormWidget(
            isExisting: params.getParam('isExisting', ParamType.bool),
            goodJSON: params.getParam('goodJSON', ParamType.JSON),
            lorrySiteID: params.getParam('lorrySiteID', ParamType.int),
          ),
        ),
        FFRoute(
          name: 'LocationForm',
          path: '/locationForm',
          builder: (context, params) => LocationFormWidget(
            isExisting: params.getParam('isExisting', ParamType.bool),
            locationJSON: params.getParam('locationJSON', ParamType.JSON),
          ),
        ),
        FFRoute(
          name: 'ShopForm',
          path: '/shopForm',
          builder: (context, params) => ShopFormWidget(
            isExisting: params.getParam('isExisting', ParamType.bool),
            shopJSON: params.getParam('shopJSON', ParamType.JSON),
          ),
        ),
        FFRoute(
          name: 'VehicleForm',
          path: '/vehicleForm',
          builder: (context, params) => VehicleFormWidget(
            isExisting: params.getParam('isExisting', ParamType.bool),
            vehicleJSON: params.getParam('vehicleJSON', ParamType.JSON),
            locationID: params.getParam('locationID', ParamType.int),
          ),
        ),
        FFRoute(
          name: 'LocationDetails',
          path: '/locationDetails',
          builder: (context, params) => LocationDetailsWidget(
            locationJSON: params.getParam('locationJSON', ParamType.JSON),
          ),
        ),
        FFRoute(
          name: 'OrdersListPage',
          path: '/ordersListPage',
          builder: (context, params) => const OrdersListPageWidget(),
        ),
        FFRoute(
          name: 'OrderForm',
          path: '/orderForm',
          builder: (context, params) => OrderFormWidget(
            isExisting: params.getParam('isExisting', ParamType.bool),
            getOrderJSON: params.getParam('getOrderJSON', ParamType.JSON),
          ),
        ),
        FFRoute(
          name: 'TransportForm',
          path: '/transportForm',
          builder: (context, params) => TransportFormWidget(
            isExisting: params.getParam('isExisting', ParamType.bool),
          ),
        ),
        FFRoute(
          name: 'TransportsListPage',
          path: '/transportsListPage',
          builder: (context, params) => const TransportsListPageWidget(),
        ),
        FFRoute(
          name: 'login',
          path: '/login',
          builder: (context, params) => const LoginWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder: PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).transitionsBuilder,
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => const TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouter.of(context).location;
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}
