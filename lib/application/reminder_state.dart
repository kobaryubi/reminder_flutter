import 'package:flutter/material.dart';
import 'package:reminder_flutter/model/reminder.dart';

class ReminderState extends ChangeNotifier {
  late Future<List<Reminder>> _futureReminders;
  Future<List<Reminder>> get futureReminders => _futureReminders;

  ReminderState() {
    fetchReminders();
  }

  Future<void> fetchReminders() async {
    _futureReminders = Reminder.fetch();
    notifyListeners();
  }
}
