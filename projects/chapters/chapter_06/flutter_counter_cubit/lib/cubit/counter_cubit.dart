import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_counter_provider/remote_service.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial());

  void incrementCounter() async {
    var state = this.state;
    if (state is CounterLoadState) return;

    var currentCount = state is CounterCountState ? state.count : 0;
    emit(CounterLoadState(currentCount));
    try {
      var newCount = await remoteService.incrementCounter(currentCount);
      emit(CounterCountState(newCount));
    } catch (e) {
      emit(CounterErrorEventState(e.toString()));
      emit(CounterCountState(currentCount));
    }
  }
}
