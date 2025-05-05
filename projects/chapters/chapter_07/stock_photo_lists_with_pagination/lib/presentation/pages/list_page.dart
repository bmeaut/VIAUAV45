import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:stock_photo_lists_with_pagination/data/photo_data_store.dart';
import 'package:stock_photo_lists_with_pagination/presentation/blocs/list_bloc.dart';
import 'package:stock_photo_lists_with_pagination/presentation/blocs/list_event.dart';
import 'package:stock_photo_lists_with_pagination/presentation/blocs/list_state.dart';
import 'package:stock_photo_lists_with_pagination/presentation/widgets/list_item_widget.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  void initState() {
    super.initState();
    context.read<ListBloc>().add(const ListFetchFirstPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("List with pagination")),
      body: BlocBuilder<ListBloc, ListState>(
        builder: (context, state) {
          if (state is InitialListState) {
            return const Center(child: Text('Initializing...'));
          } else if (state is LoadingListState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ErrorListState) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Something went wrong: ${state.error}'),
                  ElevatedButton(
                    onPressed:
                        () => context.read<ListBloc>().add(const ListRefresh()),
                    child: const Text('Try Again'),
                  ),
                ],
              ),
            );
          } else if (state is LoadedListState) {
            return RefreshIndicator(
              onRefresh: () {
                context.read<ListBloc>().add(const ListRefresh());
                return context.read<ListBloc>().stream.firstWhere(
                  (s) => s is! LoadingListState,
                );
              },
              child: PagedListView<int, StockPhoto>(
                state: state.pagingState,
                fetchNextPage: () {
                  context.read<ListBloc>().add(const ListFetchNextPage());
                },
                builderDelegate: PagedChildBuilderDelegate<StockPhoto>(
                  itemBuilder:
                      (context, item, index) => ListItemWidget(item: item),
                  firstPageProgressIndicatorBuilder:
                      (_) => const Center(child: CircularProgressIndicator()),
                  newPageProgressIndicatorBuilder:
                      (_) => const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Center(child: CircularProgressIndicator()),
                      ),
                  noItemsFoundIndicatorBuilder:
                      (_) => const Center(child: Text('No photos found')),
                  firstPageErrorIndicatorBuilder:
                      (_) => Center(
                        child: Text('Error: ${state.pagingState.error}'),
                      ),
                  newPageErrorIndicatorBuilder:
                      (_) => Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Something went wrong: ${state.pagingState.error}',
                            ),
                            ElevatedButton(
                              onPressed:
                                  () => context.read<ListBloc>().add(
                                    const ListFetchNextPage(),
                                  ),
                              child: const Text('Try Again'),
                            ),
                          ],
                        ),
                      ),
                ),
              ),
            );
          }
          return const Center(child: Text('Unknown state'));
        },
      ),
    );
  }
}
