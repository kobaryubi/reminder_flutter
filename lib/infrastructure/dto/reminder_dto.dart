import 'package:cloud_firestore/cloud_firestore.dart';

class ReminderDto {
  final String id;
  final String title;
  final DateTime remindAt;

  const ReminderDto({
    required this.id,
    required this.title,
    required this.remindAt,
  });

  factory ReminderDto.fromJson(Map<String, dynamic> json) {
    return ReminderDto(
      id: json['id'],
      title: json['title'],
      remindAt: DateTime.parse(json['remindAt']),
    );
  }

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
