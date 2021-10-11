part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {}

class SearchUpdateNameEvent extends SearchEvent{
  final String filterName;

  SearchUpdateNameEvent(this.filterName);
}
