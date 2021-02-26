part of 'counter_bloc.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();
}

class CounterIncrementEvent extends CounterEvent {
  @override
  List<Object?> get props => [];
}

class CounterInitialLoadEvent extends CounterEvent{
  @override
  List<Object?> get props => [];
}
