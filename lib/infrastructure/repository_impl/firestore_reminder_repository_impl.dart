import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:reminder_flutter/domain/entity/reminder_entity.dart';
import 'package:reminder_flutter/domain/repository/reminder_repository.dart';
import 'package:reminder_flutter/infrastructure/dto/reminder_dto.dart';
import 'package:reminder_flutter/infrastructure/mapper/reminder_mapper.dart';

class FirestoreReminderRepositoryImpl implements ReminderRepository {
  final FirebaseFirestore firestore;
  static const _usersCollection = "users";
  static const _remindersCollection = "reminders";

  FirestoreReminderRepositoryImpl(this.firestore);

  @override
  Future<ReminderEntity> getReminder({
    required String uid,
    required String id,
  }) async {
    final docSnapshot = await firestore
        .collection(_usersCollection)
        .doc(uid)
        .collection(_remindersCollection)
        .doc(id)
        .withConverter(
          fromFirestore: ReminderDto.fromFirestore,
          toFirestore: (ReminderDto reminderDto, SetOptions? options) {
            return reminderDto.toFirestore();
          },
        )
        .get();
    final reminderDto = docSnapshot.data();

    if (reminderDto == null) {
      throw Exception('Reminder not found');
    }

    return ReminderMapper.toEntity(reminderDto);
  }

  @override
  Future<List<ReminderEntity>> getReminders({
    required String uid,
  }) async {
    final querySnapshot = await firestore
        .collection(_usersCollection)
        .doc(uid)
        .collection(_remindersCollection)
        .orderBy('remindAt', descending: false)
        .withConverter(
          fromFirestore: ReminderDto.fromFirestore,
          toFirestore: (ReminderDto reminderDto, SetOptions? options) {
            return reminderDto.toFirestore();
          },
        )
        .get();

    return querySnapshot.docs
        .map((doc) => ReminderMapper.toEntity(doc.data()))
        .toList();
  }

  @override
  Future<void> addReminder({
    required String uid,
    required ReminderEntity reminderEntity,
  }) async {
    final reminderMap = ReminderMapper.toDto(reminderEntity).toMap();
    reminderMap.remove('id');

    await firestore
        .collection(_usersCollection)
        .doc(uid)
        .collection(_remindersCollection)
        .add(reminderMap);
  }

  @override
  Future<void> updateReminder({
    required String uid,
    required ReminderEntity reminderEntity,
  }) async {
    final id = reminderEntity.id;
    final reminderMap = ReminderMapper.toDto(reminderEntity).toMap();
    reminderMap.remove('id');

    await firestore
        .collection(_usersCollection)
        .doc(uid)
        .collection(_remindersCollection)
        .doc(id)
        .update(reminderMap);
  }

  @override
  Future<void> deleteReminder({
    required String uid,
    required String id,
  }) async {
    await firestore
        .collection(_usersCollection)
        .doc(uid)
        .collection(_remindersCollection)
        .doc(id)
        .delete();
  }
}
