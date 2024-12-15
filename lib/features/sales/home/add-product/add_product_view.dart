import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sales_purchase_app/features/sales/home/add-product/add_product_view_model.dart';
import 'package:sales_purchase_app/ui/components/custom_button.dart';
import 'package:sales_purchase_app/ui/components/custom_date_picker.dart';
import 'package:sales_purchase_app/ui/components/custom_loading_dialog.dart';
import 'package:sales_purchase_app/ui/components/custom_text_field.dart';
import 'package:sales_purchase_app/ui/components/custom_upload.dart';
import 'package:sales_purchase_app/ui/shared/app_color.dart';
import 'package:sales_purchase_app/features/base_view.dart';
import 'package:sales_purchase_app/ui/widgets/select_photo_upload.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<AddProductViewModel>(
      model: AddProductViewModel(
        baseApi: Provider.of(context),
      ),
      onModelReady: (AddProductViewModel model) => model.initModel(),
      onModelDispose: (AddProductViewModel model) => model.disposeModel(),
      builder: (BuildContext context, AddProductViewModel model, _) {
        return Stack(
          children: [
            Scaffold(
              appBar: AppBar(
                title: const Text('Create Product'),
              ),
              backgroundColor: AppColor.white,
              body: const AddProductContent(),
            ),
            if (model.isBusy) const CustomLoadingDialog(),
          ],
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
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          CustomDatePicker(
            initialDate: DateTime.now(),
            label: 'Date',
            onDateSelected: (selectedDate) {
              model.selectDate = selectedDate;
            },
          ),
          const SizedBox(
            height: 16.0,
          ),
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
          CustomUpload(
            label: 'Photo',
            imageFile: model.photoProduct,
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
                    onGallerySelected: () => model.pickPhotoProduct(),
                    onCameraSelected: () => model.cameraPhotoProduct(),
                  );
                },
              );
            },
          ),
          const SizedBox(
            height: 16.0,
          ),
          CustomTextField(
            controller: model.partNumberController,
            label: 'Part Number',
            textCapitalization: TextCapitalization.characters,
            textInputAction: TextInputAction.next,
            onChanged: (value) {
              model.updatePartNumber(value);
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
            maxLines: 4,
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
            onPressed: model.isFormValid
                ? () async {
                    await model.createProduct(context);
                  }
                : null,
            label: 'Create',
          ),
          const SizedBox(
            height: 20.0,
          ),
        ],
      ),
    );
  }
}
