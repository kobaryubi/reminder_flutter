import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
import 'package:reminder_flutter/domain/entity/reminder_entity.dart';
import 'package:reminder_flutter/main.dart';
import 'package:uuid/uuid.dart';
import 'package:timezone/timezone.dart' as tz;

mixin ReminderMixin {
  void scheduleLocalNotification({
    required ReminderEntity reminderEntity,
  }) async {
    const uuid = Uuid();
    await flutterLocalNotificationsPlugin.zonedSchedule(
      uuid.v4().hashCode,
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
