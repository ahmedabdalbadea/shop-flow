import 'package:flutter/material.dart';

class RatingStars extends StatelessWidget {
  const RatingStars({super.key, required this.rating});

  final int rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(5, (index) {
        return Icon(
          index < rating - 1 ? Icons.star : Icons.star_outline,
          color: Colors.orangeAccent,
          size: 16,
        );
      }),
    );
  }
}
