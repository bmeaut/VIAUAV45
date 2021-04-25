import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ny_times_most_popular/di/di_utils.dart';
import 'package:ny_times_most_popular/ui/details/article_details_event.dart';
import 'package:url_launcher/url_launcher.dart';

import 'article_details_bloc.dart';
import 'article_details_state.dart';

class ArticleDetails extends StatelessWidget {
  final int articleId;

  ArticleDetails(this.articleId);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => injector<ArticleDetailsBloc>(),
      child: BlocBuilder<ArticleDetailsBloc, ArticleDetailsState>(
        builder: (context, state) {
          if (state is Loading) {
            BlocProvider.of<ArticleDetailsBloc>(context)
                .add(LoadArticleEvent(articleId));
            return ArticleDetailsLoading();
          }

          if (state is ContentReady) {
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
                        ? CachedNetworkImage(
                            imageUrl: article.largeUrl!,
                            height: 200,
                          )
                        : Icon(
                            Icons.image,
                            size: 200,
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
                          Padding(
                            padding: const EdgeInsets.only(left: 4.0),
                            child: Text(
                              article.publishedDate,
                            ),
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
              "Something went wrong while retrieving Article with id $articleId",
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
