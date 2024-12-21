import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sales_purchase_app/ui/shared/app_color.dart';
import 'package:sales_purchase_app/ui/shared/app_font.dart';
import 'package:sales_purchase_app/ui/shared/app_image.dart';

class NameTileSales extends StatelessWidget {
  final String name;
  final String role;
  const NameTileSales({
    super.key,
    required this.name,
    required this.role,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          ClipOval(
            child: Container(
              padding: const EdgeInsets.all(8),
              color: AppColor.primary,
              child: SvgPicture.asset(
                AppImage.icUsername,
                colorFilter: const ColorFilter.mode(
                  AppColor.white,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 12.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: AppFont.semiBold.copyWith(
                  color: AppColor.primary,
                  fontSize: 16,
                ),
              ),
              Text(
                role,
                style: AppFont.regular.copyWith(
                  color: AppColor.primary,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class NameTilePurchasing extends StatelessWidget {
  final String name;
  final String role;
  const NameTilePurchasing({
    super.key,
    required this.name,
    required this.role,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          ClipOval(
            child: Container(
              padding: const EdgeInsets.all(8),
              color: AppColor.secondary,
              child: SvgPicture.asset(
                AppImage.icUsername,
                colorFilter: const ColorFilter.mode(
                  AppColor.white,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 12.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: AppFont.semiBold.copyWith(
                  color: AppColor.secondary,
                  fontSize: 16,
                ),
              ),
              Text(
                role,
                style: AppFont.regular.copyWith(
                  color: AppColor.secondary,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
