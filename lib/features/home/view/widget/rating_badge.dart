import 'package:flutter/material.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/utils/app_font_styles.dart';

class RatingBadge extends StatelessWidget {
  const RatingBadge({
    super.key,
    required this.rating,
    required this.reviewsNumber,
  });

  final String rating;
  final int reviewsNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: kPaddingColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(Icons.star, color: Colors.orangeAccent),
          const SizedBox(width: 4),
          Text(rating, style: AppFontStyles.styleRegular16),
          const SizedBox(width: 4),
          Text(
            "($reviewsNumber)",
            style: AppFontStyles.styleMedium12.copyWith(color: kThrTextColor),
          ),
        ],
      ),
    );
  }
}
