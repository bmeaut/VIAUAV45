import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:ny_times_most_popular/domain/model/article.dart';

@immutable
abstract class ArticleListState {
  const ArticleListState();
}

class Loading extends ArticleListState {
  static final Loading _instance = Loading._();

  factory Loading() => _instance;

  Loading._();
}

abstract class Content extends ArticleListState {
  final List<Article> articles;

  Content({required this.articles});
}

class ContentReady extends Content with EquatableMixin {
  ContentReady({required List<Article> articles}): super(articles: articles);

  @override
  List<Object> get props => [articles];
}

class Refreshing extends Content with EquatableMixin {
  Refreshing({required List<Article> articles}): super(articles: articles);

  @override
  List<Object> get props => [articles];
}

class Error extends Content with EquatableMixin {
  Error({required List<Article> articles}): super(articles: articles);

  @override
  List<Object> get props => [articles];
}