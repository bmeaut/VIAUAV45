part of 'search_bloc.dart';

@immutable
abstract class SearchState extends Equatable{}

class SearchResultListState extends SearchState {
  final List<User> users;

  SearchResultListState(this.users);

  @override
  List<Object?> get props => [users];
}

class SearchErrorEventState extends SearchState {
  final String message;

  SearchErrorEventState(this.message);

  @override
  List<Object?> get props => [message];
}
