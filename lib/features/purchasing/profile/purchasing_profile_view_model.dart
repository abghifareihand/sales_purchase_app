import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sales_purchase_app/core/api/base_api.dart';
import 'package:sales_purchase_app/core/models/auth/user_model.dart';
import 'package:sales_purchase_app/core/services/pref_service.dart';
import 'package:sales_purchase_app/features/base_view_model.dart';
import 'package:sales_purchase_app/ui/components/custom_snackbar.dart';
import 'package:sales_purchase_app/ui/routes/app_routes.dart';
import 'package:sales_purchase_app/ui/shared/app_color.dart';

class PurchasingProfileViewModel extends BaseViewModel {
  PurchasingProfileViewModel({
    required this.baseApi,
  });

  final BaseApi baseApi;
  String apiMessage = '';
  UserData? user;

  @override
  Future<void> initModel() async {
    setBusy(true);
    super.initModel();
    await fetchUser();
    setBusy(false);
  }

  @override
  Future<void> disposeModel() async {
    super.disposeModel();
  }

  Future<void> fetchUser() async {
    setBusy(true);
    try {
      final String? authToken = await PrefService.getAuthToken();
      final HttpResponse<UserResponse> userResponse = await baseApi.getUser(
        'Bearer $authToken',
      );
      final statusCode = userResponse.response.statusCode;
      final status = userResponse.data.status;
      if (statusCode == 200 && status == 'success') {
        user = userResponse.data.data;
      } else {
        apiMessage = 'Error fetching user';
      }
    } on DioException catch (e) {
      apiMessage = 'Error: $e';
    }
    setBusy(false);
  }

  Future<void> logout(BuildContext context) async {
    await PrefService.logout();
    if (context.mounted) {
      CustomSnackbar.show(
        context,
        message: 'Logout success',
        backgroundColor: AppColor.secondary,
      );
      Navigator.of(context).pushNamedAndRemoveUntil(
        AppRoutes.authLogin,
        (Route<dynamic> route) => false,
      );
    }
  }
}
