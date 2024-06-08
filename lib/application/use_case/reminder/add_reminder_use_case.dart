import 'package:reminder_flutter/application/service/reminder_service.dart';
import 'package:reminder_flutter/domain/entity/reminder_entity.dart';

class AddReminderUseCase {
  final ReminderService _reminderService;

  AddReminderUseCase(this._reminderService);

  Future<void> call(ReminderEntity reminderEntity) async {
    return await _reminderService.addReminder(reminderEntity);
  }
}
