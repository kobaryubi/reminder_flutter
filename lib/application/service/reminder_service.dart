import 'package:reminder_flutter/domain/entity/reminder_entity.dart';
import 'package:reminder_flutter/domain/repository/reminder_repository.dart';

class ReminderService {
  final ReminderRepository _reminderRepository;

  ReminderService(this._reminderRepository);

  Future<List<ReminderEntity>> getReminders() async {
    return await _reminderRepository.getReminders();
  }

  Future<void> addReminder(ReminderEntity reminderEntity) async {
    return await _reminderRepository.addReminder(reminderEntity);
  }
}
