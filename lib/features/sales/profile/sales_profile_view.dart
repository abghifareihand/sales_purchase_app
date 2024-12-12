import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sales_purchase_app/features/sales/profile/sales_profile_view_model.dart';
import 'package:sales_purchase_app/ui/components/custom_button.dart';
import 'package:sales_purchase_app/ui/shared/app_color.dart';
import 'package:sales_purchase_app/features/base_view.dart';

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
    final SalesProfileViewModel model = Provider.of<SalesProfileViewModel>(context);
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SizedBox(
            height: 40.0,
          ),
          Button.filled(
            onPressed: () => model.logout(context),
            label: 'Logout',
          ),
        ],
      ),
    );
  }
}
