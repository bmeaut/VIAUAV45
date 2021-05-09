import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

import 'network_media_metadata.dart';

part 'network_media.g.dart';

@immutable
@JsonSerializable()
class NetworkMedia {
  final String type;
  final String caption;
  @JsonKey(name: "media-metadata")
  final List<NetworkMediaMetadata> metadata;

  NetworkMedia(
    this.type,
    this.caption,
    this.metadata,
  );

  static const fromJsonFactory = _$NetworkMediaFromJson;

  factory NetworkMedia.fromJson(Map<String, dynamic> json) => _$NetworkMediaFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkMediaToJson(this);
}
