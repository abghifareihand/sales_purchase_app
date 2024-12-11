import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sales_purchase_app/ui/shared/app_color.dart';
import 'package:sales_purchase_app/pages/main_page.dart';

import '../ui/components/custom_button.dart';
import '../ui/components/custom_text_field.dart';
import '../ui/shared/app_font.dart';
import '../ui/shared/app_image.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Text(
                'LOGO',
                style: AppFont.bold.copyWith(
                  color: AppColor.primary,
                  fontSize: 40,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          CustomTextField(
            showLabel: false,
            controller: TextEditingController(),
            label: 'Email Address',
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SvgPicture.asset(AppImage.icEmail),
            ),
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(
            height: 20.0,
          ),
          CustomTextField(
            showLabel: false,
            controller: TextEditingController(),
            label: 'Password',
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SvgPicture.asset(AppImage.icPassword),
            ),
            obscureText: true,
          ),
          const SizedBox(
            height: 40.0,
          ),
          Button.filled(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const MainPage(),
                ),
              );
            },
            label: 'Login',
          ),
        ],
      ),
    );
  }
}
