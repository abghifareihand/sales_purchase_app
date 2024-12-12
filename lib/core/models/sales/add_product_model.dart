import 'package:json_annotation/json_annotation.dart';

part 'add_product_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class AddProductResponse {
  const AddProductResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory AddProductResponse.fromJson(Map<String, dynamic> json) => _$AddProductResponseFromJson(json);

  final String status;
  final String message;
  final ProductData data;

  Map<String, dynamic> toJson() => _$AddProductResponseToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class ProductData {
  const ProductData({
    required this.idSales,
    required this.dateRequest,
    required this.productName,
    required this.productPhoto,
    required this.quantity,
    required this.description,
    required this.partNumber,
    required this.customerName,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  factory ProductData.fromJson(Map<String, dynamic> json) => _$ProductDataFromJson(json);

  final String idSales;
  final String dateRequest;
  final String productName;
  final String productPhoto;
  final String quantity;
  final String description;
  final String partNumber;
  final String customerName;
  final String updatedAt;
  final String createdAt;
  final int id;

  Map<String, dynamic> toJson() => _$ProductDataToJson(this);
}
