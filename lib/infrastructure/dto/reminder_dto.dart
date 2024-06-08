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

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
    };
  }
}
