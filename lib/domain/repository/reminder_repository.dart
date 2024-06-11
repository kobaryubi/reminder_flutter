import 'dart:async';

import 'package:reminder_flutter/domain/entity/reminder_entity.dart';

abstract class ReminderRepository {
  Future<ReminderEntity> getReminder({
    required String uid,
    required String id,
  });
  Future<List<ReminderEntity>> getReminders({
    required String uid,
  });
  Future<void> addReminder({
    required String uid,
    required ReminderEntity reminderEntity,
  });
  Future<void> updateReminder({
    required String uid,
    required ReminderEntity reminderEntity,
  });
}
