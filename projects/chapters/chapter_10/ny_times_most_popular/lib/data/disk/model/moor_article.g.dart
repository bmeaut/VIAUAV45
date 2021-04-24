// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_article.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class MoorArticleData extends DataClass implements Insertable<MoorArticleData> {
  final int id;
  final String url;
  final String byLine;
  final String title;
  final String publishedDate;
  final String? thumbUrl;
  final String? largeUrl;
  MoorArticleData(
      {required this.id,
      required this.url,
      required this.byLine,
      required this.title,
      required this.publishedDate,
      this.thumbUrl,
      this.largeUrl});
  factory MoorArticleData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return MoorArticleData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      url: stringType.mapFromDatabaseResponse(data['${effectivePrefix}url'])!,
      byLine: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}by_line'])!,
      title:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      publishedDate: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}published_date'])!,
      thumbUrl: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}thumb_url']),
      largeUrl: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}large_url']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['url'] = Variable<String>(url);
    map['by_line'] = Variable<String>(byLine);
    map['title'] = Variable<String>(title);
    map['published_date'] = Variable<String>(publishedDate);
    if (!nullToAbsent || thumbUrl != null) {
      map['thumb_url'] = Variable<String?>(thumbUrl);
    }
    if (!nullToAbsent || largeUrl != null) {
      map['large_url'] = Variable<String?>(largeUrl);
    }
    return map;
  }

  MoorArticleCompanion toCompanion(bool nullToAbsent) {
    return MoorArticleCompanion(
      id: Value(id),
      url: Value(url),
      byLine: Value(byLine),
      title: Value(title),
      publishedDate: Value(publishedDate),
      thumbUrl: thumbUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(thumbUrl),
      largeUrl: largeUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(largeUrl),
    );
  }

  factory MoorArticleData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return MoorArticleData(
      id: serializer.fromJson<int>(json['id']),
      url: serializer.fromJson<String>(json['url']),
      byLine: serializer.fromJson<String>(json['byLine']),
      title: serializer.fromJson<String>(json['title']),
      publishedDate: serializer.fromJson<String>(json['publishedDate']),
      thumbUrl: serializer.fromJson<String?>(json['thumbUrl']),
      largeUrl: serializer.fromJson<String?>(json['largeUrl']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'url': serializer.toJson<String>(url),
      'byLine': serializer.toJson<String>(byLine),
      'title': serializer.toJson<String>(title),
      'publishedDate': serializer.toJson<String>(publishedDate),
      'thumbUrl': serializer.toJson<String?>(thumbUrl),
      'largeUrl': serializer.toJson<String?>(largeUrl),
    };
  }

  MoorArticleData copyWith(
          {int? id,
          String? url,
          String? byLine,
          String? title,
          String? publishedDate,
          String? thumbUrl,
          String? largeUrl}) =>
      MoorArticleData(
        id: id ?? this.id,
        url: url ?? this.url,
        byLine: byLine ?? this.byLine,
        title: title ?? this.title,
        publishedDate: publishedDate ?? this.publishedDate,
        thumbUrl: thumbUrl ?? this.thumbUrl,
        largeUrl: largeUrl ?? this.largeUrl,
      );
  @override
  String toString() {
    return (StringBuffer('MoorArticleData(')
          ..write('id: $id, ')
          ..write('url: $url, ')
          ..write('byLine: $byLine, ')
          ..write('title: $title, ')
          ..write('publishedDate: $publishedDate, ')
          ..write('thumbUrl: $thumbUrl, ')
          ..write('largeUrl: $largeUrl')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          url.hashCode,
          $mrjc(
              byLine.hashCode,
              $mrjc(
                  title.hashCode,
                  $mrjc(publishedDate.hashCode,
                      $mrjc(thumbUrl.hashCode, largeUrl.hashCode)))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is MoorArticleData &&
          other.id == this.id &&
          other.url == this.url &&
          other.byLine == this.byLine &&
          other.title == this.title &&
          other.publishedDate == this.publishedDate &&
          other.thumbUrl == this.thumbUrl &&
          other.largeUrl == this.largeUrl);
}

class MoorArticleCompanion extends UpdateCompanion<MoorArticleData> {
  final Value<int> id;
  final Value<String> url;
  final Value<String> byLine;
  final Value<String> title;
  final Value<String> publishedDate;
  final Value<String?> thumbUrl;
  final Value<String?> largeUrl;
  const MoorArticleCompanion({
    this.id = const Value.absent(),
    this.url = const Value.absent(),
    this.byLine = const Value.absent(),
    this.title = const Value.absent(),
    this.publishedDate = const Value.absent(),
    this.thumbUrl = const Value.absent(),
    this.largeUrl = const Value.absent(),
  });
  MoorArticleCompanion.insert({
    required int id,
    required String url,
    required String byLine,
    required String title,
    required String publishedDate,
    this.thumbUrl = const Value.absent(),
    this.largeUrl = const Value.absent(),
  })  : id = Value(id),
        url = Value(url),
        byLine = Value(byLine),
        title = Value(title),
        publishedDate = Value(publishedDate);
  static Insertable<MoorArticleData> custom({
    Expression<int>? id,
    Expression<String>? url,
    Expression<String>? byLine,
    Expression<String>? title,
    Expression<String>? publishedDate,
    Expression<String?>? thumbUrl,
    Expression<String?>? largeUrl,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (url != null) 'url': url,
      if (byLine != null) 'by_line': byLine,
      if (title != null) 'title': title,
      if (publishedDate != null) 'published_date': publishedDate,
      if (thumbUrl != null) 'thumb_url': thumbUrl,
      if (largeUrl != null) 'large_url': largeUrl,
    });
  }

  MoorArticleCompanion copyWith(
      {Value<int>? id,
      Value<String>? url,
      Value<String>? byLine,
      Value<String>? title,
      Value<String>? publishedDate,
      Value<String?>? thumbUrl,
      Value<String?>? largeUrl}) {
    return MoorArticleCompanion(
      id: id ?? this.id,
      url: url ?? this.url,
      byLine: byLine ?? this.byLine,
      title: title ?? this.title,
      publishedDate: publishedDate ?? this.publishedDate,
      thumbUrl: thumbUrl ?? this.thumbUrl,
      largeUrl: largeUrl ?? this.largeUrl,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (byLine.present) {
      map['by_line'] = Variable<String>(byLine.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (publishedDate.present) {
      map['published_date'] = Variable<String>(publishedDate.value);
    }
    if (thumbUrl.present) {
      map['thumb_url'] = Variable<String?>(thumbUrl.value);
    }
    if (largeUrl.present) {
      map['large_url'] = Variable<String?>(largeUrl.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MoorArticleCompanion(')
          ..write('id: $id, ')
          ..write('url: $url, ')
          ..write('byLine: $byLine, ')
          ..write('title: $title, ')
          ..write('publishedDate: $publishedDate, ')
          ..write('thumbUrl: $thumbUrl, ')
          ..write('largeUrl: $largeUrl')
          ..write(')'))
        .toString();
  }
}

class $MoorArticleTable extends MoorArticle
    with TableInfo<$MoorArticleTable, MoorArticleData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $MoorArticleTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedTextColumn url = _constructUrl();
  GeneratedTextColumn _constructUrl() {
    return GeneratedTextColumn(
      'url',
      $tableName,
      false,
    );
  }

  final VerificationMeta _byLineMeta = const VerificationMeta('byLine');
  @override
  late final GeneratedTextColumn byLine = _constructByLine();
  GeneratedTextColumn _constructByLine() {
    return GeneratedTextColumn(
      'by_line',
      $tableName,
      false,
    );
  }

  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedTextColumn title = _constructTitle();
  GeneratedTextColumn _constructTitle() {
    return GeneratedTextColumn(
      'title',
      $tableName,
      false,
    );
  }

  final VerificationMeta _publishedDateMeta =
      const VerificationMeta('publishedDate');
  @override
  late final GeneratedTextColumn publishedDate = _constructPublishedDate();
  GeneratedTextColumn _constructPublishedDate() {
    return GeneratedTextColumn(
      'published_date',
      $tableName,
      false,
    );
  }

  final VerificationMeta _thumbUrlMeta = const VerificationMeta('thumbUrl');
  @override
  late final GeneratedTextColumn thumbUrl = _constructThumbUrl();
  GeneratedTextColumn _constructThumbUrl() {
    return GeneratedTextColumn(
      'thumb_url',
      $tableName,
      true,
    );
  }

  final VerificationMeta _largeUrlMeta = const VerificationMeta('largeUrl');
  @override
  late final GeneratedTextColumn largeUrl = _constructLargeUrl();
  GeneratedTextColumn _constructLargeUrl() {
    return GeneratedTextColumn(
      'large_url',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, url, byLine, title, publishedDate, thumbUrl, largeUrl];
  @override
  $MoorArticleTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'moor_article';
  @override
  final String actualTableName = 'moor_article';
  @override
  VerificationContext validateIntegrity(Insertable<MoorArticleData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('url')) {
      context.handle(
          _urlMeta, url.isAcceptableOrUnknown(data['url']!, _urlMeta));
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    if (data.containsKey('by_line')) {
      context.handle(_byLineMeta,
          byLine.isAcceptableOrUnknown(data['by_line']!, _byLineMeta));
    } else if (isInserting) {
      context.missing(_byLineMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('published_date')) {
      context.handle(
          _publishedDateMeta,
          publishedDate.isAcceptableOrUnknown(
              data['published_date']!, _publishedDateMeta));
    } else if (isInserting) {
      context.missing(_publishedDateMeta);
    }
    if (data.containsKey('thumb_url')) {
      context.handle(_thumbUrlMeta,
          thumbUrl.isAcceptableOrUnknown(data['thumb_url']!, _thumbUrlMeta));
    }
    if (data.containsKey('large_url')) {
      context.handle(_largeUrlMeta,
          largeUrl.isAcceptableOrUnknown(data['large_url']!, _largeUrlMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  MoorArticleData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return MoorArticleData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $MoorArticleTable createAlias(String alias) {
    return $MoorArticleTable(_db, alias);
  }
}

abstract class _$NytMostPopularDatabase extends GeneratedDatabase {
  _$NytMostPopularDatabase(QueryExecutor e)
      : super(SqlTypeSystem.defaultInstance, e);
  late final $MoorArticleTable moorArticle = $MoorArticleTable(this);
  late final ArticleDao articleDao = ArticleDao(this as NytMostPopularDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [moorArticle];
}
