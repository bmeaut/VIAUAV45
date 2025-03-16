import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter_bloc/bloc/counter_event.dart';

import '../remote_service.dart';
import 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    on<CounterIncrementEvent>(_handleIncrement);
  }

  Future<void> _handleIncrement(
    CounterIncrementEvent event,
    Emitter<CounterState> emit,
  ) async {
    var state = this.state;
    if (state is CounterLoadingState) return;

    var currentCount = state is CounterCountState ? state.count : 0;
    emit(CounterLoadingState(currentCount));
    try {
      var newCount = await remoteService.incrementCounter(currentCount);
      emit(CounterCountState(newCount));
    } catch (e) {
      emit(CounterErrorEventState(e.toString()));
      emit(CounterCountState(currentCount));
    }
  }
}
