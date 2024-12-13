import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sales_purchase_app/features/purchasing/home/detail-product/detail_product_view_model.dart';
import 'package:sales_purchase_app/ui/shared/app_color.dart';
import 'package:sales_purchase_app/features/base_view.dart';
import 'package:sales_purchase_app/ui/shared/app_font.dart';

class DetailProductView extends StatelessWidget {
  final int productId;
  const DetailProductView({
    super.key,
    required this.productId,
  });

  @override
  Widget build(BuildContext context) {
    return BaseView<DetailProductViewModel>(
      model: DetailProductViewModel(
        baseApi: Provider.of(context),
        productId: productId,
      ),
      onModelReady: (DetailProductViewModel model) => model.initModel(),
      onModelDispose: (DetailProductViewModel model) => model.disposeModel(),
      builder: (BuildContext context, DetailProductViewModel model, _) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Detail Product'),
          ),
          backgroundColor: AppColor.white,
          body: model.isBusy
              ? const Center(
                  child: CircularProgressIndicator(
                    color: AppColor.primary,
                  ),
                )
              : const ProductDetailContent(),
        );
      },
    );
  }
}

class ProductDetailContent extends StatelessWidget {
  const ProductDetailContent({super.key});

  @override
  Widget build(BuildContext context) {
    final DetailProductViewModel model = Provider.of<DetailProductViewModel>(context);
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: AppColor.gray.withOpacity(0.5),
              ),
            ),
            child: model.product!.productPhoto.isEmpty
                ? Center(
                    child: Icon(
                      Icons.image,
                      color: AppColor.gray.withOpacity(0.5),
                      size: 48,
                    ),
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      model.product!.productPhoto,
                      fit: BoxFit.cover,
                    ),
                  ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                model.product!.productName,
                style: AppFont.semiBold.copyWith(
                  color: AppColor.black,
                  fontSize: 20,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 4,
                  horizontal: 12,
                ),
                decoration: BoxDecoration(
                  color: AppColor.primary,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  'Stock : ${model.product!.quantity}',
                  style: AppFont.medium.copyWith(
                    color: AppColor.white,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}