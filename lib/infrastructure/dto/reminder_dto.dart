import 'package:cloud_firestore/cloud_firestore.dart';

class ReminderDto {
  final String id;
  final String title;

  const ReminderDto({
    required this.id,
    required this.title,
  });

  factory ReminderDto.fromJson(Map<String, dynamic> json) {
    return ReminderDto(
      id: json['id'],
      title: json['title'],
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
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
    };
  }

  Map<String, dynamic> toFirestore() {
    return {
      'title': title,
    };
  }
}
