import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sales_purchase_app/features/purchasing/home/purchasing_home_view_model.dart';
import 'package:sales_purchase_app/ui/shared/app_color.dart';
import 'package:sales_purchase_app/features/base_view.dart';
import 'package:sales_purchase_app/ui/shared/app_font.dart';
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
    final PurchasingHomeViewModel model = Provider.of<PurchasingHomeViewModel>(context);
    return RefreshIndicator(
      color: AppColor.primary,
      onRefresh: model.refreshProduct,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NameTile(
                    name: model.user!.name,
                    role: AppUtils.getRoleString(model.user!.role),
                    purchasing: true,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Data Product',
                    style: AppFont.bold.copyWith(
                      color: AppColor.black,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final product = model.products[index];
                  return PurchasingProductCard(data: product);
                },
                childCount: model.products.length,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 20,
                childAspectRatio: 0.75,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
