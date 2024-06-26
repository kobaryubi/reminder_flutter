import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:reminder_flutter/domain/repository/reminder_repository.dart';
import 'package:reminder_flutter/infrastructure/repository_impl/firestore_reminder_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'reminder_use_case_provider.g.dart';

@riverpod
ReminderRepository reminderRepository(ReminderRepositoryRef ref) {
  return FirestoreReminderRepositoryImpl(FirebaseFirestore.instance);
}
