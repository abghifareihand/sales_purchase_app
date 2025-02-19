import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sales_purchase_app/core/services/remote_service.dart';
import 'package:sales_purchase_app/ui/components/custom_button.dart';
import 'package:sales_purchase_app/ui/components/custom_text_field.dart';
import 'package:sales_purchase_app/ui/shared/app_color.dart';
import 'package:sales_purchase_app/features/auth/login/login_view_model.dart';
import 'package:sales_purchase_app/features/base_view.dart';
import 'package:sales_purchase_app/ui/shared/app_font.dart';
import 'package:sales_purchase_app/ui/shared/app_image.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      model: LoginViewModel(
        baseApi: Provider.of(context),
      ),
      onModelReady: (LoginViewModel model) => model.initModel(),
      onModelDispose: (LoginViewModel model) => model.disposeModel(),
      builder: (BuildContext context, LoginViewModel model, _) {
        return const Scaffold(
          backgroundColor: AppColor.background,
          body: LoginContent(),
        );
      },
    );
  }
}

class LoginContent extends StatelessWidget {
  const LoginContent({super.key});

  @override
  Widget build(BuildContext context) {
    final remoteConfig = RemoteConfigService();
    final LoginViewModel model = Provider.of<LoginViewModel>(context);
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '',
                style: AppFont.bold.copyWith(
                  color: AppColor.black,
                  fontSize: 28,
                ),
              ),
              Text(
                'Welcome back, please login to your account',
                style: AppFont.regular.copyWith(
                  color: AppColor.gray,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        CustomTextField(
          showLabel: false,
          controller: model.usernameController,
          label: 'Username',
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SvgPicture.asset(AppImage.icUsername),
          ),
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          onChanged: (value) {
            model.updateUsername(value);
          },
        ),
        const SizedBox(
          height: 20.0,
        ),
        CustomTextField(
          showLabel: false,
          controller: model.passwordController,
          label: 'Password',
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SvgPicture.asset(AppImage.icPassword),
          ),
          obscureText: true,
          onChanged: (value) {
            model.updatePassword(value);
          },
        ),
        const SizedBox(
          height: 40.0,
        ),
        Button.filled(
          onPressed: model.isFormValid
              ? () async {
                  await model.login(context);
                }
              : null,
          label: 'Login',
        ),
      ],
    );
  }
}
