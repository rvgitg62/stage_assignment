// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Reel _$ReelFromJson(Map<String, dynamic> json) => Reel(
      id: json['id'] as String,
      mediaType: $enumDecodeNullable(_$MediaTypeEnumMap, json['mediaType']),
      mediaUrl: json['mediaUrl'] as String?,
    );

Map<String, dynamic> _$ReelToJson(Reel instance) => <String, dynamic>{
      'id': instance.id,
      'mediaType': _$MediaTypeEnumMap[instance.mediaType],
      'mediaUrl': instance.mediaUrl,
    };

const _$MediaTypeEnumMap = {
  MediaType.image: 'image',
  MediaType.video: 'video',
};
