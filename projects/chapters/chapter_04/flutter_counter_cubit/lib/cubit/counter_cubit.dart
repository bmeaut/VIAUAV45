import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial());

  void incrementCount(){
    var currentState = state;
    if (currentState is CounterInitial){
      emit(CounterCountState(0));
    } else if (currentState is CounterCountState){
      var currentCount = currentState.count;
      emit(CounterCountState(currentCount + 1));
    }
  }
}
