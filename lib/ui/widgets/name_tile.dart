import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sales_purchase_app/ui/shared/app_color.dart';
import 'package:sales_purchase_app/ui/shared/app_font.dart';
import 'package:sales_purchase_app/ui/shared/app_image.dart';

class NameTile extends StatelessWidget {
  final String name;
  final String role;
  const NameTile({
    super.key,
    required this.name,
    required this.role,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 40,
        horizontal: 20,
      ),
      child: Row(
        children: [
          ClipOval(
            child: Container(
              padding: const EdgeInsets.all(8),
              color: Colors.white,
              child: SvgPicture.asset(
                AppImage.icUsername,
                colorFilter: const ColorFilter.mode(
                  AppColor.black,
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
                style: AppFont.bold.copyWith(
                  color: AppColor.white,
                  fontSize: 16,
                ),
              ),
              Text(
                role,
                style: AppFont.regular.copyWith(
                  color: AppColor.white,
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
