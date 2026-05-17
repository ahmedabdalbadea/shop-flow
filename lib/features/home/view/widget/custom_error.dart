import 'package:flutter/material.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/utils/app_font_styles.dart';

class CustomError extends StatelessWidget {
  const CustomError({super.key, required this.errMsg});

  final String errMsg;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 54, color: kErrorColor),
          const SizedBox(height: 16),
          Text(
            errMsg,
            textAlign: TextAlign.center,
            style: AppFontStyles.styleSemiBold14.copyWith(color: kThrTextColor),
          ),
        ],
      ),
    );
  }
}
