import 'package:todo_app/domain/model/todo_priority.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/foundation.dart';

part 'todo.g.dart';

@immutable
@CopyWith()
class Todo {
  final int? id;
  final String title;
  final DateTime dueDate;
  final bool isDone;
  final String description;
  final TodoPriority priority;

  const Todo({
    this.id,
    required this.title,
    required this.dueDate,
    required this.isDone,
    required this.description,
    required this.priority,
  });
}
