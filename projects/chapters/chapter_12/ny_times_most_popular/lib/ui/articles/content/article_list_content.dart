import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ny_times_most_popular/main.dart';
import 'package:ny_times_most_popular/ui/articles/article_list_bloc.dart';
import 'package:ny_times_most_popular/ui/articles/article_list_event.dart';
import 'package:ny_times_most_popular/ui/articles/article_list_state.dart';

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
    return BlocListener<ArticleListBloc, ArticleListState>(
      listener: (_, state) {
        if (!(state is Refreshing)) {
          _refreshCompleter.complete();
          _refreshCompleter = Completer();
        }
      },
      child: RefreshIndicator(
        onRefresh: () async {
          BlocProvider.of<ArticleListBloc>(context).add(RefreshArticlesEvent());
          return _refreshCompleter.future;
        },
        child: ListView.builder(
          itemCount: state.articles.length,
          itemBuilder: (context, index) {
            final item = state.articles[index];
            return InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  DETAIL_PAGE,
                  arguments: item.id,
                );
              },
              child: ListTile(
                leading: item.thumbUrl != null
                    ? CachedNetworkImage(
                        imageUrl: item.thumbUrl!,
                        height: 40,
                        width: 40,
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
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Text(
                            item.publishedDate,
                          ),
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
                      Icons.chevron_right,
                      size: 20,
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
