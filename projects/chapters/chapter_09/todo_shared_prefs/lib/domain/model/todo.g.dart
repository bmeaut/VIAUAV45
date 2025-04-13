// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TodoCWProxy {
  Todo id(int? id);

  Todo title(String title);

  Todo dueDate(DateTime dueDate);

  Todo isDone(bool isDone);

  Todo description(String description);

  Todo priority(TodoPriority priority);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Todo(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Todo(...).copyWith(id: 12, name: "My name")
  /// ````
  Todo call({
    int? id,
    String title,
    DateTime dueDate,
    bool isDone,
    String description,
    TodoPriority priority,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTodo.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTodo.copyWith.fieldName(...)`
class _$TodoCWProxyImpl implements _$TodoCWProxy {
  const _$TodoCWProxyImpl(this._value);

  final Todo _value;

  @override
  Todo id(int? id) => this(id: id);

  @override
  Todo title(String title) => this(title: title);

  @override
  Todo dueDate(DateTime dueDate) => this(dueDate: dueDate);

  @override
  Todo isDone(bool isDone) => this(isDone: isDone);

  @override
  Todo description(String description) => this(description: description);

  @override
  Todo priority(TodoPriority priority) => this(priority: priority);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Todo(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Todo(...).copyWith(id: 12, name: "My name")
  /// ````
  Todo call({
    Object? id = const $CopyWithPlaceholder(),
    Object? title = const $CopyWithPlaceholder(),
    Object? dueDate = const $CopyWithPlaceholder(),
    Object? isDone = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? priority = const $CopyWithPlaceholder(),
  }) {
    return Todo(
      id:
          id == const $CopyWithPlaceholder()
              ? _value.id
              // ignore: cast_nullable_to_non_nullable
              : id as int?,
      title:
          title == const $CopyWithPlaceholder()
              ? _value.title
              // ignore: cast_nullable_to_non_nullable
              : title as String,
      dueDate:
          dueDate == const $CopyWithPlaceholder()
              ? _value.dueDate
              // ignore: cast_nullable_to_non_nullable
              : dueDate as DateTime,
      isDone:
          isDone == const $CopyWithPlaceholder()
              ? _value.isDone
              // ignore: cast_nullable_to_non_nullable
              : isDone as bool,
      description:
          description == const $CopyWithPlaceholder()
              ? _value.description
              // ignore: cast_nullable_to_non_nullable
              : description as String,
      priority:
          priority == const $CopyWithPlaceholder()
              ? _value.priority
              // ignore: cast_nullable_to_non_nullable
              : priority as TodoPriority,
    );
  }
}

extension $TodoCopyWith on Todo {
  /// Returns a callable class that can be used as follows: `instanceOfTodo.copyWith(...)` or like so:`instanceOfTodo.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TodoCWProxy get copyWith => _$TodoCWProxyImpl(this);
}
