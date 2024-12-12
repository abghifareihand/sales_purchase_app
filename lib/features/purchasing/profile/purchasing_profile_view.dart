import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sales_purchase_app/features/purchasing/profile/purchasing_profile_view_model.dart';
import 'package:sales_purchase_app/ui/components/custom_button.dart';
import 'package:sales_purchase_app/ui/shared/app_color.dart';
import 'package:sales_purchase_app/features/base_view.dart';

class PurchasingProfileView extends StatelessWidget {
  const PurchasingProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<PurchasingProfileViewModel>(
      model: PurchasingProfileViewModel(),
      onModelReady: (PurchasingProfileViewModel model) => model.initModel(),
      onModelDispose: (PurchasingProfileViewModel model) => model.disposeModel(),
      builder: (BuildContext context, PurchasingProfileViewModel model, _) {
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
    final PurchasingProfileViewModel model = Provider.of<PurchasingProfileViewModel>(context);
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
