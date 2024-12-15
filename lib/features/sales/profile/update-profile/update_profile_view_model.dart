import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sales_purchase_app/core/api/base_api.dart';
import 'package:sales_purchase_app/core/models/auth/update_user_model.dart';
import 'package:sales_purchase_app/core/services/pref_service.dart';
import 'package:sales_purchase_app/features/base_view_model.dart';
import 'package:sales_purchase_app/ui/components/custom_success_dialog.dart';
import 'package:sales_purchase_app/ui/routes/app_routes.dart';

class UpdateProfileViewModel extends BaseViewModel {
  UpdateProfileViewModel({
    required this.baseApi,
    required String username,
    required String name,
  }) {
    usernameController.text = username;
    nameController.text = name;
  }

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final BaseApi baseApi;
  String apiMessage = '';

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

  bool get isFormValid {
    return usernameController.text.isNotEmpty && nameController.text.isNotEmpty;
  }

  void updateUsername(String value) {
    usernameController.text = value;
    notifyListeners();
  }

  void updateName(String value) {
    nameController.text = value;
    notifyListeners();
  }

  Future<void> updateUser(BuildContext context) async {
    setBusy(true);
    try {
      final String? authToken = await PrefService.getAuthToken();
      final Map<String, dynamic> request = {
        'username': usernameController.text,
        'name': nameController.text,
      };

      if (passwordController.text.isNotEmpty) {
        request['password'] = passwordController.text;
      }
      final HttpResponse<UpdateUserResponse> userResponse = await baseApi.updateUser(
        'Bearer $authToken',
        request,
      );
      final statusCode = userResponse.response.statusCode;
      final status = userResponse.data.status;
      if (statusCode == 200 && status == 'success') {
        final UpdateUserResponse result = userResponse.data;
        apiMessage = result.message;
        if (context.mounted) {
          await showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return CustomSuccessDialog(
                title: 'Update Profile Success',
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
        apiMessage = 'Error fetching user';
      }
    } on DioException catch (e) {
      apiMessage = 'Error: $e';
    }
    setBusy(false);
  }
}
