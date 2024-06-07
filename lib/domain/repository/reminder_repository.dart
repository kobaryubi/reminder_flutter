import 'package:reminder_flutter/domain/entity/reminder_entity.dart';

abstract class ReminderRepository {
  Future<List<ReminderEntity>> getReminders();
  Future<void> addReminder(ReminderEntity reminderEntity);
}
