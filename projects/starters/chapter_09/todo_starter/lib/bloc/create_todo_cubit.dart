import 'package:awesome_todo_app/data/database/data_source.dart';
import 'package:awesome_todo_app/domain/model/todo.dart';
import 'package:awesome_todo_app/domain/model/todo_priority.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'create_todo_cubit.g.dart';

class CreateTodoCubit extends Cubit<CreateTodoState> {
  final DataSource _dataSource;

  CreateTodoCubit(
    this._dataSource,
  ) : super(CreateTodoState.initial());

  Future<void> submitTodo(
    String title,
    String description,
  ) async {
    await _dataSource.upsertTodo(
      state.todo.copyWith(
        title: title,
        description: description,
      ),
    );
  }

  void updateState({
    String? title,
    String? description,
    TodoPriority? priority,
    DateTime? dueDate,
  }) {
    emit(state.copyWith(
        todo: state.todo.copyWith(
      title: title,
      description: description,
      priority: priority,
      dueDate: dueDate,
    )));
  }
}

@immutable
@CopyWith()
class CreateTodoState extends Equatable {
  final Todo todo;

  const CreateTodoState({
    required this.todo,
  });

  CreateTodoState.initial()
      : todo = Todo(
          id: null,
          title: "",
          dueDate: DateTime.now(),
          isDone: false,
          description: "",
          priority: TodoPriority.NORMAL,
        );

  @override
  List<Object> get props => [
        todo,
      ];
}
