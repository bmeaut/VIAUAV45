import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_platform_channels/domain/repository/repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final Repository repository;

  HomeBloc({required this.repository}) : super(HomeStateInitial()) {
    on<HomeEventGetTemperature>(_onGetTemperature);
  }

  Future<void> _onGetTemperature(
    HomeEventGetTemperature event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeStateLoading());
    try {
      final int result = await repository.getTemperature();
      emit(HomeStateLoaded(temperature: result));
    } catch (e) {
      emit(HomeStateError());
    }
  }
}
