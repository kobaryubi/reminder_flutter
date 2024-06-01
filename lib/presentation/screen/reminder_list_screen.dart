import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:reminder_flutter/presentation/state/reminder_list_state.dart';
import 'package:reminder_flutter/application/user_state.dart';

class ReminderListScreen extends StatelessWidget {
  const ReminderListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final reminderListState = context.watch<ReminderListState>();
    final userState = context.watch<UserState>();

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
      body: userState.isLoggedIn
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
                    return ListTile(
                      leading: const Icon(Icons.alarm),
                      title: Text(reminders[index].title),
                      onTap: () => context.push('/${reminders[index].id}'),
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
