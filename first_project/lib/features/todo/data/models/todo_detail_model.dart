class TodoDetailsModel {
  final String todoId;
  final String taskName;
  final bool isCompleted;
  final DateTime timestamp;

  TodoDetailsModel({
    required this.todoId,
    required this.taskName,
    required this.isCompleted,
    required this.timestamp,
  });

  factory TodoDetailsModel.fromMap(Map<String, dynamic> map) {
    return TodoDetailsModel(
      todoId: map['todo_id'],
      taskName: map['task_name'],
      isCompleted: map['is_completed'],
      timestamp: DateTime.parse(map['timestamp']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'todo_id': todoId,
      'task_name': taskName,
      'is_completed': isCompleted,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}
