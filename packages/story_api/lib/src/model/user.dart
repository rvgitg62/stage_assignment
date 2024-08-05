import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()

/// user details
class User {
  /// constructor for [User]
  User({
    required this.id,
    required this.name,
    this.profilePicture,
  });

  /// user id
  String id;

  /// user name
  String name;

  /// user profile picture
  String? profilePicture;

  /// factory method to create a new [User] from a json
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  /// method to convert a [User] to a json
  Map<String, dynamic> toJson() => _$UserToJson(this);

  // add documentation for copyWith
  /*
  * Returns a new [User] with updated attributes.
  * */
  User copyWith({
    String? id,
    String? name,
    String? profilePicture,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      profilePicture: profilePicture ?? this.profilePicture,
    );
  }
}
