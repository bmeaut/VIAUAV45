import 'package:collection/collection.dart';
import 'package:injectable/injectable.dart';
import 'package:ny_times_most_popular/data/network/model/network_article.dart';
import 'package:ny_times_most_popular/data/network/nyt_api.dart';
import 'package:ny_times_most_popular/domain/model/article.dart';

@singleton
class ArticleNetworkDataSource {
  final NytApi _nytApi;

  ArticleNetworkDataSource(this._nytApi);

  Future<List<Article>?> getArticles() async {
    final networkResponse = await _nytApi.getArticles();

    if (networkResponse.response.statusCode != 200) return null;

    final networkArticles = networkResponse.data.results;

    return networkArticles.map((article) => article.toDomainModel()).toList();
  }
}

extension on NetworkArticle {
  Article toDomainModel() {
    final firstImageMetadata = this.media.firstWhereOrNull((media) => media.type == "image")?.metadata;
    final thumbUrl =
        firstImageMetadata?.firstWhereOrNull((media) => media.format == "Standard Thumbnail")?.url;
    final largeUrl =
        firstImageMetadata?.firstWhereOrNull((media) => media.format == "mediumThreeByTwo440")?.url;

    return Article(
      id: this.id,
      url: this.url,
      byLine: this.byline,
      title: this.title,
      publishedDate: this.publishedDate,
      thumbUrl: thumbUrl,
      largeUrl: largeUrl,
    );
  }
}
