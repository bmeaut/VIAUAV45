part of 'counter_cubit.dart';

abstract class CounterState extends Equatable {
  const CounterState();
}

class CounterInitial extends CounterState {
  @override
  List<Object> get props => [];
}

class CounterCountState extends CounterState {
  final int count;

  const CounterCountState(this.count);

  @override
  List<Object?> get props => [count];
}
