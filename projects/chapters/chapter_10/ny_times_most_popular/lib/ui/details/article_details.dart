import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ny_times_most_popular/di/article_details_scope.dart';
import 'package:ny_times_most_popular/ui/details/article_details_event.dart';
import 'package:ny_times_most_popular/di/di_utils.dart';
import 'package:url_launcher/url_launcher.dart';

import 'article_details_bloc.dart';
import 'article_details_state.dart';

class ArticleDetails extends StatelessWidget {
  final int articleId;

  ArticleDetails(this.articleId);

  @override
  Widget build(BuildContext context) {
    return ArticleDetailsScope(
      injectionTarget: BlocBuilder<ArticleDetailsBloc, ArticleDetailsState>(
        builder: (context, state) {
          if (state is Loading) {
            context
                .getBloc<ArticleDetailsBloc>()
                .add(LoadArticleEvent(articleId));
            return ArticleDetailsLoading();
          } else if (state is ContentReady) {
            final article = state.article;
            return Scaffold(
              appBar: AppBar(
                title: Text("Article details"),
              ),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    article.largeUrl != null
                        ? Image.network(
                            article.largeUrl!,
                          )
                        : Icon(
                            Icons.image,
                            size: 100,
                          ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(article.title),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(article.byLine),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.calendar_today,
                            size: 15,
                          ),
                          Text(
                            article.publishedDate,
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        final url = article.url;
                        if (await canLaunch(url)) {
                          await launch(url, forceWebView: true);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Could not launch ${article.url}"),
                            ),
                          );
                        }
                      },
                      child: Text(
                        "OPEN IN BROWSER",
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          return Center(
            child: Text(
              "Something went wrong while retrieving Article",
            ),
          );
        },
      ),
    );
  }
}

class ArticleDetailsLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Article details"),
      ),
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
