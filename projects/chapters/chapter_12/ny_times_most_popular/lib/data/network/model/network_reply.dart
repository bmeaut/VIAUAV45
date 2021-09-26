import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:ny_times_most_popular/data/network/model/network_article.dart';

part 'network_reply.g.dart';

@immutable
@JsonSerializable()
class NetworkReply {
  final List<NetworkArticle> results;

  NetworkReply(
    this.results,
  );

  static const fromJsonFactory = _$NetworkReplyFromJson;

  factory NetworkReply.fromJson(Map<String, dynamic> json) => _$NetworkReplyFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkReplyToJson(this);
}
