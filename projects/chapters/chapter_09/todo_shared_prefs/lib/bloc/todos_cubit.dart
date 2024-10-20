import 'package:todo_shared_prefs/data/database/data_source.dart';
import 'package:todo_shared_prefs/domain/model/todo.dart';
import 'package:todo_shared_prefs/domain/model/todo_priority.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'todos_cubit.g.dart';

class TodosCubit extends Cubit<TodosState> {
  static const HIDE_DONE_TODOS_KEY = "HIDE_DONE_TODOS";

  final DataSource _dataSource;

  TodosCubit(
    this._dataSource,
  ) : super(const Loading()) {
    getTodos();
  }

  Future<void> getTodos() async {
    _emitAllTodos();
  }

  Future<void> upsertTodo(Todo todo) async {
    await _dataSource.upsertTodo(todo);
    _emitAllTodos();
  }

  Future<void> deleteTodo(Todo todo) async {
    await _dataSource.deleteTodo(todo);
    _emitAllTodos();
  }

  Future<void> createTodo(
    String title,
    String description,
    TodoPriority priority,
    DateTime dueDate,
  ) async {
    await _dataSource.upsertTodo(
      Todo(
        title: title,
        description: description,
        priority: priority,
        dueDate: dueDate,
        isDone: false,
      ),
    );
    _emitAllTodos();
  }

  Future<void> setDoneTodoVisibility(bool doneTodosVisible) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(HIDE_DONE_TODOS_KEY, doneTodosVisible);
    _emitAllTodos();
  }

  Future<void> _emitAllTodos() async {
    final allTodos = await _dataSource.getAllTodos();
    final prefs = await SharedPreferences.getInstance();
    final hideDoneTodos = prefs.getBool(HIDE_DONE_TODOS_KEY) ?? false;
    if (!hideDoneTodos) {
      emit(
        TodosLoaded(todos: allTodos, hideDoneTodos: hideDoneTodos),
      );
    } else {
      final todos = allTodos.where((todo) => !todo.isDone).toList();
      emit(
        TodosLoaded(todos: todos, hideDoneTodos: hideDoneTodos),
      );
    }
  }
}

@immutable
abstract class TodosState {}

@immutable
class Loading implements TodosState {
  const Loading();
}

@immutable
@CopyWith()
class TodosLoaded extends Equatable implements TodosState {
  final List<Todo> todos;
  final bool hideDoneTodos;

  const TodosLoaded({
    required this.todos,
    required this.hideDoneTodos,
  });

  @override
  List<Object> get props => [
        todos,
        hideDoneTodos,
      ];
}
