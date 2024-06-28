import 'package:reminder_flutter/domain/entity/reminder_entity.dart';
import 'package:reminder_flutter/presentation/provider/reminder_use_case_provider.dart';
import 'package:reminder_flutter/presentation/provider/user_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'reminder_provider.g.dart';

@riverpod
class Reminder extends _$Reminder {
  @override
  Future<ReminderEntity> build({required String id}) async {
    final uid = ref.read(userProvider)?.uid;
    if (uid == null) {
      throw Exception('User is not signed in');
    }

    return await ref.read(getReminderUseCaseProvider)(
      uid: uid,
      id: id,
    );
  }

  Future<void> addReminder({
    required ReminderEntity reminderEntity,
  }) async {
    final uid = ref.read(userProvider)?.uid;
    if (uid == null) {
      throw Exception('User is not signed in');
    }

    await ref.read(addReminderUseCaseProvider)(
      uid: uid,
      reminderEntity: reminderEntity,
    );
  }

  Future<void> updateReminder({
    required ReminderEntity reminderEntity,
  }) async {
    final uid = ref.read(userProvider)?.uid;
    if (uid == null) {
      throw Exception('User is not signed in');
    }

    await ref.read(updateReminderUseCaseProvider)(
      uid: uid,
      reminderEntity: reminderEntity,
    );
  }
}
