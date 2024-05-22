import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:reminder_flutter/application/reminder_state.dart';

class ReminderListView extends StatelessWidget {
  const ReminderListView({super.key});

  @override
  Widget build(BuildContext context) {
    final reminderState = context.watch<ReminderState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Reminders'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Add a reminder',
            onPressed: () => context.go('/add'),
          )
        ],
      ),
      body: FutureBuilder(
        future: reminderState.futureReminders,
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
              return ListTile(
                leading: const Icon(Icons.alarm),
                title: Text(reminders[index].title),
                onTap: () => context.go('/${reminders[index].id}'),
              );
            },
          );
        },
      ),
    );
  }
}
