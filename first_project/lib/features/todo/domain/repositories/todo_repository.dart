import 'package:first_project/features/todo/domain/entities/todo.dart';

abstract class TodoRepository {
  // Fetch all todos
  Future<List<TodoEntity>> getTodos();

  // Fetch single todo by ID
  Future<TodoEntity> getTodoById(String id);

  // Create todo
  Future<TodoEntity> createTodo(String title);

  // Update todo
  Future<TodoEntity> updateTodo(String id, {String? title, bool? done});

  // Delete todo
  Future<TodoEntity> deleteTodo(String id);

  // Fetch deleted history
  Future<List<TodoEntity>> getHistory();

  // Recycle a deleted todo
  Future<TodoEntity> recycleTodo(String id);
}
