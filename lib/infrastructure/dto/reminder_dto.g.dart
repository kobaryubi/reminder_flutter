// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminder_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReminderDtoImpl _$$ReminderDtoImplFromJson(Map<String, dynamic> json) =>
    _$ReminderDtoImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      remindAt: const DateTimeConverter().fromJson(json['remindAt'] as String),
    );

Map<String, dynamic> _$$ReminderDtoImplToJson(_$ReminderDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'remindAt': const DateTimeConverter().toJson(instance.remindAt),
    };
