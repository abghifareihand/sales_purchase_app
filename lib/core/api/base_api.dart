import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sales_purchase_app/core/models/auth/login_model.dart';

part 'base_api.g.dart';

@RestApi()
abstract class BaseApi {
  factory BaseApi(Dio dio, {String baseUrl}) = _BaseApi;

  @POST('/api/sales-request/login')
  Future<HttpResponse<LoginResponse>> login(
    @Body() LoginRequest request,
  );
}
