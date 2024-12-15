import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sales_purchase_app/ui/shared/app_color.dart';

class IconCircle extends StatelessWidget {
  final String icon;
  const IconCircle({
    super.key,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: AppColor.primary.withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      padding: const EdgeInsets.all(10),
      child: SvgPicture.asset(
        icon,
        colorFilter: const ColorFilter.mode(
          AppColor.primary,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
