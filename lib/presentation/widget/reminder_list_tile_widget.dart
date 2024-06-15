import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:reminder_flutter/domain/entity/reminder_entity.dart';

class ReminderListTileWidget extends StatelessWidget {
  final ReminderEntity reminderEntity;

  const ReminderListTileWidget({super.key, required this.reminderEntity});

  @override
  Widget build(BuildContext context) {
    final String formattedRemindAt =
        DateFormat('yyyy-MM-dd HH:mm').format(reminderEntity.remindAt);

    return ListTile(
      leading: const Icon(Icons.alarm),
      title: Text(reminderEntity.title),
      subtitle: Text(formattedRemindAt),
      onTap: () => context.push('/${reminderEntity.id}'),
    );
  }
}
