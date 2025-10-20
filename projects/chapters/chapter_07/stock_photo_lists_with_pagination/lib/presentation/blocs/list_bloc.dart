import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:stock_photo_lists_with_pagination/data/photo_data_store.dart';

import 'list_event.dart';
import 'list_state.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  final PhotoDataStore _photoDataStore;
  static const _pageSize = 20;

  ListBloc({required PhotoDataStore photoDataStore})
    : _photoDataStore = photoDataStore,
      super(const InitialListState()) {
    on<ListFetchFirstPage>(_onFetchFirstPage);
    on<ListFetchNextPage>(_onFetchNextPage);
    on<ListRefresh>(_onRefresh);
  }

  Future<PagingState<int, StockPhoto>> _fetchPage(
    int pageKey,
    PagingState<int, StockPhoto> currentPageState,
  ) async {
    final newItems = await _photoDataStore.getPhotos(pageKey, _pageSize);
    final isLastPage = newItems.length < _pageSize;

    final newPagingState = currentPageState.copyWith(
      pages: [...?currentPageState.pages, newItems],
      keys: [...?currentPageState.keys, pageKey],
      hasNextPage: !isLastPage,
      isLoading: false,
      error: null,
    );
    return newPagingState;
  }

  Future<void> _onFetchFirstPage(
    ListFetchFirstPage event,
    Emitter<ListState> emit,
  ) async {
    emit(const LoadingListState());
    try {
      const firstPageKey = 0;
      final initialPagingState = PagingState<int, StockPhoto>();
      final newPagingState = await _fetchPage(firstPageKey, initialPagingState);
      emit(LoadedListState(pagingState: newPagingState));
    } catch (error) {
      emit(ErrorListState(error: error));
    }
  }

  Future<void> _onFetchNextPage(
    ListFetchNextPage event,
    Emitter<ListState> emit,
  ) async {
    final currentState = state;
    if (currentState is! LoadedListState) return;

    final currentPagingState = currentState.pagingState;

    if (currentPagingState.isLoading || !currentPagingState.hasNextPage) return;

    final nextPageKey = (currentPagingState.keys?.last ?? -1) + 1;

    emit(
      LoadedListState(
        pagingState: currentPagingState.copyWith(isLoading: true, error: null),
      ),
    );

    try {
      final newPagingState = await _fetchPage(nextPageKey, currentPagingState);
      emit(LoadedListState(pagingState: newPagingState));
    } catch (error) {
      emit(
        LoadedListState(
          pagingState: currentPagingState.copyWith(
            isLoading: false, // Loading finished (with error)
            error: error,
          ),
        ),
      );
    }
  }

  Future<void> _onRefresh(ListRefresh event, Emitter<ListState> emit) async {
    emit(const LoadingListState());
    try {
      const firstPageKey = 0;
      final initialPagingState = PagingState<int, StockPhoto>();
      final newPagingState = await _fetchPage(firstPageKey, initialPagingState);
      emit(LoadedListState(pagingState: newPagingState));
    } catch (error) {
      emit(ErrorListState(error: error));
    }
  }
}
