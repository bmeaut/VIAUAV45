import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stock_photo_lists_with_pagination/data/photo_data_store.dart';
import 'package:stock_photo_lists_with_pagination/presentation/blocs/list_bloc.dart';
import 'package:stock_photo_lists_with_pagination/presentation/blocs/list_event.dart';
import 'package:stock_photo_lists_with_pagination/presentation/blocs/list_state.dart';
import 'package:stock_photo_lists_with_pagination/presentation/pages/list_page.dart';
import 'package:stock_photo_lists_with_pagination/presentation/widgets/list_item_widget.dart';

class MockListBloc extends MockBloc<ListEvent, ListState> implements ListBloc {}

List<StockPhoto> createPhotos(int startId, int count) {
  return List.generate(count, (i) => StockPhoto.fromId(startId + i));
}

late MockListBloc mockListBloc;

void main() {
  setUpAll(() {
    registerFallbackValue(const ListFetchNextPage());
    registerFallbackValue(const ListRefresh());
  });

  setUp(() {
    mockListBloc = MockListBloc();
    when(() => mockListBloc.state).thenReturn(const InitialListState());
  });

  Future<void> pumpListPage(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<ListBloc>.value(
          value: mockListBloc,
          child: const ListPage(),
        ),
      ),
    );
    await tester.pump();
  }

  testWidgets('renders initial state text initially', (tester) async {
    when(() => mockListBloc.state).thenReturn(const InitialListState());
    await pumpListPage(tester);
    expect(find.text('Initializing...'), findsOneWidget);
  });

  testWidgets('renders loading indicator for LoadingListState', (tester) async {
    whenListen(
      mockListBloc,
      Stream.fromIterable([const LoadingListState()]),
      initialState: const InitialListState(),
    );
    await pumpListPage(tester);
    await tester.pump();
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('renders error message and retry button for ErrorListState', (
    tester,
  ) async {
    final error = Exception('Failed');
    whenListen(
      mockListBloc,
      Stream.fromIterable([ErrorListState(error: error)]),
      initialState: const InitialListState(),
    );
    await pumpListPage(tester);
    await tester.pump();

    expect(
      find.textContaining('Something went wrong: ${error}'),
      findsOneWidget,
    );
    expect(find.widgetWithText(ElevatedButton, 'Try Again'), findsOneWidget);

    await tester.tap(find.widgetWithText(ElevatedButton, 'Try Again'));
    await tester.pump();

    verify(() => mockListBloc.add(const ListRefresh())).called(1);
  });

  testWidgets('renders PagedListView and items for LoadedListState', (
    tester,
  ) async {
    final photos = createPhotos(0, 5);
    final pagingState = PagingState<int, StockPhoto>(
      pages: [photos],
      keys: [0],
      hasNextPage: true,
    );
    whenListen(
      mockListBloc,
      Stream.fromIterable([LoadedListState(pagingState: pagingState)]),
      initialState: const InitialListState(),
    );

    await pumpListPage(tester);
    await tester.pumpAndSettle();

    expect(find.byType(PagedListView<int, StockPhoto>), findsOneWidget);
    expect(find.byType(ListItemWidget), findsNWidgets(5));
    expect(find.text(StockPhoto.fromId(0).title), findsOneWidget);
  });

  testWidgets('triggers ListFetchNextPage on scroll when loaded', (
    tester,
  ) async {
    final photosPage1 = createPhotos(0, 20);
    final pagingState = PagingState<int, StockPhoto>(
      pages: [photosPage1],
      keys: [0],
      hasNextPage: true,
    );
    whenListen(
      mockListBloc,
      Stream.fromIterable([LoadedListState(pagingState: pagingState)]),
      initialState: const InitialListState(),
    );

    await pumpListPage(tester);
    await tester.pumpAndSettle();

    final listFinder = find.byType(PagedListView<int, StockPhoto>);
    expect(listFinder, findsOneWidget);

    await tester.drag(listFinder, const Offset(0.0, -600.0));
    await tester.pumpAndSettle();

    verify(() => mockListBloc.add(const ListFetchNextPage())).called(1);
  });

  testWidgets('triggers ListRefresh on pull to refresh when loaded', (
    tester,
  ) async {
    final photos = createPhotos(0, 5);
    final pagingState = PagingState<int, StockPhoto>(
      pages: [photos],
      keys: [0],
      hasNextPage: true,
    );
    whenListen(
      mockListBloc,
      Stream.fromIterable([LoadedListState(pagingState: pagingState)]),
      initialState: const InitialListState(),
    );

    await pumpListPage(tester);
    await tester.pumpAndSettle();

    await tester.fling(
      find.byType(PagedListView<int, StockPhoto>),
      const Offset(0.0, 300.0),
      1000.0,
    );
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    await tester.pump(const Duration(seconds: 1));
    await tester.pump(const Duration(seconds: 1));

    verify(() => mockListBloc.add(const ListRefresh())).called(1);
  });
}
