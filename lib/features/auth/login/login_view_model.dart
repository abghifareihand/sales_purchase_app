import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sales_purchase_app/core/api/base_api.dart';
import 'package:sales_purchase_app/core/models/auth/login_model.dart';
import 'package:sales_purchase_app/core/services/pref_service.dart';
import 'package:sales_purchase_app/core/services/remote_service.dart';
import 'package:sales_purchase_app/features/base_view_model.dart';
import 'package:sales_purchase_app/ui/components/custom_error_dialog.dart';
import 'package:sales_purchase_app/ui/components/custom_loading_dialog.dart';
import 'package:sales_purchase_app/ui/components/custom_snackbar.dart';
import 'package:sales_purchase_app/ui/routes/app_routes.dart';
import 'package:sales_purchase_app/ui/shared/app_color.dart';

class LoginViewModel extends BaseViewModel {
  LoginViewModel({
    required this.baseApi,
  });
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final BaseApi baseApi;
  String apiMessage = '';

  @override
  Future<void> initModel() async {
    setBusy(true);
    super.initModel();
    setBusy(false);
  }

  @override
  Future<void> disposeModel() async {
    usernameController.dispose();
    passwordController.dispose();
    super.disposeModel();
  }

  bool get isFormValid {
    return usernameController.text.isNotEmpty && passwordController.text.isNotEmpty;
  }

  void updateUsername(String value) {
    usernameController.text = value;
    notifyListeners();
  }

  void updatePassword(String value) {
    passwordController.text = value;
    notifyListeners();
  }

  Future<void> login(BuildContext context) async {
    setBusy(true);
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return const CustomLoadingDialog(
          color: AppColor.primary,
        );
      },
    );
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
        await PrefService.saveAuthToken(result.token!);
        await PrefService.saveRoleId(result.data!.role);
        await PrefService.saveUserId(result.data!.id);

        final role = result.data?.role;
        apiMessage = result.data!.username;

        if (role == 1) {
          if (context.mounted) {
            Navigator.of(context).pop();
            await Navigator.of(context).pushReplacementNamed(
              AppRoutes.salesMain,
            );
          }
        } else if (role == 2) {
          if (context.mounted) {
            Navigator.of(context).pop();
            await Navigator.of(context).pushReplacementNamed(
              AppRoutes.purchasingMain,
            );
          }
        } else {
          if (context.mounted) {
            Navigator.of(context, rootNavigator: true).pop();
            await showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return const CustomErrorDialog(
                  title: 'Admin login via website',
                );
              },
            );
          }
        }
      } else if (statusCode == 200 && status == 'error') {
        if (context.mounted) {
          Navigator.of(context, rootNavigator: true).pop();
          await showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return const CustomErrorDialog(
                title: 'Incorrect username or password',
              );
            },
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
