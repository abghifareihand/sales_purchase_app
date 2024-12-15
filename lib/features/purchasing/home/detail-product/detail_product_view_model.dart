import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sales_purchase_app/core/api/base_api.dart';
import 'package:sales_purchase_app/core/models/purchasing/product_detail_model.dart';
import 'package:sales_purchase_app/core/services/pref_service.dart';
import 'package:sales_purchase_app/features/base_view_model.dart';

class DetailProductViewModel extends BaseViewModel {
  DetailProductViewModel({
    required this.baseApi,
    required this.productId,
  });

  final BaseApi baseApi;
  final int productId;

  String apiMessage = '';
  ProductDetailData? product;

  @override
  Future<void> initModel() async {
    setBusy(true);
    super.initModel();
    await fetchDetail();
    setBusy(false);
  }

  @override
  Future<void> disposeModel() async {
    super.disposeModel();
  }

  Future<void> fetchDetail() async {
    setBusy(true);
    try {
      final String? authToken = await PrefService.getAuthToken();
      final HttpResponse<ProductDetailResponse> productDetailResponse = await baseApi.purchasingGetDetailProduct(
        'Bearer $authToken',
        productId,
      );
      final statusCode = productDetailResponse.response.statusCode;
      final status = productDetailResponse.data.status;
      if (statusCode == 200 && status == 'success') {
        product = productDetailResponse.data.data;
      } else {
        apiMessage = 'Error fetching product details';
      }
    } on DioException catch (e) {
      apiMessage = 'Error: $e';
    }
    setBusy(false);
  }

  Future<void> refreshDetail() async {
    await fetchDetail();
  }
}
