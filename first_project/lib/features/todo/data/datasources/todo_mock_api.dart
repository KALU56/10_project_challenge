class TodoMockApi {
  final List<Map<String, dynamic>> _todos = [
    {"id": "1", "title": "Buy milk", "done": false, "created_at": "2025-11-01T08:00:00Z"},
    {"id": "2", "title": "Walk dog", "done": true, "created_at": "2025-11-01T09:00:00Z"},
  ];
  final List<Map<String, dynamic>> _history = [];

  // FETCH ALL TODOS
  Future<List<Map<String, dynamic>>> fetchTodos() async {
    await Future.delayed(Duration(milliseconds: 500));
    return _todos;
  }

  // FETCH TODO BY ID
  Future<Map<String, dynamic>> fetchTodoById(String id) async {
    await Future.delayed(Duration(milliseconds: 500));
    final todo = _todos.firstWhere((t) => t['id'] == id);
    return {
      "todo_id": todo['id'],
      "task_name": todo['title'],
      "is_completed": todo['done'],
      "timestamp": todo['created_at']
    };
  }

  // CREATE TODO
  Future<Map<String, dynamic>> createTodo(String title) async {
    final newTodo = {
      "id": (_todos.length + 1).toString(),
      "title": title,
      "done": false,
      "created_at": DateTime.now().toIso8601String()
    };
    _todos.add(newTodo);
    return newTodo;
  }

  // UPDATE TODO
  Future<Map<String, dynamic>> updateTodo(String id, {String? title, bool? done}) async {
    final index = _todos.indexWhere((t) => t['id'] == id);
    if (index == -1) throw Exception("Todo not found");
    if (title != null) _todos[index]['title'] = title;
    if (done != null) _todos[index]['done'] = done;
    _todos[index]['updated_at'] = DateTime.now().toIso8601String();
    return _todos[index];
  }

  // DELETE TODO
  Future<Map<String, dynamic>> deleteTodo(String id) async {
    final index = _todos.indexWhere((t) => t['id'] == id);
    if (index == -1) throw Exception("Todo not found");
    final deleted = _todos.removeAt(index);
    _history.add(deleted);
    return {"status": "success", "deleted_id": deleted['id']};
  }

  // FETCH HISTORY (DELETED TODOS)
  Future<List<Map<String, dynamic>>> fetchHistory() async {
    await Future.delayed(Duration(milliseconds: 500));
    return _history.map((t) => {
      "uid": t['id'],
      "title": t['title'],
      "completed": t['done'],
      "date": t['created_at']
    }).toList();
  }

  // RECYCLE (RESTORE DELETED TODO)
  Future<Map<String, dynamic>> recycleTodo(String id) async {
    final index = _history.indexWhere((t) => t['id'] == id);
    if (index == -1) throw Exception("Todo not found in history");
    final restored = _history.removeAt(index);
    _todos.add(restored);
    return {
      "id": restored['id'],
      "title": restored['title'],
      "done": restored['done'],
      "restored_at": DateTime.now().toIso8601String()
    };
  }
}
