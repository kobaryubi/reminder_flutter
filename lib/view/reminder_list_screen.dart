import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/reminder_model.dart';
import 'reminder_add.dart';
import 'reminder_edit.dart';

class ReminderListScreen extends StatelessWidget {
  const ReminderListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final reminderModel = context.watch<ReminderModel>();
    final reminders = reminderModel.reminders;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Reminders'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Add a reminder',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ReminderAddScreen(),
                ),
              );
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: reminders.length,
        itemBuilder: (context, index) {
          return ListTile(
              leading: const Icon(Icons.alarm),
              title: Text(reminders[index]),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ReminderEditScreen(),
                  ),
                );
              });
        },
      ),
    );
  }
}
