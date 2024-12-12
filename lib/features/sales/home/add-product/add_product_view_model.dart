import 'package:flutter/material.dart';
import 'package:sales_purchase_app/features/base_view_model.dart';

class AddProductViewModel extends BaseViewModel {
  final TextEditingController nameProductController = TextEditingController();
  final TextEditingController quantityProductController = TextEditingController();
  final TextEditingController descProductController = TextEditingController();
  final TextEditingController custNameController = TextEditingController();

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
    return nameProductController.text.isNotEmpty && quantityProductController.text.isNotEmpty && descProductController.text.isNotEmpty && custNameController.text.isNotEmpty;
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
}
