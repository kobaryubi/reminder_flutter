import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:reminder_flutter/domain/entity/reminder_entity.dart';
import 'package:reminder_flutter/domain/repository/reminder_repository.dart';
import 'package:reminder_flutter/infrastructure/dto/reminder_dto.dart';
import 'package:reminder_flutter/infrastructure/mapper/reminder_mapper.dart';

class RestReminderRepositoryImpl implements ReminderRepository {
  final String baseUrl;

  RestReminderRepositoryImpl(this.baseUrl);

  @override
  Future<List<ReminderEntity>> getReminders() async {
    final url = Uri.parse('$baseUrl/reminders');
    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception('Failed to load reminders');
    }

    final Map<String, dynamic> data = jsonDecode(response.body);
    final List<dynamic> jsonReminders = data['reminders'];

    return jsonReminders
        .map((json) => ReminderMapper.toEntity(ReminderDto.fromJson(json)))
        .toList();
  }
}
