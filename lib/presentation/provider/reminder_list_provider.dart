import 'package:reminder_flutter/domain/entity/reminder_entity.dart';
import 'package:reminder_flutter/presentation/provider/reminder_use_case_provider.dart';
import 'package:reminder_flutter/presentation/provider/user_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'reminder_list_provider.g.dart';

@riverpod
class ReminderList extends _$ReminderList {
  @override
  Future<List<ReminderEntity>> build() async {
    final uid = ref.read(userProvider)?.uid;
    if (uid == null) {
      throw Exception('User is not signed in');
    }

    return await ref.read(getReminderListUseCaseProvider)(
      uid: uid,
    );
  }

  Future<void> deleteReminder({
    required String id,
  }) async {
    final uid = ref.read(userProvider)?.uid;
    if (uid == null) {
      throw Exception('User is not signed in');
    }

    await ref.read(deleteReminderUseCaseProvider)(
      uid: uid,
      id: id,
    );

    ref.invalidateSelf();
  }
}
