import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_shared_prefs/data/database/data_source.dart';
import 'package:todo_shared_prefs/domain/model/todo.dart';

part 'todo_details_cubit.g.dart';

class TodoDetailsCubit extends Cubit<TodoState> {
  final DataSource _dataSource;

  TodoDetailsCubit(this._dataSource, int id) : super(const Loading()) {
    getTodo(id);
  }

  Future<void> getTodo(int id) async {
    final todo = await _dataSource.getTodo(id);
    emit(TodoLoaded(todo: todo));
  }
}

@immutable
abstract class TodoState {}

@immutable
class Loading implements TodoState {
  const Loading();
}

@immutable
@CopyWith()
class TodoLoaded extends Equatable implements TodoState {
  final Todo todo;

  const TodoLoaded({required this.todo});

  @override
  List<Object> get props => [todo];
}
