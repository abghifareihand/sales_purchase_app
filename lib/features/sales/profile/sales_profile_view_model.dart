import 'package:flutter/material.dart';
import 'package:sales_purchase_app/core/services/pref_service.dart';
import 'package:sales_purchase_app/features/base_view_model.dart';
import 'package:sales_purchase_app/ui/components/custom_snackbar.dart';
import 'package:sales_purchase_app/ui/routes/app_routes.dart';
import 'package:sales_purchase_app/ui/shared/app_color.dart';

class SalesProfileViewModel extends BaseViewModel {
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

  Future<void> logout(BuildContext context) async {
    await PrefService.logout();
    if (context.mounted) {
      CustomSnackbar.show(
        context,
        message: 'Logout success',
        backgroundColor: AppColor.primary,
      );
      Navigator.of(context).pushNamedAndRemoveUntil(
        AppRoutes.authLogin,
        (Route<dynamic> route) => false,
      );
    }
  }
}
