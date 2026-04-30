import 'package:flutter/material.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/utils/app_font_styles.dart';
import 'package:shop_flow/features/auth/view/widgets/onboarding_card.dart';
import 'package:shop_flow/features/auth/view/widgets/sign_up_actions.dart';
import 'package:shop_flow/features/auth/view/widgets/sign_up_inputs.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

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
                Text("Create Account", style: AppFontStyles.styleSemiBold24),
                const SizedBox(height: 8),
                Text(
                  "Join the ShopFlow community",
                  style: AppFontStyles.styleRegular14.copyWith(
                    color: kThrTextColor,
                  ),
                ),
                const SizedBox(height: 32),
                const SignUpInputs(),
                const SizedBox(height: 16),
                const SignUpActions(),
                // const SizedBox(height: 32),
                // const SignUpPrompt(),
              ],
            ),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
