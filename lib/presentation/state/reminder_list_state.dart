import 'package:flutter/material.dart';
import 'package:reminder_flutter/application/use_case/reminder/get_reminders_use_case.dart';
import 'package:reminder_flutter/domain/entity/reminder_entity.dart';
import 'package:reminder_flutter/presentation/state/user_state.dart';

class ReminderListState extends ChangeNotifier {
  final GetRemindersUseCase _getRemindersUseCase;
  final UserState _userState;

  late Future<List<ReminderEntity>> _futureReminderList;
  Future<List<ReminderEntity>> get futureReminderList => _futureReminderList;

  ReminderListState({
    required GetRemindersUseCase getRemindersUseCase,
    required UserState userState,
  })  : _getRemindersUseCase = getRemindersUseCase,
        _userState = userState {
    getReminders();
  }

  Future<void> getReminders() async {
    final uid = _userState.user?.uid;
    if (uid == null) {
      return;
    }

    _futureReminderList = _getRemindersUseCase(uid: uid);
    notifyListeners();
  }
}
