import 'package:reminder_flutter/domain/entity/reminder_entity.dart';
import 'package:reminder_flutter/domain/repository/reminder_repository.dart';

class GetRemindersUseCase {
  final ReminderRepository reminderRepository;

  GetRemindersUseCase({required this.reminderRepository});

  Future<List<ReminderEntity>> call({
    required String uid,
  }) async {
    return await reminderRepository.getReminders(uid: uid);
  }
}
