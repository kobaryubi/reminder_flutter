import 'dart:convert';
import 'package:http/http.dart' as http;

class Reminder {
  final int id;
  final String title;

  const Reminder({
    required this.id,
    required this.title,
  });

  factory Reminder.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': int id,
        'title': String title,
      } =>
        Reminder(
          id: id,
          title: title,
        ),
      _ => throw const FormatException('Failed to load reminder.'),
    };
  }

  static Future<List<Reminder>> fetch() async {
    final url = Uri.parse('http://localhost:8080/reminders');
    final response = await http.get(url);
    if (response.statusCode != 200) {
      throw Exception('Failed to load reminders');
    }

    Map<String, dynamic> data = jsonDecode(response.body);
    List<dynamic> remindersJson = data['reminders'];
    return remindersJson.map((json) => Reminder.fromJson(json)).toList();
  }
}
