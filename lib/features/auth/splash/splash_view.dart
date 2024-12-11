import 'package:flutter/material.dart';
import 'package:sales_purchase_app/ui/shared/app_color.dart';
import 'package:sales_purchase_app/features/auth/splash/splash_view_model.dart';
import 'package:sales_purchase_app/features/base_view.dart';
import 'package:sales_purchase_app/ui/shared/app_font.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<SplashViewModel>(
      model: SplashViewModel(),
      onModelReady: (SplashViewModel model) => model.navigateSplash(context),
      onModelDispose: (SplashViewModel model) => model.disposeModel(),
      builder: (BuildContext context, SplashViewModel model, _) {
        return const Scaffold(
          backgroundColor: AppColor.primary,
          body: SplashContent(),
        );
      },
    );
  }
}

class SplashContent extends StatelessWidget {
  const SplashContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Sales Purchase App',
        style: AppFont.bold.copyWith(
          color: AppColor.white,
          fontSize: 32,
        ),
      ),
    );
  }
}
