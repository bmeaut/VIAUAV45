import 'package:flutter/foundation.dart';

@immutable
abstract class ArticleListEvent {
  const ArticleListEvent();
}

class LoadArticlesEvent extends ArticleListEvent {
  static final LoadArticlesEvent _instance = LoadArticlesEvent._();

  factory LoadArticlesEvent() => _instance;

  LoadArticlesEvent._();
}

class RefreshArticlesEvent extends ArticleListEvent {
  static final RefreshArticlesEvent _instance = RefreshArticlesEvent._();

  factory RefreshArticlesEvent() => _instance;

  RefreshArticlesEvent._();
}