import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_platform_channels/domain/repository/repository.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    @required this.repository,
  }) : super(HomeStateLoading());
  final Repository repository;

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is HomeEventGetTemperature) {
      yield* _mapLoadTemperatureToState();
    }
  }

  Stream<HomeState> _mapLoadTemperatureToState() async* {
    try {
      final int result = await repository.getTemperature();
      yield HomeStateLoaded(temperature: result);
    } catch (e) {
      yield HomeStateError();
    }
  }
}
