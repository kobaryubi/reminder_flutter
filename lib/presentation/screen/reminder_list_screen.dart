import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reminder_flutter/presentation/provider/reminder_list_provider.dart';
import 'package:reminder_flutter/presentation/router/route_paths.dart';
import 'package:reminder_flutter/presentation/widget/reminder_list_tile_widget.dart';

class ReminderListScreen extends HookConsumerWidget {
  const ReminderListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reminderListAsyncValue = ref.watch(reminderListProvider);

    final colorScheme =
        useMemoized(() => Theme.of(context).colorScheme, [context]);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Reminders'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Add a reminder',
            onPressed: () => context.push(RoutePaths.reminderAdd),
          )
        ],
      ),
      body: reminderListAsyncValue.when(
        data: (reminderList) {
          if (reminderList.isEmpty) {
            return const Center(
              child: Text('No reminders'),
            );
          }

          return RefreshIndicator(
            onRefresh: () => ref.refresh(reminderListProvider.future),
            child: ListView.builder(
              itemCount: reminderList.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  background: Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 16.0),
                    color: colorScheme.error,
                    child: Icon(
                      Icons.delete,
                      color: colorScheme.onError,
                    ),
                  ),
                  key: Key(reminderList[index].id),
                  direction: DismissDirection.endToStart,
                  child: ReminderListTileWidget(
                    reminderEntity: reminderList[index],
                  ),
                  onDismissed: (DismissDirection direction) async {
                    await ref
                        .read(reminderListProvider.notifier)
                        .handleReminderDismiss(
                          id: reminderList[index].id,
                        );
                  },
                );
              },
            ),
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stackTrace) => Center(
          child: Text('Error: $error'),
        ),
      ),
    );
  }
}
