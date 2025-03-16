import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class CounterEvent extends Equatable {
  const CounterEvent();
}

class CounterIncrementEvent extends CounterEvent {
  const CounterIncrementEvent();

  @override
  List<Object> get props => [];
}
