class TodoEntity {
  final String id;
  final String title;
  final bool isDone;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final DateTime? restoredAt;
  final String? status; // for delete or action status

  TodoEntity({
    required this.id,
    required this.title,
    required this.isDone,
    required this.createdAt,
    this.updatedAt,
    this.restoredAt,
    this.status,
  });
}
