import 'package:first_project/features/todo/domain/entities/todo.dart';

import '../repositories/todo_repository.dart';

class GetTodos {
  final TodoRepository repository;

  GetTodos(this.repository);

  Future<List<TodoEntity>> call() async {
    return await repository.getTodos();
  }
}
