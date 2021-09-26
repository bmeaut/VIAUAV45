import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'network_media.dart';

part 'network_article.g.dart';

@immutable
@JsonSerializable()
class NetworkArticle {
  final int id;
  final String url;
  final String byline;
  final String title;
  @JsonKey(name: "published_date")
  final String publishedDate;
  final List<NetworkMedia> media;

  NetworkArticle(
    this.id,
    this.url,
    this.byline,
    this.title,
    this.publishedDate,
    this.media,
  );
  
  static const fromJsonFactory = _$NetworkArticleFromJson;

  factory NetworkArticle.fromJson(Map<String, dynamic> json) => _$NetworkArticleFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkArticleToJson(this);
}
