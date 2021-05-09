import 'package:floor/floor.dart';
import 'package:ny_times_most_popular/data/disk/article_dao.dart';
import 'package:ny_times_most_popular/data/disk/model/floor_article.dart';

@dao
abstract class FloorArticleDao implements ArticleDao {

  @Query("SELECT * FROM articles")
  Future<List<FloorArticle>> getAllArticles();

  @Query('SELECT * FROM articles WHERE id = :id')
  Future<FloorArticle?> getArticle(int id);

  @insert
  Future<void> insertArticles(List<FloorArticle> articles);

  @Query("DELETE FROM articles")
  Future<void> deleteAllArticles();
}
