import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:reminder_flutter/application/use_case/reminder/add_reminder_use_case.dart';
import 'package:reminder_flutter/domain/entity/reminder_entity.dart';
import 'package:reminder_flutter/presentation/state/reminder_list_state.dart';

class ReminderEditScreen extends StatefulWidget {
  const ReminderEditScreen({super.key});

  @override
  State<ReminderEditScreen> createState() => _ReminderEditScreenState();
}

class _ReminderEditScreenState extends State<ReminderEditScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  DateTime _remindAt = DateTime.now();

  void _pickNotificationDate(BuildContext context) async {
    final now = DateTime.now();
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _remindAt,
      firstDate: now,
      lastDate: now.add(const Duration(days: 365)),
    );

    if (pickedDate == null || pickedDate == _remindAt) {
      return;
    }

    if (!context.mounted) {
      return;
    }

    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(_remindAt),
    );

    if (pickedTime == null) {
      setState(() {
        _remindAt = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          _remindAt.hour,
          _remindAt.minute,
        );
      });

      return;
    }

    setState(() {
      _remindAt = DateTime(
        pickedDate.year,
        pickedDate.month,
        pickedDate.day,
        pickedTime.hour,
        pickedTime.minute,
      );
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String formattedRemindAt = DateFormat('yyyy-MM-dd HH:mm').format(_remindAt);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Reminder'),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              TextFormField(
                autofocus: true,
                controller: _titleController,
                decoration: const InputDecoration(
                  hintText: 'Enter your title',
                  labelText: 'Title',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter your title to continue';
                  }

                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              Row(
                children: [
                  Expanded(child: Text(formattedRemindAt)),
                  IconButton(
                    icon: const Icon(Icons.calendar_today),
                    onPressed: () => _pickNotificationDate(context),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () async {
                  if (!_formKey.currentState!.validate()) {
                    return;
                  }

                  final addReminderUseCase = context.read<AddReminderUseCase>();
                  final reminderListState = context.read<ReminderListState>();

                  await addReminderUseCase(ReminderEntity(
                    id: '',
                    title: _titleController.text,
                    remindAt: _remindAt,
                  ));

                  _titleController.clear();

                  await reminderListState.getReminders();

                  if (!context.mounted) {
                    return;
                  }
                  context.pop();
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
