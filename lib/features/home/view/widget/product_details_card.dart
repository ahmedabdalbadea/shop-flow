import 'package:flutter/material.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/utils/app_font_styles.dart';
import 'package:shop_flow/features/home/data/models/products/product.dart';
import 'package:shop_flow/features/home/view/widget/product_details_price.dart';
import 'package:shop_flow/features/home/view/widget/product_highlights.dart';
import 'package:shop_flow/features/home/view/widget/product_meta_row.dart';
import 'package:shop_flow/features/home/view/widget/reviews_section.dart';
import 'package:shop_flow/features/home/view/widget/tags_wrap.dart';

class ProductDetailsCard extends StatelessWidget {
  const ProductDetailsCard({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductMetaRow(
            category: product.category!,
            rereviewsNumber: product.reviews!.length,
            rating: product.rating!,
          ),

          const SizedBox(height: 8),
          Text(
            product.title!,
            style: AppFontStyles.styleBold32,
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 8),
          ProductDetailsPrice(
            price: product.price!,
            discountPercentage: product.discountPercentage,
          ),
          const SizedBox(height: 8),
          Text(
            product.description!,
            style: AppFontStyles.styleRegular16.copyWith(color: kThrTextColor),
          ),
          const SizedBox(height: 24),
          TagsWrap(tags: product.tags!.cast<String>()),
          const SizedBox(height: 24),

          IntrinsicHeight(child: ProductHighlights(product: product)),
          product.reviews == null || product.reviews == []
              ? const SizedBox.shrink()
              : const SizedBox(height: 56),

          product.reviews == null || product.reviews == []
              ? const SizedBox.shrink()
              : ReviewsSection(reviews: product.reviews!),
        ],
      ),
    );
  }
}
