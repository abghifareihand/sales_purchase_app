import 'package:flutter/material.dart';
import 'package:sales_purchase_app/features/sales/home/sales_home_view_model.dart';
import 'package:sales_purchase_app/ui/shared/app_color.dart';
import 'package:sales_purchase_app/features/base_view.dart';
import 'package:sales_purchase_app/ui/shared/app_font.dart';

class SalesHomeView extends StatelessWidget {
  const SalesHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<SalesHomeViewModel>(
      model: SalesHomeViewModel(),
      onModelReady: (SalesHomeViewModel model) => model.initModel(),
      onModelDispose: (SalesHomeViewModel model) => model.disposeModel(),
      builder: (BuildContext context, SalesHomeViewModel model, _) {
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
              'SALES HOME',
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
