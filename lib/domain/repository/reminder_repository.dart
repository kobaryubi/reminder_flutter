import 'package:reminder_flutter/domain/entity/reminder.dart';

abstract class ReminderRepository {
  Future<List<Reminder>> getReminders();
}
