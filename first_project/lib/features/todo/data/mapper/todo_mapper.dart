// data/mapper/todo_mapper.dart
import 'package:first_project/features/todo/data/models/todo_detail_model.dart';
import 'package:first_project/features/todo/data/models/todo_history_model.dart';
import 'package:first_project/features/todo/data/models/todo_model.dart';
import 'package:first_project/features/todo/data/models/todo_recycle_model.dart';
import 'package:first_project/features/todo/domain/entities/todo.dart';



class TodoMapper {
  static Todo fromDto(TodoDto dto) => Todo(
        id: dto.id,
        title: dto.title,
        description: '', // no description in this API
        isDone: dto.done,
        createdAt: DateTime.parse(dto.createdAt),
      );

  static Todo fromDetailDto(TodoDetailDto dto) => Todo(
        id: dto.todoId,
        title: dto.taskName,
        description: '',
        isDone: dto.isCompleted,
        createdAt: DateTime.parse(dto.timestamp),
      );

  static Todo fromHistoryDto(TodoHistoryDto dto) => Todo(
        id: dto.uid,
        title: dto.title,
        description: '',
        isDone: dto.completed,
        createdAt: DateTime.parse(dto.date),
      );

  static Todo fromRecycleDto(TodoRecycleDto dto) => Todo(
        id: dto.id,
        title: dto.title,
        description: '',
        isDone: dto.done,
        createdAt: DateTime.parse(dto.restoredAt),
      );
}
