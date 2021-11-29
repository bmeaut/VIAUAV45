// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkArticle _$NetworkArticleFromJson(Map<String, dynamic> json) =>
    NetworkArticle(
      json['id'] as int,
      json['url'] as String,
      json['byline'] as String,
      json['title'] as String,
      json['published_date'] as String,
      (json['media'] as List<dynamic>)
          .map((e) => NetworkMedia.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NetworkArticleToJson(NetworkArticle instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'byline': instance.byline,
      'title': instance.title,
      'published_date': instance.publishedDate,
      'media': instance.media,
    };
