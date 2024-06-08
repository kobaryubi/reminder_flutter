import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ReminderAddScreen extends StatefulWidget {
  const ReminderAddScreen({super.key});

  @override
  State<ReminderAddScreen> createState() => _ReminderAddScreenState();
}

class _ReminderAddScreenState extends State<ReminderAddScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Reminder'),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: 'Enter your reminder',
                  labelText: 'Reminder',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter your reminder to continue';
                  }

                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) {
                      return;
                    }

                    context.pop();
                  },
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
