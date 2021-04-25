import 'package:moor/moor.dart';

import 'model/moor_article.dart';

@UseDao(tables: [MoorArticle])
abstract class ArticleDao {

  Future<List<MoorArticleData>> getAllArticles();

  Future<MoorArticleData?> getArticle(int id);

  Future<void> insertArticles(List<MoorArticleData> articles);

  Future<int> deleteAllArticles();
}
