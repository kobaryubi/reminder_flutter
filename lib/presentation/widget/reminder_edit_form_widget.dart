import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:reminder_flutter/domain/entity/reminder_entity.dart';
import 'package:reminder_flutter/presentation/mixin/reminder_mixin.dart';
import 'package:reminder_flutter/presentation/provider/reminder_list_provider.dart';
import 'package:reminder_flutter/presentation/provider/reminder_provider.dart';

class ReminderEditFormWidget extends StatefulHookConsumerWidget {
  final ReminderEntity reminderEntity;

  const ReminderEditFormWidget({super.key, required this.reminderEntity});

  @override
  ReminderEditFormWidgetState createState() => ReminderEditFormWidgetState();
}

class ReminderEditFormWidgetState extends ConsumerState<ReminderEditFormWidget>
    with ReminderMixin {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TextEditingController _titleController =
      TextEditingController(text: widget.reminderEntity.title);

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final remindAt = useState(widget.reminderEntity.remindAt);
    final isSubmitButtonDisabled = useState(false);

    final pickNotificationDate = useCallback((BuildContext context) async {
      final now = DateTime.now();
      final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: remindAt.value.isBefore(now) ? now : remindAt.value,
        firstDate: now,
        lastDate: now.add(const Duration(days: 365)),
      );

      if (pickedDate == null || pickedDate == remindAt.value) {
        return;
      }

      if (!context.mounted) {
        return;
      }

      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(remindAt.value),
      );

      if (pickedTime == null) {
        remindAt.value = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          remindAt.value.hour,
          remindAt.value.minute,
        );

        return;
      }

      remindAt.value = DateTime(
        pickedDate.year,
        pickedDate.month,
        pickedDate.day,
        pickedTime.hour,
        pickedTime.minute,
      );
    }, [remindAt.value]);

    useEffect(() {
      isSubmitButtonDisabled.value = DateTime.now().isAfter(remindAt.value);
      return;
    }, [remindAt.value]);

    return Form(
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
                Expanded(
                  child: Text(
                    DateFormat('yyyy-MM-dd HH:mm').format(remindAt.value),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: () => pickNotificationDate(context),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: isSubmitButtonDisabled.value
                  ? null
                  : () async {
                      if (!_formKey.currentState!.validate()) {
                        return;
                      }

                      final reminderEntity = widget.reminderEntity.id.isEmpty
                          ? ReminderEntity(
                              id: '',
                              title: _titleController.text,
                              remindAt: remindAt.value,
                            )
                          : ReminderEntity(
                              id: widget.reminderEntity.id,
                              title: _titleController.text,
                              remindAt: remindAt.value,
                            );

                      widget.reminderEntity.id.isEmpty
                          ? await ref
                              .read(reminderProvider(id: '').notifier)
                              .addReminder(
                                reminderEntity: reminderEntity,
                              )
                          : await ref
                              .read(
                                  reminderProvider(id: widget.reminderEntity.id)
                                      .notifier)
                              .updateReminder(
                                reminderEntity: reminderEntity,
                              );

                      scheduleLocalNotification(reminderEntity: reminderEntity);

                      ref.invalidate(reminderListProvider);

                      _titleController.clear();

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
    );
  }
}
