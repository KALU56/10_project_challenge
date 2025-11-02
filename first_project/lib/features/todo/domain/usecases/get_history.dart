import 'package:first_project/features/todo/domain/entities/todo.dart';

import '../repositories/todo_repository.dart';

class GetHistory {
  final TodoRepository repository;

  GetHistory(this.repository);

  Future<List<TodoEntity>> call() async {
    return await repository.getHistory();
  }
}
