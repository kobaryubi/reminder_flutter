import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:reminder_flutter/domain/entity/reminder_entity.dart';

class ReminderListTileWidget extends HookConsumerWidget {
  final ReminderEntity reminderEntity;

  const ReminderListTileWidget({super.key, required this.reminderEntity});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String formattedRemindAt = useMemoized(
      () => DateFormat('yyyy-MM-dd HH:mm').format(reminderEntity.remindAt),
      [reminderEntity.remindAt],
    );
    final isPastDue = useMemoized(
        () => DateTime.now().isAfter(reminderEntity.remindAt),
        [reminderEntity.remindAt]);
    final textStyle = useMemoized(
      () {
        final colorScheme = Theme.of(context).colorScheme;

        return Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: isPastDue
                  ? colorScheme.error
                  : colorScheme.onPrimaryContainer,
            );
      },
      [context, isPastDue],
    );

    return ListTile(
      leading: Icon(
        Icons.alarm,
        color: isPastDue ? Theme.of(context).colorScheme.error : null,
      ),
      title: Text(reminderEntity.title, style: textStyle),
      subtitle: Text(formattedRemindAt, style: textStyle),
      onTap: () => context.push('/reminder/${reminderEntity.id}'),
    );
  }
}
