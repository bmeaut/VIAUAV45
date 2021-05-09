import 'package:awesome_todo_app/domain/model/todo_priority.dart';

class Todo {
  int? id;
  String title;
  DateTime dueDate;
  bool isDone;
  String description;
  TodoPriority priority;

  Todo({
    this.id,
    required this.title,
    required this.dueDate,
    required this.isDone,
    required this.description,
    required this.priority,
  });
}
