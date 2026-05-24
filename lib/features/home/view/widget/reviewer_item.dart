import 'package:flutter/material.dart';
import 'package:shop_flow/core/utils/app_font_styles.dart';
import 'package:shop_flow/features/home/view/widget/rating_stars.dart';

class ReviewerItem extends StatelessWidget {
  const ReviewerItem({
    super.key,
    required this.name,
    required this.comment,
    required this.rating,
  });

  final String name, comment;
  final int rating;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: AppFontStyles.styleRegular16,
                overflow: TextOverflow.ellipsis,
              ),

              RatingStars(rating: rating),
            ],
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerLeft,
            child: Text("\"$comment\"", style: AppFontStyles.styleRegular16),
          ),
        ],
      ),
    );
  }
}
