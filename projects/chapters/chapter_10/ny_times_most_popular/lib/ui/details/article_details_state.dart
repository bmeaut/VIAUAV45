import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:ny_times_most_popular/domain/model/article.dart';

@immutable
abstract class ArticleDetailsState {
  const ArticleDetailsState();
}

class Loading extends ArticleDetailsState {
  static final Loading _instance = Loading._();

  factory Loading() => _instance;

  Loading._();
}

class Error extends ArticleDetailsState {
  static final Error _instance = Error._();

  factory Error() => _instance;

  Error._();
}

class ContentReady extends ArticleDetailsState with EquatableMixin {
  final Article article;

  ContentReady({required this.article});

  @override
  List<Object> get props => [article];
}