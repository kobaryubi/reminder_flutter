import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reminder_flutter/presentation/provider/is_logged_in_provider.dart';
import 'package:reminder_flutter/presentation/router/go_router_builder.dart';
import 'package:reminder_flutter/presentation/router/route_paths.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router_provider.g.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

@riverpod
class Router extends _$Router {
  @override
  GoRouter build() {
    final isLoggedIn = ref.watch(isLoggedInProvider);

    return GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: RoutePaths.home,
      routes: $appRoutes,
      errorBuilder: (BuildContext context, GoRouterState state) {
        return ErrorRoute(error: state.error!).build(context, state);
      },
      redirect: (BuildContext context, GoRouterState state) {
        if (!isLoggedIn) {
          return const SignInRoute().location;
        }

        return null;
      },
    );
  }
}
