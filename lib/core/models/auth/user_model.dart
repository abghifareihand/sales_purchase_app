import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class UserResponse {
  const UserResponse({
    required this.status,
    required this.message,
    this.data,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) => _$UserResponseFromJson(json);

  final String status;
  final String message;
  final UserData? data;

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class UserData {
  const UserData({
    required this.id,
    required this.name,
    required this.username,
    required this.role,
    this.fcmToken,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);

  final int id;
  final String name;
  final String username;
  final int role;
  final String? fcmToken;
  final String createdAt;
  final String updatedAt;

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}
