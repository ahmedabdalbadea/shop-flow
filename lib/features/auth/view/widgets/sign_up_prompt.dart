import 'package:flutter/material.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/utils/app_font_styles.dart';

class SignUpPrompt extends StatelessWidget {
  const SignUpPrompt({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't have an account?", style: AppFontStyles.styleRegular14),

        Text(
          "Sign up",
          style: AppFontStyles.styleRegular14.copyWith(color: kSecTextColor),
        ),
      ],
    );
  }
}
