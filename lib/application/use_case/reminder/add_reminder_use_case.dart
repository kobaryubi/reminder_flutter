import 'package:reminder_flutter/domain/entity/reminder_entity.dart';
import 'package:reminder_flutter/domain/repository/reminder_repository.dart';

class AddReminderUseCase {
  final ReminderRepository reminderRepository;

  AddReminderUseCase({required this.reminderRepository});

  Future<void> call({
    required String uid,
    required ReminderEntity reminderEntity,
  }) async {
    return await reminderRepository.addReminder(
      uid: uid,
      reminderEntity: reminderEntity,
    );
  }
}
