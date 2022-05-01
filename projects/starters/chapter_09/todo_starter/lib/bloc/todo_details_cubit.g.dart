// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_details_cubit.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TodoLoadedCWProxy {
  TodoLoaded todo(Todo todo);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TodoLoaded(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TodoLoaded(...).copyWith(id: 12, name: "My name")
  /// ````
  TodoLoaded call({
    Todo? todo,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTodoLoaded.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTodoLoaded.copyWith.fieldName(...)`
class _$TodoLoadedCWProxyImpl implements _$TodoLoadedCWProxy {
  final TodoLoaded _value;

  const _$TodoLoadedCWProxyImpl(this._value);

  @override
  TodoLoaded todo(Todo todo) => this(todo: todo);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TodoLoaded(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TodoLoaded(...).copyWith(id: 12, name: "My name")
  /// ````
  TodoLoaded call({
    Object? todo = const $CopyWithPlaceholder(),
  }) {
    return TodoLoaded(
      todo: todo == const $CopyWithPlaceholder() || todo == null
          ? _value.todo
          // ignore: cast_nullable_to_non_nullable
          : todo as Todo,
    );
  }
}

extension $TodoLoadedCopyWith on TodoLoaded {
  /// Returns a callable class that can be used as follows: `instanceOfclass TodoLoaded extends Equatable implements TodoState.name.copyWith(...)` or like so:`instanceOfclass TodoLoaded extends Equatable implements TodoState.name.copyWith.fieldName(...)`.
  _$TodoLoadedCWProxy get copyWith => _$TodoLoadedCWProxyImpl(this);
}
