import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sales_purchase_app/ui/components/custom_button.dart';
import 'package:sales_purchase_app/ui/components/custom_text_field.dart';
import 'package:sales_purchase_app/ui/shared/app_image.dart';

class LoginWidget<T> extends StatefulWidget {
  final T model;
  const LoginWidget({super.key, required this.model});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextField(
              showLabel: false,
              controller: widget.model.usernameController,
              label: 'Username',
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SvgPicture.asset(AppImage.icUsername),
              ),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              onChanged: (value) {
                setState(() {
                  widget.model.updateUsername(value);
                });
              },
            ),
            const SizedBox(
              height: 20.0,
            ),
            CustomTextField(
              showLabel: false,
              controller: widget.model.passw,
              label: 'Password',
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SvgPicture.asset(AppImage.icPassword),
              ),
              obscureText: true,
              onChanged: (value) {
                setState(() {
                  widget.model.updatePassword(value);
                });
              },
            ),
            const SizedBox(
              height: 40.0,
            ),
            Button.filled(
              onPressed: widget.model.isFormValid
                  ? () async {
                      await widget.model.login(context);
                    }
                  : null,
              label: 'Login',
            ),
          ],
        ),
      ),
    );
  }
}
