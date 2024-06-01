import 'package:reminder_flutter/application/service/reminder_service.dart';
import 'package:reminder_flutter/domain/entity/reminder_entity.dart';

class GetRemindersUseCase {
  final ReminderService _reminderService;

  GetRemindersUseCase(this._reminderService);

  Future<List<ReminderEntity>> call() async {
    return await _reminderService.getReminders();
  }
}
