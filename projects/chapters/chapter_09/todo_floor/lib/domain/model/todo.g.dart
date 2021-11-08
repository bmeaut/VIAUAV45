// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

extension TodoCopyWith on Todo {
  Todo copyWith({
    String? description,
    DateTime? dueDate,
    int? id,
    bool? isDone,
    TodoPriority? priority,
    String? title,
  }) {
    return Todo(
      description: description ?? this.description,
      dueDate: dueDate ?? this.dueDate,
      id: id ?? this.id,
      isDone: isDone ?? this.isDone,
      priority: priority ?? this.priority,
      title: title ?? this.title,
    );
  }
}
