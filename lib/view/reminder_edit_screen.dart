import 'package:flutter/material.dart';

class ReminderEditScreen extends StatelessWidget {
  const ReminderEditScreen({super.key});

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
