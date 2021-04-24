import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ny_times_most_popular/di/article_list_scope.dart';
import 'package:ny_times_most_popular/di/di_utils.dart';
import 'package:ny_times_most_popular/ui/articles/article_list_bloc.dart';
import 'package:ny_times_most_popular/ui/articles/article_list_event.dart';
import 'package:ny_times_most_popular/ui/articles/article_list_state.dart';
import 'package:ny_times_most_popular/ui/details/article_details.dart';

class ArticleListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ArticleListScope(
      injectionTarget: BlocBuilder<ArticleListBloc, ArticleListState>(
        builder: (context, state) {
          if (state is Loading) {
            context.getBloc<ArticleListBloc>().add(LoadArticlesEvent());
            return ArticleListLoading();
          }

          if (state is Content) {
            return ArticleListContent(state);
          }

          return Center(
            child: Text("Invalid state!"),
          );
        },
      ),
    );
  }
}

class ArticleListLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NYT Most Popular"),
      ),
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class ArticleListContent extends StatefulWidget {
  final Content state;

  ArticleListContent(this.state);

  @override
  _ArticleListContentState createState() => _ArticleListContentState(state);
}

class _ArticleListContentState extends State<ArticleListContent> {
  Content state;
  late Completer _refreshCompleter;

  _ArticleListContentState(this.state);

  @override
  void initState() {
    super.initState();
    _refreshCompleter = Completer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NYT Most Popular"),
      ),
      body: BlocListener<ArticleListBloc, ArticleListState>(
        listener: (context, state) {
          if (!(state is Refreshing)) {
            _refreshCompleter.complete();
            _refreshCompleter = Completer();
          }
        },
        child: RefreshIndicator(
          onRefresh: () async {
            context.getBloc<ArticleListBloc>().add(RefreshArticlesEvent());
            return _refreshCompleter.future;
          },
          child: ListView.builder(
            itemCount: state.articles.length,
            itemBuilder: (context, index) {
              final item = state.articles[index];
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return ArticleDetails(item.id);
                      },
                    ),
                  );
                },
                child: ListTile(
                  leading: item.thumbUrl != null
                      ? Image.network(
                          item.thumbUrl!,
                          width: 40,
                          height: 40,
                        )
                      : Icon(
                          Icons.image,
                          size: 40,
                        ),
                  title: Text(
                    item.title,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Text(
                              item.byLine,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.calendar_today,
                            size: 15,
                          ),
                          Text(
                            item.publishedDate,
                          ),
                        ],
                      )
                    ],
                  ),
                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
