import 'package:reminder_flutter/domain/entity/reminder.dart';
import 'package:reminder_flutter/domain/repository/reminder_repository.dart';

class ReminderService {
  final ReminderRepository _reminderRepository;

  ReminderService(this._reminderRepository);

  Future<void> addReminder(Reminder reminder) async {
    return await _reminderRepository.addReminder(reminder);
  }
}
