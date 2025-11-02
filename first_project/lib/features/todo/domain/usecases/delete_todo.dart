import 'package:first_project/features/todo/domain/entities/todo.dart';
import '../repositories/todo_repository.dart';

class DeleteTodo {
  final TodoRepository repository;

  DeleteTodo(this.repository);

  Future<TodoEntity> call(String id) async {
    return await repository.deleteTodo(id);
  }
}
