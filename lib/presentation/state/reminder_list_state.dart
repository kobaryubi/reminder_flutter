import 'package:flutter/material.dart';
import 'package:reminder_flutter/application/usecase/reminder/get_reminders_usecase.dart';
import 'package:reminder_flutter/domain/entity/reminder_entity.dart';

class ReminderState extends ChangeNotifier {
  final GetRemindersUseCase _getRemindersUseCase;

  late Future<List<ReminderEntity>> _futureReminders;
  Future<List<ReminderEntity>> get futureReminders => _futureReminders;

  ReminderState(this._getRemindersUseCase) {
    _getReminders();
  }

  Future<void> _getReminders() async {
    _futureReminders = _getRemindersUseCase();
    notifyListeners();
  }
}
