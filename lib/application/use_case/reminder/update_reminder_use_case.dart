import 'package:reminder_flutter/application/service/reminder_service.dart';
import 'package:reminder_flutter/domain/entity/reminder_entity.dart';

class UpdateReminderUseCase {
  final ReminderService _reminderService;

  UpdateReminderUseCase({required ReminderService reminderService})
      : _reminderService = reminderService;

  Future<void> call({
    required String uid,
    required ReminderEntity reminderEntity,
  }) async {
    return await _reminderService.updateReminder(
      uid: uid,
      reminderEntity: reminderEntity,
    );
  }
}
