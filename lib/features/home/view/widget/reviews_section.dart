import 'package:flutter/material.dart';
import 'package:shop_flow/core/utils/app_font_styles.dart';
import 'package:shop_flow/core/models/products/review.dart';
import 'package:shop_flow/features/home/view/widget/reviewer_item.dart';

class ReviewsSection extends StatelessWidget {
  const ReviewsSection({super.key, required this.reviews});

  final List<Review> reviews;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Customer Reviews (${reviews.length})",
            style: AppFontStyles.styleRegular16,
          ),
        ),

        const SizedBox(height: 16),

        ...List.generate(3, (index) {
          return ReviewerItem(
            name: reviews[index].reviewerName!,
            comment: reviews[index].comment!,
            rating: reviews[index].rating!,
          );
        }),
      ],
    );
  }
}
