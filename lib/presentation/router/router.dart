import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reminder_flutter/presentation/router/route_paths.dart';
import 'package:reminder_flutter/presentation/screen/reminder_edit_screen.dart';
import 'package:reminder_flutter/presentation/screen/reminder_list_screen.dart';
import 'package:reminder_flutter/presentation/widget/scaffold_with_nav_bar_widget.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: RoutePaths.home,
  routes: <RouteBase>[
    GoRoute(
      path: RoutePaths.signIn,
      builder: (BuildContext context, GoRouterState state) {
        return SignInScreen(
          actions: [
            AuthStateChangeAction<UserCreated>(
                (BuildContext context, UserCreated state) async {
              final user = state.credential.user;
              if (user == null || user.emailVerified) {
                return;
              }

              await user.sendEmailVerification();
              if (!context.mounted) {
                return;
              }

              const snackBar = SnackBar(
                content: Text(
                    'Please check your email to verify your email address'),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }),
            AuthStateChangeAction<SignedIn>(
                (BuildContext context, SignedIn state) async {
              final user = state.user;
              if (user == null) {
                return;
              }

              if (!user.emailVerified) {
                await user.sendEmailVerification();
                if (!context.mounted) {
                  return;
                }

                const snackBar = SnackBar(
                  content: Text(
                      'Please check your email to verify your email address'),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);

                return;
              }

              context.go(RoutePaths.home);
            }),
          ],
        );
      },
    ),
    StatefulShellRoute.indexedStack(
      builder: (
        BuildContext context,
        GoRouterState state,
        StatefulNavigationShell navigationShell,
      ) {
        return ScaffoldWithNavBar(navigationShell: navigationShell);
      },
      branches: <StatefulShellBranch>[
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: RoutePaths.home,
              builder: (BuildContext context, GoRouterState state) {
                return const ReminderListScreen();
              },
            ),
            GoRoute(
              path: RoutePaths.reminderAdd,
              builder: (BuildContext context, GoRouterState state) {
                return const ReminderEditScreen();
              },
            ),
            GoRoute(
              path: RoutePaths.reminderEdit,
              builder: (BuildContext context, GoRouterState state) {
                return ReminderEditScreen(id: state.pathParameters['id']);
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: RoutePaths.profile,
              builder: (BuildContext context, GoRouterState state) {
                return Scaffold(
                  appBar: AppBar(title: const Text('Profile')),
                  body: ProfileScreen(actions: [
                    SignedOutAction(
                      (context) {
                        context.go(RoutePaths.signIn);
                      },
                    )
                  ]),
                );
              },
            ),
          ],
        ),
      ],
    ),
  ],
);
