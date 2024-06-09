class ReminderEntity {
  final String id;
  final String title;
  final DateTime remindAt;

  const ReminderEntity({
    required this.id,
    required this.title,
    required this.remindAt,
  });
}
