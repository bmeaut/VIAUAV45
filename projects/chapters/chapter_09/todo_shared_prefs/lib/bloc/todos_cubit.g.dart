// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todos_cubit.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TodosLoadedCWProxy {
  TodosLoaded todos(List<Todo> todos);

  TodosLoaded hideDoneTodos(bool hideDoneTodos);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TodosLoaded(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TodosLoaded(...).copyWith(id: 12, name: "My name")
  /// ````
  TodosLoaded call({List<Todo> todos, bool hideDoneTodos});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTodosLoaded.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTodosLoaded.copyWith.fieldName(...)`
class _$TodosLoadedCWProxyImpl implements _$TodosLoadedCWProxy {
  const _$TodosLoadedCWProxyImpl(this._value);

  final TodosLoaded _value;

  @override
  TodosLoaded todos(List<Todo> todos) => this(todos: todos);

  @override
  TodosLoaded hideDoneTodos(bool hideDoneTodos) =>
      this(hideDoneTodos: hideDoneTodos);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TodosLoaded(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TodosLoaded(...).copyWith(id: 12, name: "My name")
  /// ````
  TodosLoaded call({
    Object? todos = const $CopyWithPlaceholder(),
    Object? hideDoneTodos = const $CopyWithPlaceholder(),
  }) {
    return TodosLoaded(
      todos:
          todos == const $CopyWithPlaceholder()
              ? _value.todos
              // ignore: cast_nullable_to_non_nullable
              : todos as List<Todo>,
      hideDoneTodos:
          hideDoneTodos == const $CopyWithPlaceholder()
              ? _value.hideDoneTodos
              // ignore: cast_nullable_to_non_nullable
              : hideDoneTodos as bool,
    );
  }
}

extension $TodosLoadedCopyWith on TodosLoaded {
  /// Returns a callable class that can be used as follows: `instanceOfTodosLoaded.copyWith(...)` or like so:`instanceOfTodosLoaded.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TodosLoadedCWProxy get copyWith => _$TodosLoadedCWProxyImpl(this);
}
