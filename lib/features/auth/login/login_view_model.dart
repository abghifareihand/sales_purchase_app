import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:retrofit/dio.dart';
import 'package:sales_purchase_app/core/api/base_api.dart';
import 'package:sales_purchase_app/core/models/auth/login_model.dart';
import 'package:sales_purchase_app/features/base_view_model.dart';
import 'package:sales_purchase_app/ui/components/custom_error_dialog.dart';
import 'package:sales_purchase_app/ui/components/custom_snackbar.dart';
import 'package:sales_purchase_app/ui/routes/app_routes.dart';
import 'package:sales_purchase_app/ui/shared/app_color.dart';

class LoginViewModel extends BaseViewModel {
  LoginViewModel({
    required this.baseApi,
  });
  final BaseApi baseApi;
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String apiMessage = '';

  @override
  Future<void> initModel() async {
    setBusy(true);
    super.initModel();
    setBusy(false);
  }

  @override
  Future<void> disposeModel() async {
    super.disposeModel();
  }

  bool get isFormValid {
    return usernameController.text.isNotEmpty && passwordController.text.isNotEmpty;
  }

  void updateUsername(String username) {
    usernameController.text = username;
    notifyListeners();
  }

  void updatePassword(String password) {
    passwordController.text = password;
    notifyListeners();
  }

  Future<void> login(BuildContext context) async {
    setBusy(true);
    try {
      final LoginRequest request = LoginRequest(
        username: usernameController.text,
        password: passwordController.text,
      );

      final HttpResponse<LoginResponse> loginResponse = await baseApi.login(
        request,
      );
      final statusCode = loginResponse.response.statusCode;
      final status = loginResponse.data.status;
      if (statusCode == 200 && status == 'success') {
        final LoginResponse result = loginResponse.data;
        final role = result.data?.role;
        apiMessage = result.data!.username;
        if (role == 1) {
          if (context.mounted) {
            await Navigator.of(context).pushReplacementNamed(
              AppRoutes.salesMain,
            );
          }
        } else if (role == 2) {
          if (context.mounted) {
            await Navigator.of(context).pushReplacementNamed(
              AppRoutes.purchasingMain,
            );
          }
        } else {
          if (context.mounted) {
            await showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return const CustomErrorDialog(
                  title: 'Admin login di website',
                );
              },
            );
          }
        }
      } else if (statusCode == 200 && status == 'error') {
        if (context.mounted) {
          CustomSnackbar.show(
            context,
            message: 'Username atau password salah',
            backgroundColor: AppColor.red,
          );
        }
      }
    } on DioException catch (e) {
      if (context.mounted) {
        CustomSnackbar.show(
          context,
          message: 'Error: $e',
          backgroundColor: AppColor.red,
        );
      }
    }
    setBusy(false);
  }
}
