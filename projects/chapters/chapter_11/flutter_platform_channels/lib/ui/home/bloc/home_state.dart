part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeStateLoading extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeStateLoaded extends HomeState {
  final int temperature;

  HomeStateLoaded({this.temperature});

  @override
  List<Object> get props => [temperature];
}

class HomeStateError extends HomeState {
  @override
  List<Object> get props => [];
}
