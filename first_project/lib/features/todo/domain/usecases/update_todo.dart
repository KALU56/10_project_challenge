import 'package:first_project/features/todo/domain/entities/todo.dart';

import '../repositories/todo_repository.dart';

class UpdateTodo {
  final TodoRepository repository;

  UpdateTodo(this.repository);

  Future<TodoEntity> call(String id, {String? title, bool? done}) async {
    return await repository.updateTodo(id, title: title, done: done);
  }
}
