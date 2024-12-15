import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sales_purchase_app/core/api/base_api.dart';
import 'package:sales_purchase_app/core/models/sales/update_product_model.dart';
import 'package:sales_purchase_app/core/services/pref_service.dart';
import 'package:sales_purchase_app/features/base_view_model.dart';
import 'package:sales_purchase_app/ui/components/custom_snackbar.dart';
import 'package:sales_purchase_app/ui/components/custom_success_dialog.dart';
import 'package:sales_purchase_app/ui/extensions/formatter.dart';
import 'package:sales_purchase_app/ui/routes/app_routes.dart';
import 'package:sales_purchase_app/ui/shared/app_color.dart';

class UpdateProductViewModel extends BaseViewModel {
  UpdateProductViewModel({
    required this.baseApi,
    required this.productId,
  });

  final TextEditingController capitalPriceController = TextEditingController();
  final TextEditingController deliveryTypeController = TextEditingController();
  final TextEditingController shippingCostController = TextEditingController();
  final TextEditingController deliveryDurationController = TextEditingController();
  final TextEditingController availableStockController = TextEditingController();
  final TextEditingController supplierNameController = TextEditingController();
  final TextEditingController picSupplierController = TextEditingController();
  final TextEditingController picPhoneNumberController = TextEditingController();
  final TextEditingController ownStockController = TextEditingController();

  final BaseApi baseApi;
  final int productId;
  File? photoFromSupplier;
  String apiMessage = '';

  @override
  Future<void> initModel() async {
    setBusy(true);
    super.initModel();
    setBusy(false);
  }

  @override
  Future<void> disposeModel() async {
    capitalPriceController.dispose();
    deliveryTypeController.dispose();
    shippingCostController.dispose();
    deliveryDurationController.dispose();
    availableStockController.dispose();
    supplierNameController.dispose();
    picSupplierController.dispose();
    picPhoneNumberController.dispose();
    ownStockController.dispose();
    super.disposeModel();
  }

  bool get isFormValid {
    return capitalPriceController.text.isNotEmpty && deliveryTypeController.text.isNotEmpty && shippingCostController.text.isNotEmpty && deliveryDurationController.text.isNotEmpty && availableStockController.text.isNotEmpty && supplierNameController.text.isNotEmpty && picSupplierController.text.isNotEmpty && picPhoneNumberController.text.isNotEmpty && ownStockController.text.isNotEmpty && photoFromSupplier != null;
  }

  Future<void> pickFromSupplier() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      photoFromSupplier = File(image.path);
      notifyListeners();
    }
  }

  Future<void> cameraFromSupplier() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      photoFromSupplier = File(image.path);
      notifyListeners();
    }
  }

  void updateCapitalPrice(String value) {
    final formattedValue = Formatter.formatAmount(value);
    capitalPriceController.text = formattedValue;
    notifyListeners();
  }

  String get rawCapitalPrice {
    return Formatter.getRawAmount(capitalPriceController.text);
  }

  void updateDeliveryType(String value) {
    deliveryTypeController.text = value;
    notifyListeners();
  }

  void updateShippingCost(String value) {
    final formattedValue = Formatter.formatAmount(value);
    shippingCostController.text = formattedValue;
    notifyListeners();
  }

  String get rawShippingCost {
    return Formatter.getRawAmount(shippingCostController.text);
  }

  void updateDeliveryDuration(String value) {
    deliveryDurationController.text = value;
    notifyListeners();
  }

  void updateAvailableStock(String value) {
    availableStockController.text = value;
    notifyListeners();
  }

  void updateSupplierName(String value) {
    supplierNameController.text = value;
    notifyListeners();
  }

  void updatePicSupplier(String value) {
    picSupplierController.text = value;
    notifyListeners();
  }

  void updatePicPhoneNumber(String value) {
    picPhoneNumberController.text = value;
    notifyListeners();
  }

  void toggleOwnStock(bool value) {
    ownStockController.text = value ? '1' : '0';
    notifyListeners();
  }

  bool get isOwnStockOn => ownStockController.text == '1';

  Future<void> updateProduct(BuildContext context) async {
    setBusy(true);
    try {
      final File filePhoto = File(photoFromSupplier!.path);
      final String? authToken = await PrefService.getAuthToken();

      final productResponse = await baseApi.salesUpdateProduct(
        'Bearer $authToken',
        productId.toString(),
        rawCapitalPrice,
        deliveryTypeController.text,
        rawShippingCost,
        deliveryDurationController.text,
        availableStockController.text,
        supplierNameController.text,
        filePhoto,
        picSupplierController.text,
        picPhoneNumberController.text,
        ownStockController.text,
      );
      final statusCode = productResponse.response.statusCode;
      final status = productResponse.data.status;
      if (statusCode == 201 && status == 'success') {
        final UpdateProductResponse result = productResponse.data;
        apiMessage = result.message;
        if (context.mounted) {
          await showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return CustomSuccessDialog(
                title: 'Update Product Success',
                onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    AppRoutes.salesMain,
                    (Route<dynamic> route) => false,
                  );
                },
              );
            },
          );
        }
      } else {
        if (context.mounted) {
          CustomSnackbar.show(
            context,
            message: 'Field required',
            backgroundColor: AppColor.red,
          );
        }
      }
    } on DioException catch (e) {
      apiMessage = 'Error: $e';
      if (context.mounted) {
        CustomSnackbar.show(
          context,
          message: apiMessage,
          backgroundColor: AppColor.red,
        );
      }
    }
    setBusy(false);
  }
}
