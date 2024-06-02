import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:reminder_flutter/domain/entity/reminder_entity.dart';
import 'package:reminder_flutter/domain/repository/reminder_repository.dart';

class FirestoreReminderRepositoryImpl implements ReminderRepository {
  final FirebaseFirestore firestore;

  FirestoreReminderRepositoryImpl(this.firestore);

  @override
  Future<List<ReminderEntity>> getReminders() async {
    return [];
  }
}
