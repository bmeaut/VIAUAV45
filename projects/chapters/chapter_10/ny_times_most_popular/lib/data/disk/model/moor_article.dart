import 'dart:io';

import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';
import 'package:ny_times_most_popular/data/disk/article_dao.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

part 'moor_article.g.dart';

class MoorArticle extends Table {
  IntColumn get id => integer()();

  TextColumn get url => text()();

  TextColumn get byLine => text()();

  TextColumn get title => text()();

  TextColumn get publishedDate => text()();

  TextColumn get thumbUrl => text().nullable()();

  TextColumn get largeUrl => text().nullable()();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'nyt_most_popular.db'));
    return VmDatabase(file);
  });
}

@UseMoor(tables: [MoorArticle], daos: [ArticleDao])
class NytMostPopularDatabase extends _$NytMostPopularDatabase {
  NytMostPopularDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}
