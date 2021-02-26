import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

part 'counter_event.dart';

part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitialEmpty());

  @override
  Stream<CounterState> mapEventToState(
    CounterEvent event,
  ) async* {
    if (event is CounterInitialLoadEvent) {
      yield* mapInitialLoadEventToState();
    } else if (event is CounterIncrementEvent) {
      yield* mapIncrementEventToState();
    }
  }

  Stream<CounterState> mapInitialLoadEventToState() async* {
    if (state is! CounterLoadingState) {
      yield CounterLoadingState();
      await Future.delayed(Duration(seconds: 1));
      yield CounterInitialLoadedState();
    }
  }

  Stream<CounterState> mapIncrementEventToState() async* {
    if (state is! CounterLoadingState) {
      var localState = state;
      var newCount = localState is CounterCountState ? localState.count + 1 : 0;
      yield CounterLoadingState();
      await Future.delayed(Duration(seconds: 1));
      yield CounterCountState(newCount);
    }
  }
}
