import 'package:flutter/material.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/utils/app_font_styles.dart';
import 'package:shop_flow/core/widget/user_input.dart';

class SignUpInputs extends StatelessWidget {
  const SignUpInputs({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Full Name", style: AppFontStyles.styleSemiBold14),
        const SizedBox(height: 8),
        UserInput(hint: "John Doe"),
        const SizedBox(height: 16),
        Text("Email", style: AppFontStyles.styleSemiBold14),
        const SizedBox(height: 8),
        UserInput(hint: "name@example.com"),
        const SizedBox(height: 16),
        Text("Password", style: AppFontStyles.styleSemiBold14),
        const SizedBox(height: 8),
        UserInput(hint: "••••••••", isPassword: true),
      ],
    );
  }
}
