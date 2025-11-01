class Todo {
  final String id;
  final String title;
  final String description;
  final bool isDone;
  final DateTime createdAt;

  Todo({
    required this.id,
    required this.title,
    required this.description,
    required this.isDone,
    required this.createdAt,
  });
}
