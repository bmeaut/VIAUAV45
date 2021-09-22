import 'package:flutter/foundation.dart';

@immutable
abstract class ArticleDetailsEvent {
  const ArticleDetailsEvent();
}

class LoadArticleEvent extends ArticleDetailsEvent {
  final int id;

  LoadArticleEvent(this.id);
}
