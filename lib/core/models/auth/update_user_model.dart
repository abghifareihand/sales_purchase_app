import 'package:json_annotation/json_annotation.dart';

part 'update_user_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class UpdateUserResponse {
  const UpdateUserResponse({
    required this.status,
    required this.message,
    this.data,
  });

  factory UpdateUserResponse.fromJson(Map<String, dynamic> json) => _$UpdateUserResponseFromJson(json);

  final String status;
  final String message;
  final UpdateUserData? data;

  Map<String, dynamic> toJson() => _$UpdateUserResponseToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class UpdateUserData {
  const UpdateUserData({
    required this.id,
    required this.name,
    required this.username,
    required this.role,
    this.fcmToken,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UpdateUserData.fromJson(Map<String, dynamic> json) => _$UpdateUserDataFromJson(json);

  final int id;
  final String name;
  final String username;
  final int role;
  final String? fcmToken;
  final String createdAt;
  final String updatedAt;

  Map<String, dynamic> toJson() => _$UpdateUserDataToJson(this);
}
