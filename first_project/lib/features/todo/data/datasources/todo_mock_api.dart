import 'package:first_project/features/todo/data/models/todo_create_model.dart';
import 'package:first_project/features/todo/data/models/todo_delete_model.dart';
import 'package:first_project/features/todo/data/models/todo_detail_model.dart';
import 'package:first_project/features/todo/data/models/todo_history_model.dart';
import 'package:first_project/features/todo/data/models/todo_recycle_model.dart';
import 'package:first_project/features/todo/data/models/todo_update_model.dart';

import '../models/todo_model.dart';


class TodoMockDataSource {
  // In-memory storage for active todos
  final List<Map<String, dynamic>> _todos = [
    {
      "id": "1",
      "title": "Buy milk",
      "done": false,
      "created_at": "2025-11-01T08:00:00Z"
    },
    {
      "id": "2",
      "title": "Walk dog",
      "done": true,
      "created_at": "2025-11-01T09:00:00Z"
    },
  ];

  // In-memory storage for deleted todos (history)
  final List<Map<String, dynamic>> _history = [];

  // 🔹 Fetch all todos
  Future<List<TodoModel>> fetchTodos() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _todos.map((e) => TodoModel.fromMap(e)).toList();
  }

  // 🔹 Fetch todo by ID
  Future<TodoDetailsModel> fetchTodoById(String id) async {
    await Future.delayed(const Duration(milliseconds: 500));
    final todo = _todos.firstWhere((t) => t['id'] == id);
    final map = {
      "todo_id": todo['id'],
      "task_name": todo['title'],
      "is_completed": todo['done'],
      "timestamp": todo['created_at'],
    };
    return TodoDetailsModel.fromMap(map);
  }

  // 🔹 Create new todo
  Future<CreateTodoModel> createTodo(String title) async {
    final newTodo = {
      "id": (_todos.length + 1).toString(),
      "title": title,
      "done": false,
      "created_at": DateTime.now().toIso8601String(),
    };
    _todos.add(newTodo);
    return CreateTodoModel.fromMap(newTodo);
  }

  // 🔹 Update todo
  Future<UpdateTodoModel> updateTodo(String id, {String? title, bool? done}) async {
    final index = _todos.indexWhere((t) => t['id'] == id);
    if (index == -1) throw Exception("Todo not found");
    if (title != null) _todos[index]['title'] = title;
    if (done != null) _todos[index]['done'] = done;
    _todos[index]['updated_at'] = DateTime.now().toIso8601String();
    return UpdateTodoModel.fromMap(_todos[index]);
  }

  // 🔹 Delete todo
  Future<DeleteTodoModel> deleteTodo(String id) async {
    final index = _todos.indexWhere((t) => t['id'] == id);
    if (index == -1) throw Exception("Todo not found");
    final deleted = _todos.removeAt(index);
    _history.add(deleted);
    final map = {
      "status": "success",
      "deleted_id": deleted['id'],
    };
    return DeleteTodoModel.fromMap(map);
  }

  // 🔹 Fetch history (deleted todos)
  Future<List<HistoryTodoModel>> fetchHistory() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _history
        .map((t) => HistoryTodoModel.fromMap({
              "uid": t['id'],
              "title": t['title'],
              "completed": t['done'],
              "date": t['created_at'],
            }))
        .toList();
  }

  // 🔹 Recycle (restore deleted todo)
  Future<RecycleTodoModel> recycleTodo(String id) async {
    final index = _history.indexWhere((t) => t['id'] == id);
    if (index == -1) throw Exception("Todo not found in history");
    final restored = _history.removeAt(index);
    _todos.add(restored);
    final map = {
      "id": restored['id'],
      "title": restored['title'],
      "done": restored['done'],
      "restored_at": DateTime.now().toIso8601String(),
    };
    return RecycleTodoModel.fromMap(map);
  }
}
