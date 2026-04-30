import 'package:flutter/material.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/utils/app_font_styles.dart';
import 'package:shop_flow/core/widget/user_input.dart';

class SignInInputs extends StatelessWidget {
  const SignInInputs({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text("Email", style: AppFontStyles.styleSemiBold14),
        ),
        const SizedBox(height: 8),
        UserInput(hint: "name@example.com"),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Password", style: AppFontStyles.styleSemiBold14),
            Text(
              "Forgot password?",
              style: AppFontStyles.styleMedium12.copyWith(
                color: kSecTextColor,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        UserInput(hint: "••••••••", isPassword: true),
      ],
    );
  }
}
