import 'package:ny_times_most_popular/data/disk/article_dao.dart';
import 'package:ny_times_most_popular/data/disk/model/floor_article.dart';
import 'package:ny_times_most_popular/domain/model/article.dart';

class ArticleDiskDataSource {
  final ArticleDao _articleDao;

  ArticleDiskDataSource(this._articleDao);

  Future<List<Article>?> getAllArticles() async {
    try {
      final articlesFromDb = await _articleDao.getAllArticles();
      return articlesFromDb.map(
        (article) => article.toDomainModel(),
      ).toList();
    } catch (err) {
      return null;
    }
  }

  Future<Article?> getArticle(int id) async {
    try {
      final articleFromDb = await _articleDao.getArticle(id);
      return articleFromDb?.toDomainModel();
    } catch (err) {
      return null;
    }
  }

  Future<void> saveArticles(List<Article> articles) async {
    await _articleDao.deleteAllArticles();
    _articleDao.insertArticles(
      articles.map(
        (article) => article.toDatabaseModel(),
      ).toList(),
    );
  }
}

extension on FloorArticle {
  Article toDomainModel() {
    return Article(
      id: this.id,
      url: this.url,
      byLine: this.byLine,
      title: this.title,
      publishedDate: this.publishedDate,
      thumbUrl: this.thumbUrl,
      largeUrl: this.largeUrl,
    );
  }
}

extension on Article {
  FloorArticle toDatabaseModel() {
    return FloorArticle(
      id: this.id,
      url: this.url,
      byLine: this.byLine,
      title: this.title,
      publishedDate: this.publishedDate,
      thumbUrl: this.thumbUrl,
      largeUrl: this.largeUrl,
    );
  }
}
