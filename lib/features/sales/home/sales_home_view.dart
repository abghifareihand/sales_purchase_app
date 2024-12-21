import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sales_purchase_app/features/sales/home/sales_home_view_model.dart';
import 'package:sales_purchase_app/ui/routes/app_routes.dart';
import 'package:sales_purchase_app/ui/shared/app_color.dart';
import 'package:sales_purchase_app/features/base_view.dart';
import 'package:sales_purchase_app/ui/shared/app_image.dart';
import 'package:sales_purchase_app/ui/shared/app_utils.dart';
import 'package:sales_purchase_app/ui/widgets/name_tile.dart';
import 'package:sales_purchase_app/ui/widgets/sales_menu_card.dart';

class SalesHomeView extends StatelessWidget {
  const SalesHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<SalesHomeViewModel>(
      model: SalesHomeViewModel(
        baseApi: Provider.of(context),
      ),
      onModelReady: (SalesHomeViewModel model) => model.initModel(),
      onModelDispose: (SalesHomeViewModel model) => model.disposeModel(),
      builder: (BuildContext context, SalesHomeViewModel model, _) {
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
    final SalesHomeViewModel model = Provider.of<SalesHomeViewModel>(context);
    return ListView(
      children: [
        NameTileSales(
          name: model.user!.name,
          role: AppUtils.getRoleString(model.user!.role),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SalesMenuCard(
              icon: AppImage.product,
              title: 'Create Product',
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.salesAddProduct,
                );
              },
            ),
            SalesMenuCard(
              icon: AppImage.vendor,
              title: 'Edit Product',
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.salesEditProduct,
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
