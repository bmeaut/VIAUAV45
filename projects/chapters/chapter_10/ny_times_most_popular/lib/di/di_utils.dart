import 'package:get_it/get_it.dart';
import 'package:ny_times_most_popular/data/disk/article_dao.dart';
import 'package:ny_times_most_popular/data/disk/article_disk_data_source.dart';
import 'package:ny_times_most_popular/data/disk/floor_database.dart';
import 'package:ny_times_most_popular/data/network/article_network_data_source.dart';
import 'package:ny_times_most_popular/data/network/dio_nyt_service.dart';
import 'package:ny_times_most_popular/data/network/nyt_api.dart';
import 'package:ny_times_most_popular/domain/interactor/article_interactor.dart';
import 'package:ny_times_most_popular/ui/articles/article_list_bloc.dart';
import 'package:ny_times_most_popular/ui/details/article_details_bloc.dart';

final injector = GetIt.instance;

void initDependencies() {
  injector.registerSingleton<NytApi>(NytService());

  injector.registerSingleton(
    ArticleNetworkDataSource(injector<NytApi>()),
  );

  injector.registerSingletonAsync<ArticleDao>(() async {
    final database = await $FloorFloorArticleDatabase
        .databaseBuilder("nyt_database.db")
        .build();
    return database.articleDao;
  });

  injector.registerSingletonAsync(
    () async {
      return ArticleDiskDataSource(
        injector<ArticleDao>(),
      );
    },
    dependsOn: [ArticleDao],
  );

  injector.registerSingletonAsync(
    () async {
      return ArticleInteractor(
        injector<ArticleDiskDataSource>(),
        injector<ArticleNetworkDataSource>(),
      );
    },
    dependsOn: [ArticleDiskDataSource],
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
