import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:retrofit/dio.dart';
import 'package:sales_purchase_app/core/api/base_api.dart';
import 'package:sales_purchase_app/core/models/sales/add_product_model.dart';
import 'package:sales_purchase_app/features/base_view_model.dart';
import 'package:sales_purchase_app/ui/components/custom_snackbar.dart';
import 'package:sales_purchase_app/ui/components/custom_success_dialog.dart';
import 'package:sales_purchase_app/ui/routes/app_routes.dart';
import 'package:sales_purchase_app/ui/shared/app_color.dart';

class AddProductViewModel extends BaseViewModel {
  AddProductViewModel({
    required this.baseApi,
  });

  final BaseApi baseApi;
  final TextEditingController nameProductController = TextEditingController();
  final TextEditingController quantityProductController = TextEditingController();
  final TextEditingController descProductController = TextEditingController();
  final TextEditingController custNameController = TextEditingController();
  DateTime? selectDate;
  File? photoProduct;
  String? photoProductName;

  String apiMessage = '';

  @override
  Future<void> initModel() async {
    setBusy(true);
    super.initModel();
    setBusy(false);
  }

  @override
  Future<void> disposeModel() async {
    nameProductController.dispose();
    quantityProductController.dispose();
    descProductController.dispose();
    custNameController.dispose();
    super.disposeModel();
  }

  bool get isFormValid {
    return nameProductController.text.isNotEmpty && quantityProductController.text.isNotEmpty && descProductController.text.isNotEmpty && custNameController.text.isNotEmpty && photoProduct != null;
  }

  Future<void> pickPhotoProduct() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      photoProduct = File(image.path);
      photoProductName = image.name;
      notifyListeners();
    }
  }

  Future<void> cameraPhotoProduct() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      photoProduct = File(image.path);
      photoProductName = image.name;
      notifyListeners();
    }
  }

  void updateNameProduct(String value) {
    nameProductController.text = value;
    notifyListeners();
  }

  void updateQuantityProduct(String value) {
    quantityProductController.text = value;
    notifyListeners();
  }

  void updateDescProduct(String value) {
    descProductController.text = value;
    notifyListeners();
  }

  void updateCustName(String value) {
    custNameController.text = value;
    notifyListeners();
  }

  Future<void> createProduct(BuildContext context) async {
    setBusy(true);
    try {
      final File file = File(photoProduct!.path);
      final DateTime dateToSend = selectDate ?? DateTime.now();
      final formattedDate = DateFormat('yyyy-MM-dd').format(dateToSend);

      final HttpResponse<AddProductResponse> productResponse = await baseApi.addProduct(
        '1',
        formattedDate,
        nameProductController.text,
        file,
        quantityProductController.text,
        descProductController.text,
        'A56SGSG',
        custNameController.text,
      );
      final statusCode = productResponse.response.statusCode;
      final status = productResponse.data.status;
      if (statusCode == 201 && status == 'success') {
        final AddProductResponse result = productResponse.data;
        apiMessage = result.message;
        if (context.mounted) {
          await showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return CustomSuccessDialog(
                title: 'Create Product Success',
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
