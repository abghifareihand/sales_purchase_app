import 'package:sales_purchase_app/features/base_view_model.dart';

class PurchasingHomeViewModel extends BaseViewModel {
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
