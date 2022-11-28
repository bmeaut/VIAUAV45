// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'floor_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorFloorArticleDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$FloorArticleDatabaseBuilder databaseBuilder(String name) =>
      _$FloorArticleDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$FloorArticleDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$FloorArticleDatabaseBuilder(null);
}

class _$FloorArticleDatabaseBuilder {
  _$FloorArticleDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$FloorArticleDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$FloorArticleDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<FloorArticleDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$FloorArticleDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$FloorArticleDatabase extends FloorArticleDatabase {
  _$FloorArticleDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  FloorArticleDao? _articleDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `articles` (`id` INTEGER NOT NULL, `url` TEXT NOT NULL, `byLine` TEXT NOT NULL, `title` TEXT NOT NULL, `publishedDate` TEXT NOT NULL, `thumbUrl` TEXT, `largeUrl` TEXT, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  FloorArticleDao get articleDao {
    return _articleDaoInstance ??= _$FloorArticleDao(database, changeListener);
  }
}

class _$FloorArticleDao extends FloorArticleDao {
  _$FloorArticleDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _floorArticleInsertionAdapter = InsertionAdapter(
            database,
            'articles',
            (FloorArticle item) => <String, Object?>{
                  'id': item.id,
                  'url': item.url,
                  'byLine': item.byLine,
                  'title': item.title,
                  'publishedDate': item.publishedDate,
                  'thumbUrl': item.thumbUrl,
                  'largeUrl': item.largeUrl
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<FloorArticle> _floorArticleInsertionAdapter;

  @override
  Future<List<FloorArticle>> getAllArticles() async {
    return _queryAdapter.queryList('SELECT * FROM articles',
        mapper: (Map<String, Object?> row) => FloorArticle(
            id: row['id'] as int,
            url: row['url'] as String,
            byLine: row['byLine'] as String,
            title: row['title'] as String,
            publishedDate: row['publishedDate'] as String,
            thumbUrl: row['thumbUrl'] as String?,
            largeUrl: row['largeUrl'] as String?));
  }

  @override
  Future<FloorArticle?> getArticle(int id) async {
    return _queryAdapter.query('SELECT * FROM articles WHERE id = ?1',
        mapper: (Map<String, Object?> row) => FloorArticle(
            id: row['id'] as int,
            url: row['url'] as String,
            byLine: row['byLine'] as String,
            title: row['title'] as String,
            publishedDate: row['publishedDate'] as String,
            thumbUrl: row['thumbUrl'] as String?,
            largeUrl: row['largeUrl'] as String?),
        arguments: [id]);
  }

  @override
  Future<void> deleteAllArticles() async {
    await _queryAdapter.queryNoReturn('DELETE FROM articles');
  }

  @override
  Future<void> insertArticles(List<FloorArticle> articles) async {
    await _floorArticleInsertionAdapter.insertList(
        articles, OnConflictStrategy.abort);
  }
}
