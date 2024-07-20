import 'package:flutter/material.dart';
import 'package:reminder_flutter/presentation/provider/reminder_provider.dart';
import 'package:reminder_flutter/presentation/widget/reminder_edit_form_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ReminderEditScreen extends HookConsumerWidget {
  final String id;

  const ReminderEditScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reminderAsyncValue = ref.watch(reminderProvider(id: id));

    return Scaffold(
      appBar: AppBar(
        title: Text(id.isEmpty ? 'Add Reminder' : 'Edit Reminder'),
      ),
      body: reminderAsyncValue.when(
        data: (reminderEntity) =>
            ReminderEditFormWidget(reminderEntity: reminderEntity),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stackTrace) => Text('$error'),
      ),
    );
  }
}
