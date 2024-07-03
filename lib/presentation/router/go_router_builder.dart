import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reminder_flutter/presentation/router/route_paths.dart';

part 'go_router_builder.g.dart';

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

          context.go(RoutePaths.home);
        }),
      ],
    );
  }
}
