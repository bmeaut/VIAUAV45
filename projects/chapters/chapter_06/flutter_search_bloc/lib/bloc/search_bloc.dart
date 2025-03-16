import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_search_bloc/remote_service.dart';
import 'package:rxdart/rxdart.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchResultListState(const [])) {
    on<SearchUpdateNameEvent>(
      (event, emit) async {
        try {
          debugPrint("Starting request: ${event.filterName}");
          var searchResult = await remoteService.searchUsers(event.filterName);
          emit(SearchResultListState(searchResult));
        } catch (e) {
          emit(SearchErrorEventState(e.toString()));
        }
      },
      transformer:
          (events, mapper) => events
              .debounceTime(const Duration(milliseconds: 500))
              .switchMap(mapper),
    );
  }
}
