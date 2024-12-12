import 'package:flutter/material.dart';
import 'package:sales_purchase_app/features/purchasing/home/purchasing_home_view_model.dart';
import 'package:sales_purchase_app/ui/shared/app_color.dart';
import 'package:sales_purchase_app/features/base_view.dart';
import 'package:sales_purchase_app/ui/shared/app_font.dart';

class PurchasingHomeView extends StatelessWidget {
  const PurchasingHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<PurchasingHomeViewModel>(
      model: PurchasingHomeViewModel(),
      onModelReady: (PurchasingHomeViewModel model) => model.initModel(),
      onModelDispose: (PurchasingHomeViewModel model) => model.disposeModel(),
      builder: (BuildContext context, PurchasingHomeViewModel model, _) {
        return Scaffold(
          backgroundColor: AppColor.background,
          body: model.isBusy
              ? const Center(
                  child: CircularProgressIndicator(
                    color: AppColor.primary,
                  ),
                )
              : const HomeContent(),
        );
      },
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 40.0,
          ),
          Center(
            child: Text(
              'PURCHASING HOME',
              style: AppFont.bold.copyWith(
                color: AppColor.black,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
