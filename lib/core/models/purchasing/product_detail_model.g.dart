// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDetailResponse _$ProductDetailResponseFromJson(
        Map<String, dynamic> json) =>
    ProductDetailResponse(
      status: json['status'] as String,
      message: json['message'] as String,
      data: ProductDetailData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductDetailResponseToJson(
        ProductDetailResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

ProductDetailData _$ProductDetailDataFromJson(Map<String, dynamic> json) =>
    ProductDetailData(
      id: (json['id'] as num).toInt(),
      idSales: (json['id_sales'] as num).toInt(),
      dateRequest: json['date_request'] as String,
      productName: json['product_name'] as String,
      productPhoto: json['product_photo'] as String,
      quantity: (json['quantity'] as num).toInt(),
      description: json['description'] as String,
      partNumber: json['part_number'] as String,
      customerName: json['customer_name'] as String,
      status: (json['status'] as num).toInt(),
      capitalPrice: (json['capital_price'] as num?)?.toInt(),
      deliveryType: json['delivery_type'] as String?,
      shippingCost: (json['shipping_cost'] as num?)?.toInt(),
      deliveryDuration: (json['delivery_duration'] as num?)?.toInt(),
      availableStock: (json['available_stock'] as num?)?.toInt(),
      supplierName: json['supplier_name'] as String?,
      supplierAddress: json['supplier_address'] as String?,
      photoFromSupplier: json['photo_from_supplier'] as String,
      picSupplier: json['pic_supplier'] as String?,
      picPhoneNumber: json['pic_phone_number'] as String?,
      ownStock: (json['own_stock'] as num?)?.toInt(),
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      marginMinimal: (json['margin_minimal'] as num).toDouble(),
      marginMaximal: (json['margin_maximal'] as num).toDouble(),
      hargaJualMinimal: (json['harga_jual_minimal'] as num).toDouble(),
      hargaJualMaximal: (json['harga_jual_maximal'] as num).toDouble(),
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductDetailDataToJson(ProductDetailData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'id_sales': instance.idSales,
      'date_request': instance.dateRequest,
      'product_name': instance.productName,
      'product_photo': instance.productPhoto,
      'quantity': instance.quantity,
      'description': instance.description,
      'part_number': instance.partNumber,
      'customer_name': instance.customerName,
      'status': instance.status,
      'capital_price': instance.capitalPrice,
      'delivery_type': instance.deliveryType,
      'shipping_cost': instance.shippingCost,
      'delivery_duration': instance.deliveryDuration,
      'available_stock': instance.availableStock,
      'supplier_name': instance.supplierName,
      'supplier_address': instance.supplierAddress,
      'photo_from_supplier': instance.photoFromSupplier,
      'pic_supplier': instance.picSupplier,
      'pic_phone_number': instance.picPhoneNumber,
      'own_stock': instance.ownStock,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'margin_minimal': instance.marginMinimal,
      'margin_maximal': instance.marginMaximal,
      'harga_jual_minimal': instance.hargaJualMinimal,
      'harga_jual_maximal': instance.hargaJualMaximal,
      'user': instance.user,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      username: json['username'] as String,
      role: (json['role'] as num).toInt(),
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'username': instance.username,
      'role': instance.role,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
