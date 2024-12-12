// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddProductResponse _$AddProductResponseFromJson(Map<String, dynamic> json) =>
    AddProductResponse(
      status: json['status'] as String,
      message: json['message'] as String,
      data: ProductData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddProductResponseToJson(AddProductResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

ProductData _$ProductDataFromJson(Map<String, dynamic> json) => ProductData(
      idSales: json['id_sales'] as String,
      dateRequest: json['date_request'] as String,
      productName: json['product_name'] as String,
      productPhoto: json['product_photo'] as String,
      quantity: json['quantity'] as String,
      description: json['description'] as String,
      partNumber: json['part_number'] as String,
      customerName: json['customer_name'] as String,
      updatedAt: json['updated_at'] as String,
      createdAt: json['created_at'] as String,
      id: (json['id'] as num).toInt(),
    );

Map<String, dynamic> _$ProductDataToJson(ProductData instance) =>
    <String, dynamic>{
      'id_sales': instance.idSales,
      'date_request': instance.dateRequest,
      'product_name': instance.productName,
      'product_photo': instance.productPhoto,
      'quantity': instance.quantity,
      'description': instance.description,
      'part_number': instance.partNumber,
      'customer_name': instance.customerName,
      'updated_at': instance.updatedAt,
      'created_at': instance.createdAt,
      'id': instance.id,
    };
