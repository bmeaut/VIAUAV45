part of 'counter_cubit.dart';

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

class CounterLoadState extends CounterState {
  final int count;

  const CounterLoadState(this.count);

  @override
  List<Object?> get props => [count];
}

class CounterErrorEventState extends CounterState {
  final String message;

  const CounterErrorEventState(this.message);

  @override
  List<Object?> get props => [message];
}
