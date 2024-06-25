// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reminder_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReminderDto _$ReminderDtoFromJson(Map<String, dynamic> json) {
  return _ReminderDto.fromJson(json);
}

/// @nodoc
mixin _$ReminderDto {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime get remindAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReminderDtoCopyWith<ReminderDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReminderDtoCopyWith<$Res> {
  factory $ReminderDtoCopyWith(
          ReminderDto value, $Res Function(ReminderDto) then) =
      _$ReminderDtoCopyWithImpl<$Res, ReminderDto>;
  @useResult
  $Res call({String id, String title, @DateTimeConverter() DateTime remindAt});
}

/// @nodoc
class _$ReminderDtoCopyWithImpl<$Res, $Val extends ReminderDto>
    implements $ReminderDtoCopyWith<$Res> {
  _$ReminderDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? remindAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      remindAt: null == remindAt
          ? _value.remindAt
          : remindAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReminderDtoImplCopyWith<$Res>
    implements $ReminderDtoCopyWith<$Res> {
  factory _$$ReminderDtoImplCopyWith(
          _$ReminderDtoImpl value, $Res Function(_$ReminderDtoImpl) then) =
      __$$ReminderDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String title, @DateTimeConverter() DateTime remindAt});
}

/// @nodoc
class __$$ReminderDtoImplCopyWithImpl<$Res>
    extends _$ReminderDtoCopyWithImpl<$Res, _$ReminderDtoImpl>
    implements _$$ReminderDtoImplCopyWith<$Res> {
  __$$ReminderDtoImplCopyWithImpl(
      _$ReminderDtoImpl _value, $Res Function(_$ReminderDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? remindAt = null,
  }) {
    return _then(_$ReminderDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      remindAt: null == remindAt
          ? _value.remindAt
          : remindAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReminderDtoImpl implements _ReminderDto {
  const _$ReminderDtoImpl(
      {required this.id,
      required this.title,
      @DateTimeConverter() required this.remindAt});

  factory _$ReminderDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReminderDtoImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  @DateTimeConverter()
  final DateTime remindAt;

  @override
  String toString() {
    return 'ReminderDto(id: $id, title: $title, remindAt: $remindAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReminderDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.remindAt, remindAt) ||
                other.remindAt == remindAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, remindAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReminderDtoImplCopyWith<_$ReminderDtoImpl> get copyWith =>
      __$$ReminderDtoImplCopyWithImpl<_$ReminderDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReminderDtoImplToJson(
      this,
    );
  }
}

abstract class _ReminderDto implements ReminderDto {
  const factory _ReminderDto(
          {required final String id,
          required final String title,
          @DateTimeConverter() required final DateTime remindAt}) =
      _$ReminderDtoImpl;

  factory _ReminderDto.fromJson(Map<String, dynamic> json) =
      _$ReminderDtoImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  @DateTimeConverter()
  DateTime get remindAt;
  @override
  @JsonKey(ignore: true)
  _$$ReminderDtoImplCopyWith<_$ReminderDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
