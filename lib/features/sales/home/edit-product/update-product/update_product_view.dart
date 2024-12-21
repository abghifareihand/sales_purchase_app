import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sales_purchase_app/features/sales/home/edit-product/update-product/update_product_view_model.dart';
import 'package:sales_purchase_app/ui/components/custom_button.dart';
import 'package:sales_purchase_app/ui/components/custom_loading_dialog.dart';
import 'package:sales_purchase_app/ui/components/custom_text_field.dart';
import 'package:sales_purchase_app/ui/components/custom_upload.dart';
import 'package:sales_purchase_app/ui/shared/app_color.dart';
import 'package:sales_purchase_app/features/base_view.dart';
import 'package:sales_purchase_app/ui/shared/app_font.dart';
import 'package:sales_purchase_app/ui/widgets/select_photo_upload.dart';

class UpdateProductView extends StatelessWidget {
  final int productId;
  const UpdateProductView({
    super.key,
    required this.productId,
  });

  @override
  Widget build(BuildContext context) {
    return BaseView<UpdateProductViewModel>(
      model: UpdateProductViewModel(
        baseApi: Provider.of(context),
        productId: productId,
      ),
      onModelReady: (UpdateProductViewModel model) => model.initModel(),
      onModelDispose: (UpdateProductViewModel model) => model.disposeModel(),
      builder: (BuildContext context, UpdateProductViewModel model, _) {
        return Stack(
          children: [
            Scaffold(
              appBar: AppBar(
                elevation: 0,
                title: const Text('Update Product'),
                centerTitle: true,
                backgroundColor: AppColor.white,
                titleTextStyle: AppFont.bold.copyWith(
                  color: AppColor.primary,
                  fontSize: 16,
                ),
                iconTheme: const IconThemeData(color: AppColor.primary),
              ),
              backgroundColor: AppColor.white,
              body: const UpdateProductContent(),
            ),
            if (model.isBusy) const CustomLoadingDialog(color: AppColor.primary),
          ],
        );
      },
    );
  }
}

class UpdateProductContent extends StatelessWidget {
  const UpdateProductContent({super.key});

  @override
  Widget build(BuildContext context) {
    final UpdateProductViewModel model = Provider.of<UpdateProductViewModel>(context);
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        CustomTextField(
          controller: model.capitalPriceController,
          label: 'Capital Price',
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.number,
          onChanged: (value) {
            model.updateCapitalPrice(value);
          },
        ),
        const SizedBox(
          height: 16.0,
        ),
        CustomTextField(
          controller: model.deliveryTypeController,
          label: 'Delivery Type',
          textInputAction: TextInputAction.next,
          onChanged: (value) {
            model.updateDeliveryType(value);
          },
        ),
        const SizedBox(
          height: 16.0,
        ),
        CustomTextField(
          controller: model.shippingCostController,
          label: 'Shipping Cost',
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.number,
          onChanged: (value) {
            model.updateShippingCost(value);
          },
        ),
        const SizedBox(
          height: 16.0,
        ),
        CustomTextField(
          controller: model.deliveryDurationController,
          label: 'Delivery Duration',
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.number,
          onChanged: (value) {
            model.updateDeliveryDuration(value);
          },
        ),
        const SizedBox(
          height: 16.0,
        ),
        CustomTextField(
          controller: model.availableStockController,
          label: 'Available Stock',
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.number,
          onChanged: (value) {
            model.updateAvailableStock(value);
          },
        ),
        const SizedBox(
          height: 16.0,
        ),
        CustomTextField(
          controller: model.supplierNameController,
          label: 'Supplier Name',
          textInputAction: TextInputAction.next,
          onChanged: (value) {
            model.updateSupplierName(value);
          },
        ),
        const SizedBox(
          height: 16.0,
        ),
        CustomUpload(
          label: 'Photo From Supplier',
          imageFile: model.photoFromSupplier,
          onTap: () {
            showModalBottomSheet(
              context: context,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(12.0),
                ),
              ),
              builder: (context) {
                return SelectPhotoUpload(
                  onGallerySelected: () => model.pickFromSupplier(),
                  onCameraSelected: () => model.cameraFromSupplier(),
                );
              },
            );
          },
        ),
        const SizedBox(
          height: 16.0,
        ),
        CustomTextField(
          controller: model.picSupplierController,
          label: 'PIC Supplier',
          textInputAction: TextInputAction.next,
          onChanged: (value) {
            model.updatePicSupplier(value);
          },
        ),
        const SizedBox(
          height: 16.0,
        ),
        CustomTextField(
          controller: model.picPhoneNumberController,
          label: 'PIC Phone Number',
          keyboardType: TextInputType.number,
          onChanged: (value) {
            model.updatePicPhoneNumber(value);
          },
        ),
        const SizedBox(
          height: 16.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Own Stock'),
            Switch(
              value: model.isOwnStockOn,
              onChanged: (value) {
                model.toggleOwnStock(value);
              },
            ),
          ],
        ),
        const SizedBox(
          height: 40.0,
        ),
        Button.filled(
          onPressed: model.isFormValid
              ? () async {
                  await model.updateProduct(context);
                }
              : null,
          label: 'Update Product',
        ),
        const SizedBox(
          height: 20.0,
        ),
      ],
    );
  }
}
