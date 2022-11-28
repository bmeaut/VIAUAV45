import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ny_times_most_popular/di/injectable_di.dart';
import 'package:ny_times_most_popular/ui/articles/article_list_bloc.dart';
import 'package:ny_times_most_popular/ui/articles/article_list_event.dart';
import 'package:ny_times_most_popular/ui/articles/article_list_state.dart';
import 'package:ny_times_most_popular/ui/articles/content/article_list_content.dart';
import 'package:ny_times_most_popular/utils.dart';

class ArticleListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NYT Most Popular"),
      ),
      body: BlocProvider(
        create: (context) => injector<ArticleListBloc>(),
        child: BlocListener<ArticleListBloc, ArticleListState>(
          listener: (context, state) {
            if (state is Error) {
              context.showSnackBar(
                content: Text("Failed to refresh articles!"),
              );
            }
          },
          child: BlocBuilder<ArticleListBloc, ArticleListState>(
            builder: (context, state) {
              if (state is Loading) {
                BlocProvider.of<ArticleListBloc>(context)
                    .add(LoadArticlesEvent());
                return ArticleListLoading();
              }

              if (state is Content) {
                return ArticleListContent(state);
              }

              return Center(
                child: Text("Something went wrong :("),
              );
            },
          ),
        ),
      ),
    );
  }
}

class ArticleListLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
