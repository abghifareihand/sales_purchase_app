import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sales_purchase_app/ui/shared/app_color.dart';
import 'package:sales_purchase_app/ui/shared/app_image.dart';

import '../ui/shared/app_font.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColor.stroke,
                  ),
                  child: SvgPicture.asset(
                    AppImage.icTransaction,
                  ),
                ),
                title: Text(
                  'Title',
                  style: AppFont.semiBold.copyWith(
                    color: AppColor.black,
                  ),
                ),
                subtitle: Text(
                  'Subtitle',
                  style: AppFont.regular.copyWith(
                    color: AppColor.gray,
                  ),
                ),
                trailing: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '22-07-2024',
                      style: AppFont.light.copyWith(
                        color: AppColor.black,
                      ),
                    ),
                    Text(
                      '12:00 WIB',
                      style: AppFont.light.copyWith(
                        color: AppColor.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
