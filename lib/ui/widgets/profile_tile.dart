import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sales_purchase_app/ui/shared/app_color.dart';
import 'package:sales_purchase_app/ui/shared/app_font.dart';
import 'package:sales_purchase_app/ui/shared/app_image.dart';

import 'icon_circle.dart';

class ProfileTile extends StatelessWidget {
  final String icon;
  final String title;
  final VoidCallback onTap;
  const ProfileTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          IconCircle(
            icon: icon,
          ),
          const SizedBox(
            width: 16.0,
          ),
          Text(
            title,
            style: AppFont.medium.copyWith(
              color: AppColor.black,
              fontSize: 16,
            ),
          ),
          const Spacer(),
          SvgPicture.asset(
            AppImage.icChevronRight,
          ),
        ],
      ),
    );
  }
}
