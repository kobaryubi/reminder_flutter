import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reminder_flutter/presentation/provider/is_logged_in_provider.dart';
import 'package:reminder_flutter/presentation/widget/reminder_list_tile_widget.dart';

class ReminderListScreen extends HookConsumerWidget {
  const ReminderListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reminderListState = context.watch<ReminderListState>();
    final isLoggedIn = ref.watch(isLoggedInProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Reminders'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Add a reminder',
            onPressed: () => context.push('/add'),
          )
        ],
      ),
      body: isLoggedIn
          ? FutureBuilder(
              future: reminderListState.futureReminderList,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }

                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(
                    child: Text('No reminders'),
                  );
                }

                final reminders = snapshot.data!;
                return ListView.builder(
                  itemCount: reminders.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      background: Container(
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(right: 16.0),
                        color: Colors.red,
                        child: const Icon(Icons.delete, color: Colors.white),
                      ),
                      key: Key(reminders[index].id),
                      direction: DismissDirection.endToStart,
                      child: ReminderListTileWidget(
                        reminderEntity: reminders[index],
                      ),
                      onDismissed: (DismissDirection direction) async {
                        await reminderListState.deleteReminder(
                          id: reminders[index].id,
                        );
                        reminders.removeWhere(
                            (reminder) => reminder.id == reminders[index].id);

                        await reminderListState.getReminders();
                      },
                    );
                  },
                );
              },
            )
          : Center(
              child: ElevatedButton(
                onPressed: () => context.push('/sign-in'),
                child: const Text('Sign in'),
              ),
            ),
    );
  }
}
