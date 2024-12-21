import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sales_purchase_app/features/sales/profile/update-profile/update_profile_view_model.dart';
import 'package:sales_purchase_app/ui/components/custom_button.dart';
import 'package:sales_purchase_app/ui/components/custom_loading_dialog.dart';
import 'package:sales_purchase_app/ui/components/custom_text_field.dart';
import 'package:sales_purchase_app/ui/shared/app_color.dart';
import 'package:sales_purchase_app/features/base_view.dart';
import 'package:sales_purchase_app/ui/shared/app_font.dart';

class UpdateProfileView extends StatelessWidget {
  final String username;
  final String name;
  const UpdateProfileView({
    super.key,
    required this.username,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return BaseView<UpdateProfileViewModel>(
      model: UpdateProfileViewModel(
        baseApi: Provider.of(context),
        username: username,
        name: name,
      ),
      onModelReady: (UpdateProfileViewModel model) => model.initModel(),
      onModelDispose: (UpdateProfileViewModel model) => model.disposeModel(),
      builder: (BuildContext context, UpdateProfileViewModel model, _) {
        return Stack(
          children: [
            Scaffold(
              appBar: AppBar(
                elevation: 0,
                title: const Text('My Account'),
                centerTitle: true,
                backgroundColor: AppColor.white,
                titleTextStyle: AppFont.bold.copyWith(
                  color: AppColor.primary,
                  fontSize: 16,
                ),
                iconTheme: const IconThemeData(color: AppColor.primary),
              ),
              backgroundColor: AppColor.white,
              body: UpdateProfileContent(
                username: username,
                name: name,
              ),
            ),
            if (model.isBusy) const CustomLoadingDialog(color: AppColor.primary),
          ],
        );
      },
    );
  }
}

class UpdateProfileContent extends StatelessWidget {
  final String username;
  final String name;
  const UpdateProfileContent({
    super.key,
    required this.username,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    final UpdateProfileViewModel model = Provider.of<UpdateProfileViewModel>(context);
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        CustomTextField(
          controller: model.usernameController,
          label: 'Username',
          onChanged: (value) {
            model.updateUsername(value);
          },
        ),
        const SizedBox(
          height: 16.0,
        ),
        CustomTextField(
          controller: model.nameController,
          label: 'Name',
          onChanged: (value) {
            model.updateName(value);
          },
        ),
        const SizedBox(
          height: 16.0,
        ),
        CustomTextField(
          controller: model.passwordController,
          label: 'Password',
          obscureText: true,
        ),
        const SizedBox(
          height: 40.0,
        ),
        Button.filled(
          onPressed: model.isFormValid
              ? () async {
                  await model.updateUser(context);
                }
              : null,
          label: 'Update Profile',
        ),
      ],
    );
  }
}
