import 'package:flutter/material.dart';
import 'package:shop_flow/core/utlis/app_font_styles.dart';
import 'package:shop_flow/features/auth/view/widgets/auth_input.dart';
import 'package:shop_flow/features/auth/view/widgets/log_in_inputs.dart';
import 'package:shop_flow/features/auth/view/widgets/onboarding_card.dart';

class SignInViewBody extends StatelessWidget {
  const SignInViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: OnboardingCard(
            child: Column(
              children: [
                Text("Welcome back", style: AppFontStyles.styleSemiBold24),
                const SizedBox(height: 8),
                Text(
                  "Sign in to your ShopFlow account",
                  style: AppFontStyles.styleRegular14,
                ),
                const SizedBox(height: 32),
                LogInInputs(),
              ],
            ),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
