import 'package:reminder_flutter/application/service/reminder_service.dart';
import 'package:reminder_flutter/domain/entity/reminder.dart';

abstract class AddReminderUseCase {
  Future<void> call(Reminder reminder);
}

class AddReminder implements AddReminderUseCase {
  final ReminderService _reminderService;

  AddReminder(this._reminderService);

  @override
  Future<void> call(Reminder reminder) async {
    return await _reminderService.addReminder(reminder);
  }
}
