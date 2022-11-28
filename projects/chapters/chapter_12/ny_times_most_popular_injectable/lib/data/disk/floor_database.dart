import 'dart:async';

import 'package:floor/floor.dart';
import 'package:injectable/injectable.dart';
import 'package:ny_times_most_popular/data/disk/floor_article_dao.dart';
import 'package:ny_times_most_popular/data/disk/model/floor_article.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'floor_database.g.dart';

@Database(
  version: 1,
  entities: [FloorArticle],
)
@singleton
abstract class FloorArticleDatabase extends FloorDatabase {
  FloorArticleDao get articleDao;

  @factoryMethod
  @preResolve
  static Future<FloorArticleDatabase> createDatabase() async {
    final database = await $FloorFloorArticleDatabase
        .databaseBuilder("nyt_database.db")
        .build();
    return database;
  }
}
