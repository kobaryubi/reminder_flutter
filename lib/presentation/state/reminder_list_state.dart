import 'package:flutter/material.dart';
import 'package:reminder_flutter/application/use_case/reminder/delete_reminder_use_case.dart';
import 'package:reminder_flutter/application/use_case/reminder/get_reminders_use_case.dart';
import 'package:reminder_flutter/domain/entity/reminder_entity.dart';
import 'package:reminder_flutter/presentation/state/user_state.dart';

class ReminderListState extends ChangeNotifier {
  final UserState userState;
  final GetRemindersUseCase getRemindersUseCase;
  final DeleteReminderUseCase deleteReminderUseCase;

  late Future<List<ReminderEntity>> _futureReminderList;
  Future<List<ReminderEntity>> get futureReminderList => _futureReminderList;

  ReminderListState({
    required this.userState,
    required this.getRemindersUseCase,
    required this.deleteReminderUseCase,
  }) {
    getReminders();
  }

  Future<void> getReminders() async {
    final uid = userState.user?.uid;
    if (uid == null) {
      return;
    }

    _futureReminderList = getRemindersUseCase(uid: uid);
    notifyListeners();
  }

  Future<void> deleteReminder({required String id}) async {
    final uid = userState.user?.uid;
    if (uid == null) {
      return;
    }

    await deleteReminderUseCase(
      uid: uid,
      id: id,
    );
  }
}
