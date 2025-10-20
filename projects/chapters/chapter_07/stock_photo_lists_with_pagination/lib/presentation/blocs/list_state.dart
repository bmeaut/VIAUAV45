import 'package:equatable/equatable.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:stock_photo_lists_with_pagination/data/photo_data_store.dart';

abstract class ListState extends Equatable {
  const ListState();

  @override
  List<Object?> get props => [];
}

class InitialListState extends ListState {
  const InitialListState();
}

class LoadingListState extends ListState {
  const LoadingListState();
}

class LoadedListState extends ListState {
  final PagingState<int, StockPhoto> pagingState;

  const LoadedListState({required this.pagingState});

  @override
  List<Object?> get props => [pagingState];
}

class ErrorListState extends ListState {
  final Object error;

  const ErrorListState({required this.error});

  @override
  List<Object?> get props => [error];
}
