// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_story.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserStory _$UserStoryFromJson(Map<String, dynamic> json) => UserStory(
      id: json['id'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      reels: (json['reels'] as List<dynamic>?)
          ?.map((e) => Reel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserStoryToJson(UserStory instance) => <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'reels': instance.reels,
    };
