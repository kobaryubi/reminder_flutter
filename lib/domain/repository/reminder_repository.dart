import 'package:reminder_flutter/domain/entity/reminder.dart';

abstract class ReminderRepository {
  Future<void> addReminder(Reminder reminder);
}
