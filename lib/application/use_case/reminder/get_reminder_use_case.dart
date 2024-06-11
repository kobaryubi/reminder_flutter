import 'package:reminder_flutter/application/service/reminder_service.dart';
import 'package:reminder_flutter/domain/entity/reminder_entity.dart';

class GetReminderUseCase {
  final ReminderService _reminderService;

  GetReminderUseCase({required ReminderService reminderService})
      : _reminderService = reminderService;

  Future<ReminderEntity> call({
    required String uid,
    required String id,
  }) async {
    return await _reminderService.getReminder(
      uid: uid,
      id: id,
    );
  }
}
