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
class RecycleTodoModel {
  final String id;
  final String title;
  final bool done;
  final DateTime restoredAt;

  RecycleTodoModel({
    required this.id,
    required this.title,
    required this.done,
    required this.restoredAt,
  });

  factory RecycleTodoModel.fromMap(Map<String, dynamic> map) {
    return RecycleTodoModel(
      id: map['id'],
      title: map['title'],
      done: map['done'],
      restoredAt: DateTime.parse(map['restored_at']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'done': done,
      'restored_at': restoredAt.toIso8601String(),
    };
  }
}
