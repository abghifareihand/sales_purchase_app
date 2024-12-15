import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sales_purchase_app/core/models/auth/login_model.dart';
import 'package:sales_purchase_app/core/models/auth/user_model.dart';
import 'package:sales_purchase_app/core/models/purchasing/product_detail_model.dart';
import 'package:sales_purchase_app/core/models/purchasing/product_model.dart';
import 'package:sales_purchase_app/core/models/sales/add_product_model.dart';
import 'package:sales_purchase_app/core/models/sales/update_product_model.dart';

part 'base_api.g.dart';

@RestApi()
abstract class BaseApi {
  factory BaseApi(Dio dio, {String baseUrl}) = _BaseApi;

  /// [AUTH]
  @POST('/api/sales-request/login')
  Future<HttpResponse<LoginResponse>> login(
    @Body() LoginRequest request,
  );

  @GET('/api/sales-request/user')
  Future<HttpResponse<UserResponse>> getUser(
    @Header('Authorization') String bearerToken,
  );

  /// [PURCHASING]
  @GET('/api/sales-request/data')
  Future<HttpResponse<ProductResponse>> purchasingGetProduct(
    @Header('Authorization') String bearerToken,
  );

  @GET('/api/sales-request/detail')
  Future<HttpResponse<ProductDetailResponse>> purchasingGetDetailProduct(
    @Header('Authorization') String bearerToken,
    @Query('id') int productId,
  );

  /// [SALES]
  @POST('/api/sales-request/create')
  @MultiPart()
  Future<HttpResponse<AddProductResponse>> salesAddProduct(
    @Header('Authorization') String bearerToken,
    @Part(name: 'id_sales') String idSales,
    @Part(name: 'date_request') String dateRequest,
    @Part(name: 'product_name') String productName,
    @Part(name: 'product_photo') File productPhoto,
    @Part(name: 'quantity') String quantity,
    @Part(name: 'description') String description,
    @Part(name: 'part_number') String partNumber,
    @Part(name: 'customer_name') String customerName,
  );

  @POST('/api/sales-request/update')
  @MultiPart()
  Future<HttpResponse<UpdateProductResponse>> salesUpdateProduct(
    @Header('Authorization') String bearerToken,
    @Part(name: 'id') String id,
    @Part(name: 'capital_price') String capitalPrice,
    @Part(name: 'delivery_type') String deliveryType,
    @Part(name: 'shipping_cost') String shippingCost,
    @Part(name: 'delivery_duration') String deliveryDuration,
    @Part(name: 'available_stock') String availableStock,
    @Part(name: 'supplier_name') String supplierName,
    @Part(name: 'photo_from_supplier') File photoFromSupplier,
    @Part(name: 'pic_supplier') String picSupplier,
    @Part(name: 'pic_phone_number') String picPhoneNumber,
    @Part(name: 'own_stock') String ownStock,
  );

  @GET('/api/sales-request/data')
  Future<HttpResponse<ProductResponse>> salesGetProduct(
    @Header('Authorization') String bearerToken,
  );
}
