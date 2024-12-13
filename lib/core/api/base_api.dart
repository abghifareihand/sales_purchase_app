import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sales_purchase_app/core/models/auth/login_model.dart';
import 'package:sales_purchase_app/core/models/purchasing/product_detail_model.dart';
import 'package:sales_purchase_app/core/models/purchasing/product_model.dart';
import 'package:sales_purchase_app/core/models/sales/add_product_model.dart';

part 'base_api.g.dart';

@RestApi()
abstract class BaseApi {
  factory BaseApi(Dio dio, {String baseUrl}) = _BaseApi;

  @POST('/api/sales-request/login')
  Future<HttpResponse<LoginResponse>> login(
    @Body() LoginRequest request,
  );

  @GET('/api/sales-request/data')
  Future<HttpResponse<ProductResponse>> getProductList();

  @GET('/api/sales-request/detail')
  Future<HttpResponse<ProductDetailResponse>> getDetailProduct(
    @Query('id') int productId,
  );

  @POST('/api/sales-request/create')
  @MultiPart()
  Future<HttpResponse<AddProductResponse>> addProduct(
    @Part(name: 'id_sales') String idSales,
    @Part(name: 'date_request') String dateRequest,
    @Part(name: 'product_name') String productName,
    @Part(name: 'product_photo') File productPhoto,
    @Part(name: 'quantity') String quantity,
    @Part(name: 'description') String description,
    @Part(name: 'part_number') String partNumber,
    @Part(name: 'customer_name') String customerName,
  );
}
