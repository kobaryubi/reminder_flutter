import 'package:flutter/material.dart';

class ReminderEditView extends StatelessWidget {
  const ReminderEditView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Reminder'),
      ),
      body: const Placeholder(),
    );
  }
}
