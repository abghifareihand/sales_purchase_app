import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ProductResponse {
  const ProductResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ProductResponse.fromJson(Map<String, dynamic> json) => _$ProductResponseFromJson(json);

  final String status;
  final String message;
  final List<ProductData> data;

  Map<String, dynamic> toJson() => _$ProductResponseToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class ProductData {
  const ProductData({
    required this.id,
    required this.idSales,
    required this.dateRequest,
    required this.productName,
    required this.productPhoto,
    required this.quantity,
    required this.description,
    required this.partNumber,
    required this.customerName,
    required this.status,
    this.capitalPrice,
    this.deliveryType,
    this.shippingCost,
    this.deliveryDuration,
    this.availableStock,
    this.supplierName,
    this.supplierAddress,
    required this.photoFromSupplier,
    this.picSupplier,
    this.picPhoneNumber,
    this.ownStock,
    required this.createdAt,
    required this.updatedAt,
    required this.marginMinimal,
    required this.marginMaximal,
    required this.hargaJualMinimal,
    required this.hargaJualMaximal,
  });

  factory ProductData.fromJson(Map<String, dynamic> json) => _$ProductDataFromJson(json);

  final int id;
  final int idSales;
  final String dateRequest;
  final String productName;
  final String productPhoto;
  final int quantity;
  final String description;
  final String partNumber;
  final String customerName;
  final int status;
  final int? capitalPrice;
  final String? deliveryType;
  final int? shippingCost;
  final int? deliveryDuration;
  final int? availableStock;
  final String? supplierName;
  final String? supplierAddress;
  final String photoFromSupplier;
  final String? picSupplier;
  final String? picPhoneNumber;
  final int? ownStock;
  final String createdAt;
  final String updatedAt;
  final double marginMinimal;
  final double marginMaximal;
  final int hargaJualMinimal;
  final int hargaJualMaximal;
}
