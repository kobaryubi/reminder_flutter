class Reminder {
  final int id;
  final String title;

  const Reminder({
    required this.id,
    required this.title,
  });

  factory Reminder.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': int id,
        'title': String title,
      } =>
        Reminder(
          id: id,
          title: title,
        ),
      _ => throw const FormatException('Failed to load reminder.'),
    };
  }
}
