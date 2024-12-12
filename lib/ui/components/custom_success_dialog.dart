import 'package:flutter/material.dart';
import 'package:sales_purchase_app/ui/components/custom_button.dart';
import 'package:sales_purchase_app/ui/shared/app_color.dart';
import 'package:sales_purchase_app/ui/shared/app_font.dart';
import 'package:sales_purchase_app/ui/shared/app_image.dart';

class CustomSuccessDialog extends StatelessWidget {
  const CustomSuccessDialog({
    super.key,
    required this.title,
    required this.onPressed,
  });
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColor.white,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.asset(
              AppImage.success,
              width: 120,
              height: 120,
            ),
            const SizedBox(
              height: 16.0,
            ),
            Text(
              title,
              style: AppFont.bold.copyWith(
                color: AppColor.primary,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32.0),
            Button.filled(
              height: 48,
              borderRadius: 12,
              onPressed: onPressed,
              label: 'OK',
            ),
          ],
        ),
      ),
    );
  }
}
