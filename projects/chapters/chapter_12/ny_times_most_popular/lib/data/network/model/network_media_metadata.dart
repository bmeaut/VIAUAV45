import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'network_media_metadata.g.dart';

@immutable
@JsonSerializable()
class NetworkMediaMetadata {
  final String url;
  final String format;
  final int width;
  final int height;

  NetworkMediaMetadata(
    this.url,
    this.format,
    this.width,
    this.height,
  );

  static const fromJsonFactory = _$NetworkMediaMetadataFromJson;

  factory NetworkMediaMetadata.fromJson(Map<String, dynamic> json) => _$NetworkMediaMetadataFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkMediaMetadataToJson(this);
}
