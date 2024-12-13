import 'package:json_annotation/json_annotation.dart';

part 'login_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class LoginRequest {
  const LoginRequest({
    required this.username,
    required this.password,
  });

  factory LoginRequest.fromJson(Map<String, dynamic> json) => _$LoginRequestFromJson(json);

  final String username;
  final String password;

  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class LoginResponse {
  const LoginResponse({
    required this.status,
    required this.message,
    this.data,
    this.token,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);

  final String status;
  final String message;
  final LoginData? data;
  final String? token;

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class LoginData {
  const LoginData({
    required this.id,
    required this.name,
    required this.username,
    required this.role,
    this.fcmToken,
    required this.createdAt,
    required this.updatedAt,
  });

  factory LoginData.fromJson(Map<String, dynamic> json) => _$LoginDataFromJson(json);

  final int id;
  final String name;
  final String username;
  final int role;
  final String? fcmToken;
  final String createdAt;
  final String updatedAt;

  Map<String, dynamic> toJson() => _$LoginDataToJson(this);
}
