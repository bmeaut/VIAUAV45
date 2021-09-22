import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
class Article extends Equatable {
  final int id;
  final String url;
  final String byLine;
  final String title;
  final String publishedDate;
  final String? thumbUrl;
  final String? largeUrl;

  const Article({
    required this.id,
    required this.url,
    required this.byLine,
    required this.title,
    required this.publishedDate,
    required this.thumbUrl,
    required this.largeUrl,
  });

  Article copyWith({
    int? id,
    String? url,
    String? byLine,
    String? title,
    String? publishedDate,
    String? thumbUrl,
    String? largeUrl,
  }) {
    return new Article(
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
  List<Object?> get props => [
    id,
    url,
    byLine,
    title,
    publishedDate,
    thumbUrl,
    largeUrl,
  ];
}