import 'package:flutter/material.dart';

class ReminderAddScreen extends StatelessWidget {
  const ReminderAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Reminder'),
      ),
      body: const Placeholder(),
    );
  }
}
