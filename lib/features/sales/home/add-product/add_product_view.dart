import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sales_purchase_app/features/sales/home/add-product/add_product_view_model.dart';
import 'package:sales_purchase_app/ui/components/custom_button.dart';
import 'package:sales_purchase_app/ui/components/custom_text_field.dart';
import 'package:sales_purchase_app/ui/shared/app_color.dart';
import 'package:sales_purchase_app/features/base_view.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<AddProductViewModel>(
      model: AddProductViewModel(),
      onModelReady: (AddProductViewModel model) => model.initModel(),
      onModelDispose: (AddProductViewModel model) => model.disposeModel(),
      builder: (BuildContext context, AddProductViewModel model, _) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Add Product'),
          ),
          backgroundColor: AppColor.white,
          body: model.isBusy
              ? const Center(
                  child: CircularProgressIndicator(
                    color: AppColor.primary,
                  ),
                )
              : const AddProductContent(),
        );
      },
    );
  }
}

class AddProductContent extends StatelessWidget {
  const AddProductContent({super.key});

  @override
  Widget build(BuildContext context) {
    final AddProductViewModel model = Provider.of<AddProductViewModel>(context);
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          CustomTextField(
            controller: model.nameProductController,
            label: 'Name',
            textInputAction: TextInputAction.next,
            onChanged: (value) {
              model.updateNameProduct(value);
            },
          ),
          const SizedBox(
            height: 16.0,
          ),
          CustomTextField(
            controller: model.quantityProductController,
            label: 'Quantity',
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            onChanged: (value) {
              model.updateQuantityProduct(value);
            },
          ),
          const SizedBox(
            height: 16.0,
          ),
          CustomTextField(
            controller: model.descProductController,
            label: 'Description',
            textInputAction: TextInputAction.next,
            onChanged: (value) {
              model.updateDescProduct(value);
            },
          ),
          const SizedBox(
            height: 16.0,
          ),
          CustomTextField(
            controller: model.custNameController,
            label: 'Customer Name',
            textCapitalization: TextCapitalization.words,
            onChanged: (value) {
              model.updateCustName(value);
            },
          ),
          const SizedBox(
            height: 40.0,
          ),
          Button.filled(
            onPressed: model.isFormValid ? () async {} : null,
            label: 'Create',
          ),
        ],
      ),
    );
  }
}
