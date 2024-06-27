import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:reminder_flutter/application/use_case/reminder/delete_reminder_use_case.dart';
import 'package:reminder_flutter/application/use_case/reminder/get_reminder_use_case.dart';
import 'package:reminder_flutter/application/use_case/reminder/get_reminder_list_use_case.dart';
import 'package:reminder_flutter/application/use_case/reminder/update_reminder_use_case.dart';
import 'package:reminder_flutter/domain/repository/reminder_repository.dart';
import 'package:reminder_flutter/infrastructure/repository_impl/firestore_reminder_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'reminder_use_case_provider.g.dart';

@riverpod
ReminderRepository reminderRepository(ReminderRepositoryRef ref) {
  return FirestoreReminderRepositoryImpl(FirebaseFirestore.instance);
}

@riverpod
GetReminderListUseCase getReminderListUseCase(GetReminderListUseCaseRef ref) {
  return GetReminderListUseCase(
    reminderRepository: ref.read(reminderRepositoryProvider),
  );
}

@riverpod
GetReminderUseCase getReminderUseCase(GetReminderUseCaseRef ref) {
  return GetReminderUseCase(
    reminderRepository: ref.read(reminderRepositoryProvider),
  );
}

@riverpod
DeleteReminderUseCase deleteReminderUseCase(DeleteReminderUseCaseRef ref) {
  return DeleteReminderUseCase(
    reminderRepository: ref.read(reminderRepositoryProvider),
  );
}

@riverpod
UpdateReminderUseCase updateReminderUseCase(UpdateReminderUseCaseRef ref) {
  return UpdateReminderUseCase(
    reminderRepository: ref.read(reminderRepositoryProvider),
  );
}
