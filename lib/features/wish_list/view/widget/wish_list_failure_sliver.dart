import 'package:flutter/material.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/utils/app_font_styles.dart';

class WishListFailureSliver extends StatelessWidget {
  const WishListFailureSliver({super.key, required this.errMsg});
  final String errMsg;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 80.0, horizontal: 24.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.error_outline_rounded, color: kErrorColor, size: 50),
              const SizedBox(width: 8),
              Text(
                errMsg,
                style: AppFontStyles.styleSemiBold16.copyWith(
                  color: kThrTextColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
