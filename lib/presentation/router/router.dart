import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reminder_flutter/presentation/router/go_router_builder.dart';
import 'package:reminder_flutter/presentation/router/route_paths.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: RoutePaths.home,
  routes: $appRoutes,
  errorBuilder: (BuildContext context, GoRouterState state) {
    return ErrorRoute(error: state.error!).build(context, state);
  },
);
