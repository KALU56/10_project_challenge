import 'package:first_project/features/todo/domain/usecases/create_todo.dart';
import 'package:first_project/features/todo/domain/usecases/delete_todo.dart';
import 'package:first_project/features/todo/domain/usecases/get_history.dart';
import 'package:first_project/features/todo/domain/usecases/get_todo_by_id.dart';
import 'package:first_project/features/todo/domain/usecases/recycle_todo.dart';
import 'package:first_project/features/todo/domain/usecases/todo.dart';
import 'package:first_project/features/todo/domain/usecases/update_todo.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:first_project/features/todo/domain/entities/todo.dart';
part 'todo_state.dart';
class TodoCubit extends Cubit<TodoState> {
  final GetTodos getTodos;
  final CreateTodo createTodo;
  final DeleteTodo deleteTodo;
  final UpdateTodo updateTodo;
  final RecycleTodo recycleTodo;
  final GetHistory getHistory;
  final GetTodoById getTodoById;

  TodoCubit({
    required this.getTodos,
    required this.createTodo,
    required this.deleteTodo,
    required this.updateTodo,
    required this.recycleTodo,
    required this.getHistory,
    required this.getTodoById,
  }) : super(TodoInitial());

  // FETCH ALL TODOS
  Future<void> loadTodos() async {
    emit(TodoLoading());
    try {
      final todos = await getTodos();
      emit(TodoLoaded(todos));
    } catch (e) {
      emit(TodoError(e.toString()));
    }
  }


  Future<void> addTodo(String title) async {
    try {
      final todo = await createTodo(title);
      final current = state is TodoLoaded ? (state as TodoLoaded).todos : [];
      emit(TodoLoaded([...current, todo]));
    } catch (e) {
      emit(TodoError(e.toString()));
    }
  }


  Future<void> removeTodo(String id) async {
    try {
      await deleteTodo(id);
      final current = state is TodoLoaded ? (state as TodoLoaded).todos : <TodoEntity>[];
      emit(TodoLoaded(current.where((t) => t.id != id).toList()));
    } catch (e) {
      emit(TodoError(e.toString()));
    }
  }


  Future<void> updateTodoItem(String id, {String? title, bool? done}) async {
    try {
      final updated = await updateTodo(id, title: title, done: done);
      if (state is TodoLoaded) {
        final current = (state as TodoLoaded).todos;
        final updatedList = current.map((t) => t.id == id ? updated : t).toList();
        emit(TodoLoaded(updatedList));
      }
    } catch (e) {
      emit(TodoError(e.toString()));
    }
  }

  // FETCH HISTORY
  Future<void> loadHistory() async {
    emit(TodoLoading());
    try {
      final history = await getHistory();
      emit(TodoLoaded(history));
    } catch (e) {
      emit(TodoError(e.toString()));
    }
  }


  Future<void> recycle(String id) async {
    try {
      final restored = await recycleTodo(id);
      if (state is TodoLoaded) {
        final current = (state as TodoLoaded).todos;
        emit(TodoLoaded([...current, restored]));
      }
    } catch (e) {
      emit(TodoError(e.toString()));
    }
  }


  Future<TodoEntity?> getTodo(String id) async {
    try {
      final todo = await getTodoById(id);
      return todo;
    } catch (e) {
      emit(TodoError(e.toString()));
      return null;
    }
  }
}
