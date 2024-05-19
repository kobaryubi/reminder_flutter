import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reminder_flutter/model/reminder_model.dart';
import 'package:reminder_flutter/view/reminder_add_view.dart';
import 'package:reminder_flutter/view/reminder_edit_view.dart';

class ReminderListView extends StatelessWidget {
  const ReminderListView({super.key});

  @override
  Widget build(BuildContext context) {
    final reminderModel = context.watch<ReminderModel>();

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
                  builder: (context) => const ReminderAddView(),
                ),
              );
            },
          )
        ],
      ),
      body: FutureBuilder(
        future: reminderModel.futureReminders,
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
                      builder: (context) => const ReminderEditView(),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
