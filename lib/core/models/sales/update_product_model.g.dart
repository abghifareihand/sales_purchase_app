// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateProductResponse _$UpdateProductResponseFromJson(
        Map<String, dynamic> json) =>
    UpdateProductResponse(
      status: json['status'] as String,
      message: json['message'] as String,
      data: json['data'] as bool,
    );

Map<String, dynamic> _$UpdateProductResponseToJson(
        UpdateProductResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
