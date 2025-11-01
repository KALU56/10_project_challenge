class CreateTodoModel {
  final String id;
  final String title;
  final bool done;
  final DateTime createdAt;

  CreateTodoModel({
    required this.id,
    required this.title,
    required this.done,
    required this.createdAt,
  });

  factory CreateTodoModel.fromMap(Map<String, dynamic> map) {
    return CreateTodoModel(
      id: map['id'],
      title: map['title'],
      done: map['done'],
      createdAt: DateTime.parse(map['created_at']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'done': done,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
