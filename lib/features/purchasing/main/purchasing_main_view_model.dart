import 'package:flutter/material.dart';
import 'package:sales_purchase_app/features/base_view_model.dart';
import 'package:sales_purchase_app/features/purchasing/home/purchasing_home_view.dart';
import 'package:sales_purchase_app/features/purchasing/profile/purchasing_profile_view.dart';

class PurchasingMainViewModel extends BaseViewModel {
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  List<Widget> get pages => [
        const PurchasingHomeView(),
        const PurchasingProfileView(),
      ];

  void onItemTapped(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  @override
  Future<void> initModel() async {
    setBusy(true);
    super.initModel();
    setBusy(false);
  }

  @override
  Future<void> disposeModel() async {
    super.disposeModel();
  }
}
