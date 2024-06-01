import 'package:http/http.dart' as http;
import 'package:reminder_flutter/domain/entity/reminder.dart';
import 'package:reminder_flutter/domain/repository/reminder_repository.dart';

class RestReminderRepositoryImpl implements ReminderRepository {
  final String baseUrl;

  RestReminderRepositoryImpl(this.baseUrl);

  @override
  Future<List<Reminder>> getReminders() async {
    final url = Uri.parse('$baseUrl/reminders');
    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception('Failed to load reminders');
    }

    return [];
  }
}
