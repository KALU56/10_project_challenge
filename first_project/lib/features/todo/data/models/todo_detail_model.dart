class TodoDetailDto {
  final String todoId;
  final String taskName;
  final bool isCompleted;
  final String timestamp;

  TodoDetailDto({
    required this.todoId,
    required this.taskName,
    required this.isCompleted,
    required this.timestamp,
  });

  factory TodoDetailDto.fromJson(Map<String, dynamic> json) => TodoDetailDto(
        todoId: json['todo_id'],
        taskName: json['task_name'],
        isCompleted: json['is_completed'],
        timestamp: json['timestamp'],
      );

}
