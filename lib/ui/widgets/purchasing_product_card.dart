import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sales_purchase_app/core/models/purchasing/product_model.dart';
import 'package:sales_purchase_app/ui/routes/app_routes.dart';
import 'package:sales_purchase_app/ui/shared/app_color.dart';
import 'package:sales_purchase_app/ui/shared/app_font.dart';
import 'package:shimmer/shimmer.dart';

class PurchasingProductCard extends StatelessWidget {
  final ProductData data;
  const PurchasingProductCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          AppRoutes.purchasingDetailProduct,
          arguments: data.id,
        );
      },
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: const BorderRadius.all(
                Radius.circular(10.0),
              ),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: CachedNetworkImage(
                    imageUrl: data.productPhoto,
                    width: double.infinity,
                    height: 130.0,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Shimmer.fromColors(
                      baseColor: AppColor.gray.withOpacity(0.3),
                      highlightColor: AppColor.gray.withOpacity(0.5),
                      child: Container(
                        width: double.infinity,
                        height: 130.0,
                        color: Colors.white,
                      ),
                    ),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                ),
                const SizedBox(
                  height: 14.0,
                ),
                Flexible(
                  child: Text(
                    data.productName,
                    style: AppFont.regular.copyWith(
                      color: AppColor.black,
                      fontSize: 14,
                    ),
                  ),
                ),
                Text(
                  data.partNumber,
                  style: AppFont.bold.copyWith(
                    color: AppColor.primary,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
