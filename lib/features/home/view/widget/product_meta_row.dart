import 'package:flutter/material.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/utils/app_font_styles.dart';
import 'package:shop_flow/features/home/view/widget/rating_badge.dart';

class ProductMetaRow extends StatelessWidget {
  const ProductMetaRow({
    super.key,
    required this.category,
    required this.rating,
    required this.rereviewsNumber,
  });

  final String category;
  final double rating;
  final int rereviewsNumber;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          category.toUpperCase(),
          style: AppFontStyles.styleMedium12.copyWith(color: kSecTextColor),
        ),

        RatingBadge(
          rating: rating.toStringAsFixed(1),
          reviewsNumber: rereviewsNumber,
        ),
      ],
    );
  }
}
