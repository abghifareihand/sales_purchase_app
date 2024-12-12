import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sales_purchase_app/ui/shared/app_color.dart';
import 'package:sales_purchase_app/ui/shared/app_font.dart';
import 'package:sales_purchase_app/ui/shared/app_image.dart';

class NameTile extends StatelessWidget {
  final String name;
  final String role;
  final bool purchasing;
  const NameTile({
    super.key,
    required this.name,
    required this.role,
    this.purchasing = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: purchasing ? 20 : 40,
        horizontal: purchasing ? 0 : 20,
      ),
      child: Row(
        children: [
          ClipOval(
            child: Container(
              padding: const EdgeInsets.all(8),
              color: purchasing ? AppColor.primary : AppColor.white,
              child: SvgPicture.asset(
                AppImage.icUsername,
                colorFilter: ColorFilter.mode(
                  purchasing ? AppColor.white : AppColor.primary,
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
                  color: purchasing ? AppColor.primary : AppColor.white,
                  fontSize: 16,
                ),
              ),
              Text(
                role,
                style: AppFont.regular.copyWith(
                  color: purchasing ? AppColor.primary : AppColor.white,
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
