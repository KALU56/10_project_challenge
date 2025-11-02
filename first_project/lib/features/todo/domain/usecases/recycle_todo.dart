import 'package:first_project/features/todo/domain/entities/todo.dart';

import '../repositories/todo_repository.dart';

class RecycleTodo {
  final TodoRepository repository;

  RecycleTodo(this.repository);

  Future<TodoEntity> call(String id) async {
    return await repository.recycleTodo(id);
  }
}
