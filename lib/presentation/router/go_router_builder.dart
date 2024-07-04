import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reminder_flutter/presentation/router/route_paths.dart';
import 'package:reminder_flutter/presentation/screen/reminder_edit_screen.dart';
import 'package:reminder_flutter/presentation/screen/reminder_list_screen.dart';
import 'package:reminder_flutter/presentation/widget/scaffold_with_nav_bar_widget.dart';

part 'go_router_builder.g.dart';

class ErrorRoute extends GoRouteData {
  final Exception error;

  ErrorRoute({required this.error});

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page Not Found'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          child: const Text('Home'),
        ),
      ),
    );
  }
}

@TypedGoRoute<SignInRoute>(path: RoutePaths.signIn)
class SignInRoute extends GoRouteData {
  const SignInRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
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
            content:
                Text('Please check your email to verify your email address'),
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
              content:
                  Text('Please check your email to verify your email address'),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);

            return;
          }

          const ReminderListRouteData().go(context);
        }),
      ],
    );
  }
}

class ReminderBranchData extends StatefulShellBranchData {
  const ReminderBranchData();
}

class ReminderListRouteData extends GoRouteData {
  const ReminderListRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ReminderListScreen();
  }
}

class ReminderAddRouteData extends GoRouteData {
  const ReminderAddRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ReminderEditScreen();
  }
}

class ReminderEditRouteData extends GoRouteData {
  final String id;

  const ReminderEditRouteData({required this.id});

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ReminderEditScreen(id: id);
  }
}

class AccountBranchData extends StatefulShellBranchData {
  const AccountBranchData();
}

class ProfileRouteData extends GoRouteData {
  const ProfileRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: ProfileScreen(
        actions: [
          SignedOutAction(
            (context) {
              const SignInRoute().go(context);
            },
          )
        ],
      ),
    );
  }
}

@TypedStatefulShellRoute<ReminderShellRouteData>(
  branches: <TypedStatefulShellBranch<StatefulShellBranchData>>[
    TypedStatefulShellBranch<ReminderBranchData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<ReminderListRouteData>(path: RoutePaths.home),
        TypedGoRoute<ReminderAddRouteData>(path: RoutePaths.reminderAdd),
        TypedGoRoute<ReminderEditRouteData>(path: RoutePaths.reminderEdit),
      ],
    ),
    TypedStatefulShellBranch<AccountBranchData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<ProfileRouteData>(path: RoutePaths.profile),
      ],
    ),
  ],
)
class ReminderShellRouteData extends StatefulShellRouteData {
  const ReminderShellRouteData();

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    return ScaffoldWithNavBar(navigationShell: navigationShell);
  }
}
