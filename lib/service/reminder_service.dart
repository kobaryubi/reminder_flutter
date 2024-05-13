import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/reminder.dart';

class ReminderService {
  Future<List<Reminder>> fetchReminders() async {
    final url = Uri.parse('http://localhost:8080/reminders');
    final response = await http.get(url);
    if (response.statusCode != 200) {
      throw Exception('Failed to load reminders');
    }

    final Map<String, dynamic> parsed = jsonDecode(response.body);
    return (parsed['reminders'] as List<dynamic>)
        .map<Reminder>((json) => Reminder.fromJson(json))
        .toList();
  }
}
