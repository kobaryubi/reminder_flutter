import 'package:reminder_flutter/domain/entity/reminder_entity.dart';
import 'package:reminder_flutter/domain/repository/reminder_repository.dart';

class GetReminderUseCase {
  final ReminderRepository reminderRepository;

  GetReminderUseCase({required this.reminderRepository});

  Future<ReminderEntity> call({
    required String uid,
    required String id,
  }) async {
    return await reminderRepository.getReminder(
      uid: uid,
      id: id,
    );
  }
}
