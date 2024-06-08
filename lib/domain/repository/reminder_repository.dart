import 'dart:async';

import 'package:reminder_flutter/domain/entity/reminder_entity.dart';

abstract class ReminderRepository {
  FutureOr<List<ReminderEntity>> getReminders();
  FutureOr<void> addReminder(ReminderEntity reminderEntity);
}
