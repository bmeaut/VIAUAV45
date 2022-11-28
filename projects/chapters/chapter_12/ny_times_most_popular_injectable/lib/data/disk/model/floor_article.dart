import 'package:floor/floor.dart';

@Entity(tableName: "articles")
class FloorArticle {
  @primaryKey
  int id;
  String url;
  String byLine;
  String title;
  String publishedDate;
  String? thumbUrl;
  String? largeUrl;

  FloorArticle({
    required this.id,
    required this.url,
    required this.byLine,
    required this.title,
    required this.publishedDate,
    this.thumbUrl,
    this.largeUrl,
  });
}
