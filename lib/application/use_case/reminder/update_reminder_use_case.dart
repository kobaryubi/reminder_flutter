import 'package:reminder_flutter/domain/entity/reminder_entity.dart';
import 'package:reminder_flutter/domain/repository/reminder_repository.dart';

class UpdateReminderUseCase {
  final ReminderRepository reminderRepository;

  UpdateReminderUseCase({required this.reminderRepository});

  Future<void> call({
    required String uid,
    required ReminderEntity reminderEntity,
  }) async {
    return await reminderRepository.updateReminder(
      uid: uid,
      reminderEntity: reminderEntity,
    );
  }
}
