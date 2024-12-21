import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sales_purchase_app/features/purchasing/home/purchasing_home_view_model.dart';
import 'package:sales_purchase_app/ui/shared/app_color.dart';
import 'package:sales_purchase_app/features/base_view.dart';
import 'package:sales_purchase_app/ui/shared/app_utils.dart';
import 'package:sales_purchase_app/ui/widgets/name_tile.dart';
import 'package:sales_purchase_app/ui/widgets/purchasing_product_card.dart';

class PurchasingHomeView extends StatelessWidget {
  const PurchasingHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<PurchasingHomeViewModel>(
      model: PurchasingHomeViewModel(
        baseApi: Provider.of(context),
      ),
      onModelReady: (PurchasingHomeViewModel model) => model.initModel(),
      onModelDispose: (PurchasingHomeViewModel model) => model.disposeModel(),
      builder: (BuildContext context, PurchasingHomeViewModel model, _) {
        return Scaffold(
          backgroundColor: AppColor.white,
          body: model.isBusy
              ? const Center(
                  child: CircularProgressIndicator(
                    color: AppColor.secondary,
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
    final PurchasingHomeViewModel model = Provider.of<PurchasingHomeViewModel>(context);
    return RefreshIndicator(
      color: AppColor.secondary,
      onRefresh: () => model.refreshProduct(),
      child: ListView(
        children: [
          NameTilePurchasing(
            name: model.user!.name,
            role: AppUtils.getRoleString(model.user!.role),
          ),
          const SizedBox(
            height: 20.0,
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: model.products.length,
            padding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 20,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 0.8,
            ),
            itemBuilder: (context, index) {
              return PurchasingProductCard(
                data: model.products[index],
              );
            },
          ),
        ],
      ),
    );
  }
}
