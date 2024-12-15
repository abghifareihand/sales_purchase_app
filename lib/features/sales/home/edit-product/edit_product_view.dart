import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sales_purchase_app/features/sales/home/edit-product/edit_product_view_model.dart';
import 'package:sales_purchase_app/ui/shared/app_color.dart';
import 'package:sales_purchase_app/features/base_view.dart';
import 'package:sales_purchase_app/ui/widgets/sales_product_card.dart';

class EditProductView extends StatelessWidget {
  const EditProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<EditProductViewModel>(
      model: EditProductViewModel(
        baseApi: Provider.of(context),
      ),
      onModelReady: (EditProductViewModel model) => model.initModel(),
      onModelDispose: (EditProductViewModel model) => model.disposeModel(),
      builder: (BuildContext context, EditProductViewModel model, _) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('My Product'),
          ),
          backgroundColor: AppColor.white,
          body: model.isBusy
              ? const Center(
                  child: CircularProgressIndicator(
                    color: AppColor.primary,
                  ),
                )
              : const EditProductContent(),
        );
      },
    );
  }
}

class EditProductContent extends StatelessWidget {
  const EditProductContent({super.key});

  @override
  Widget build(BuildContext context) {
    final EditProductViewModel model = Provider.of<EditProductViewModel>(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.separated(
            padding: const EdgeInsets.all(20),
            itemCount: model.products.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => const SizedBox(
              height: 16.0,
            ),
            itemBuilder: (context, index) {
              final product = model.products[index];
              return SalesProductCard(data: product);
            },
          ),
        ],
      ),
    );
  }
}
