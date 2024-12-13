import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sales_purchase_app/core/services/shared_pref_service.dart';
import 'package:sales_purchase_app/features/base_view_model.dart';
import 'package:sales_purchase_app/ui/routes/app_routes.dart';

class SplashViewModel extends BaseViewModel {
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

  Future<void> navigateSplash(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));
    final authToken = await SharedPrefService.getAuthToken();
    final userId = await SharedPrefService.getUserId();
    final roleId = await SharedPrefService.getRoleId();

    log('Auth Token : $authToken');
    log('User ID : $userId');
    log('Role ID : $roleId');

    // if (context.mounted) {
    //   Navigator.of(context).pushNamedAndRemoveUntil(
    //     AppRoutes.authLogin,
    //     (Route<dynamic> route) => false,
    //   );
    // }

    if (context.mounted) {
      if (authToken != null && userId != null) {
        if (roleId == 1) {
          Navigator.of(context).pushReplacementNamed(
            AppRoutes.salesMain,
          );
        }
        if (roleId == 2) {
          Navigator.of(context).pushReplacementNamed(
            AppRoutes.purchasingMain,
          );
        }
      } else {
        Navigator.of(context).pushReplacementNamed(
          AppRoutes.authLogin,
        );
      }
    }
  }
}
