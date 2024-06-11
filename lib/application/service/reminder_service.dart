import 'package:reminder_flutter/domain/entity/reminder_entity.dart';
import 'package:reminder_flutter/domain/repository/reminder_repository.dart';

class ReminderService {
  final ReminderRepository _reminderRepository;

  ReminderService(this._reminderRepository);

  Future<ReminderEntity> getReminder({
    required String uid,
    required String id,
  }) async {
    return await _reminderRepository.getReminder(
      uid: uid,
      id: id,
    );
  }

  Future<List<ReminderEntity>> getReminders({
    required String uid,
  }) async {
    return await _reminderRepository.getReminders(uid: uid);
  }

  Future<void> addReminder({
    required String uid,
    required ReminderEntity reminderEntity,
  }) async {
    return await _reminderRepository.addReminder(
      uid: uid,
      reminderEntity: reminderEntity,
    );
  }

  Future<void> updateReminder({
    required String uid,
    required ReminderEntity reminderEntity,
  }) async {
    return await _reminderRepository.updateReminder(
      uid: uid,
      reminderEntity: reminderEntity,
    );
  }
}
