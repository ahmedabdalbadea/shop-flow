import 'package:flutter/material.dart';
import 'package:shop_flow/core/utils/app_font_styles.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider(height: 1, color: Color(0xffC5C5D4))),
        const SizedBox(width: 16),
        Text(
          "OR",
          style: AppFontStyles.styleMedium12.copyWith(
            color: const Color(0xff757684),
          ),
        ),
        const SizedBox(width: 16),
        const Expanded(child: Divider(height: 1, color: Color(0xffC5C5D4))),
      ],
    );
  }
}
