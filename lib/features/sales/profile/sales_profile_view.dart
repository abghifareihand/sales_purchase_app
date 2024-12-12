import 'package:flutter/material.dart';
import 'package:sales_purchase_app/features/sales/profile/sales_profile_view_model.dart';
import 'package:sales_purchase_app/ui/shared/app_color.dart';
import 'package:sales_purchase_app/features/base_view.dart';
import 'package:sales_purchase_app/ui/shared/app_font.dart';

class SalesProfileView extends StatelessWidget {
  const SalesProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<SalesProfileViewModel>(
      model: SalesProfileViewModel(),
      onModelReady: (SalesProfileViewModel model) => model.initModel(),
      onModelDispose: (SalesProfileViewModel model) => model.disposeModel(),
      builder: (BuildContext context, SalesProfileViewModel model, _) {
        return Scaffold(
          backgroundColor: AppColor.white,
          body: model.isBusy
              ? const Center(
                  child: CircularProgressIndicator(
                    color: AppColor.primary,
                  ),
                )
              : const ProfileContent(),
        );
      },
    );
  }
}

class ProfileContent extends StatelessWidget {
  const ProfileContent({super.key});

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
              'SALES PROFILE',
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
