import 'package:reminder_flutter/domain/entity/reminder_entity.dart';
import 'package:reminder_flutter/infrastructure/dto/reminder_dto.dart';

class ReminderMapper {
  static ReminderEntity toEntity(ReminderDto dto) {
    return ReminderEntity(
      id: dto.id,
      title: dto.title,
    );
  }

  static ReminderDto toDto(ReminderEntity entity) {
    return ReminderDto(
      id: entity.id,
      title: entity.title,
    );
  }
}
