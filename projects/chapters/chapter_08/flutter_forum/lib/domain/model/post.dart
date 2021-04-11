import 'package:json_annotation/json_annotation.dart';

part 'post.g.dart';

@JsonSerializable()
class Post {
  final String? uid;
  final String author;
  final String title;
  final DateTime time;
  final String? body;
  final String? imageUrl;

  Post({
    this.uid,
    required this.author,
    required this.title,
    required this.time,
    this.body,
    this.imageUrl,
  });

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  Map<String, dynamic> toJson() => _$PostToJson(this);
}
