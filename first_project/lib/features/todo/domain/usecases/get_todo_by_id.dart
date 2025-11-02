import 'package:first_project/features/todo/domain/entities/todo.dart';

import '../repositories/todo_repository.dart';

class GetTodoById {
  final TodoRepository repository;

  GetTodoById(this.repository);

  Future<TodoEntity> call(String id) async {
    return await repository.getTodoById(id);
  }
}
