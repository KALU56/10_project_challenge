class UpdateTodoModel {
  final String id;
  final String title;
  final bool done;
  final DateTime updatedAt;

  UpdateTodoModel({
    required this.id,
    required this.title,
    required this.done,
    required this.updatedAt,
  });

  factory UpdateTodoModel.fromMap(Map<String, dynamic> map) {
    return UpdateTodoModel(
      id: map['id'],
      title: map['title'],
      done: map['done'],
      updatedAt: DateTime.parse(map['updated_at']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'done': done,
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
