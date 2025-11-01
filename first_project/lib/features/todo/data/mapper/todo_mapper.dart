import 'package:first_project/features/todo/data/models/todo_create_model.dart';
import 'package:first_project/features/todo/data/models/todo_delete_model.dart';
import 'package:first_project/features/todo/data/models/todo_detail_model.dart';
import 'package:first_project/features/todo/data/models/todo_history_model.dart';
import 'package:first_project/features/todo/data/models/todo_recycle_model.dart';
import 'package:first_project/features/todo/data/models/todo_update_model.dart';
import 'package:first_project/features/todo/domain/entities/todo.dart';

import '../../data/models/todo_model.dart';

extension TodoModelMapper on TodoModel {
  TodoEntity toEntity() => TodoEntity(
        id: id,
        title: title,
        isDone: done,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );
}

extension TodoDetailsModelMapper on TodoDetailsModel {
  TodoEntity toEntity() => TodoEntity(
        id: todoId,
        title: taskName,
        isDone: isCompleted,
        createdAt: timestamp,
      );
}

extension CreateTodoModelMapper on CreateTodoModel {
  TodoEntity toEntity() => TodoEntity(
        id: id,
        title: title,
        isDone: done,
        createdAt: createdAt,
      );
}

extension UpdateTodoModelMapper on UpdateTodoModel {
  TodoEntity toEntity() => TodoEntity(
        id: id,
        title: title,
        isDone: done,
        createdAt: DateTime.now(), // optional placeholder
        updatedAt: updatedAt,
      );
}

extension DeleteTodoModelMapper on DeleteTodoModel {
  TodoEntity toEntity() => TodoEntity(
        id: deletedId,
        title: '',
        isDone: false,
        createdAt: DateTime.now(),
        status: status,
      );
}

extension HistoryTodoModelMapper on HistoryTodoModel {
  TodoEntity toEntity() => TodoEntity(
        id: uid,
        title: title,
        isDone: completed,
        createdAt: date,
      );
}

extension RecycleTodoModelMapper on RecycleTodoModel {
  TodoEntity toEntity() => TodoEntity(
        id: id,
        title: title,
        isDone: done,
        createdAt: DateTime.now(),
        restoredAt: restoredAt,
      );
}
