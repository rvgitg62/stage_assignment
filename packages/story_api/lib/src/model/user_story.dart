import 'package:json_annotation/json_annotation.dart';
import 'package:story_api/src/model/user.dart';

import 'reel.dart';

part 'user_story.g.dart';

@JsonSerializable()
class UserStory {
  String id;
  User user;
  List<Reel>? reels;

  UserStory({
    required this.id,
    required this.user,
    this.reels,
  });

  factory UserStory.fromJson(Map<String, dynamic> json) => _$UserStoryFromJson(json);

  Map<String, dynamic> toJson() => _$UserStoryToJson(this);

  copyWith({
    String? id,
    User? user,
    List<Reel>? reels,
  }) {
    return UserStory(
      id: id ?? this.id,
      user: user ?? this.user,
      reels: reels ?? this.reels,
    );
  }
}
