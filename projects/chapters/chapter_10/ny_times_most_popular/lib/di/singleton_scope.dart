import 'package:chopper/chopper.dart';
import 'package:ny_times_most_popular/data/disk/article_dao.dart';
import 'package:ny_times_most_popular/data/disk/article_disk_data_source.dart';
import 'package:ny_times_most_popular/data/disk/model/moor_article.dart';
import 'package:ny_times_most_popular/data/network/api_key_interceptor.dart';
import 'package:ny_times_most_popular/data/network/article_network_data_source.dart';
import 'package:ny_times_most_popular/data/network/chopper_nyt_api.dart';
import 'package:ny_times_most_popular/data/network/json_serializable_converter.dart';
import 'package:ny_times_most_popular/data/network/model/network_article.dart';
import 'package:ny_times_most_popular/data/network/model/network_media.dart';
import 'package:ny_times_most_popular/data/network/model/network_media_metadata.dart';
import 'package:ny_times_most_popular/data/network/model/network_reply.dart';
import 'package:ny_times_most_popular/data/network/nyt_api.dart';
import 'package:ny_times_most_popular/domain/interactor/article_interactor.dart';
import 'package:ny_times_most_popular/ui/articles/article_list_bloc.dart';
import 'package:ny_times_most_popular/ui/details/article_details_bloc.dart';

import 'di_utils.dart';

void setUpDi() {
  injector.registerSingleton<NytApi>(
    ChopperClient(
      baseUrl: "https://api.nytimes.com",
      services: [
        ChopperNytApi.create(),
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
    ).getService<ChopperNytApi>(),
  );

  injector.registerSingleton(
    ArticleNetworkDataSource(injector<NytApi>()),
  );

  injector.registerSingleton<ArticleDao>(
    NytMostPopularDatabase().moorArticleDao,
  );

  injector.registerSingleton(
    ArticleDiskDataSource(
      injector<ArticleDao>(),
    ),
  );

  injector.registerSingleton(
    ArticleInteractor(
      injector<ArticleDiskDataSource>(),
      injector<ArticleNetworkDataSource>(),
    ),
  );

  injector.registerFactory(
    () => ArticleListBloc(
      injector<ArticleInteractor>(),
    ),
  );

  injector.registerFactory(
    () => ArticleDetailsBloc(
      injector<ArticleInteractor>(),
    ),
  );
}
