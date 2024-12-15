import 'package:json_annotation/json_annotation.dart';

part 'update_product_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class UpdateProductResponse {
  const UpdateProductResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory UpdateProductResponse.fromJson(Map<String, dynamic> json) => _$UpdateProductResponseFromJson(json);

  final String status;
  final String message;
  final bool data;

  Map<String, dynamic> toJson() => _$UpdateProductResponseToJson(this);
}
