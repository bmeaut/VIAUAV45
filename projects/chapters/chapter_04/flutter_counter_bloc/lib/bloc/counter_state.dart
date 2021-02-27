part of 'counter_bloc.dart';

abstract class CounterState extends Equatable {
  const CounterState();
}

class CounterInitialEmpty extends CounterState {
  @override
  List<Object> get props => [];
}

class CounterInitialLoadedState extends CounterState {
  @override
  List<Object> get props => [];
}

class CounterLoadingState extends CounterState {
  @override
  List<Object> get props => [];
}

class CounterCountState extends CounterState{
  final int count;

  const CounterCountState(this.count);

  @override
  List<Object?> get props => [count];
}
