// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_todo_cubit.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CreateTodoStateCWProxy {
  CreateTodoState todo(Todo todo);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CreateTodoState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CreateTodoState(...).copyWith(id: 12, name: "My name")
  /// ````
  CreateTodoState call({
    Todo? todo,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCreateTodoState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCreateTodoState.copyWith.fieldName(...)`
class _$CreateTodoStateCWProxyImpl implements _$CreateTodoStateCWProxy {
  final CreateTodoState _value;

  const _$CreateTodoStateCWProxyImpl(this._value);

  @override
  CreateTodoState todo(Todo todo) => this(todo: todo);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CreateTodoState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CreateTodoState(...).copyWith(id: 12, name: "My name")
  /// ````
  CreateTodoState call({
    Object? todo = const $CopyWithPlaceholder(),
  }) {
    return CreateTodoState(
      todo: todo == const $CopyWithPlaceholder() || todo == null
          ? _value.todo
          // ignore: cast_nullable_to_non_nullable
          : todo as Todo,
    );
  }
}

extension $CreateTodoStateCopyWith on CreateTodoState {
  /// Returns a callable class that can be used as follows: `instanceOfclass CreateTodoState extends Equatable.name.copyWith(...)` or like so:`instanceOfclass CreateTodoState extends Equatable.name.copyWith.fieldName(...)`.
  _$CreateTodoStateCWProxy get copyWith => _$CreateTodoStateCWProxyImpl(this);
}
