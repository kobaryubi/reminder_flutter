// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'go_router_builder.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $signInRoute,
      $reminderShellRouteData,
    ];

RouteBase get $signInRoute => GoRouteData.$route(
      path: '/sign-in',
      factory: $SignInRouteExtension._fromState,
    );

extension $SignInRouteExtension on SignInRoute {
  static SignInRoute _fromState(GoRouterState state) => const SignInRoute();

  String get location => GoRouteData.$location(
        '/sign-in',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $reminderShellRouteData => StatefulShellRouteData.$route(
      factory: $ReminderShellRouteDataExtension._fromState,
      branches: [
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/',
              factory: $ReminderListRouteDataExtension._fromState,
            ),
            GoRouteData.$route(
              path: '/reminder/add',
              factory: $ReminderAddRouteDataExtension._fromState,
            ),
            GoRouteData.$route(
              path: '/reminder/:id',
              factory: $ReminderEditRouteDataExtension._fromState,
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/profile',
              factory: $ProfileRouteDataExtension._fromState,
            ),
          ],
        ),
      ],
    );

extension $ReminderShellRouteDataExtension on ReminderShellRouteData {
  static ReminderShellRouteData _fromState(GoRouterState state) =>
      const ReminderShellRouteData();
}

extension $ReminderListRouteDataExtension on ReminderListRouteData {
  static ReminderListRouteData _fromState(GoRouterState state) =>
      const ReminderListRouteData();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ReminderAddRouteDataExtension on ReminderAddRouteData {
  static ReminderAddRouteData _fromState(GoRouterState state) =>
      const ReminderAddRouteData();

  String get location => GoRouteData.$location(
        '/reminder/add',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ReminderEditRouteDataExtension on ReminderEditRouteData {
  static ReminderEditRouteData _fromState(GoRouterState state) =>
      ReminderEditRouteData(
        id: state.pathParameters['id']!,
      );

  String get location => GoRouteData.$location(
        '/reminder/${Uri.encodeComponent(id)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ProfileRouteDataExtension on ProfileRouteData {
  static ProfileRouteData _fromState(GoRouterState state) =>
      const ProfileRouteData();

  String get location => GoRouteData.$location(
        '/profile',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
