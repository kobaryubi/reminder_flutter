import 'package:flutter/material.dart';

import '../model/reminder.dart';
import '../service/reminder_service.dart';
import 'reminder_add_screen.dart';
import 'reminder_edit_screen.dart';

class ReminderListScreen extends StatefulWidget {
  const ReminderListScreen({super.key});

  @override
  State<ReminderListScreen> createState() => _ReminderListScreenState();
}

class _ReminderListScreenState extends State<ReminderListScreen> {
  final ReminderService _reminderService = ReminderService();
  late Future<List<Reminder>> futureReminders;

  @override
  void initState() {
    super.initState();
    futureReminders = _reminderService.fetchReminders();
  }

  @override
  Widget build(BuildContext context) {
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
        body: FutureBuilder<List<Reminder>>(
          future: futureReminders,
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
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ReminderEditScreen(),
                      ),
                    );
                  },
                );
              },
            );
          },
        ));
  }
}
