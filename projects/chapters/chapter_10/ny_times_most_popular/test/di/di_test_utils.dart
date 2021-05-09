import 'package:mockito/mockito.dart';
import 'package:ny_times_most_popular/data/disk/article_dao.dart';
import 'package:ny_times_most_popular/data/disk/article_disk_data_source.dart';
import 'package:ny_times_most_popular/data/network/article_network_data_source.dart';
import 'package:ny_times_most_popular/data/network/nyt_api.dart';
import 'package:ny_times_most_popular/domain/interactor/article_interactor.dart';
import 'package:ny_times_most_popular/ui/articles/article_list_bloc.dart';
import 'package:ny_times_most_popular/ui/details/article_details_bloc.dart';

class NytServiceMock extends Mock implements NytApi {}

ArticleNetworkDataSource initArticleNetworkDataSource() {
  return ArticleNetworkDataSource(NytServiceMock());
}

class ArticleDaoMock extends Mock implements ArticleDao {}

ArticleDiskDataSource initArticleDiskDataSource() {
  return ArticleDiskDataSource(ArticleDaoMock());
}

class ArticleNetworkDataSourceMock extends Mock
    implements ArticleNetworkDataSource {}

ArticleInteractor initArticleInteractor() {
  return ArticleInteractor(
      initArticleDiskDataSource(), initArticleNetworkDataSource());
}

ArticleListBloc initArticleListBloc() {
  return ArticleListBloc(initArticleInteractor());
}

ArticleDetailsBloc initArticleDetailsBloc() {
  return ArticleDetailsBloc(initArticleInteractor());
}
