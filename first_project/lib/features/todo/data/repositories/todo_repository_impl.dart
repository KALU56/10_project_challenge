import 'package:first_project/features/todo/data/datasources/todo_mock_api.dart';
import 'package:first_project/features/todo/data/mapper/todo_mapper.dart';
import 'package:first_project/features/todo/domain/entities/todo.dart';

import '../../domain/repositories/todo_repository.dart';


class TodoRepositoryImpl implements TodoRepository {
  final TodoMockDataSource dataSource;

  TodoRepositoryImpl(this.dataSource);

  @override
  Future<List<TodoEntity>> getTodos() async {
    final models = await dataSource.fetchTodos(); // List<TodoModel>
    return models.map((m) => m.toEntity()).toList();
  }

  @override
  Future<TodoEntity> getTodoById(String id) async {
    final model = await dataSource.fetchTodoById(id); // TodoDetailsModel
    return model.toEntity();
  }

  @override
  Future<TodoEntity> createTodo(String title) async {
    final model = await dataSource.createTodo(title); // CreateTodoModel
    return model.toEntity();
  }

  @override
  Future<TodoEntity> updateTodo(String id, {String? title, bool? done}) async {
    final model = await dataSource.updateTodo(id, title: title, done: done); // UpdateTodoModel
    return model.toEntity();
  }

  @override
  Future<TodoEntity> deleteTodo(String id) async {
    final model = await dataSource.deleteTodo(id); // DeleteTodoModel
    return model.toEntity();
  }

  @override
  Future<List<TodoEntity>> getHistory() async {
    final models = await dataSource.fetchHistory(); // List<HistoryTodoModel>
    return models.map((m) => m.toEntity()).toList();
  }

  @override
  Future<TodoEntity> recycleTodo(String id) async {
    final model = await dataSource.recycleTodo(id); // RecycleTodoModel
    return model.toEntity();
  }
}
