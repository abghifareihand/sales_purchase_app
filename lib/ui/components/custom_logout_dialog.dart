import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sales_purchase_app/ui/components/custom_button.dart';
import 'package:sales_purchase_app/ui/shared/app_color.dart';
import 'package:sales_purchase_app/ui/shared/app_font.dart';
import 'package:sales_purchase_app/ui/shared/app_image.dart';

class CustomLogoutDialog extends StatelessWidget {
  const CustomLogoutDialog({
    super.key,
    required this.onPressed,
  });
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
            SvgPicture.asset(
              AppImage.icLogout,
              width: 60,
              height: 60,
              colorFilter: const ColorFilter.mode(
                AppColor.primary,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Text(
              'Are you sure logout?',
              style: AppFont.semiBold.copyWith(
                color: AppColor.black,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32.0),
            Row(
              children: [
                Expanded(
                  child: Button.outlined(
                    height: 48,
                    borderRadius: 12,
                    onPressed: () => Navigator.pop(context),
                    label: 'No',
                    textColor: AppColor.primary,
                  ),
                ),
                const SizedBox(
                  width: 24.0,
                ),
                Expanded(
                  child: Button.filled(
                    height: 48,
                    borderRadius: 12,
                    onPressed: onPressed,
                    label: 'Yes',
                    textColor: AppColor.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
