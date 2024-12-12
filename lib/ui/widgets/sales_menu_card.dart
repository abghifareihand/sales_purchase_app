import 'package:flutter/material.dart';
import 'package:sales_purchase_app/ui/shared/app_color.dart';
import 'package:sales_purchase_app/ui/shared/app_font.dart';

class SalesMenuCard extends StatelessWidget {
  final String icon;
  final String title;
  final VoidCallback onPressed;

  const SalesMenuCard({
    super.key,
    required this.icon,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 120,
        height: 120,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: AppColor.gray.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              icon,
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              title,
              style: AppFont.medium.copyWith(
                color: AppColor.primary,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
