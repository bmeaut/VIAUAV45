// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_media_metadata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkMediaMetadata _$NetworkMediaMetadataFromJson(
        Map<String, dynamic> json) =>
    NetworkMediaMetadata(
      json['url'] as String,
      json['format'] as String,
      json['width'] as int,
      json['height'] as int,
    );

Map<String, dynamic> _$NetworkMediaMetadataToJson(
        NetworkMediaMetadata instance) =>
    <String, dynamic>{
      'url': instance.url,
      'format': instance.format,
      'width': instance.width,
      'height': instance.height,
    };
