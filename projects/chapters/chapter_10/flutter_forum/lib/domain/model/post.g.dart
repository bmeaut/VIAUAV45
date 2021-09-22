// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) {
  return Post(
    uid: json['uid'] as String?,
    author: json['author'] as String,
    title: json['title'] as String,
    time: DateTime.parse(json['time'] as String),
    body: json['body'] as String?,
    imageUrl: json['imageUrl'] as String?,
   );
}

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'uid': instance.uid,
      'author': instance.author,
      'title': instance.title,
      'time': instance.time.toIso8601String(),
      'body': instance.body,
      'imageUrl': instance.imageUrl,
    };
