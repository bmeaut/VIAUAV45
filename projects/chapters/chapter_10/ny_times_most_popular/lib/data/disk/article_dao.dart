import 'package:moor/moor.dart';

import 'model/moor_article.dart';

part 'article_dao.g.dart';

@UseDao(tables: [MoorArticle])
class ArticleDao extends DatabaseAccessor<NytMostPopularDatabase> with _$ArticleDaoMixin {
  ArticleDao(NytMostPopularDatabase db) : super(db);

  Future<List<MoorArticleData>> getAllArticles() {
    return select(moorArticle).get();
  }

  Future<MoorArticleData?> findArticle(int id) {
    return (select(moorArticle)
          ..limit(1)
          ..where((article) => article.id.equals(id)))
        .getSingle();
  }

  Future<void> insertArticles(List<MoorArticleData> articles) async {
    await batch((batch) {
      batch.insertAll(
        moorArticle,
        articles
            .map((article) => MoorArticleCompanion.insert(
                  id: article.id,
                  url: article.url,
                  byLine: article.byLine,
                  title: article.title,
                  publishedDate: article.publishedDate,
                  thumbUrl: Value(article.thumbUrl),
                  largeUrl: Value(article.largeUrl),
                ))
            .toList(),
        mode: InsertMode.insertOrReplace,
      );
    });
  }

  Future<int> deleteAllArticles() {
    return delete(moorArticle).go();
  }
}
