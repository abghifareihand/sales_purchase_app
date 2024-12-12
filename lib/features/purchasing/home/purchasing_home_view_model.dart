import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';
import 'package:sales_purchase_app/core/api/base_api.dart';
import 'package:sales_purchase_app/core/models/purchasing/product_model.dart';
import 'package:sales_purchase_app/features/base_view_model.dart';

class PurchasingHomeViewModel extends BaseViewModel {
  PurchasingHomeViewModel({
    required this.baseApi,
  });

  final BaseApi baseApi;
  List<ProductData> products = [];
  String apiMessage = '';

  @override
  Future<void> initModel() async {
    setBusy(true);
    super.initModel();
    await fetchProduct();
    setBusy(false);
  }

  @override
  Future<void> disposeModel() async {
    super.disposeModel();
  }

  Future<void> fetchProduct() async {
    setBusy(true);
    try {
      final HttpResponse<ProductResponse> productResponse = await baseApi.getProductData();
      final statusCode = productResponse.response.statusCode;
      final status = productResponse.data.status;
      if (statusCode == 200 && status == 'success') {
        products = productResponse.data.data;
      } else if (products.isEmpty) {
        apiMessage = 'No products available';
      } else {
        apiMessage = 'Error fetching products';
      }
    } on DioException catch (e) {
      apiMessage = 'Error: $e';
    }
    setBusy(false);
  }

  Future<void> refreshProduct() async {
    await fetchProduct();
  }
}
