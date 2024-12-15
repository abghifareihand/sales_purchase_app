// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateUserResponse _$UpdateUserResponseFromJson(Map<String, dynamic> json) =>
    UpdateUserResponse(
      status: json['status'] as String,
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : UpdateUserData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UpdateUserResponseToJson(UpdateUserResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

UpdateUserData _$UpdateUserDataFromJson(Map<String, dynamic> json) =>
    UpdateUserData(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      username: json['username'] as String,
      role: (json['role'] as num).toInt(),
      fcmToken: json['fcm_token'] as String?,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );

Map<String, dynamic> _$UpdateUserDataToJson(UpdateUserData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'username': instance.username,
      'role': instance.role,
      'fcm_token': instance.fcmToken,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
