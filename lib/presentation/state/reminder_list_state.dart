import 'package:flutter/material.dart';
import 'package:reminder_flutter/application/use_case/reminder/get_reminders_use_case.dart';
import 'package:reminder_flutter/domain/entity/reminder_entity.dart';

class ReminderListState extends ChangeNotifier {
  final GetRemindersUseCase _getRemindersUseCase;

  late Future<List<ReminderEntity>> _futureReminderList;
  Future<List<ReminderEntity>> get futureReminderList => _futureReminderList;

  ReminderListState(this._getRemindersUseCase) {
    _getReminders();
  }

  Future<void> _getReminders() async {
    _futureReminderList = _getRemindersUseCase();
    notifyListeners();
  }
}
