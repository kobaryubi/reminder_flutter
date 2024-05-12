import 'package:flutter/foundation.dart';

class ReminderViewModel extends ChangeNotifier {
  final List<String> reminders = [
    "10:00 AM - Meeting with the team",
    "12:00 PM - Lunch with John",
    "3:00 PM - Call with Jane",
  ];
}
