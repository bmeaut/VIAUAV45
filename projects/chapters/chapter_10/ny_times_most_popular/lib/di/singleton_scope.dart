import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:ny_times_most_popular/data/disk/article_dao.dart';
import 'package:ny_times_most_popular/data/disk/article_disk_data_source.dart';
import 'package:ny_times_most_popular/data/disk/model/moor_article.dart';
import 'package:ny_times_most_popular/data/network/api_key_interceptor.dart';
import 'package:ny_times_most_popular/data/network/article_network_data_source.dart';
import 'package:ny_times_most_popular/data/network/json_serializable_converter.dart';
import 'package:ny_times_most_popular/data/network/model/network_article.dart';
import 'package:ny_times_most_popular/data/network/model/network_media.dart';
import 'package:ny_times_most_popular/data/network/model/network_media_metadata.dart';
import 'package:ny_times_most_popular/data/network/model/network_reply.dart';
import 'package:ny_times_most_popular/data/network/nyt_api.dart';
import 'package:ny_times_most_popular/domain/interactor/article_interactor.dart';
import 'package:provider/provider.dart';

import 'di_utils.dart';

class SingletonScope extends Scope {
  SingletonScope({required Widget injectionTarget}) : super(injectionTarget);

  @override
  Widget buildDependencyTree({required Widget injectionTarget}) {
    return MultiProvider(
      providers: [
        _provideChopperClient(),
        _provideNytApi(),
        _provideArticleNetworkDataSource(),
        _provideNytMostPopularDatabase(),
        _provideArticleDao(),
        _provideArticleDiskDataSource(),
        _provideArticleListInteractor(),
      ],
      child: injectionTarget,
    );
  }

  Provider<ChopperClient> _provideChopperClient() {
    return Provider<ChopperClient>(
      create: (context) {
        return ChopperClient(
          baseUrl: "https://api.nytimes.com",
          services: [
            NytApi.create(),
          ],
          interceptors: [
            ApiKeyInterceptor(),
            HttpLoggingInterceptor(),
          ],
          converter: JsonSerializableConverter({
            NetworkReply: NetworkReply.fromJsonFactory,
            NetworkArticle: NetworkArticle.fromJsonFactory,
            NetworkMedia: NetworkMedia.fromJsonFactory,
            NetworkMediaMetadata: NetworkMediaMetadata.fromJsonFactory,
          }),
        );
      },
      dispose: (context, value) => value.dispose(),
    );
  }

  Provider<NytApi> _provideNytApi() {
    return Provider<NytApi>(
      create: (context) {
        final chopper = context.getElement<ChopperClient>();
        return chopper.getService<NytApi>();
      },
      dispose: (_, value) => value.client.dispose(),
    );
  }

  Provider<ArticleNetworkDataSource> _provideArticleNetworkDataSource() {
    return Provider<ArticleNetworkDataSource>(
      create: (context) {
        return ArticleNetworkDataSource(
          context.getElement<NytApi>(),
        );
      },
    );
  }

  Provider<NytMostPopularDatabase> _provideNytMostPopularDatabase() {
    return Provider<NytMostPopularDatabase>(
      create: (context) {
        return NytMostPopularDatabase();
      },
    );
  }

  Provider<ArticleDao> _provideArticleDao() {
    return Provider<ArticleDao>(
      create: (context) => context.getElement<NytMostPopularDatabase>().articleDao,
    );
  }

  Provider<ArticleDiskDataSource> _provideArticleDiskDataSource() {
    return Provider<ArticleDiskDataSource>(
      create: (context) => ArticleDiskDataSource(
        context.getElement<ArticleDao>(),
      ),
    );
  }

  Provider<ArticleInteractor> _provideArticleListInteractor() {
    return Provider<ArticleInteractor>(
      create: (context) {
        return ArticleInteractor(
          context.getElement<ArticleDiskDataSource>(),
          context.getElement<ArticleNetworkDataSource>(),
        );
      },
    );
  }
}
