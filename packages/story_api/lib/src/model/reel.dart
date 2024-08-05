import 'package:json_annotation/json_annotation.dart';
import 'package:story_api/src/model/media_type.dart';

part 'reel.g.dart';

@JsonSerializable()
class Reel {
  String id;
  MediaType? mediaType;
  String? mediaUrl;
  bool isViewed = false;

  Reel({
    required this.id,
    this.mediaType,
    this.mediaUrl,
    this.isViewed = false,
  });

  factory Reel.fromJson(Map<String, dynamic> json) => _$ReelFromJson(json);

  Map<String, dynamic> toJson() => _$ReelToJson(this);

  copyWith({
    String? id,
    MediaType? mediaType,
    String? mediaUrl,
    bool? isViewed,
  }) {
    return Reel(
      id: id ?? this.id,
      mediaType: mediaType ?? this.mediaType,
      mediaUrl: mediaUrl ?? this.mediaUrl,
      isViewed: isViewed ?? this.isViewed,
    );
  }
}
