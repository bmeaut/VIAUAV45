import 'package:ny_times_most_popular/data/disk/model/floor_article.dart';

abstract class ArticleDao {

  Future<List<FloorArticle>> getAllArticles();

  Future<FloorArticle?> getArticle(int id);

  Future<void> insertArticles(List<FloorArticle> articles);

  Future<void> deleteAllArticles();
}
