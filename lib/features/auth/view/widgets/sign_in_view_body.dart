import 'package:flutter/material.dart';
import 'package:shop_flow/core/utlis/app_font_styles.dart';
import 'package:shop_flow/features/auth/view/widgets/auth_input.dart';
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
              
              ],
            ),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
