import 'package:flutter/material.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/utils/app_font_styles.dart';

class UserInfoError extends StatelessWidget {
  const UserInfoError({super.key, required this.errMsg});
  final String errMsg;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(24),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.red.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.red.withValues(alpha: 0.2)),
      ),
      child: Row(
        children: [
          const Icon(Icons.error_outline, color: kErrorColor),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              errMsg,
              style: AppFontStyles.styleRegular14.copyWith(color: kErrorColor),
            ),
          ),
        ],
      ),
    );
  }
}
