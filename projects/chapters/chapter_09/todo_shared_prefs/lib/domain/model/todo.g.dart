// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TodoCWProxy {
  Todo description(String description);

  Todo dueDate(DateTime dueDate);

  Todo id(int? id);

  Todo isDone(bool isDone);

  Todo priority(TodoPriority priority);

  Todo title(String title);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Todo(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Todo(...).copyWith(id: 12, name: "My name")
  /// ````
  Todo call({
    String? description,
    DateTime? dueDate,
    int? id,
    bool? isDone,
    TodoPriority? priority,
    String? title,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTodo.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTodo.copyWith.fieldName(...)`
class _$TodoCWProxyImpl implements _$TodoCWProxy {
  final Todo _value;

  const _$TodoCWProxyImpl(this._value);

  @override
  Todo description(String description) => this(description: description);

  @override
  Todo dueDate(DateTime dueDate) => this(dueDate: dueDate);

  @override
  Todo id(int? id) => this(id: id);

  @override
  Todo isDone(bool isDone) => this(isDone: isDone);

  @override
  Todo priority(TodoPriority priority) => this(priority: priority);

  @override
  Todo title(String title) => this(title: title);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Todo(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Todo(...).copyWith(id: 12, name: "My name")
  /// ````
  Todo call({
    Object? description = const $CopyWithPlaceholder(),
    Object? dueDate = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? isDone = const $CopyWithPlaceholder(),
    Object? priority = const $CopyWithPlaceholder(),
    Object? title = const $CopyWithPlaceholder(),
  }) {
    return Todo(
      description:
          description == const $CopyWithPlaceholder() || description == null
              ? _value.description
              // ignore: cast_nullable_to_non_nullable
              : description as String,
      dueDate: dueDate == const $CopyWithPlaceholder() || dueDate == null
          ? _value.dueDate
          // ignore: cast_nullable_to_non_nullable
          : dueDate as DateTime,
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int?,
      isDone: isDone == const $CopyWithPlaceholder() || isDone == null
          ? _value.isDone
          // ignore: cast_nullable_to_non_nullable
          : isDone as bool,
      priority: priority == const $CopyWithPlaceholder() || priority == null
          ? _value.priority
          // ignore: cast_nullable_to_non_nullable
          : priority as TodoPriority,
      title: title == const $CopyWithPlaceholder() || title == null
          ? _value.title
          // ignore: cast_nullable_to_non_nullable
          : title as String,
    );
  }
}

extension $TodoCopyWith on Todo {
  /// Returns a callable class that can be used as follows: `instanceOfclass Todo.name.copyWith(...)` or like so:`instanceOfclass Todo.name.copyWith.fieldName(...)`.
  _$TodoCWProxy get copyWith => _$TodoCWProxyImpl(this);
}
