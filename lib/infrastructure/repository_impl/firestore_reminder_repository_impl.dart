import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:reminder_flutter/domain/entity/reminder_entity.dart';
import 'package:reminder_flutter/domain/repository/reminder_repository.dart';
import 'package:reminder_flutter/infrastructure/mapper/reminder_mapper.dart';

class FirestoreReminderRepositoryImpl implements ReminderRepository {
  final FirebaseFirestore firestore;
  static const _remindersCollection = "reminders";

  FirestoreReminderRepositoryImpl(this.firestore);

  @override
  Future<List<ReminderEntity>> getReminders() async {
    return [];
  }

  @override
  Future<void> addReminder(ReminderEntity reminderEntity) async {
    final reminderMap = ReminderMapper.toDto(reminderEntity).toMap();
    reminderMap.remove('id');

    await firestore.collection(_remindersCollection).add(reminderMap);
  }
}
