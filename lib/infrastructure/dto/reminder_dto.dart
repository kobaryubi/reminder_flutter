import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reminder_flutter/infrastructure/converter/date_time_converter.dart';

part 'reminder_dto.freezed.dart';
part 'reminder_dto.g.dart';

@freezed
class ReminderDto with _$ReminderDto {
  const ReminderDto._();

  const factory ReminderDto({
    required String id,
    required String title,
    @DateTimeConverter() required DateTime remindAt,
  }) = _ReminderDto;

  factory ReminderDto.fromJson(Map<String, Object?> json) =>
      _$ReminderDtoFromJson(json);

  factory ReminderDto.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();

    return ReminderDto(
      id: snapshot.id,
      title: data?['title'],
      remindAt: DateTime.parse(data?['remindAt']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'remindAt': remindAt.toIso8601String(),
    };
  }

  Map<String, dynamic> toFirestore() {
    return {
      'title': title,
      'remindAt': remindAt.toIso8601String(),
    };
  }
}
