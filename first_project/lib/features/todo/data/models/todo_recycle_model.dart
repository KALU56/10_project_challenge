class TodoRecycleDto {
  final String id;
  final String title;
  final bool done;
  final String restoredAt;

  TodoRecycleDto({
    required this.id,
    required this.title,
    required this.done,
    required this.restoredAt,
  });

  factory TodoRecycleDto.fromJson(Map<String, dynamic> json) => TodoRecycleDto(
        id: json['id'],
        title: json['title'],
        done: json['done'],
        restoredAt: json['restored_at'],
      );
}
