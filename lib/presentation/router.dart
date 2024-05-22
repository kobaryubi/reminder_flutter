import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reminder_flutter/view/reminder_add_view.dart';
import 'package:reminder_flutter/view/reminder_edit_view.dart';
import 'package:reminder_flutter/view/reminder_list_view.dart';

final router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const ReminderListView();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'add',
          builder: (BuildContext context, GoRouterState state) {
            return const ReminderAddView();
          },
        ),
        GoRoute(
          path: ':id',
          builder: (BuildContext context, GoRouterState state) {
            return const ReminderEditView();
          },
        )
      ],
    ),
  ],
);
