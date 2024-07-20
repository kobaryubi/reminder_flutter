import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
import 'package:reminder_flutter/domain/entity/reminder_entity.dart';
import 'package:reminder_flutter/main.dart';
import 'package:timezone/timezone.dart' as tz;

mixin ReminderMixin {
  void scheduleLocalNotification({
    required ReminderEntity reminderEntity,
  }) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
      reminderEntity.id.hashCode,
      reminderEntity.title,
      DateFormat('yyyy-MM-dd HH:mm').format(reminderEntity.remindAt),
      tz.TZDateTime.from(reminderEntity.remindAt, tz.local),
      const NotificationDetails(
        iOS: DarwinNotificationDetails(),
      ),
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }
}
