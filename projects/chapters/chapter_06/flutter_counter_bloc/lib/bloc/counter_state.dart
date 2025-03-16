import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class CounterState extends Equatable {
  const CounterState();
}

class CounterInitial extends CounterState {
  const CounterInitial();

  @override
  List<Object> get props => [];
}

class CounterCountState extends CounterState {
  final int count;

  const CounterCountState(this.count);

  @override
  List<Object?> get props => [count];
}

class CounterLoadingState extends CounterState {
  final int count;

  const CounterLoadingState(this.count);

  @override
  List<Object?> get props => [count];
}

class CounterErrorEventState extends CounterState {
  final String message;

  const CounterErrorEventState(this.message);

  @override
  List<Object?> get props => [message];
}
