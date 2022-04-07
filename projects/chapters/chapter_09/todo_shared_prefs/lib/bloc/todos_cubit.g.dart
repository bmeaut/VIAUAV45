// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todos_cubit.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TodosLoadedCWProxy {
  TodosLoaded hideDoneTodos(bool hideDoneTodos);

  TodosLoaded todos(List<Todo> todos);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TodosLoaded(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TodosLoaded(...).copyWith(id: 12, name: "My name")
  /// ````
  TodosLoaded call({
    bool? hideDoneTodos,
    List<Todo>? todos,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTodosLoaded.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTodosLoaded.copyWith.fieldName(...)`
class _$TodosLoadedCWProxyImpl implements _$TodosLoadedCWProxy {
  final TodosLoaded _value;

  const _$TodosLoadedCWProxyImpl(this._value);

  @override
  TodosLoaded hideDoneTodos(bool hideDoneTodos) =>
      this(hideDoneTodos: hideDoneTodos);

  @override
  TodosLoaded todos(List<Todo> todos) => this(todos: todos);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TodosLoaded(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TodosLoaded(...).copyWith(id: 12, name: "My name")
  /// ````
  TodosLoaded call({
    Object? hideDoneTodos = const $CopyWithPlaceholder(),
    Object? todos = const $CopyWithPlaceholder(),
  }) {
    return TodosLoaded(
      hideDoneTodos:
          hideDoneTodos == const $CopyWithPlaceholder() || hideDoneTodos == null
              ? _value.hideDoneTodos
              // ignore: cast_nullable_to_non_nullable
              : hideDoneTodos as bool,
      todos: todos == const $CopyWithPlaceholder() || todos == null
          ? _value.todos
          // ignore: cast_nullable_to_non_nullable
          : todos as List<Todo>,
    );
  }
}

extension $TodosLoadedCopyWith on TodosLoaded {
  /// Returns a callable class that can be used as follows: `instanceOfclass TodosLoaded extends Equatable implements TodosState.name.copyWith(...)` or like so:`instanceOfclass TodosLoaded extends Equatable implements TodosState.name.copyWith.fieldName(...)`.
  _$TodosLoadedCWProxy get copyWith => _$TodosLoadedCWProxyImpl(this);
}
