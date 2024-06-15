import 'package:reminder_flutter/domain/repository/reminder_repository.dart';

class DeleteReminderUseCase {
  final ReminderRepository reminderRepository;

  DeleteReminderUseCase({required this.reminderRepository});

  Future<void> call({
    required String uid,
    required String id,
  }) async {
    return await reminderRepository.deleteReminder(
      uid: uid,
      id: id,
    );
  }
}
