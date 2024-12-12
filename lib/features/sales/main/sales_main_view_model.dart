import 'package:flutter/material.dart';
import 'package:sales_purchase_app/features/base_view_model.dart';
import 'package:sales_purchase_app/features/sales/home/sales_home_view.dart';
import 'package:sales_purchase_app/features/sales/profile/sales_profile_view.dart';

class SalesMainViewModel extends BaseViewModel {
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  List<Widget> get pages => [
        const SalesHomeView(),
        const SalesProfileView(),
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
